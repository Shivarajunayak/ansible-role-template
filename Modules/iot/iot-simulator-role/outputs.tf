output "simulator_role_arn" {
  description = "Simulator role arn"
  value       = aws_iam_role.iot_simulator_role.arn
}
