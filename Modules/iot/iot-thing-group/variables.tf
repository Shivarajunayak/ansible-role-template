variable "thing_group_name" {
  description = "The name of the IoT Thing Group."
  type        = string
  default     = "hmcl-cv-dev-device-provisioning"
}
variable "thing_group_description" {
  description = "The description of the IoT Thing Group."
  type        = string
  default     = "" 
}
variable "query_string" {
  description = "The query_string"
  type        = string
  default     = ""
}

variable "is_dynamic_thing_group" {
  description = "is dynamic thing group"
  type        = bool
  default     = false
}
variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default = {}
}
