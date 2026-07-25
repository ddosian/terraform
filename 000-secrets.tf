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
  adguard_password       = data.infisical_secrets.terraform_production_secrets.secrets["ADGUARD_PASSWORD"].value
  dockhand_api_token     = data.infisical_secrets.terraform_production_secrets.secrets["DOCKHAND_API_TOKEN"].value
  cloudflare_api_token   = data.infisical_secrets.terraform_production_secrets.secrets["CLOUDFLARE_API_TOKEN"].value
  uptimekuma_username    = data.infisical_secrets.terraform_production_secrets.secrets["UPTIMEKUMA_USERNAME"].value
  uptimekuma_password    = data.infisical_secrets.terraform_production_secrets.secrets["UPTIMEKUMA_PASSWORD"].value
  authentik_token        = data.infisical_secrets.terraform_production_secrets.secrets["AUTHENTIK_TOKEN"].value
  pm_api_token_id        = data.infisical_secrets.terraform_production_secrets.secrets["PM_API_TOKEN_ID"].value
  pm_api_token_secret    = data.infisical_secrets.terraform_production_secrets.secrets["PM_API_TOKEN_SECRET"].value
  dockhand_client_id     = data.infisical_secrets.terraform_production_secrets.secrets["DOCKHAND_CLIENT_ID"].value
  dockhand_client_secret = data.infisical_secrets.terraform_production_secrets.secrets["DOCKHAND_CLIENT_SECRET"].value
  netbox_api_token       = data.infisical_secrets.terraform_production_secrets.secrets["NETBOX_API_TOKEN"].value
  gitlab_client_id       = data.infisical_secrets.terraform_production_secrets.secrets["GITLAB_CLIENT_ID"].value
  gitlab_client_secret   = data.infisical_secrets.terraform_production_secrets.secrets["GITLAB_CLIENT_SECRET"].value
  ts-prod-01_password    = data.infisical_secrets.terraform_production_secrets.secrets["TS_PROD_01_ROOT_PASSWORD"].value
  ts-prod-02_password    = data.infisical_secrets.terraform_production_secrets.secrets["TS_PROD_02_ROOT_PASSWORD"].value
  b2_key_id              = data.infisical_secrets.terraform_production_secrets.secrets["B2_APPLICATION_KEY_ID"].value
  b2_application_key     = data.infisical_secrets.terraform_production_secrets.secrets["B2_APPLICATION_KEY"].value

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