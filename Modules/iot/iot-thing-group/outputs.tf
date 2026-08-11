output "iot_thing_group_arn" {
  description = "The ARN of the IoT Thing Group."
  value       = try(aws_iot_thing_group.device_provisioning_iot_thing_group[0].arn, null)
}
output "iot_thing_group_name" {
  description = "The name of the IoT Thing Group."
  value       = try(aws_iot_thing_group.device_provisioning_iot_thing_group[0].name, null)
}
output "iot_thing_group_id" {
  description = "The ID of the IoT Thing Group."
  value       = try(aws_iot_thing_group.device_provisioning_iot_thing_group[0].id, null)
}
output "iot_thing_group_properties" {
  description = "The properties of the IoT Thing Group."
  value       = try(aws_iot_thing_group.device_provisioning_iot_thing_group[0].properties, null)
}



output "iot_dynamic_thing_group_arn" {
  description = "The ARN of the IoT Thing Group."
  value       = try(awscc_iot_thing_group.example[0].arn, null)
}
output "iot_dynamic_thing_group_id" {
  description = "The ID of the IoT Thing Group."
  value       = try(awscc_iot_thing_group.example[0].id, null)
}
