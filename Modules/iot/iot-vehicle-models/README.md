# iot-vehicle-models

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
README.md updated successfully
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

No requirements.
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
  	 source  = "<module-path>"
  
	 # Optional variables
  	 aws_region  = ""
  	 fleetwise_endpoint_url  = ""
  	 terraform_role_arn  = ""
  	 vehicle_manifest_name  = ""
  	 vehicle_model_json  = ""
}
```
## Resources

| Name | Type |
|------|------|
| [local_file.output_vehicle_model_json](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [null_resource.create_vehicle_model](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Fleetwise region | `string` | `""` | no |
| <a name="input_fleetwise_endpoint_url"></a> [fleetwise\_endpoint\_url](#input\_fleetwise\_endpoint\_url) | Fleetwise endpoint url | `string` | `""` | no |
| <a name="input_terraform_role_arn"></a> [terraform\_role\_arn](#input\_terraform\_role\_arn) | Terraform role arn for spoke | `string` | `""` | no |
| <a name="input_vehicle_manifest_name"></a> [vehicle\_manifest\_name](#input\_vehicle\_manifest\_name) | Decoder manifest name | `string` | `""` | no |
| <a name="input_vehicle_model_json"></a> [vehicle\_model\_json](#input\_vehicle\_model\_json) | Vehicle Model JSON | `string` | `""` | no |
## Outputs

No outputs.
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->