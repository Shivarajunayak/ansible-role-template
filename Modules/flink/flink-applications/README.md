# flink

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
    	 application_name  = 
    	 bucket  = 
    	 cloudwatch_log_group  = 
    	 cloudwatch_log_stream  = 
    	 flink_application_configuration  = 
    	 flink_application_properties  = 
    	 flink_role_arn  = 
    	 runtime_environment  = 
    	 s3_object_key  = 
    	 security_group_id  = 
    	 subnet_ids  = 
  
	 # Optional variables
  	 tags  = {}
}
```
## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_stream.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_stream) | resource |
| [aws_kinesisanalyticsv2_application.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesisanalyticsv2_application) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | Name of the Kinesis Analytics application | `string` | n/a | yes |
| <a name="input_bucket"></a> [bucket](#input\_bucket) | S3 bucket name | `string` | n/a | yes |
| <a name="input_cloudwatch_log_group"></a> [cloudwatch\_log\_group](#input\_cloudwatch\_log\_group) | Name of CloudWatch Log Group | `string` | n/a | yes |
| <a name="input_cloudwatch_log_stream"></a> [cloudwatch\_log\_stream](#input\_cloudwatch\_log\_stream) | Name of CloudWatch Log Stream | `string` | n/a | yes |
| <a name="input_flink_application_configuration"></a> [flink\_application\_configuration](#input\_flink\_application\_configuration) | List of Flink application configurations | <pre>list(object({<br>    checkpoint_configuration_type  = string<br>    monitoring_configuration_type  = string<br>    log_level                      = string<br>    metrics_level                  = string<br>    auto_scaling_enabled           = bool<br>    parallelism_configuration_type = string<br>    parallelism                    = number<br>    parallelism_per_kpu            = number<br>  }))</pre> | n/a | yes |
| <a name="input_flink_application_properties"></a> [flink\_application\_properties](#input\_flink\_application\_properties) | Properties for the Flink application | <pre>list(object({<br>    property_group_id = string<br>    property_map      = map(string)<br>  }))</pre> | n/a | yes |
| <a name="input_flink_role_arn"></a> [flink\_role\_arn](#input\_flink\_role\_arn) | Flink Role ARN | `string` | n/a | yes |
| <a name="input_runtime_environment"></a> [runtime\_environment](#input\_runtime\_environment) | Runtime environment for the Kinesis Analytics application | `string` | n/a | yes |
| <a name="input_s3_object_key"></a> [s3\_object\_key](#input\_s3\_object\_key) | Key of the object in S3 | `string` | n/a | yes |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | Security group ID for the VPC configuration | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of subnet IDs for the VPC configuration | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for AWS resources | `any` | `{}` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kinesisanalytics_application_arn"></a> [kinesisanalytics\_application\_arn](#output\_kinesisanalytics\_application\_arn) | The ARN of the Kinesis Analytics application |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->
