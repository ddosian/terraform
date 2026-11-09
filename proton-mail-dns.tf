# MX
resource "cloudflare_dns_record" "proton-mail-mx10" {
  zone_id = var.cloudflare_zone_id
  name = "dontddos.me"
  ttl = 1
  type = "MX"
  comment = "Managed by Terraform"
  content = "mail.protonmail.ch"
  priority = 10
}

resource "cloudflare_dns_record" "proton-mail-mx20" {
  zone_id = var.cloudflare_zone_id
  name = "dontddos.me"
  ttl = 1
  type = "MX"
  comment = "Managed by Terraform"
  content = "mailsec.protonmail.ch"
  priority = 20
}


# CNAME
resource "cloudflare_dns_record" "proton-mail-domainkey1" {
  zone_id = var.cloudflare_zone_id
  name = "protonmail._domainkey.dontddos.me"
  ttl = 1
  type = "CNAME"
  comment = "Managed by Terraform"
  content = "protonmail.domainkey.dk7rn4h4c3mlcummpygdpvblcu2lkvalznmlpdnkh2awnmix6yk2q.domains.proton.ch"
}

resource "cloudflare_dns_record" "proton-mail-domainkey2" {
  zone_id = var.cloudflare_zone_id
  name = "protonmail2._domainkey.dontddos.me"
  ttl = 1
  type = "CNAME"
  comment = "Managed by Terraform"
  content = "protonmail2.domainkey.dk7rn4h4c3mlcummpygdpvblcu2lkvalznmlpdnkh2awnmix6yk2q.domains.proton.ch"
}

resource "cloudflare_dns_record" "proton-mail-domainkey3" {
  zone_id = var.cloudflare_zone_id
  name = "protonmail3._domainkey.dontddos.me"
  ttl = 1
  type = "CNAME"
  comment = "Managed by Terraform"
  content = "protonmail3.domainkey.dk7rn4h4c3mlcummpygdpvblcu2lkvalznmlpdnkh2awnmix6yk2q.domains.proton.ch"
}

# TXT
resource "cloudflare_dns_record" "proton-mail-verification" {
  zone_id = var.cloudflare_zone_id
  name = "dontddos.me"
  ttl = 1
  type = "TXT"
  comment = "Managed by Terraform"
  content = "protonmail-verification=0ebb9892aa0f3b4963e0b2855d1740e1ce23d2ac"
}

resource "cloudflare_dns_record" "proton-mail-spf" {
  zone_id = var.cloudflare_zone_id
  name = "dontddos.me"
  ttl = 1
  type = "TXT"
  comment = "Managed by Terraform"
  content = "v=spf1 include:_spf.protonmail.ch ~all"
}

resource "cloudflare_dns_record" "proton-mail-dmarc" {
  zone_id = var.cloudflare_zone_id
  name = "_dmarc.dontddos.me"
  ttl = 1
  type = "TXT"
  comment = "Managed by Terraform"
  content = "v=DMARC1; p=quarantine"
}