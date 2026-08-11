variable "cf_template_url" {
  type        = string
  description = "Amazon S3 bucket URL location of a file containing the CloudFormation template body"
}
variable "cf_stack_name" {
  type        = string
  description = "CloudFormation template Name"
}
variable "cf_stack_parameters" {
  type        = map(string)
  description = "Key-value map of input parameters for the Stack Set template"
  default     = {}
}
variable "capabilities" {
  type        = list(string)
  description = "A list of capabilities. Valid values: CAPABILITY_IAM, CAPABILITY_NAMED_IAM, CAPABILITY_AUTO_EXPAND"
  default     = []
}
variable "on_failure" {
  type        = string
  default     = "ROLLBACK"
  description = "Action to be taken if stack creation fails. This must be one of: `DO_NOTHING`, `ROLLBACK`, or `DELETE`"
}
variable "timeout_in_minutes" {
  type        = number
  default     = 30
  description = "The amount of time that can pass before the stack status becomes `CREATE_FAILED`"
}
variable "tags" {
  type        = map(string)
  description = "Key-value map of input parameters for the Stack Set template"
  default     = {}
}