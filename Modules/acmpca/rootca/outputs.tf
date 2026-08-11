output "root_ca_arn" {
  description = "The ARN of the Root Certificate Authority"
  value       = aws_acmpca_certificate_authority.root.arn
}
output "root_ca_certificate" {
  description = "The certificate of the Root Certificate Authority"
  value       = aws_acmpca_certificate.root.certificate
}
output "root_ca_certificate_chain" {
  description = "The certificate chain of the Root Certificate Authority"
  value       = aws_acmpca_certificate.root.certificate_chain
}
