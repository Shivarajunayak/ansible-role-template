# iot-campaign

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
README.md updated successfully
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_awscc"></a> [awscc](#requirement\_awscc) | ~> 0.1 |
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
  	 source  = "<module-path>"
  
	 # Optional variables
  	 aws_region  = ""
  	 campaign_json  = null
  	 campaign_name  = ""
  	 fleetwise_endpoint_url  = ""
  	 signal_catalog_arn  = null
  	 target_arn  = null
  	 terraform_role_arn  = ""
}
```
## Resources

| Name | Type |
|------|------|
| [local_file.output_campaign_json](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [null_resource.campaign](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region to deploy resources | `string` | `""` | no |
| <a name="input_campaign_json"></a> [campaign\_json](#input\_campaign\_json) | JSON string for the campaign configuration. | `string` | `null` | no |
| <a name="input_campaign_name"></a> [campaign\_name](#input\_campaign\_name) | The name of the campaign. | `string` | `""` | no |
| <a name="input_fleetwise_endpoint_url"></a> [fleetwise\_endpoint\_url](#input\_fleetwise\_endpoint\_url) | Endpoint URL for IoT FleetWise | `string` | `""` | no |
| <a name="input_signal_catalog_arn"></a> [signal\_catalog\_arn](#input\_signal\_catalog\_arn) | The ARN of the signal catalog. | `string` | `null` | no |
| <a name="input_target_arn"></a> [target\_arn](#input\_target\_arn) | The ARN of the target associated with the campaign. | `string` | `null` | no |
| <a name="input_terraform_role_arn"></a> [terraform\_role\_arn](#input\_terraform\_role\_arn) | Role ARN for assuming a role in the target account | `string` | `""` | no |
## Outputs

No outputs.
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->