
variable "vehicle_model_json" {
  type        = string
  default     = ""
  description = "Vehicle Model JSON"
}
variable "vehicle_manifest_name" {
  type        = string
  default     = ""
  description = "Decoder manifest name"
}
variable "fleetwise_endpoint_url" {
  type        = string
  default     = ""
  description = "Fleetwise endpoint url"
}

variable "aws_region" {
  type        = string
  default     = ""
  description = "Fleetwise region"
}

variable "terraform_role_arn" {
  type        = string
  default     = ""
  description = "Terraform role arn for spoke"
}
