# iot-device-defender-audit

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
README.md updated successfully
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.0 |
| <a name="requirement_awscc"></a> [awscc](#requirement\_awscc) | ~> 0.1 |
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
  	 source  = "<module-path>"
    
	 # Required variables
    	 audit_checks  = 
    	 iot_assume_role_policy  = 
    	 iot_policy_document  = 
    	 sns_assume_role_policy  = 
    	 sns_policy_document  = 
  
	 # Optional variables
  	 account_id  = "905418263290"
  	 aws_region  = ""
  	 iot_policy_name  = ""
  	 iot_role_arn  = ""
  	 iot_role_name  = ""
  	 sns_policy_name  = ""
  	 sns_role_name  = ""
  	 sns_topic_name  = ""
  	 tags  = {}
}
```
## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.iot_audit_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.sns_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.iot_audit_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.sns_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.iot_audit_role_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.sns_role_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_sns_topic.iot_audit_sns_topic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [awscc_iot_account_audit_configuration.iot_audit_config](https://registry.terraform.io/providers/hashicorp/awscc/latest/docs/resources/iot_account_audit_configuration) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | Your 12-digit AWS account ID | `string` | `"905418263290"` | no |
| <a name="input_audit_checks"></a> [audit\_checks](#input\_audit\_checks) | Configuration for audit checks | <pre>map(object({<br>    enabled = bool<br>  }))</pre> | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region to create resources in | `string` | `""` | no |
| <a name="input_iot_assume_role_policy"></a> [iot\_assume\_role\_policy](#input\_iot\_assume\_role\_policy) | Assume role policy for the IoT role | `string` | n/a | yes |
| <a name="input_iot_policy_document"></a> [iot\_policy\_document](#input\_iot\_policy\_document) | Policy document for the IoT policy | `string` | n/a | yes |
| <a name="input_iot_policy_name"></a> [iot\_policy\_name](#input\_iot\_policy\_name) | The name of the IAM policy for IoT audit | `string` | `""` | no |
| <a name="input_iot_role_arn"></a> [iot\_role\_arn](#input\_iot\_role\_arn) | The ARN of the IAM role that grants AWS IoT permission to perform audits | `string` | `""` | no |
| <a name="input_iot_role_name"></a> [iot\_role\_name](#input\_iot\_role\_name) | The name of the IAM role for IoT audit | `string` | `""` | no |
| <a name="input_sns_assume_role_policy"></a> [sns\_assume\_role\_policy](#input\_sns\_assume\_role\_policy) | Assume role policy for the SNS role | `string` | n/a | yes |
| <a name="input_sns_policy_document"></a> [sns\_policy\_document](#input\_sns\_policy\_document) | Policy document for the SNS policy | `string` | n/a | yes |
| <a name="input_sns_policy_name"></a> [sns\_policy\_name](#input\_sns\_policy\_name) | The name of the IAM policy for SNS notifications | `string` | `""` | no |
| <a name="input_sns_role_name"></a> [sns\_role\_name](#input\_sns\_role\_name) | The name of the IAM role for SNS notifications | `string` | `""` | no |
| <a name="input_sns_topic_name"></a> [sns\_topic\_name](#input\_sns\_topic\_name) | The name of the SNS topic for audit notifications | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `any` | `{}` | no |
## Outputs

No outputs.
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->