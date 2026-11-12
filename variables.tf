# Cloudflare
variable cloudflare_api_token {
    type = string
    sensitive = true
}

variable "cloudflare_zone_id" {
  type        = string
}

# Proxmox
variable "pm_api_token_id" {
  type = string
}

variable "pm_api_token_secret" {
  type = string
  sensitive = true
}


# pfSense
variable "pfsense_password" {
  type = string
  sensitive = true
}