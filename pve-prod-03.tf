# DNS Records
resource "adguard_rewrite" "pve-prod-03_record" {
  domain = "pve-prod-03.internal.dontddos.me"
  answer = "10.77.0.13"
}

# Dockhand Environment
resource "dockhand_environment" "pve-prod-03_dockhand_environment" {
  name            = "pve-prod-03"
  connection_type = "direct"
  host     = "pve-prod-03.internal.dontddos.me"

  protocol        = "https"
  port            = 2376
  tls_skip_verify = false
  ca_cert     = file("${path.module}/../ansible/docker-keys/pve-prod-03/ca.pem")
  client_cert = file("${path.module}/../ansible/docker-keys/pve-prod-03/cert.pem")
  client_key  = file("${path.module}/../ansible/docker-keys/pve-prod-03/key.pem")
  icon            = "server"
}