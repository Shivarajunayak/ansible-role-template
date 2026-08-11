# step-function

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
README.md updated successfully
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.14.1 |
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
  	 source  = "<module-path>"
  
	 # Optional variables
  	 cloudwatch_log_group_kms_key_id  = ""
  	 cloudwatch_log_group_name  = ""
  	 cloudwatch_log_group_retention_in_days  = 7
  	 cloudwatch_log_group_tags  = {}
  	 create  = true
  	 definition  = ""
  	 logging_configuration  = {}
  	 name  = ""
  	 publish  = false
  	 stepfunction_role_arn  = ""
  	 tags  = {}
  	 type  = ""
}
```
## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_sfn_state_machine.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sfn_state_machine) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudwatch_log_group_kms_key_id"></a> [cloudwatch\_log\_group\_kms\_key\_id](#input\_cloudwatch\_log\_group\_kms\_key\_id) | KMS key ID for encrypting CloudWatch logs | `string` | `""` | no |
| <a name="input_cloudwatch_log_group_name"></a> [cloudwatch\_log\_group\_name](#input\_cloudwatch\_log\_group\_name) | Name of the CloudWatch log group | `string` | `""` | no |
| <a name="input_cloudwatch_log_group_retention_in_days"></a> [cloudwatch\_log\_group\_retention\_in\_days](#input\_cloudwatch\_log\_group\_retention\_in\_days) | Retention period of CloudWatch logs in days | `number` | `7` | no |
| <a name="input_cloudwatch_log_group_tags"></a> [cloudwatch\_log\_group\_tags](#input\_cloudwatch\_log\_group\_tags) | Tags to apply to the CloudWatch log group | `map(string)` | `{}` | no |
| <a name="input_create"></a> [create](#input\_create) | Whether to create the resources | `bool` | `true` | no |
| <a name="input_definition"></a> [definition](#input\_definition) | Definition of the Step Functions state machine | `string` | `""` | no |
| <a name="input_logging_configuration"></a> [logging\_configuration](#input\_logging\_configuration) | Logging configuration for the Step Functions state machine | `map(any)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the Step Functions state machine | `string` | `""` | no |
| <a name="input_publish"></a> [publish](#input\_publish) | Whether to publish the Step Functions state machine | `bool` | `false` | no |
| <a name="input_stepfunction_role_arn"></a> [stepfunction\_role\_arn](#input\_stepfunction\_role\_arn) | ARN of the IAM role for the Step Functions state machine | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to both resources | `map(string)` | `{}` | no |
| <a name="input_type"></a> [type](#input\_type) | Type of the Step Functions state machine (e.g., EXPRESS, STANDARD) | `string` | `""` | no |
## Outputs

No outputs.
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->