# acmpca

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
README.md updated successfully
rootca/README.md updated successfully
subordinateca/README.md updated successfully
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.12.0 |
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
  	 source  = "<module-path>"
  
	 # Optional variables
  	 root_ca_common_name  = "example.com"
  	 root_ca_key_algorithm  = "RSA_4096"
  	 root_ca_signing_algorithm  = "SHA512WITHRSA"
  	 root_ca_validity_years  = 10
  	 subordinate_ca_common_name  = "sub.example.com"
  	 subordinate_ca_key_algorithm  = "RSA_2048"
  	 subordinate_ca_signing_algorithm  = "SHA512WITHRSA"
  	 subordinate_ca_validity_years  = 5
  	 tags  = {
  "Environment": "production",
  "Project": "ACM PCA"
}
}
```
## Resources

| Name | Type |
|------|------|
| [aws_acmpca_certificate.root](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acmpca_certificate) | resource |
| [aws_acmpca_certificate.subordinate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acmpca_certificate) | resource |
| [aws_acmpca_certificate_authority.root](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acmpca_certificate_authority) | resource |
| [aws_acmpca_certificate_authority.subordinate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acmpca_certificate_authority) | resource |
| [aws_acmpca_certificate_authority_certificate.root](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acmpca_certificate_authority_certificate) | resource |
| [aws_acmpca_certificate_authority_certificate.subordinate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acmpca_certificate_authority_certificate) | resource |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_root_ca_common_name"></a> [root\_ca\_common\_name](#input\_root\_ca\_common\_name) | Common name for the Root CA. | `string` | `"example.com"` | no |
| <a name="input_root_ca_key_algorithm"></a> [root\_ca\_key\_algorithm](#input\_root\_ca\_key\_algorithm) | Key algorithm for the Root CA. | `string` | `"RSA_4096"` | no |
| <a name="input_root_ca_signing_algorithm"></a> [root\_ca\_signing\_algorithm](#input\_root\_ca\_signing\_algorithm) | Signing algorithm for the Root CA. | `string` | `"SHA512WITHRSA"` | no |
| <a name="input_root_ca_validity_years"></a> [root\_ca\_validity\_years](#input\_root\_ca\_validity\_years) | Validity period in years for the Root CA certificate. | `number` | `10` | no |
| <a name="input_subordinate_ca_common_name"></a> [subordinate\_ca\_common\_name](#input\_subordinate\_ca\_common\_name) | Common name for the Subordinate CA. | `string` | `"sub.example.com"` | no |
| <a name="input_subordinate_ca_key_algorithm"></a> [subordinate\_ca\_key\_algorithm](#input\_subordinate\_ca\_key\_algorithm) | Key algorithm for the Subordinate CA. | `string` | `"RSA_2048"` | no |
| <a name="input_subordinate_ca_signing_algorithm"></a> [subordinate\_ca\_signing\_algorithm](#input\_subordinate\_ca\_signing\_algorithm) | Signing algorithm for the Subordinate CA. | `string` | `"SHA512WITHRSA"` | no |
| <a name="input_subordinate_ca_validity_years"></a> [subordinate\_ca\_validity\_years](#input\_subordinate\_ca\_validity\_years) | Validity period in years for the Subordinate CA certificate. | `number` | `5` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | <pre>{<br>  "Environment": "production",<br>  "Project": "ACM PCA"<br>}</pre> | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_root_ca_arn"></a> [root\_ca\_arn](#output\_root\_ca\_arn) | The ARN of the Root Certificate Authority |
| <a name="output_root_ca_certificate"></a> [root\_ca\_certificate](#output\_root\_ca\_certificate) | The certificate of the Root Certificate Authority |
| <a name="output_root_ca_certificate_chain"></a> [root\_ca\_certificate\_chain](#output\_root\_ca\_certificate\_chain) | The certificate chain of the Root Certificate Authority |
| <a name="output_subordinate_ca_arn"></a> [subordinate\_ca\_arn](#output\_subordinate\_ca\_arn) | The ARN of the Subordinate Certificate Authority |
| <a name="output_subordinate_ca_certificate"></a> [subordinate\_ca\_certificate](#output\_subordinate\_ca\_certificate) | The certificate of the Subordinate Certificate Authority |
| <a name="output_subordinate_ca_certificate_chain"></a> [subordinate\_ca\_certificate\_chain](#output\_subordinate\_ca\_certificate\_chain) | The certificate chain of the Subordinate Certificate Authority |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->