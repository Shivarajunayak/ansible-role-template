output "state_machine_arn" {
  description = "The ARN of the created Step Functions State Machine"
  value       = aws_sfn_state_machine.this[0].arn
}
output "state_machine_name" {
  description = "The name of the created Step Functions State Machine"
  value       = aws_sfn_state_machine.this[0].name
}
output "state_machine_status" {
  description = "The status of the created Step Functions State Machine"
  value       = aws_sfn_state_machine.this[0].status
}
output "cloudwatch_log_group_arn" {
  description = "The ARN of the created CloudWatch Log Group"
  value       = aws_cloudwatch_log_group.this[0].arn
}
output "cloudwatch_log_group_name" {
  description = "The name of the created CloudWatch Log Group"
  value       = aws_cloudwatch_log_group.this[0].name
}
output "cloudwatch_log_group_retention_in_days" {
  description = "The retention period of the created CloudWatch Log Group"
  value       = aws_cloudwatch_log_group.this[0].retention_in_days
}
