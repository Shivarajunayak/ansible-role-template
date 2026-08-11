output "cognito_user_pool_id" {
  description = "The id of the user pool"
  value       = try(module.aws_cognito_user_pool_complete.id, null)
}

output "cognito_user_pool_arn" {
  description = "The ARN of the user pool"
  value       = try(module.aws_cognito_user_pool_complete.arn, null)
}

output "cognito_user_pool_endpoint" {
  description = "The endpoint name of the user pool. Example format: cognito-idp.REGION.amazonaws.com/xxxx_yyyyy"
  value       = try(module.aws_cognito_user_pool_complete.endpoint, null)
}

