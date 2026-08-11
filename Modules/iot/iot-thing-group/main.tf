resource "aws_iot_thing_group" "device_provisioning_iot_thing_group" {
  count = var.is_dynamic_thing_group ? 0 : 1
  name = var.thing_group_name
  properties {
    description = var.thing_group_description
  }
  tags = var.tags
}

resource "awscc_iot_thing_group" "example" {
  count = var.is_dynamic_thing_group ? 1 : 0
  thing_group_name = var.thing_group_name

  thing_group_properties = {
    thing_group_description = var.thing_group_description
  }
  query_string = var.query_string
}
