resource "aws_iam_role" "iot_role" {
  name = var.iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "iot.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "custom_policy" {
  name        = var.iam_policy_name
  description = "Custom policy for IoT role"
  policy      = var.custom_policy_json
}

resource "aws_iam_role_policy_attachment" "custom_policy_attachment" {
  role       = aws_iam_role.iot_role.name
  policy_arn = aws_iam_policy.custom_policy.arn
}
resource "aws_cloudwatch_log_group" "kafka_error_logs" {
  for_each          = { for rule in var.iot_topic_rules : rule.rule_name => rule if rule.error_action != null && lookup(rule.error_action, "kafka", null) != null }
  name              = "/aws/kafka/errors/${each.value.rule_name}"
  retention_in_days = try(each.value.retention_in_days, 7)
  kms_key_id        = try(each.value.kms_key_id, "")
  tags              = try(each.value.tags, {})
}
resource "aws_iot_topic_rule" "topic_rule" {
  for_each    = { for rule in var.iot_topic_rules : rule.rule_name => rule }
  name        = each.value.rule_name
  sql         = each.value.sql
  sql_version = each.value.sql_version
  description = each.value.description
  tags        = try(each.value.tags, {})
  enabled     = true
  dynamic "lambda" {
    for_each = each.value.action.lambda != null ? [each.value.action.lambda] : []
    content {
      function_arn = lambda.value.function_arn
    }
  }
  dynamic "dynamodbv2" {
    for_each = each.value.action.dynamodbv2 != null ? [each.value.action.dynamodbv2] : []
    content {
      role_arn = aws_iam_role.iot_role.arn
      put_item {
        table_name = dynamodbv2.value.table_name
      }
    }
  }
  dynamic "kafka" {
    for_each = each.value.action.kafka != null ? [each.value.action.kafka] : []
    content {
      destination_arn = kafka.value.destination_arn
      topic           = kafka.value.topic
      key             = kafka.value.key
      client_properties = {
        "bootstrap.servers"   = kafka.value.client_properties.bootstrap_servers
        "security.protocol"   = kafka.value.client_properties.security_protocol
        "sasl.mechanism"      = kafka.value.client_properties.sasl_mechanism
        "sasl.scram.username" = "$${get_secret('${kafka.value.client_properties.sasl_secret_name}', 'SecretString', 'username', '${aws_iam_role.iot_role.arn}')}"
        "sasl.scram.password" = "$${get_secret('${kafka.value.client_properties.sasl_secret_name}', 'SecretString', 'password', '${aws_iam_role.iot_role.arn}')}"
        "compression.type"    = kafka.value.client_properties.compression_type
        "acks"                = kafka.value.client_properties.acks
      }
    }
  }
  dynamic "republish" {
    for_each = each.value.action.republish != null ? [each.value.action.republish] : []
    content {
      role_arn = aws_iam_role.iot_role.arn
      topic    = republish.value.topic
      qos      = republish.value.qos
    }
  }
  dynamic "s3" {
  for_each = each.value.action.s3 != null ? [each.value.action.s3] : []
  content {
    bucket_name = s3.value.bucket_name
    key         = s3.value.key
    role_arn    = aws_iam_role.iot_role.arn
    }
  }
  
  dynamic "error_action" {
    for_each = each.value.error_action != null ? [each.value.error_action] : []
    content {
      dynamic "dynamodbv2" {
        for_each = error_action.value.dynamodbv2 != null ? [error_action.value.dynamodbv2] : []
        content {
          role_arn = aws_iam_role.iot_role.arn
          put_item {
            table_name = dynamodbv2.value.table_name
          }
        }
      }
      dynamic "kafka" {
        for_each = error_action.value.kafka != null ? [error_action.value.kafka] : []
        content {
          destination_arn = kafka.value.destination_arn
          topic           = kafka.value.topic
          key             = kafka.value.key
          client_properties = {
            "bootstrap.servers"   = kafka.value.client_properties.bootstrap_servers
            "security.protocol"   = kafka.value.client_properties.security_protocol
            "sasl.mechanism"      = kafka.value.client_properties.sasl_mechanism
            "sasl.scram.username" = "$${get_secret('${kafka.value.client_properties.sasl_secret_name}', 'SecretString', 'username', '${aws_iam_role.iot_role.arn}')}"
            "sasl.scram.password" = "$${get_secret('${kafka.value.client_properties.sasl_secret_name}', 'SecretString', 'password', '${aws_iam_role.iot_role.arn}')}"
            "compression.type"    = kafka.value.client_properties.compression_type
            "acks"                = kafka.value.client_properties.acks
          }
        }
      }
      dynamic "lambda" {
        for_each = error_action.value.lambda != null ? [error_action.value.lambda] : []
        content {
          function_arn = lambda.value.function_arn
        }
      }
      dynamic "cloudwatch_logs" {
        for_each = error_action.value.cloudwatch_logs != null ? [error_action.value.cloudwatch_logs] : []
        content {
          log_group_name = cloudwatch_logs.value.log_group_name
          role_arn       = aws_iam_role.iot_role.arn
        }
      }
      dynamic "republish" {
        for_each = error_action.value.republish != null ? [error_action.value.republish] : []
        content {
          role_arn = aws_iam_role.iot_role.arn
          topic    = republish.value.topic
          qos      = republish.value.qos
        }
      }
      dynamic "s3" {
      for_each = error_action.value.s3 != null ? [error_action.value.s3] : []
      content {
        bucket_name = s3.value.bucket_name
        key         = s3.value.key
        role_arn    = aws_iam_role.iot_role.arn
        }
      }
    }
  }
}


resource "awscc_iot_topic_rule" "open_search_rule" {
  rule_name     = var.open_search_rule_name
  topic_rule_payload = {
    sql         = var.open_search_sql
    description = var.open_search_description

  actions = [{
    open_search = {
      endpoint = var.open_search_endpoint
      index    = var.open_search_index
      id       = var.open_search_id
      type     = var.open_search_type
      role_arn = aws_iam_role.iot_role.arn
   }
  }]
  }
}