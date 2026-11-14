terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.24.0"
    }
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc10"
    }       
    technitium = {
      source  = "kevynb/technitium"
      version = "0.4.0"
    }
  }
}

provider "technitium" {
  url = "https://technitium-prod-01.dns-prod-01.home.internal.dontddos.me"
  skip_certificate_verification = false
  token = var.technitium_token
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

provider "proxmox" {
  pm_api_url          = "https://10.77.10.11:8006/api2/json"
  pm_tls_insecure     = true
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
}
