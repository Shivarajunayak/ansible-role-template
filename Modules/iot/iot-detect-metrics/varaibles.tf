variable "metrics" {
  description = "A list of custom metrics to create"
  type = list(object({
    metric_name  = string
    display_name = string
    metric_type  = string
    tags         = map(string)
  }))
  default = []
}