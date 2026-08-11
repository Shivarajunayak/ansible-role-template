variable "iam_role_name" {
  description = "Name of the IAM role for iot rules"
  type        = string
  default     = "my-iot-role"
}
variable "iam_policy_name" {
  description = "Custom IAM Policy name"
  type        = string
  default     = ""
}

variable "custom_policy_json" {
  description = "iot role custom policy"
  type        = string
  default     = ""
}


variable "iot_topic_rules" {
  type = map(object({
    rule_name   = string
    role_name   = optional(string)
    sql         = string
    sql_version = string
    description = string
    tags        = map(string)
    action = object({
      lambda = optional(object({ function_arn = string }))
      dynamodbv2 = optional(object({
        table_name = string
      }))
      kafka = optional(object({
        destination_arn   = string
        topic             = string
        key               = string
        client_properties = map(string)
      }))
      republish = optional(object({
        topic = string
        qos   = number
      }))
      s3  = optional(object({
        bucket_name = string
        role_arn    = string
        key         = string
      }))
    })
    error_action = optional(object({
      dynamodbv2 = optional(object({
        table_name = string
      }))
      kafka = optional(object({
        destination_arn = string
        topic           = string
        key             = string
        client_properties = object({
          bootstrap_servers = string
          security_protocol = string
          sasl_mechanism    = string
          sasl_secret_name  = string
          compression_type  = string
          acks              = string
        })
      }))
      lambda = optional(object({
        function_arn = string
      }))
      cloudwatch_logs = optional(object({
        log_group_name = string
        batch_mode     = bool
      }))
      republish = optional(object({
        topic = string
        qos   = number
      }))
      s3 = optional(object({
        bucket_name = string
        key         = string
        role_arn    = string
      }))
    }))
  }))
}
variable "cloudwatch_log_group" {
  description = "Name of CloudWatch Log Group"
  type        = string
  default     = ""
}
