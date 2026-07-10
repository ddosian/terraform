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
  }
}

variable "adguard_password" {
  description = "The password for the AdGuard Home instance"
  type        = string
  sensitive   = true
}

provider "adguard" {
  host     = "adguard-home-prod-01.dns-prod-01.internal.dontddos.me"
  username = "ddos"
  password = var.adguard_password
}

variable "dockhand_endpoint" {
  description = "The endpoint for the Dockhand API"
  type        = string
}

variable "dockhand_api_token" {
  description = "The API token for the Dockhand API"
  type        = string
  sensitive   = true
}

provider "dockhand" {
  endpoint    = var.dockhand_endpoint
  api_token    = var.dockhand_api_token
}