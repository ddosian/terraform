# SimpleLogin DKIM CNAME records
resource "cloudflare_dns_record" "dkim_alias_cloudflare_record" {
  zone_id = "310137280dfff667dd7414c94ef3a938"
  name    = "dkim._domainkey.alias.dontddos.me"
  ttl     = 1
  type    = "CNAME"
  comment = "Managed by Terraform"
  content = "dkim._domainkey.simplelogin.co"
  proxied = false
}

resource "cloudflare_dns_record" "dkim02_alias_cloudflare_record" {
  zone_id = "310137280dfff667dd7414c94ef3a938"
  name    = "dkim02._domainkey.alias.dontddos.me"
  ttl     = 1
  type    = "CNAME"
  comment = "Managed by Terraform"
  content = "dkim02._domainkey.simplelogin.co"
  proxied = false
}

resource "cloudflare_dns_record" "dkim03_alias_cloudflare_record" {
  zone_id = "310137280dfff667dd7414c94ef3a938"
  name    = "dkim03._domainkey.alias.dontddos.me"
  ttl     = 1
  type    = "CNAME"
  comment = "Managed by Terraform"
  content = "dkim03._domainkey.simplelogin.co"
  proxied = false
}

# SimpleLogin MX records
resource "cloudflare_dns_record" "mx_alias_1_cloudflare_record" {
  zone_id  = "310137280dfff667dd7414c94ef3a938"
  name     = "alias.dontddos.me"
  ttl      = 1
  type     = "MX"
  comment  = "Managed by Terraform"
  content  = "mx1.simplelogin.co"
  priority = 10
  proxied  = false
}

resource "cloudflare_dns_record" "mx_alias_2_cloudflare_record" {
  zone_id  = "310137280dfff667dd7414c94ef3a938"
  name     = "alias.dontddos.me"
  ttl      = 1
  type     = "MX"
  comment  = "Managed by Terraform"
  content  = "mx2.simplelogin.co"
  priority = 20
  proxied  = false
}

# SimpleLogin TXT records
resource "cloudflare_dns_record" "txt_alias_spf_cloudflare_record" {
  zone_id = "310137280dfff667dd7414c94ef3a938"
  name    = "alias.dontddos.me"
  ttl     = 1
  type    = "TXT"
  comment = "Managed by Terraform"
  content = "v=spf1 include:simplelogin.co ~all"
  proxied = false
}

resource "cloudflare_dns_record" "txt_alias_verification_cloudflare_record" {
  zone_id = "310137280dfff667dd7414c94ef3a938"
  name    = "alias.dontddos.me"
  ttl     = 1
  type    = "TXT"
  comment = "Managed by Terraform"
  content = "sl-verification=qwauutcftalxawvfwucyosaezjrdpy"
  proxied = false
}

resource "cloudflare_dns_record" "txt_dmarc_alias_cloudflare_record" {
  zone_id = "310137280dfff667dd7414c94ef3a938"
  name    = "_dmarc.alias.dontddos.me"
  ttl     = 1
  type    = "TXT"
  comment = "Managed by Terraform"
  content = "v=DMARC1; p=quarantine; pct=100; adkim=s; aspf=s"
  proxied = false
}
