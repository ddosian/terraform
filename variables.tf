# Cloudflare
variable "cloudflare_api_token" {
  type      = string
  sensitive = true
}

variable "cloudflare_zone_id" {
  type = string
}

# Proxmox
variable "pm_api_token_id" {
  type = string
}

variable "pm_api_token_secret" {
  type      = string
  sensitive = true
}

# nb-prod-01
variable "nb_prod_01_password" {
  type      = string
  sensitive = true
}

# nb-prod-02
variable "nb_prod_02_password" {
  type      = string
  sensitive = true
}

# Technitium-Prod-01
variable "technitium_token" {
  type = string
  sensitive = true
}