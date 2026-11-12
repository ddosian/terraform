resource "cloudflare_dns_record" "netbird-prod-01" {
  zone_id = var.cloudflare_zone_id
  name = "netbird.dontddos.me"
  ttl = 1
  type = "CNAME"
  comment = "Managed by Terraform"
  content = "edge-prod-01.lauterbourg.contabo.dontddos.me"
}