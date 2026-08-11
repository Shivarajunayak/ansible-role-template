# iot-lks

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
  	 aws_region  = "us-east-1"
  	 fleetwise_endpoint_url  = "https://controlplane.ea.us-east-1.gamma.kaleidoscope.iot.aws.dev"
  	 lks_template_name  = "fwdemo-lks-template"
  	 signal_catalog_arn  = ""
  	 state_template_properties  = [
  "Vehicle.ABS.DemoBrakePedalPressure",
  "Vehicle.ECM.DemoEngineTorque"
]
  	 terraform_role_arn  = ""
}
```
## Resources

| Name | Type |
|------|------|
| [null_resource.create_lks_template](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region to deploy resources | `string` | `"us-east-1"` | no |
| <a name="input_fleetwise_endpoint_url"></a> [fleetwise\_endpoint\_url](#input\_fleetwise\_endpoint\_url) | Endpoint URL for IoT FleetWise | `string` | `"https://controlplane.ea.us-east-1.gamma.kaleidoscope.iot.aws.dev"` | no |
| <a name="input_lks_template_name"></a> [lks\_template\_name](#input\_lks\_template\_name) | Name of the LKS Template | `string` | `"fwdemo-lks-template"` | no |
| <a name="input_signal_catalog_arn"></a> [signal\_catalog\_arn](#input\_signal\_catalog\_arn) | ARN of the Signal Catalog | `string` | `""` | no |
| <a name="input_state_template_properties"></a> [state\_template\_properties](#input\_state\_template\_properties) | Properties for the state template | `list(string)` | <pre>[<br>  "Vehicle.ABS.DemoBrakePedalPressure",<br>  "Vehicle.ECM.DemoEngineTorque"<br>]</pre> | no |
| <a name="input_terraform_role_arn"></a> [terraform\_role\_arn](#input\_terraform\_role\_arn) | Role ARN for assuming a role in the target account | `string` | `""` | no |
## Outputs

No outputs.
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->