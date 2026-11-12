resource "cloudflare_dns_record" "edge-prod-02" {
  zone_id = var.cloudflare_zone_id
  name    = "edge-prod-02.lauterbourg.contabo.dontddos.me"
  ttl     = 1
  type    = "A"
  comment = "Managed by Terraform"
  content = "38.242.248.156"
}