# iot-rules

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
README.md updated successfully
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_awscc"></a> [awscc](#requirement\_awscc) | ~> 1.2.0 |
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
  	 source  = "<module-path>"
    
	 # Required variables
    	 iot_topic_rules  = 
  
	 # Optional variables
  	 cloudwatch_log_group  = ""
  	 custom_policy_json  = ""
  	 iam_policy_name  = ""
  	 iam_role_name  = "my-iot-role"
}
```
## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.kafka_error_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_policy.custom_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.iot_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.custom_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iot_topic_rule.topic_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iot_topic_rule) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudwatch_log_group"></a> [cloudwatch\_log\_group](#input\_cloudwatch\_log\_group) | Name of CloudWatch Log Group | `string` | `""` | no |
| <a name="input_custom_policy_json"></a> [custom\_policy\_json](#input\_custom\_policy\_json) | iot role custom policy | `string` | `""` | no |
| <a name="input_iam_policy_name"></a> [iam\_policy\_name](#input\_iam\_policy\_name) | Custom IAM Policy name | `string` | `""` | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | Name of the IAM role for iot rules | `string` | `"my-iot-role"` | no |
| <a name="input_iot_topic_rules"></a> [iot\_topic\_rules](#input\_iot\_topic\_rules) | n/a | <pre>map(object({<br>    rule_name   = string<br>    role_name   = optional(string)<br>    sql         = string<br>    sql_version = string<br>    description = string<br>    tags        = map(string)<br>    action = object({<br>      lambda = optional(object({ function_arn = string }))<br>      dynamodbv2 = optional(object({<br>        table_name = string<br>      }))<br>      kafka = optional(object({<br>        destination_arn   = string<br>        topic             = string<br>        key               = string<br>        client_properties = map(string)<br>      }))<br>      republish = optional(object({<br>        topic = string<br>        qos   = number<br>      }))<br>    })<br>    error_action = optional(object({<br>      dynamodbv2 = optional(object({<br>        table_name = string<br>      }))<br>      kafka = optional(object({<br>        destination_arn = string<br>        topic           = string<br>        key             = string<br>        client_properties = object({<br>          bootstrap_servers = string<br>          security_protocol = string<br>          sasl_mechanism    = string<br>          sasl_secret_name  = string<br>          compression_type  = string<br>          acks              = string<br>        })<br>      }))<br>      lambda = optional(object({<br>        function_arn = string<br>      }))<br>      cloudwatch_logs = optional(object({<br>        log_group_name = string<br>        batch_mode     = bool<br>      }))<br>      republish = optional(object({<br>        topic = string<br>        qos   = number<br>      }))<br>    }))<br>  }))</pre> | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kafka_destination_arns"></a> [kafka\_destination\_arns](#output\_kafka\_destination\_arns) | kafka destination arns |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->