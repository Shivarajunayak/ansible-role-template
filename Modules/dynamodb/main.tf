# Flatten GSI and table information

locals {
  gsi_configs = flatten([
    for key, table in var.dynamodb_table : [
      for gsi in table.global_secondary_indexes : {
        table_name        = table.table_name
        gsi_name          = gsi.index_name
        read_max_capacity = table.read_max_capacity
        read_min_capacity = table.read_min_capacity
        write_max_capacity = table.write_max_capacity
        write_min_capacity = table.write_min_capacity
      }
    ]
  ])
}

########################################

########################################
## Table
########################################

resource "aws_dynamodb_table" "dynamodb_table" {
  for_each = { for key, value in var.dynamodb_table : key => value }
  ##for_each                    = { for key, value in var.dynamodb_table : value.table_name => value }
  name                        = try(each.value.table_name, null)
  billing_mode                = try(each.value.billing_mode, null)
  read_capacity               = lookup(each.value, "read_capacity", null)
  write_capacity              = lookup(each.value, "write_capacity", null)
  hash_key                    = try(each.value.hash_key, null)
  range_key                   = try(each.value.range_key, null)
  deletion_protection_enabled = try(each.value.deletion_protection_enabled, false)
  stream_enabled              = try(each.value.stream_enabled, false)
  stream_view_type            = each.value.stream_enabled ? each.value.stream_view_type : null

  dynamic "server_side_encryption" {
    for_each = { for key, value in each.value.server_side_encryption : key => value }
    content {
      enabled     = server_side_encryption.value.server_side_encryption_enabled
      kms_key_arn = server_side_encryption.value.server_side_encryption_kms_key_arn
    }
  }

  dynamic "ttl" {
    for_each = { for key, value in each.value.ttl : key => value }
    content {
      enabled        = ttl.value.ttl_enabled
      attribute_name = ttl.value.ttl_attribute_name
    }
  }

  dynamic "point_in_time_recovery" {
    for_each = { for key, value in each.value.point_in_time_recovery : key => value }
    content {
      enabled     = point_in_time_recovery.value.point_in_time_recovery_enabled
    }
  }

  dynamic "attribute" {
    for_each = { for key, value in each.value.attribute : key => value }
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  dynamic "global_secondary_index" {
    for_each = { for key, value in each.value.global_secondary_indexes : key => value }
    content {
      name               = try(global_secondary_index.value.index_name, "")
      hash_key           = try(global_secondary_index.value.index_hash_key, "")
      projection_type    = try(global_secondary_index.value.index_projection_type, "")
      range_key          = try(global_secondary_index.value.index_range_key, "")
      read_capacity      = lookup(global_secondary_index.value, "index_read_capacity", null)
      write_capacity     = lookup(global_secondary_index.value, "index_write_capacity", null)
      non_key_attributes = lookup(global_secondary_index.value, "index_non_key_attributes", null)
    }
  }

  # added for autoscaling so that terraform is unaffected as scaling adjusts capacity outside of terraform
  lifecycle {
    ignore_changes = [read_capacity, write_capacity, global_secondary_index]
  }

  ##

  tags = merge(
    var.tags,
    {
      Name = each.value.table_name
  })
}

########################################
## Table Autoscaling
########################################

resource "aws_appautoscaling_target" "environment_table_read_target" {
  for_each = { for key, value in var.dynamodb_table : key => value }

  max_capacity       = each.value.read_max_capacity
  min_capacity       = each.value.read_min_capacity
  resource_id        = "table/${each.value.table_name}"
  scalable_dimension = "dynamodb:table:ReadCapacityUnits"
  service_namespace  = "dynamodb"

  depends_on = [aws_dynamodb_table.dynamodb_table]

}

resource "aws_appautoscaling_policy" "environment_table_read_policy" {
  for_each = { for key, value in aws_appautoscaling_target.environment_table_read_target : key => value }

  name               = "DynamoDBReadCapacityUtilization:${each.value.resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = each.value.resource_id
  scalable_dimension = each.value.scalable_dimension
  service_namespace  = each.value.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBReadCapacityUtilization"
    }

    target_value = var.scale_threshold
  }
}

resource "aws_appautoscaling_target" "environment_table_write_target" {
  for_each = { for key, value in var.dynamodb_table : key => value }

 max_capacity       = each.value.write_max_capacity
  min_capacity       = each.value.write_min_capacity
  resource_id        = "table/${each.value.table_name}"
  scalable_dimension = "dynamodb:table:WriteCapacityUnits"
  service_namespace  = "dynamodb"

  depends_on = [aws_dynamodb_table.dynamodb_table]
}

resource "aws_appautoscaling_policy" "environment_table_write_policy" {
  for_each = { for key, value in aws_appautoscaling_target.environment_table_write_target : key => value }

  name               = "DynamoDBWriteCapacityUtilization:${each.value.resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = each.value.resource_id
  scalable_dimension = each.value.scalable_dimension
  service_namespace  = each.value.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBWriteCapacityUtilization"
    }

    target_value = var.scale_threshold
  }
}

########################################
## GSI Autoscaling only if tables have them
########################################

resource "aws_appautoscaling_target" "environment_gsi_read_target" {
  for_each = {
    for idx, gsi_config in local.gsi_configs : "${gsi_config.table_name}-${gsi_config.gsi_name}-read" => gsi_config
  }

  max_capacity       = each.value.read_max_capacity
  min_capacity       = each.value.read_min_capacity
  resource_id        = "table/${each.value.table_name}/index/${each.value.gsi_name}"
  scalable_dimension = "dynamodb:index:ReadCapacityUnits"
  service_namespace  = "dynamodb"

  depends_on = [aws_dynamodb_table.dynamodb_table]
}

resource "aws_appautoscaling_policy" "environment_gsi_read_policy" {
  for_each = aws_appautoscaling_target.environment_gsi_read_target

  name               = "DynamoDBReadCapacityUtilization:${each.value.resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = each.value.resource_id
  scalable_dimension = each.value.scalable_dimension
  service_namespace  = each.value.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBReadCapacityUtilization"
    }

    target_value = var.scale_threshold
  }
}

resource "aws_appautoscaling_target" "environment_gsi_write_target" {
  for_each = {
    for idx, gsi_config in local.gsi_configs : "${gsi_config.table_name}-${gsi_config.gsi_name}-write" => gsi_config
  }

  max_capacity       = each.value.write_max_capacity
  min_capacity       = each.value.write_min_capacity
  resource_id        = "table/${each.value.table_name}/index/${each.value.gsi_name}"
  scalable_dimension = "dynamodb:index:WriteCapacityUnits"
  service_namespace  = "dynamodb"

  depends_on = [aws_dynamodb_table.dynamodb_table]
}

resource "aws_appautoscaling_policy" "environment_gsi_write_policy" {
  for_each = aws_appautoscaling_target.environment_gsi_write_target

  name               = "DynamoDBWriteCapacityUtilization:${each.value.resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = each.value.resource_id
  scalable_dimension = each.value.scalable_dimension
  service_namespace  = each.value.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBWriteCapacityUtilization"
    }

    target_value = var.scale_threshold
  }
}


############################
# DAX 
############################

resource "aws_dax_subnet_group" "subnet_group" {
  name       = try(var.name, "dax-subnet-group")
  subnet_ids = try(var.subnet_ids, [])
}

resource "aws_dax_parameter_group" "parameter_group" {
  name = try(var.name, "dax-parameter-group")

  parameters {
    name  = "query-ttl-millis"
    value = var.dax_parameter_group_query_ttl
  }

  parameters {
    name  = "record-ttl-millis"
    value = var.dax_parameter_group_record_ttl
  }
}



resource "aws_dax_cluster" "cluster" {

  count = var.enable_dax ? 1 : 0

  cluster_name       = try(var.name, "dax-cluster")
  iam_role_arn       = try(var.iam_role_arn, null)
  node_type          = try(var.node_type, null)
  replication_factor = try(var.node_count, null)
  server_side_encryption {
    enabled = try(var.server_side_encryption, true)
  }
  parameter_group_name = aws_dax_parameter_group.parameter_group.name
  subnet_group_name    = aws_dax_subnet_group.subnet_group.name
  maintenance_window   = try(var.maintenance_window, null)
  security_group_ids   = try(var.security_group_ids, null)
  tags                 = var.tags
}
