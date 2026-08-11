resource "awscc_iot_custom_metric" "custom_metrics" {
  for_each = { for metric in var.metrics : metric.metric_name => metric }

  metric_name  = each.value.metric_name
  display_name = each.value.display_name
  metric_type  = each.value.metric_type
}