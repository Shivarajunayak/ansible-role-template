resource "awscc_iot_security_profile" "example" {
  security_profile_name = var.security_profile_name

  behaviors = [
    {
      name   = var.behaviors[0].name
      metric = var.behaviors[0].metric
      criteria = {
        comparison_operator = var.behaviors[0].comparison_operator
        consecutive_datapoints_to_alarm = var.behaviors[0].consecutive_datapoints_to_alarm
        consecutive_datapoints_to_clear = var.behaviors[0].consecutive_datapoints_to_clear
        value = {
            count = var.behaviors[0].count
        }
        duration_seconds = var.behaviors[0].duration_seconds
      }
    }
  ]
  additional_metrics_to_retain_v2 = [
    for metric in var.additional_metrics : {
      metric = metric.metric
    }
  ]

  target_arns = [var.target_arn]
}
