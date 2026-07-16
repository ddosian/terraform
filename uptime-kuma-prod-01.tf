resource "uptimekuma_monitor_group" "infrastructure_monitor_group" {
  name    = "Infrastructure"
  active  = true
}

resource "uptimekuma_monitor_group" "kubernetes_monitor_group" {
  name   = "Kubernetes"
  parent = uptimekuma_monitor_group.infrastructure_monitor_group.id
  active = true
}

resource "uptimekuma_monitor_group" "k3s-cl-prod-01_monitor_group" {
  name   = "K3s-Cl-Prod-01"
  parent = uptimekuma_monitor_group.kubernetes_monitor_group.id
  active = true
}

resource "uptimekuma_monitor_group" "k3s-cl-prod-02_monitor_group" {
  name   = "K3s-Cl-Prod-02"
  parent = uptimekuma_monitor_group.kubernetes_monitor_group.id
  active = true
}

resource "uptimekuma_monitor_group" "proxmox-ve_monitor_group" {
  name   = "Proxmox VE"
  parent = uptimekuma_monitor_group.infrastructure_monitor_group.id
  active = true
}

resource "uptimekuma_monitor_group" "networking_monitor_group" {
  name   = "Networking"
  active = true
}

resource "uptimekuma_monitor_group" "routing_monitor_group" {
  name   = "Routing"
  parent = uptimekuma_monitor_group.networking_monitor_group.id
  active = true
}

resource "uptimekuma_monitor_group" "dns_monitor_group" {
  name   = "DNS"
  parent = uptimekuma_monitor_group.networking_monitor_group.id
  active = true
}