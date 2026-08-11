variable "security_profile_name" {
  description = "The name of the security profile"
  type        = string
}

variable "behaviors" {
  description = "List of behaviors for the security profile"
  type = any
  default = {}
}

variable "additional_metrics" {
  description = "Additional metrics to retain"
  type        = any
  default     = {}
}

variable "target_arn" {
  description = "ARN of the alert target"
  type        = string
}