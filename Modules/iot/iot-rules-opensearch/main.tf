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

resource "awscc_iot_topic_rule" "open_search_rule" {
  rule_name = var.rule_name
  topic_rule_payload = {
    sql         = var.open_search_sql
    description = var.open_search_description

    actions = [
      {
        open_search = {
          endpoint = try(var.endpoint, null)
          index    = try(var.index, null)
          id       = try(var.id, null)
          type     = try(var.type, null)
          role_arn = try(var.role_arn, null)
        }
      },
      {
        republish = {
          role_arn = try(var.role_arn, null)
          topic    = try(var.topic, null)
          qos      = try(var.qos, null)
        }
      }
    ]

    error_action = {
      cloudwatch_logs = {
        log_group_name = try(var.log_group_name, null)
        batch_mode     = try(var.batch_mode, null)
        role_arn     = try(var.role_arn, null)
      }
    }
  }
}