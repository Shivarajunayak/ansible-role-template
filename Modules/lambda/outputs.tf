output "lambda_function_arn" {
  description = "The ARN of the Lambda Function"
  value       = try(module.lambda_function_existing_package_s3.lambda_function_arn, "")
}

output "lambda_function_name" {
  description = "The Name of the Lambda Function"
  value       = try(module.lambda_function_existing_package_s3.lambda_function_name, "")
}
