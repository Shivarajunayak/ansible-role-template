# s3-event-triggers

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
README.md updated successfully
modules/README.md updated successfully
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.27 |
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
  	 source  = "<module-path>"
  
	 # Optional variables
  	 bucket_name  = ""
  	 eventbridge  = {}
  	 lambda_notifications  = {}
  	 sns_notifications  = {}
  	 sqs_notifications  = {}
}
```
## Resources

No resources.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Trigger bucket name | `string` | `""` | no |
| <a name="input_eventbridge"></a> [eventbridge](#input\_eventbridge) | Enable Eventbridge | `any` | `{}` | no |
| <a name="input_lambda_notifications"></a> [lambda\_notifications](#input\_lambda\_notifications) | lambda trigger config | `any` | `{}` | no |
| <a name="input_sns_notifications"></a> [sns\_notifications](#input\_sns\_notifications) | sns trigger config | `any` | `{}` | no |
| <a name="input_sqs_notifications"></a> [sqs\_notifications](#input\_sqs\_notifications) | sqs trigger config | `any` | `{}` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_bucket_notification_id"></a> [s3\_bucket\_notification\_id](#output\_s3\_bucket\_notification\_id) | ID of S3 bucket |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->