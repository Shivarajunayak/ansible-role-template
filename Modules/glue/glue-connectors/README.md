# glue-connectors

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
  	 environment  = ""
  	 etl_vpc_id  = ""
  	 kafka_connection_properties  = {}
  	 msk_connection_name  = ""
  	 network_connection_name  = ""
  	 tags  = {}
  	 vpc_availability_zone  = ""
  	 vpc_security_group_id_list  = []
  	 vpc_subnet_id  = ""
}
```
## Resources

| Name | Type |
|------|------|
| [aws_glue_connection.msk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_connection) | resource |
| [aws_glue_connection.network](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_connection) | resource |
| [aws_security_group.glue_self_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.allow_self_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.allow_self_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Environment | `string` | `""` | no |
| <a name="input_etl_vpc_id"></a> [etl\_vpc\_id](#input\_etl\_vpc\_id) | etl vpc id | `string` | `""` | no |
| <a name="input_kafka_connection_properties"></a> [kafka\_connection\_properties](#input\_kafka\_connection\_properties) | Kafka connection properties used for this job. | `any` | `{}` | no |
| <a name="input_msk_connection_name"></a> [msk\_connection\_name](#input\_msk\_connection\_name) | Name of msk Connector | `string` | `""` | no |
| <a name="input_network_connection_name"></a> [network\_connection\_name](#input\_network\_connection\_name) | Name of Network Connector | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to resources | `map(string)` | `{}` | no |
| <a name="input_vpc_availability_zone"></a> [vpc\_availability\_zone](#input\_vpc\_availability\_zone) | MSK AZ | `string` | `""` | no |
| <a name="input_vpc_security_group_id_list"></a> [vpc\_security\_group\_id\_list](#input\_vpc\_security\_group\_id\_list) | MSK SGs | `list(string)` | `[]` | no |
| <a name="input_vpc_subnet_id"></a> [vpc\_subnet\_id](#input\_vpc\_subnet\_id) | MSK Subnet | `string` | `""` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connections"></a> [connections](#output\_connections) | connection names |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->