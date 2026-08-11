output "eventbridge_rule_ids" {
  description = "The EventBridge Rule IDs"
  value       = module.eventbridge_lambda.eventbridge_rule_ids
}

output "eventbridge_rule_arns" {
  description = "The EventBridge Rule ARNs"
  value       = module.eventbridge_lambda.eventbridge_rule_arns
}