# Cloudflare DNS records
resource "cloudflare_dns_record" "matrix-prod-01_cloudflare_record" {
  zone_id = "310137280dfff667dd7414c94ef3a938"
  name    = "matrix.dontddos.me"
  ttl     = 1
  type    = "A"
  comment = "Managed by Terraform"
  content = "156.67.29.169"
  proxied = false
}

resource "cloudflare_dns_record" "matrix-prod-01_wildcard_cloudflare_record" {
  zone_id = "310137280dfff667dd7414c94ef3a938"
  name    = "*.matrix.dontddos.me"
  ttl     = 1
  type    = "A"
  comment = "Managed by Terraform"
  content = "156.67.29.169"
  proxied = false
}