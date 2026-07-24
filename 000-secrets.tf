data "infisical_secrets" "production_secrets" {
  env_slug     = "prod"
  workspace_id = "d0ad2be4-9d2c-499b-b34f-7c63c05f3ae0"
  folder_path  = "/"
}

locals {
  adguard_password       = data.infisical_secrets.production_secrets.secrets["adguard_password"].value
  dockhand_endpoint      = data.infisical_secrets.production_secrets.secrets["dockhand_endpoint"].value
  dockhand_api_token     = data.infisical_secrets.production_secrets.secrets["dockhand_api_token"].value
  cloudflare_api_token   = data.infisical_secrets.production_secrets.secrets["cloudflare_api_token"].value
  uptimekuma_username    = data.infisical_secrets.production_secrets.secrets["uptimekuma_username"].value
  uptimekuma_password    = data.infisical_secrets.production_secrets.secrets["uptimekuma_password"].value
  authentik_token        = data.infisical_secrets.production_secrets.secrets["authentik_token"].value
  pm_api_token_id        = data.infisical_secrets.production_secrets.secrets["pm_api_token_id"].value
  pm_api_token_secret    = data.infisical_secrets.production_secrets.secrets["pm_api_token_secret"].value
  dockhand_client_id     = data.infisical_secrets.production_secrets.secrets["dockhand_client_id"].value
  dockhand_client_secret = data.infisical_secrets.production_secrets.secrets["dockhand_client_secret"].value
  netbox_api_token       = data.infisical_secrets.production_secrets.secrets["netbox_api_token"].value
  gitlab_client_id       = data.infisical_secrets.production_secrets.secrets["gitlab_client_id"].value
  gitlab_client_secret   = data.infisical_secrets.production_secrets.secrets["gitlab_client_secret"].value
  ts-prod-01_password    = data.infisical_secrets.production_secrets.secrets["ts-prod-01_password"].value
  ts-prod-02_password    = data.infisical_secrets.production_secrets.secrets["ts-prod-02_password"].value
}