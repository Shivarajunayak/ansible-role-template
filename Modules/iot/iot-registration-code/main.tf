data "aws_iot_registration_code" "example" {

}
resource "tls_private_key" "example" {
  algorithm = var.algorithm
}
resource "tls_cert_request" "example" {
  private_key_pem = tls_private_key.example.private_key_pem
  subject {
    common_name = var.common_name
  }
}
