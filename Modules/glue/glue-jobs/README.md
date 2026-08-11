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
    	 job_parameters  = 
  
	 # Optional variables
  	 acl  = "private"
  	 command  = {
  "name": "glueetl",
  "python_version": 3,
  "script_location": "s3://your-scripts-bucket/your-script.py"
}
  	 connections  = []
  	 data_location  = "s3://my-data-bucket/data/"
  	 data_source  = {
  "input_format": "org.apache.hudi.hadoop.HoodieParquetInputFormat",
  "location": "s3://your-source-bucket/path/",
  "output_format": "org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat",
  "serde_info": {
    "name": "my-table",
    "serialization_library": "    org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe"
  }
}
  	 default_arguments  = null
  	 execution_properties  = {}
  	 extra_jars  = "s3://hmcl-cvp-thor-demo/aws-msk-iam-auth-1.1.1-all.jar"
  	 glue_role_arn  = ""
  	 glue_scripts_bucket  = "glue-scripts-bucket"
  	 glue_version  = "3.0"
  	 job_description  = "My Glue job for ETL processing"
  	 job_name  = "my-glue-job"
  	 managed_policy_arn  = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
  	 max_capacity  = null
  	 max_retries  = 0
  	 non_overridable_arguments  = null
  	 number_of_workers  = 10
  	 role_arn  = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
  	 s3_bucket_results  = "glue-results-bucket"
  	 s3_bucket_scripts  = "glue-scripts-bucket"
  	 security_configuration  = null
  	 table_name  = "my_glue_table"
  	 tags  = {}
  	 timeout  = null
  	 worker_type  = "G.1X"
}
```
## Resources

| Name | Type |
|------|------|
| [aws_glue_job.glue_job](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_job) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acl"></a> [acl](#input\_acl) | (Optional) The canned ACL to apply. Conflicts with `grant` | `string` | `"private"` | no |
| <a name="input_command"></a> [command](#input\_command) | The command of the job. | <pre>object({<br>    name            = string<br>    script_location = string<br>    python_version  = number<br>  })</pre> | <pre>{<br>  "name": "glueetl",<br>  "python_version": 3,<br>  "script_location": "s3://your-scripts-bucket/your-script.py"<br>}</pre> | no |
| <a name="input_connections"></a> [connections](#input\_connections) | The list of connections with this job. | `list(string)` | `[]` | no |
| <a name="input_data_location"></a> [data\_location](#input\_data\_location) | Location of the data for the Glue catalog table | `string` | `"s3://my-data-bucket/data/"` | no |
| <a name="input_data_source"></a> [data\_source](#input\_data\_source) | Configuration for the data source | <pre>object({<br>    location      = string<br>    input_format  = string<br>    output_format = string<br>    serde_info = object({<br>      name                  = string<br>      serialization_library = string<br>    })<br>  })</pre> | <pre>{<br>  "input_format": "org.apache.hudi.hadoop.HoodieParquetInputFormat",<br>  "location": "s3://your-source-bucket/path/",<br>  "output_format": "org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat",<br>  "serde_info": {<br>    "name": "my-table",<br>    "serialization_library": "    org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe"<br>  }<br>}</pre> | no |
| <a name="input_default_arguments"></a> [default\_arguments](#input\_default\_arguments) | The map of default arguments for the job. You can specify arguments here that your own job-execution script consumes, as well as arguments that AWS Glue itself consumes. | `map(string)` | `null` | no |
| <a name="input_execution_properties"></a> [execution\_properties](#input\_execution\_properties) | Execution Properties | `any` | `{}` | no |
| <a name="input_extra_jars"></a> [extra\_jars](#input\_extra\_jars) | Comma-separated list of S3 paths to the JAR files | `string` | `"s3://hmcl-cvp-thor-demo/aws-msk-iam-auth-1.1.1-all.jar"` | no |
| <a name="input_glue_role_arn"></a> [glue\_role\_arn](#input\_glue\_role\_arn) | ARN of the IAM role for Glue job | `string` | `""` | no |
| <a name="input_glue_scripts_bucket"></a> [glue\_scripts\_bucket](#input\_glue\_scripts\_bucket) | The name of script bucket for glue | `string` | `"glue-scripts-bucket"` | no |
| <a name="input_glue_version"></a> [glue\_version](#input\_glue\_version) | The version of AWS Glue to use for the Glue Job | `string` | `"3.0"` | no |
| <a name="input_job_description"></a> [job\_description](#input\_job\_description) | Description of the Glue job | `string` | `"My Glue job for ETL processing"` | no |
| <a name="input_job_name"></a> [job\_name](#input\_job\_name) | The name of the Glue job | `string` | `"my-glue-job"` | no |
| <a name="input_job_parameters"></a> [job\_parameters](#input\_job\_parameters) | Job-specific parameters | `any` | n/a | yes |
| <a name="input_managed_policy_arn"></a> [managed\_policy\_arn](#input\_managed\_policy\_arn) | Managed policy ARN to attach to the IAM role | `string` | `"arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"` | no |
| <a name="input_max_capacity"></a> [max\_capacity](#input\_max\_capacity) | The maximum number of AWS Glue data processing units (DPUs) that can be allocated when the job runs. Required when `pythonshell` is set, accept either 0.0625 or 1.0. Use `number_of_workers` and `worker_type` arguments instead with `glue_version` 2.0 and above. | `number` | `null` | no |
| <a name="input_max_retries"></a> [max\_retries](#input\_max\_retries) | The maximum number of times to retry this job if it fails | `number` | `0` | no |
| <a name="input_non_overridable_arguments"></a> [non\_overridable\_arguments](#input\_non\_overridable\_arguments) | Non-overridable arguments for this job, specified as name-value pairs. | `map(string)` | `null` | no |
| <a name="input_number_of_workers"></a> [number\_of\_workers](#input\_number\_of\_workers) | The number of worker nodes that are allocated when a job runs | `number` | `10` | no |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | The ARN of the IAM role associated with this job. | `string` | `"arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"` | no |
| <a name="input_s3_bucket_results"></a> [s3\_bucket\_results](#input\_s3\_bucket\_results) | Name of the S3 bucket to store Glue job results | `string` | `"glue-results-bucket"` | no |
| <a name="input_s3_bucket_scripts"></a> [s3\_bucket\_scripts](#input\_s3\_bucket\_scripts) | Name of the S3 bucket to store Glue job scripts | `string` | `"glue-scripts-bucket"` | no |
| <a name="input_security_configuration"></a> [security\_configuration](#input\_security\_configuration) | The name of the Security Configuration to be associated with the job. | `string` | `null` | no |
| <a name="input_table_name"></a> [table\_name](#input\_table\_name) | Name of the Glue catalog table | `string` | `"my_glue_table"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to resources | `map(string)` | `{}` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | The job timeout in minutes | `number` | `null` | no |
| <a name="input_worker_type"></a> [worker\_type](#input\_worker\_type) | The type of predefined worker that is allocated when a job runs. Accepts Standard, G.1X, G.2X | `string` | `"G.1X"` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_glue_job_arn"></a> [glue\_job\_arn](#output\_glue\_job\_arn) | The ARN of the AWS Glue job |
| <a name="output_glue_job_name"></a> [glue\_job\_name](#output\_glue\_job\_name) | The name of the AWS Glue job |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->
