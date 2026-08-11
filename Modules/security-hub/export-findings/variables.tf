variable "sec_hub_findings_bucket_arn" {
  description = "S3 Bucket ARN for Security Hub Findings"
}
variable "lambda_function_iam_role_name" {
  description = "IAM Role Name for Lambda Function"
}
variable "lambda_function_name" {
  description = "Lambda Function Name"
  type        = string
}
variable "firehose_event_rule_name" {
  description = "Firehose Cloudwatch Event Rule Name"
  type        = string
}
variable "kinesis_delivery_stream_name" {
  description = "Firehose Delivery Name"
}
variable "kinesis_firehose_iam_role_name" {
  description = "IAM Role Name for Kinesis Firehose"
  type        = string
}
variable "security_hub_log_delivery_iam_role_name" {
  description = "IAM Role Name for Security Hub Log Delivery"
  type        = string
}
variable "logging_account_number" {
  description = "Logging account number"
  type        = number
}
variable "s3_bucket_kms_key_arn" {
  description = "S3 Bucket encrypted CMK KMS key ARN"
  type        = string
}