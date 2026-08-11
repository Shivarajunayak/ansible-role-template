output "iot_registration_code" {
  description = "The IoT registration code"
  value       = data.aws_iot_registration_code.example.registration_code
}
output "tls_private_key_pem" {
  description = "The PEM-encoded private key"
  value       = tls_private_key.example.private_key_pem
  sensitive   = true
}
output "tls_cert_request_pem" {
  description = "The PEM-encoded certificate request"
  value       = tls_cert_request.example.cert_request_pem
}
