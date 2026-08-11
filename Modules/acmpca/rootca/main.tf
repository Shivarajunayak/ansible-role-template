resource "aws_acmpca_certificate_authority" "root" {
  type = "ROOT"
  certificate_authority_configuration {
    key_algorithm     = var.root_ca_key_algorithm
    signing_algorithm = var.root_ca_signing_algorithm
    subject {
      common_name = var.root_ca_common_name
    }
  }
  tags = var.tags
}
resource "aws_acmpca_certificate" "root" {
  certificate_authority_arn   = aws_acmpca_certificate_authority.root.arn
  certificate_signing_request = aws_acmpca_certificate_authority.root.certificate_signing_request
  signing_algorithm           = var.root_ca_signing_algorithm
  template_arn                = "arn:${data.aws_partition.current.partition}:acm-pca:::template/RootCACertificate/V1"
  validity {
    type  = "YEARS"
    value = var.root_ca_validity_years
  }
  lifecycle {
    create_before_destroy = true
  }

}
resource "aws_acmpca_certificate_authority_certificate" "root" {
  certificate_authority_arn = aws_acmpca_certificate_authority.root.arn
  certificate               = aws_acmpca_certificate.root.certificate
  certificate_chain         = aws_acmpca_certificate.root.certificate_chain
}

# Data source to fetch current AWS partition
data "aws_partition" "current" {}
