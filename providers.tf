terraform {
  required_providers {
    adguard = {
      source  = "gmichels/adguard"
      version = "1.7.0"
    }
  }
}

variable "adguard_password" {
  description = "The password for the AdGuard Home instance"
  type        = string
  sensitive   = true
}

provider "adguard" {
  host     = "https://adguard-home-prod-01.dns-prod-01.internal.dontddos.me"
  username = "ddos"
  password = "SecretP@ssw0rd"
  scheme   = "http" # defaults to https
  timeout  = 5      # in seconds, defaults to 10
  insecure = false  # when `true` will skip TLS validation
}