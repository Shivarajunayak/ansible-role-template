variable "common_name" {
  description = "The common name for the TLS certificate"
  type        = string
  default     = "example.com"
}
variable "algorithm" {
  description = "The algorithm to use for the private key"
  type        = string
  default     = "RSA"
}
