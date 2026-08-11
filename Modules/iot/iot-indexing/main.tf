resource "aws_iot_indexing_configuration" "example" {
  thing_indexing_configuration {
    thing_indexing_mode              = var.thing_indexing_mode
    thing_connectivity_indexing_mode = var.thing_connectivity_indexing_mode
    device_defender_indexing_mode    = var.device_defender_indexing_mode
    named_shadow_indexing_mode       = var.named_shadow_indexing_mode
    
  }
  thing_group_indexing_configuration {
    thing_group_indexing_mode = var.thing_group_indexing_mode # Options: OFF, ON
    }

}