# Cloudflare DNS records
resource "cloudflare_dns_record" "authentik-prod-01_cloudflare_record" {
  zone_id = "310137280dfff667dd7414c94ef3a938"
  name = "auth.dontddos.me"
  ttl = 1
  type = "CNAME"
  comment = "Managed by Terraform"
  content = "vps-prod-01.dontddos.me"
  proxied = false
}