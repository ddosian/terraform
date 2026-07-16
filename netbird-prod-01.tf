# Cloudflare DNS records
resource "cloudflare_dns_record" "netbird-prod-01_cloudflare_record" {
  zone_id = "310137280dfff667dd7414c94ef3a938"
  name    = "netbird.dontddos.me"
  ttl     = 1
  type    = "CNAME"
  comment = "Managed by Terraform"
  content = "vps-prod-02.dontddos.me"
  proxied = false
}