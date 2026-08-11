resource "awscc_iot_scheduled_audit" "hmcl_monthly_audit" {
  scheduled_audit_name = var.scheduled_audit_name
  frequency            = var.frequency
  day_of_month         = var.day_of_month

  target_check_names = var.target_check_names

}