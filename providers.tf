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
    pfsense = {
      source  = "emanuelbesliu/pfsense"
      version = "0.58.0"
    }
  }
}

provider "pfsense" {
  url             = "https://10.77.1.1"
  password        = var.pfsense_password
  tls_skip_verify = true
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

provider "proxmox" {
  pm_api_url = "https://192.168.1.1:8006/api2/json"
  pm_tls_insecure = true 
  pm_api_token_id = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
}
