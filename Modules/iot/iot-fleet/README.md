# iot-fleet

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
  	 fleet_description  = ""
  	 fleet_id  = ""
  	 fleetwise_endpoint_url  = ""
  	 signal_catalog_arn  = ""
  	 terraform_role_arn  = ""
}
```
## Resources

| Name | Type |
|------|------|
| [null_resource.create_fleet](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region to deploy resources | `string` | `""` | no |
| <a name="input_fleet_description"></a> [fleet\_description](#input\_fleet\_description) | Description of the Fleet | `string` | `""` | no |
| <a name="input_fleet_id"></a> [fleet\_id](#input\_fleet\_id) | ID of the Fleet | `string` | `""` | no |
| <a name="input_fleetwise_endpoint_url"></a> [fleetwise\_endpoint\_url](#input\_fleetwise\_endpoint\_url) | Endpoint URL for IoT FleetWise | `string` | `""` | no |
| <a name="input_signal_catalog_arn"></a> [signal\_catalog\_arn](#input\_signal\_catalog\_arn) | ARN of the Signal Catalog | `string` | `""` | no |
| <a name="input_terraform_role_arn"></a> [terraform\_role\_arn](#input\_terraform\_role\_arn) | Role ARN for assuming a role in the target account | `string` | `""` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fleet_creation_trigger"></a> [fleet\_creation\_trigger](#output\_fleet\_creation\_trigger) | Trigger used for creating the fleet |
| <a name="output_fleet_description"></a> [fleet\_description](#output\_fleet\_description) | Description of the created fleet |
| <a name="output_fleet_id"></a> [fleet\_id](#output\_fleet\_id) | ID of the created fleet |
| <a name="output_signal_catalog_arn"></a> [signal\_catalog\_arn](#output\_signal\_catalog\_arn) | ARN of the signal catalog associated with the fleet |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->