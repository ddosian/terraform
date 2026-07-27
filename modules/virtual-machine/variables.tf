variable "name" {
  description = "The name of the virtual machine."
  type        = string
}

variable "id" {
  description = "The ID of the virtual machine."
  type        = number
}

variable "host" {
  description = "The host node for the virtual machine."
  type        = string
  default     = "pve-prod-01"
}

variable "domain" {
  description = "The domain name for the AdGuard DNS record."
  type        = string
  default     = "internal.dontddos.me"
}

variable "template" {
  description = "The template to clone for the virtual machine."
  type        = string
  default     = "debian-13"
}

variable "memory" {
  description = "The amount of memory (in MB) for the virtual machine."
  type        = number
  default     = 4096
}

variable "cpu_cores" {
  description = "The number of CPU cores for the virtual machine."
  type        = number
  default     = 4
}

variable "network_bridge" {
  description = "The network bridge for the virtual machine."
  type        = string
  default     = "vmbr1"
}

variable "vlan_tag" {
  description = "The VLAN tag for the virtual machine's network interface."
  type        = number
  default     = 1
}

variable "disk_size" {
  description = "The size of the disk for the virtual machine."
  type        = string
  default     = "32G"
}

variable "disk_storage" {
  description = "The storage location for the virtual machine's disk."
  type        = string
  default     = "pve-prod-01-data-01"
}

variable "ip_address" {
  description = "The IP address for the virtual machine."
  type        = string
}

variable "gateway" {
  description = "The gateway for the virtual machine's network."
  type        = string
  default     = "10.77.0.3"
}

variable "nameserver" {
  description = "The nameserver for the virtual machine."
  type        = string
  default     = "10.77.1.103"
}

variable "monitor_group" {
  description = "The Uptime Kuma monitor group ID to parent this VM monitor under."
  type        = number
}