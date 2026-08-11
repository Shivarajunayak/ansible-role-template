# glue-databases

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
  
	 # Optional variables
  	 database_name  = "my_glue_database"
  	 tags  = {}
}
```
## Resources

| Name | Type |
|------|------|
| [aws_glue_catalog_database.glue_database](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_catalog_database) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | Name of the Glue catalog database | `string` | `"my_glue_database"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to resources | `map(string)` | `{}` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_glue_database_name"></a> [glue\_database\_name](#output\_glue\_database\_name) | Glue catalog db name |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->