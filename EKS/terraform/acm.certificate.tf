resource "aws_acm_certificate" "this" {
  domain_name       = "*.strongsoftwares.com.br"
  validation_method = "DNS"

  tags = var.tags
}