# DNS Records
resource "adguard_rewrite" "nb-prod-01_record" {
  domain = "nb-prod-01.internal.dontddos.me"
  answer = "10.77.1.101"
}

# Dockhand Environment
resource "dockhand_environment" "nb-prod-01_dockhand_environment" {
  name            = "nb-prod-01"
  connection_type = "direct"
  host     = "nb-prod-01.internal.dontddos.me"

  protocol        = "https"
  port            = 2376
  tls_skip_verify = false
  ca_cert     = file("${path.module}/../ansible/docker-keys/nb-prod-01/ca.pem")
  client_cert = file("${path.module}/../ansible/docker-keys/nb-prod-01/cert.pem")
  client_key  = file("${path.module}/../ansible/docker-keys/nb-prod-01/key.pem")
  icon            = "server"
}