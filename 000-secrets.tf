data "infisical_secrets" "terraform_production_secrets" {
  env_slug     = "prod"
  workspace_id = "d0ad2be4-9d2c-499b-b34f-7c63c05f3ae0"
  folder_path  = "/"
}

data "infisical_secrets" "docker_production_secrets" {
  env_slug     = "prod"
  workspace_id = "dc24923a-0be2-41e7-b810-4aa1a6ac4a77"
  folder_path  = "/"
}

locals {
  adguard_password       = data.infisical_secrets.terraform_production_secrets.secrets["adguard_password"].value
  dockhand_endpoint      = data.infisical_secrets.terraform_production_secrets.secrets["dockhand_endpoint"].value
  dockhand_api_token     = data.infisical_secrets.terraform_production_secrets.secrets["dockhand_api_token"].value
  cloudflare_api_token   = data.infisical_secrets.terraform_production_secrets.secrets["cloudflare_api_token"].value
  uptimekuma_username    = data.infisical_secrets.terraform_production_secrets.secrets["uptimekuma_username"].value
  uptimekuma_password    = data.infisical_secrets.terraform_production_secrets.secrets["uptimekuma_password"].value
  authentik_token        = data.infisical_secrets.terraform_production_secrets.secrets["authentik_token"].value
  pm_api_token_id        = data.infisical_secrets.terraform_production_secrets.secrets["pm_api_token_id"].value
  pm_api_token_secret    = data.infisical_secrets.terraform_production_secrets.secrets["pm_api_token_secret"].value
  dockhand_client_id     = data.infisical_secrets.terraform_production_secrets.secrets["dockhand_client_id"].value
  dockhand_client_secret = data.infisical_secrets.terraform_production_secrets.secrets["dockhand_client_secret"].value
  netbox_api_token       = data.infisical_secrets.terraform_production_secrets.secrets["netbox_api_token"].value
  gitlab_client_id       = data.infisical_secrets.terraform_production_secrets.secrets["gitlab_client_id"].value
  gitlab_client_secret   = data.infisical_secrets.terraform_production_secrets.secrets["gitlab_client_secret"].value
  ts-prod-01_password    = data.infisical_secrets.terraform_production_secrets.secrets["ts-prod-01_password"].value
  ts-prod-02_password    = data.infisical_secrets.terraform_production_secrets.secrets["ts-prod-02_password"].value
  b2_key_id              = data.infisical_secrets.terraform_production_secrets.secrets["b2_key_id"].value
  b2_application_key     = data.infisical_secrets.terraform_production_secrets.secrets["b2_application_key"].value

  pve-prod-01_ca   = data.infisical_secrets.docker_production_secrets.secrets["pve-prod-01_ca"].value
  pve-prod-01_cert = data.infisical_secrets.docker_production_secrets.secrets["pve-prod-01_cert"].value
  pve-prod-01_key  = data.infisical_secrets.docker_production_secrets.secrets["pve-prod-01_key"].value

  pve-prod-02_ca   = data.infisical_secrets.docker_production_secrets.secrets["pve-prod-02_ca"].value
  pve-prod-02_cert = data.infisical_secrets.docker_production_secrets.secrets["pve-prod-02_cert"].value
  pve-prod-02_key  = data.infisical_secrets.docker_production_secrets.secrets["pve-prod-02_key"].value

  pve-prod-03_ca   = data.infisical_secrets.docker_production_secrets.secrets["pve-prod-03_ca"].value
  pve-prod-03_cert = data.infisical_secrets.docker_production_secrets.secrets["pve-prod-03_cert"].value
  pve-prod-03_key  = data.infisical_secrets.docker_production_secrets.secrets["pve-prod-03_key"].value

  dns-prod-01_ca   = data.infisical_secrets.docker_production_secrets.secrets["dns-prod-01_ca"].value
  dns-prod-01_cert = data.infisical_secrets.docker_production_secrets.secrets["dns-prod-01_cert"].value
  dns-prod-01_key  = data.infisical_secrets.docker_production_secrets.secrets["dns-prod-01_key"].value

  dns-prod-02_ca   = data.infisical_secrets.docker_production_secrets.secrets["dns-prod-02_ca"].value
  dns-prod-02_cert = data.infisical_secrets.docker_production_secrets.secrets["dns-prod-02_cert"].value
  dns-prod-02_key  = data.infisical_secrets.docker_production_secrets.secrets["dns-prod-02_key"].value

  nb-prod-01_ca   = data.infisical_secrets.docker_production_secrets.secrets["nb-prod-01_ca"].value
  nb-prod-01_cert = data.infisical_secrets.docker_production_secrets.secrets["nb-prod-01_cert"].value
  nb-prod-01_key  = data.infisical_secrets.docker_production_secrets.secrets["nb-prod-01_key"].value

  nb-prod-02_ca   = data.infisical_secrets.docker_production_secrets.secrets["nb-prod-02_ca"].value
  nb-prod-02_cert = data.infisical_secrets.docker_production_secrets.secrets["nb-prod-02_cert"].value
  nb-prod-02_key  = data.infisical_secrets.docker_production_secrets.secrets["nb-prod-02_key"].value

  mon-prod-01_ca   = data.infisical_secrets.docker_production_secrets.secrets["mon-prod-01_ca"].value
  mon-prod-01_cert = data.infisical_secrets.docker_production_secrets.secrets["mon-prod-01_cert"].value
  mon-prod-01_key  = data.infisical_secrets.docker_production_secrets.secrets["mon-prod-01_key"].value

  calagopus-prod-01_ca   = data.infisical_secrets.docker_production_secrets.secrets["calagopus-prod-01_ca"].value
  calagopus-prod-01_cert = data.infisical_secrets.docker_production_secrets.secrets["calagopus-prod-01_cert"].value
  calagopus-prod-01_key  = data.infisical_secrets.docker_production_secrets.secrets["calagopus-prod-01_key"].value

  gl-prod-01_ca   = data.infisical_secrets.docker_production_secrets.secrets["gl-prod-01_ca"].value
  gl-prod-01_cert = data.infisical_secrets.docker_production_secrets.secrets["gl-prod-01_cert"].value
  gl-prod-01_key  = data.infisical_secrets.docker_production_secrets.secrets["gl-prod-01_key"].value

  gl-runner-prod-01_ca   = data.infisical_secrets.docker_production_secrets.secrets["gl-runner-prod-01_ca"].value
  gl-runner-prod-01_cert = data.infisical_secrets.docker_production_secrets.secrets["gl-runner-prod-01_cert"].value
  gl-runner-prod-01_key  = data.infisical_secrets.docker_production_secrets.secrets["gl-runner-prod-01_key"].value

  immich-prod-01_ca   = data.infisical_secrets.docker_production_secrets.secrets["immich-prod-01_ca"].value
  immich-prod-01_cert = data.infisical_secrets.docker_production_secrets.secrets["immich-prod-01_cert"].value
  immich-prod-01_key  = data.infisical_secrets.docker_production_secrets.secrets["immich-prod-01_key"].value

  infisical-prod-01_ca   = data.infisical_secrets.docker_production_secrets.secrets["infisical-prod-01_ca"].value
  infisical-prod-01_cert = data.infisical_secrets.docker_production_secrets.secrets["infisical-prod-01_cert"].value
  infisical-prod-01_key  = data.infisical_secrets.docker_production_secrets.secrets["infisical-prod-01_key"].value

  media-prod-01_ca   = data.infisical_secrets.docker_production_secrets.secrets["media-prod-01_ca"].value
  media-prod-01_cert = data.infisical_secrets.docker_production_secrets.secrets["media-prod-01_cert"].value
  media-prod-01_key  = data.infisical_secrets.docker_production_secrets.secrets["media-prod-01_key"].value

  media-prod-02_ca   = data.infisical_secrets.docker_production_secrets.secrets["media-prod-02_ca"].value
  media-prod-02_cert = data.infisical_secrets.docker_production_secrets.secrets["media-prod-02_cert"].value
  media-prod-02_key  = data.infisical_secrets.docker_production_secrets.secrets["media-prod-02_key"].value

  ts-prod-01_ca   = data.infisical_secrets.docker_production_secrets.secrets["ts-prod-01_ca"].value
  ts-prod-01_cert = data.infisical_secrets.docker_production_secrets.secrets["ts-prod-01_cert"].value
  ts-prod-01_key  = data.infisical_secrets.docker_production_secrets.secrets["ts-prod-01_key"].value

  ts-prod-02_ca   = data.infisical_secrets.docker_production_secrets.secrets["ts-prod-02_ca"].value
  ts-prod-02_cert = data.infisical_secrets.docker_production_secrets.secrets["ts-prod-02_cert"].value
  ts-prod-02_key  = data.infisical_secrets.docker_production_secrets.secrets["ts-prod-02_key"].value

  vps-prod-01_ca   = data.infisical_secrets.docker_production_secrets.secrets["vps-prod-01_ca"].value
  vps-prod-01_cert = data.infisical_secrets.docker_production_secrets.secrets["vps-prod-01_cert"].value
  vps-prod-01_key  = data.infisical_secrets.docker_production_secrets.secrets["vps-prod-01_key"].value

  vps-prod-02_ca   = data.infisical_secrets.docker_production_secrets.secrets["vps-prod-02_ca"].value
  vps-prod-02_cert = data.infisical_secrets.docker_production_secrets.secrets["vps-prod-02_cert"].value
  vps-prod-02_key  = data.infisical_secrets.docker_production_secrets.secrets["vps-prod-02_key"].value

  wings-prod-01_ca   = data.infisical_secrets.docker_production_secrets.secrets["wings-prod-01_ca"].value
  wings-prod-01_cert = data.infisical_secrets.docker_production_secrets.secrets["wings-prod-01_cert"].value
  wings-prod-01_key  = data.infisical_secrets.docker_production_secrets.secrets["wings-prod-01_key"].value
}