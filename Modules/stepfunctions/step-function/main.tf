resource "aws_sfn_state_machine" "this" {
  count      = var.create ? 1 : 0
  name       = var.name
  role_arn   = var.stepfunction_role_arn
  definition = var.definition
  type       = var.type
  dynamic "logging_configuration" {
    for_each = var.logging_configuration != null ? [var.logging_configuration] : []
    content {
      level                  = logging_configuration.value["level"]
      log_destination        = "${aws_cloudwatch_log_group.this[0].arn}:*"
      include_execution_data = logging_configuration.value["include_execution_data"]
    }
  }
  tags    = var.tags # Assuming var.tags is defined elsewhere
  publish = var.publish
}
resource "aws_cloudwatch_log_group" "this" {
  count             = var.create ? 1 : 0
  name              = var.cloudwatch_log_group_name
  retention_in_days = var.cloudwatch_log_group_retention_in_days
  kms_key_id        = var.cloudwatch_log_group_kms_key_id
  tags              = var.tags # Assuming var.tags is defined elsewhere
}
