# amq

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
    
	 # Required variables
    	 broker_name  = 
    	 configuration_name  = 
    	 deployment_mode  = 
    	 engine_version  = 
    	 host_instance_type  = 
    	 mq_configuration_data  = 
    	 security_groups  = 
    	 storage_type  = 
    	 subnet_ids  = 
  
	 # Optional variables
  	 apply_immediately  = true
  	 auto_minor_version_upgrade  = true
  	 enable_audit_logs  = false
  	 enable_general_logs  = false
  	 engine_type  = "ActiveMQ"
  	 kms_key_id  = ""
  	 mq_secret_name  = ""
  	 publicly_accessible  = false
  	 tags  = {}
}
```
## Resources

| Name | Type |
|------|------|
| [aws_mq_broker.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker) | resource |
| [aws_mq_configuration.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_configuration) | resource |
| [aws_secretsmanager_secret.mq_secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret_version.mq_secret_version](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Whether to apply changes immediately | `bool` | `true` | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | Whether to enable automatic minor version upgrades | `bool` | `true` | no |
| <a name="input_broker_name"></a> [broker\_name](#input\_broker\_name) | The name of the MQ broker | `string` | n/a | yes |
| <a name="input_configuration_name"></a> [configuration\_name](#input\_configuration\_name) | The name of the MQ configuration | `string` | n/a | yes |
| <a name="input_deployment_mode"></a> [deployment\_mode](#input\_deployment\_mode) | The deployment mode of the broker | `string` | n/a | yes |
| <a name="input_enable_audit_logs"></a> [enable\_audit\_logs](#input\_enable\_audit\_logs) | Whether the audit logs should be enabled | `bool` | `false` | no |
| <a name="input_enable_general_logs"></a> [enable\_general\_logs](#input\_enable\_general\_logs) | Whether the general logs should be enabled | `bool` | `false` | no |
| <a name="input_engine_type"></a> [engine\_type](#input\_engine\_type) | The type of broker engine | `string` | `"ActiveMQ"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The version of the broker engine | `string` | n/a | yes |
| <a name="input_host_instance_type"></a> [host\_instance\_type](#input\_host\_instance\_type) | The type of broker instance | `string` | n/a | yes |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The KMS key ID for encrypting SSM parameters | `string` | `""` | no |
| <a name="input_mq_configuration_data"></a> [mq\_configuration\_data](#input\_mq\_configuration\_data) | MQ Configuration Data | `string` | n/a | yes |
| <a name="input_mq_secret_name"></a> [mq\_secret\_name](#input\_mq\_secret\_name) | The name of the MQ secret | `string` | `""` | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | Whether the broker is publicly accessible | `bool` | `false` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | The list of security group IDs for the broker | `list(string)` | n/a | yes |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | The broker storage | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The list of subnet IDs for the broker | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resources | `map(string)` | `{}` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mq_broker_arn"></a> [mq\_broker\_arn](#output\_mq\_broker\_arn) | The ARN of the MQ broker |
| <a name="output_mq_broker_id"></a> [mq\_broker\_id](#output\_mq\_broker\_id) | The ID of the MQ broker |
| <a name="output_mq_configuration_id"></a> [mq\_configuration\_id](#output\_mq\_configuration\_id) | The ID of the MQ configuration |
| <a name="output_mq_configuration_revision"></a> [mq\_configuration\_revision](#output\_mq\_configuration\_revision) | The latest revision of the MQ configuration |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->