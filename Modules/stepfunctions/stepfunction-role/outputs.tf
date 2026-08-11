output "stepfunction_role_arn" {

  description = "stepfunction role arn"
  value       = aws_iam_role.stepfunction_role.arn

}
