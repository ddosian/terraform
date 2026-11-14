variable "name" {
  description = "The name of the LXC container."
  type        = string
}

variable "host" {
  description = "The host node for the LXC container."
  type        = string
  default     = "pve-prod-01"
}

variable "domain" {
  description = "The domain name for the Technitium DNS record."
  type        = string
  default     = "home.internal.dontddos.me"
}

variable "password" {
  description = "The root password for the LXC container."
  type        = string
  sensitive   = true
}

variable "template" {
  description = "The template file to create the LXC container from."
  type        = string
  default     = "debian-12-standard_12.12-1_amd64.tar.zst"
}

variable "template_storage" {
  description = "The storage location of the template file."
  type        = string
  default     = "local"
}

variable "memory" {
  description = "The amount of memory (in MB) for the LXC container."
  type        = number
  default     = 1024
}

variable "swap" {
  description = "The amount of swap (in MB) for the LXC container."
  type        = number
  default     = 512
}

variable "cpu_cores" {
  description = "The number of CPU cores for the LXC container."
  type        = number
  default     = 1
}

variable "nesting" {
  description = "Whether to enable nesting for the LXC container."
  type        = bool
  default     = true
}

variable "network_bridge" {
  description = "The network bridge for the LXC container."
  type        = string
  default     = "vmbr1"
}

variable "vlan_tag" {
  description = "The VLAN tag for the LXC container's network interface."
  type        = number
  default     = 40
}

variable "disk_size" {
  description = "The size of the root disk for the LXC container."
  type        = string
  default     = "4G"
}

variable "disk_storage" {
  description = "The storage location for the LXC container's root disk."
  type        = string
  default     = "local-lvm"
}

variable "ip_address" {
  description = "The IP address for the LXC container."
  type        = string
}

variable "gateway" {
  description = "The gateway for the LXC container's network."
  type        = string
  default     = "10.77.40.1"
}

variable "tags" {
  type = list(string)
}
