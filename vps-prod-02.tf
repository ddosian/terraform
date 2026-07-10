# Dockhand Environment
resource "dockhand_environment" "vps-prod-02_dockhand_environment" {
  name            = "vps-prod-02"
  connection_type = "direct"
  host     = "vps-prod-02.dontddos.me"

  protocol        = "https"
  port            = 2376
  tls_skip_verify = false
  ca_cert     = file("${path.module}/../ansible/docker-keys/vps-prod-02/ca.pem")
  client_cert = file("${path.module}/../ansible/docker-keys/vps-prod-02/cert.pem")
  client_key  = file("${path.module}/../ansible/docker-keys/vps-prod-02/key.pem")
  icon            = "server"
}