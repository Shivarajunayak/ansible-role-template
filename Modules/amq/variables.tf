
variable "configuration_name" {
  description = "The name of the MQ configuration"
  type        = string
}

variable "mq_configuration_data" {
  description = "MQ Configuration Data"
  type        = string
}

variable "engine_type" {
  description = "The type of broker engine"
  type        = string
  default     = "ActiveMQ"
}

variable "engine_version" {
  description = "The version of the broker engine"
  type        = string
}

variable "storage_type" {
  description = "The broker storage"
  type        = string
}

variable "broker_name" {
  description = "The name of the MQ broker"
  type        = string
}

variable "deployment_mode" {
  description = "The deployment mode of the broker"
  type        = string
}

variable "host_instance_type" {
  description = "The type of broker instance"
  type        = string
}

variable "auto_minor_version_upgrade" {
  description = "Whether to enable automatic minor version upgrades"
  type        = bool
  default     = true
}

variable "apply_immediately" {
  description = "Whether to apply changes immediately"
  type        = bool
  default     = true
}

variable "publicly_accessible" {
  description = "Whether the broker is publicly accessible"
  type        = bool
  default     = false
}

variable "enable_audit_logs" {
  description = "Whether the audit logs should be enabled"
  type        = bool
  default     = false
}

variable "enable_general_logs" {
  description = "Whether the general logs should be enabled"
  type        = bool
  default     = false
}

variable "subnet_ids" {
  description = "The list of subnet IDs for the broker"
  type        = list(string)
}

variable "security_groups" {
  description = "The list of security group IDs for the broker"
  type        = list(string)
}


variable "kms_key_id" {
  description = "The KMS key ID for encrypting SSM parameters"
  type        = string
  default     = ""
}

variable "mq_secret_name" {
  description = "The name of the MQ secret"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {}
}
