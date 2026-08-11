# iot-things

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
README.md updated successfully
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
  	 source  = "<module-path>"
    
	 # Required variables
    	 thing_groups  = 
    	 things  = 
}
```
## Resources

| Name | Type |
|------|------|
| [aws_iot_thing.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iot_thing) | resource |
| [aws_iot_thing_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iot_thing_group) | resource |
| [aws_iot_thing_group_membership.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iot_thing_group_membership) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_thing_groups"></a> [thing\_groups](#input\_thing\_groups) | List of IoT thing groups with their attribute keys, values, description, and tags | <pre>list(object({<br>    name             = string<br>    parent_name      = string<br>    attribute_keys   = list(string)<br>    attribute_values = list(string)<br>    description      = string<br>    tags             = map(string)<br>  }))</pre> | n/a | yes |
| <a name="input_things"></a> [things](#input\_things) | List of IoT things with their attribute keys, values, and tags | <pre>list(object({<br>    name             = string<br>    attribute_keys   = list(string)<br>    attribute_values = list(string)<br>    tags             = map(string)<br>  }))</pre> | n/a | yes |
## Outputs

No outputs.
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->