# iot-thing-group

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
README.md updated successfully
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_awscc"></a> [awscc](#requirement\_awscc) | ~> 1.2.0 |
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
  	 source  = "<module-path>"
    
	 # Required variables
    	 thing_group_description  = 
  
	 # Optional variables
  	 tags  = {
  "terraform": "true"
}
  	 thing_group_name  = "hmcl-cv-dev-device-provisioning"
}
```
## Resources

| Name | Type |
|------|------|
| [aws_iot_thing_group.device_provisioning_iot_thing_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iot_thing_group) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resource. | `map(string)` | <pre>{<br>  "terraform": "true"<br>}</pre> | no |
| <a name="input_thing_group_description"></a> [thing\_group\_description](#input\_thing\_group\_description) | The description of the IoT Thing Group. | `string` | n/a | yes |
| <a name="input_thing_group_name"></a> [thing\_group\_name](#input\_thing\_group\_name) | The name of the IoT Thing Group. | `string` | `"hmcl-cv-dev-device-provisioning"` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iot_thing_group_arn"></a> [iot\_thing\_group\_arn](#output\_iot\_thing\_group\_arn) | The ARN of the IoT Thing Group. |
| <a name="output_iot_thing_group_id"></a> [iot\_thing\_group\_id](#output\_iot\_thing\_group\_id) | The ID of the IoT Thing Group. |
| <a name="output_iot_thing_group_name"></a> [iot\_thing\_group\_name](#output\_iot\_thing\_group\_name) | The name of the IoT Thing Group. |
| <a name="output_iot_thing_group_properties"></a> [iot\_thing\_group\_properties](#output\_iot\_thing\_group\_properties) | The properties of the IoT Thing Group. |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->