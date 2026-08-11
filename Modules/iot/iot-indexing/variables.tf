variable "thing_indexing_mode" {
  description = "The thing indexing mode"
  type        = string
  default     = "REGISTRY_AND_SHADOW"
}
variable "thing_connectivity_indexing_mode" {
  description = "The thing connectivity indexing mode"
  type        = string
  default     = "STATUS"
}
variable "device_defender_indexing_mode" {
  description = "The device defender indexing mode"
  type        = string
  default     = "VIOLATIONS"
}
variable "named_shadow_indexing_mode" {
  description = "The named shadow indexing mode"
  type        = string
  default     = "ON"
}
variable "thing_group_indexing_mode" {
  description = "The named shadow indexing mode"
  type        = string
  default     = "ON"
}

variable "filter_named_shadow_names" {
  description = "List of named shadow names to filter"
  type        = list(string)
  default     = ["thing1shadow"]
}
variable "custom_fields" {
  description = "List of custom fields with name and type"
  type = list(object({
    name = string
    type = string
  }))
  default = [
    { name = "shadow.desired.power", type = "Boolean" },
    { name = "attributes.version", type = "Number" },
    { name = "shadow.name.thing1shadow.desired.DefaultDesired", type = "String" },
    { name = "deviceDefender.securityProfile1.NUMBER_VALUE_BEHAVIOR.lastViolationValue.number", type = "Number" }
  ]
}
variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default = {
    terraform = "true"
  }
}