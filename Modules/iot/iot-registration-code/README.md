# iot-registration-code

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
  	 algorithm  = "RSA"
  	 common_name  = "example.com"
}
```
## Resources

| Name | Type |
|------|------|
| [tls_cert_request.example](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/cert_request) | resource |
| [tls_private_key.example](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [aws_iot_registration_code.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iot_registration_code) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_algorithm"></a> [algorithm](#input\_algorithm) | The algorithm to use for the private key | `string` | `"RSA"` | no |
| <a name="input_common_name"></a> [common\_name](#input\_common\_name) | The common name for the TLS certificate | `string` | `"example.com"` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iot_registration_code"></a> [iot\_registration\_code](#output\_iot\_registration\_code) | The IoT registration code |
| <a name="output_tls_cert_request_pem"></a> [tls\_cert\_request\_pem](#output\_tls\_cert\_request\_pem) | The PEM-encoded certificate request |
| <a name="output_tls_private_key_pem"></a> [tls\_private\_key\_pem](#output\_tls\_private\_key\_pem) | The PEM-encoded private key |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->