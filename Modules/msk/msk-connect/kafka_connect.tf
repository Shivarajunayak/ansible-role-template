################################################################################
# Connect Custom Plugin
################################################################################

resource "aws_mskconnect_custom_plugin" "this" {
  for_each = { for k, v in var.connect_custom_plugins : k => v }

  name         = each.value.name
  description  = lookup(each.value, "description", null)
  content_type = each.value.content_type

  location {
    s3 {
      bucket_arn     = each.value.s3_bucket_arn
      file_key       = each.value.s3_file_key
      object_version = lookup(each.value, "s3_object_version", null)
    }
  }

  timeouts {
    create = try(each.value.timeouts.create, var.connect_custom_plugin_timeouts.create, null)
  }
}



################################################################################
# Connector
################################################################################

resource "aws_iam_role" "msk_connect_role" {
  for_each = var.connect_custom_plugins

  name = each.value.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "kafkaconnect.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "msk_connect_policy" {
  for_each = var.connect_custom_plugins

  name   = each.value.role_policy_name
  policy = each.value.role_policy
}

resource "aws_iam_role_policy_attachment" "msk_connect_role_policy_attachment" {
  for_each = var.connect_custom_plugins

  role       = aws_iam_role.msk_connect_role[each.key].name
  policy_arn  = aws_iam_policy.msk_connect_policy[each.key].arn
}

resource "aws_mskconnect_connector" "example" {
  for_each = var.connect_custom_plugins

  name     = each.value.connector_name
  kafka_cluster {
    apache_kafka_cluster {
      bootstrap_servers = each.value.bootstrap_servers
      vpc {
        security_groups = each.value.connector_security_groups
        subnets         = each.value.connector_subnets
      }
    }
  }

  kafkaconnect_version = each.value.kafkaconnect_version

  capacity {
    provisioned_capacity {
      mcu_count        = each.value.mcu_count
      worker_count     = each.value.worker_count

    }
  }

  connector_configuration = each.value.connector_configuration
  plugin {
    custom_plugin {
      arn      = aws_mskconnect_custom_plugin.this[each.key].arn
      revision = aws_mskconnect_custom_plugin.this[each.key].latest_revision
    }
  }

  kafka_cluster_client_authentication {
    authentication_type = "IAM"
  }

  kafka_cluster_encryption_in_transit {
    encryption_type = "TLS"
  }

  log_delivery {

    worker_log_delivery {
      cloudwatch_logs {
        enabled = each.value.log_enabled
        log_group = each.value.log_enabled ? each.value.log_group : null
      }
    }
    
  }

  service_execution_role_arn = aws_iam_role.msk_connect_role[each.key].arn

  tags = var.tags

  
}