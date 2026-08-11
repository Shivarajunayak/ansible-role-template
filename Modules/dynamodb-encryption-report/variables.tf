variable "sns_topic_name" {
  description = "SNS Topic Name for KMS Notification"
  type        = string
}
variable "security_notification_emailID" {
  description = "SNS Topic Subscription Email ID for KMS Notification"
  type        = string
}
variable "eventbridge_scheduler_name" {
  description = "EventBridge Scheduler Name"
  type        = string
}
variable "event_scheduler_iam_role_name" {
  description = "EventBridge Scheduler IAM Role Name"
  type        = string
}
variable "lambda_function_name" {
  description = "Lambda Function Name"
  type        = string
}
variable "lambda_iam_role_name" {
  description = "Lambda Function IAM Role Name"
  type        = string
}