# MX
resource "cloudflare_dns_record" "simplelogin-mx10" {
  zone_id  = var.cloudflare_zone_id
  name     = "alias.dontddos.me"
  ttl      = 1
  type     = "MX"
  comment  = "Managed by Terraform"
  content  = "mx1.simplelogin.co"
  priority = 10
}

resource "cloudflare_dns_record" "simplelogin-mx20" {
  zone_id  = var.cloudflare_zone_id
  name     = "alias.dontddos.me"
  ttl      = 1
  type     = "MX"
  comment  = "Managed by Terraform"
  content  = "mx2.simplelogin.co"
  priority = 20
}

# CNAME
resource "cloudflare_dns_record" "simplelogin-domainkey1" {
  zone_id = var.cloudflare_zone_id
  name    = "dkim._domainkey.alias.dontddos.me"
  ttl     = 1
  type    = "CNAME"
  comment = "Managed by Terraform"
  content = "dkim._domainkey.simplelogin.co"
}
resource "cloudflare_dns_record" "simplelogin-domainkey2" {
  zone_id = var.cloudflare_zone_id
  name    = "dkim2._domainkey.alias.dontddos.me"
  ttl     = 1
  type    = "CNAME"
  comment = "Managed by Terraform"
  content = "dkim2._domainkey.simplelogin.co"
}
resource "cloudflare_dns_record" "simplelogin-domainkey3" {
  zone_id = var.cloudflare_zone_id
  name    = "dkim3._domainkey.alias.dontddos.me"
  ttl     = 1
  type    = "CNAME"
  comment = "Managed by Terraform"
  content = "dkim3._domainkey.simplelogin.co"
}
# TXT
resource "cloudflare_dns_record" "simplelogin-spf" {
  zone_id = var.cloudflare_zone_id
  name    = "alias.dontddos.me"
  ttl     = 1
  type    = "TXT"
  comment = "Managed by Terraform"
  content = "v=spf1 include:simplelogin.co ~all"
}

resource "cloudflare_dns_record" "simplelogin-dmarc" {
  zone_id = var.cloudflare_zone_id
  name    = "_dmarc.alias.dontddos.me"
  ttl     = 1
  type    = "TXT"
  comment = "Managed by Terraform"
  content = "v=DMARC1; p=quarantine; pct=100; adkim=s; aspf=s"
}