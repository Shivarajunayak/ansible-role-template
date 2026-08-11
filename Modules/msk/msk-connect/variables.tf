################################################################################
# Connect Custom Plugin
################################################################################

variable "connect_custom_plugins" {
  description = "Map of custom plugin configuration details (map of maps)"
  type        = any
  default     = {}
}

variable "connect_custom_plugin_timeouts" {
  description = "Timeout configurations for the connect custom plugins"
  type        = map(string)
  default = {
    create = null
  }
}

################################################################################
# Connect Worker Configuration
################################################################################

variable "create_connect_worker_configuration" {
  description = "Determines whether to create connect worker configuration"
  type        = bool
  default     = false
}

variable "connect_worker_config_name" {
  description = "The name of the worker configuration"
  type        = string
  default     = null
}

variable "connect_worker_config_description" {
  description = "A summary description of the worker configuration"
  type        = string
  default     = null
}

variable "connect_worker_config_properties_file_content" {
  description = "Contents of connect-distributed.properties file. The value can be either base64 encoded or in raw format"
  type        = string
  default     = null
}


################################################################################
# Connector Configuration
################################################################################

variable "tags" {
  description = "A map of tags to assign to the resources created"
  type        = map(string)
  default     = {}
}