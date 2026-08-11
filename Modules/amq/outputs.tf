output "mq_broker_id" {
  description = "The ID of the MQ broker"
  value       = aws_mq_broker.example.id
}

output "mq_broker_arn" {
  description = "The ARN of the MQ broker"
  value       = aws_mq_broker.example.arn
}

output "mq_configuration_id" {
  description = "The ID of the MQ configuration"
  value       = aws_mq_configuration.example.id
}

output "mq_configuration_revision" {
  description = "The latest revision of the MQ configuration"
  value       = aws_mq_configuration.example.latest_revision
}
