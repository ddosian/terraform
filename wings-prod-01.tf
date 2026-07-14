# DNS Records
resource "adguard_rewrite" "wings-prod-01_record" {
  domain = "wings-prod-01.internal.dontddos.me"
  answer = "10.78.1.106"
}

# Cloudflare DNS records
resource "cloudflare_dns_record" "wings-prod-01_cloudflare_record" {
  zone_id  = "310137280dfff667dd7414c94ef3a938"
  name     = "wings-prod-01.dontddos.me"
  ttl      = 1
  type     = "A"
  comment  = "Managed by Terraform"
  content  = "156.67.29.169"
  proxied  = false
}
