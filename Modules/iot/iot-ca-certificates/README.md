# iot-ca-certificates

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
  	 certificate_mode  = ""
  	 subordinate_ca_certificate_pem  = ""
  	 tags  = {}
}
```
## Resources

| Name | Type |
|------|------|
| [aws_iot_ca_certificate.iot_ca_certificate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iot_ca_certificate) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificate_mode"></a> [certificate\_mode](#input\_certificate\_mode) | Certificate Mode | `string` | `""` | no |
| <a name="input_subordinate_ca_certificate_pem"></a> [subordinate\_ca\_certificate\_pem](#input\_subordinate\_ca\_certificate\_pem) | Subordinate CA Cert PEM | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `any` | `{}` | no |
## Outputs

No outputs.
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->