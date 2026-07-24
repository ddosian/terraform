terraform {
  required_providers {
    adguard = {
      source  = "gmichels/adguard"
      version = "1.7.0"
    }
    dockhand = {
      source  = "kalebharrison/dockhand"
      version = ">= 0.1.63"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
    uptimekuma = {
      source  = "breml/uptimekuma"
      version = "~> 0.1"
    }
    authentik = {
      source  = "goauthentik/authentik"
      version = "2026.5.0"
    }
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc07"
    }
    netbox = {
      source  = "e-breuninger/netbox"
      version = "5.7.0"
    }
    infisical = {
      source = "infisical/infisical"
      version = "0.19.6"
    }
  }
}


provider "adguard" {
  host     = "adguard-home-prod-01.dns-prod-01.internal.dontddos.me"
  username = "ddos"
  password = local.adguard_password
}

provider "dockhand" {
  endpoint  = local.dockhand_endpoint
  api_token = local.dockhand_api_token
}

provider "cloudflare" {
  api_token = local.cloudflare_api_token
}

provider "uptimekuma" {
  endpoint = "https://uptime-kuma-prod-01.k3s-cl-prod-02.internal.dontddos.me"
  username = local.uptimekuma_username
  password = local.uptimekuma_password
}

provider "authentik" {
  url   = "https://authentik-prod-01.k3s-cl-prod-01.internal.dontddos.me"
  token = local.authentik_token
}

provider "proxmox" {
  pm_api_url          = "https://pve-prod-01.internal.dontddos.me:8006/api2/json"
  pm_api_token_id     = local.pm_api_token_id
  pm_api_token_secret = local.pm_api_token_secret
}

provider "netbox" {
  server_url = "https://netbox-prod-01.k3s-cl-prod-02.internal.dontddos.me"
  api_token  = local.netbox_api_token
}

variable "infisical_client_id" {
  type        = string
  description = "Infisical client ID"
}

variable "infisical_client_secret" {
  type        = string
  description = "Infisical client secret"
  sensitive   = true
}

provider "infisical" {
  host = "https://infisical-prod-01.infisical-prod-01.internal.dontddos.me"
  auth = {
    organization_slug = "homelab-f-bse"
    universal = {
      client_id     = var.infisical_client_id
      client_secret = var.infisical_client_secret
    }
  }
}