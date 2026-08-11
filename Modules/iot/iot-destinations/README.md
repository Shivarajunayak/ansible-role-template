# iot-destinations

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
    
	 # Required variables
    	 assume_role_policy  = 
    	 iot_destinations_custom_policy_json  = 
    	 role_name  = 
    	 security_group_id  = 
    	 subnet_ids  = 
    	 vpc_id  = 
  
	 # Optional variables
  	 iam_policy_name  = ""
  	 tags  = {}
}
```
## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.custom_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.custom_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iot_topic_rule_destination.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iot_topic_rule_destination) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assume_role_policy"></a> [assume\_role\_policy](#input\_assume\_role\_policy) | IAM role assume role policy | `string` | n/a | yes |
| <a name="input_iam_policy_name"></a> [iam\_policy\_name](#input\_iam\_policy\_name) | Custom IAM Policy name | `string` | `""` | no |
| <a name="input_iot_destinations_custom_policy_json"></a> [iot\_destinations\_custom\_policy\_json](#input\_iot\_destinations\_custom\_policy\_json) | IAM policy JSON for IoT destinations | `string` | n/a | yes |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | Name of the IAM role for IoT topic rule | `string` | n/a | yes |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | Name of the security group for IoT topic rule | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of subnet IDs for the VPC configuration | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `any` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC where resources will be deployed | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_custom_policy_arn"></a> [custom\_policy\_arn](#output\_custom\_policy\_arn) | The ARN of the custom IAM policy attached to the IAM role. |
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | The ARN of the IAM role created for the IoT Topic Rule Destination. |
| <a name="output_iot_topic_rule_destination_arn"></a> [iot\_topic\_rule\_destination\_arn](#output\_iot\_topic\_rule\_destination\_arn) | The ARN of the IoT Topic Rule Destination. |
| <a name="output_iot_topic_rule_destination_id"></a> [iot\_topic\_rule\_destination\_id](#output\_iot\_topic\_rule\_destination\_id) | The ID of the IoT Topic Rule Destination. |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->
