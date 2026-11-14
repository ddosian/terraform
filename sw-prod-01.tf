resource "technitium_record" "sw-prod-01" {
  domain = "sw-prod-01.home.internal.dontddos.me"
  type = "A"
  ip_address= "10.77.10.21"
  ttl       = 3600
}

resource "technitium_record" "sw-prod-01_wildcard" {
  domain = "*.sw-prod-01.home.internal.dontddos.me"
  type = "CNAME"
  value= "sw-prod-01.home.internal.dontddos.me"
  ttl       = 3600
}