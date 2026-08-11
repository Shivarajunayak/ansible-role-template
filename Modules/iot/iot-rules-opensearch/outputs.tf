output "iot_role_arn" {
  description = "The ARN of the IAM role for IoT"
  value       = aws_iam_role.iot_role.arn
}

output "custom_policy_arn" {
  description = "The ARN of the custom IAM policy"
  value       = aws_iam_policy.custom_policy.arn
}

output "iot_topic_rule_name" {
  description = "The name of the IoT topic rule"
  value       = awscc_iot_topic_rule.open_search_rule.rule_name
}