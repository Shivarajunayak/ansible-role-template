# iot-decoder-manifest

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
  	 decoder_manifest_json  = ""
  	 decoder_manifest_name  = ""
  	 fleetwise_endpoint_url  = ""
  	 model_manifest_arn  = ""
  	 terraform_role_arn  = ""
}
```
## Resources

| Name | Type |
|------|------|
| [local_file.output_decoder_manifest_json](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [null_resource.decoder_manifest](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Fleetwise region | `string` | `""` | no |
| <a name="input_decoder_manifest_json"></a> [decoder\_manifest\_json](#input\_decoder\_manifest\_json) | Signal Catalog Json string | `string` | `""` | no |
| <a name="input_decoder_manifest_name"></a> [decoder\_manifest\_name](#input\_decoder\_manifest\_name) | Decoder manifest name | `string` | `""` | no |
| <a name="input_fleetwise_endpoint_url"></a> [fleetwise\_endpoint\_url](#input\_fleetwise\_endpoint\_url) | Fleetwise endpoint url | `string` | `""` | no |
| <a name="input_model_manifest_arn"></a> [model\_manifest\_arn](#input\_model\_manifest\_arn) | model manifest arn | `string` | `""` | no |
| <a name="input_terraform_role_arn"></a> [terraform\_role\_arn](#input\_terraform\_role\_arn) | Terraform role arn for spoke | `string` | `""` | no |
## Outputs

No outputs.
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->