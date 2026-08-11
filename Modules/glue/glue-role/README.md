# glue

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
README.md updated successfully
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.74.0 |
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
  	 source  = "<module-path>"
    
	 # Required variables
    	 custom_policy_json  = 
  
	 # Optional variables
  	 iam_policy_name  = ""
  	 iam_role_name  = "my-glue-role"
  	 managed_policies  = {}
}
```
## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.custom_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.glue_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.custom_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.glue_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_policy_json"></a> [custom\_policy\_json](#input\_custom\_policy\_json) | glue role custom policy | `string` | n/a | yes |
| <a name="input_iam_policy_name"></a> [iam\_policy\_name](#input\_iam\_policy\_name) | Custom IAM Policy name | `string` | `""` | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | Name of the IAM role for Glue job | `string` | `"my-glue-role"` | no |
| <a name="input_managed_policies"></a> [managed\_policies](#input\_managed\_policies) | Managed Policies ARN List | `any` | `{}` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_glue_role_arn"></a> [glue\_role\_arn](#output\_glue\_role\_arn) | Glue role arn |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->
