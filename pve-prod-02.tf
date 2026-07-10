# DNS Records
resource "adguard_rewrite" "pve-prod-02_record" {
  domain = "pve-prod-02.internal.dontddos.me"
  answer = "10.77.0.12"
}

# Dockhand Environment
resource "dockhand_environment" "pve-prod-02_dockhand_environment" {
  name            = "pve-prod-02"
  connection_type = "direct"
  host     = "pve-prod-02.internal.dontddos.me"

  protocol        = "https"
  port            = 2376
  tls_skip_verify = false
  ca_cert     = file("${path.module}/../ansible/docker-keys/pve-prod-02/ca.pem")
  client_cert = file("${path.module}/../ansible/docker-keys/pve-prod-02/cert.pem")
  client_key  = file("${path.module}/../ansible/docker-keys/pve-prod-02/key.pem")
  icon            = "server"
}