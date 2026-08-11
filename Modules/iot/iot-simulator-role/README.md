# iot-simulator-role

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
  	 assume_role_policy_action  = ""
  	 custom_policy_json  = ""
  	 simulator_policy_name  = ""
  	 simulator_role_name  = "my-iot-role"
  	 tags  = {}
}
```
## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.custom_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.iot_simulator_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.custom_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assume_role_policy_action"></a> [assume\_role\_policy\_action](#input\_assume\_role\_policy\_action) | Simulator role assume role policy | `string` | `""` | no |
| <a name="input_custom_policy_json"></a> [custom\_policy\_json](#input\_custom\_policy\_json) | iot role custom policy | `string` | `""` | no |
| <a name="input_simulator_policy_name"></a> [simulator\_policy\_name](#input\_simulator\_policy\_name) | Custom IAM Policy name | `string` | `""` | no |
| <a name="input_simulator_role_name"></a> [simulator\_role\_name](#input\_simulator\_role\_name) | Name of the IAM role for Simulator rules | `string` | `"my-iot-role"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for AWS resources | `map(string)` | `{}` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_simulator_role_arn"></a> [simulator\_role\_arn](#output\_simulator\_role\_arn) | Simulator role arn |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->