resource "cloudflare_dns_record" "edge-prod-01" {
  zone_id = var.cloudflare_zone_id
  name    = "edge-prod-01.lauterbourg.contabo.dontddos.me"
  ttl     = 1
  type    = "A"
  comment = "Managed by Terraform"
  content = "156.67.29.169"
}