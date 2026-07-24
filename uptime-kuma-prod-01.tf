resource "uptimekuma_monitor_group" "infrastructure_monitor_group" {
  name   = "Infrastructure"
  active = true
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

resource "uptimekuma_monitor_group" "traefik_monitor_group" {
  name   = "Traefik"
  parent = uptimekuma_monitor_group.networking_monitor_group.id
  active = true
}

resource "uptimekuma_monitor_group" "storage_monitor_group" {
  name   = "Storage"
  parent = uptimekuma_monitor_group.infrastructure_monitor_group.id
  active = true
}

resource "uptimekuma_monitor_group" "edge_monitor_group" {
  name   = "Edge"
  parent = uptimekuma_monitor_group.infrastructure_monitor_group.id
  active = true
}

resource "uptimekuma_monitor_group" "vms_monitor_group" {
  name   = "VMs"
  parent = uptimekuma_monitor_group.infrastructure_monitor_group.id
  active = true
}

resource "uptimekuma_monitor_group" "services" {
  name   = "Services"
  active = true
}

resource "uptimekuma_monitor_group" "media" {
  name   = "Media"
  parent = uptimekuma_monitor_group.services.id
  active = true
}

resource "uptimekuma_monitor_group" "git" {
  name   = "Git"
  parent = uptimekuma_monitor_group.services.id
  active = true
}

resource "uptimekuma_monitor_group" "monitoring" {
  name   = "Monitoring"
  parent = uptimekuma_monitor_group.services.id
  active = true
}

resource "uptimekuma_status_page" "public" {
  title     = "DontDDoS Status Page"
  slug      = "public"
  published = true

  theme           = "dark"
  show_powered_by = false

  domain_name_list = [
    "status.dontddos.me"
  ]

  public_group_list = [
    {
      name = "K3s-Cl-Prod-01"
      monitor_list = [
        { id = uptimekuma_monitor_ping.k3s-prod-01_uptimekuma_monitor.id },
        { id = uptimekuma_monitor_ping.k3s-prod-02_uptimekuma_monitor.id },
        { id = uptimekuma_monitor_ping.k3s-prod-03_uptimekuma_monitor.id },
        { id = uptimekuma_monitor_ping.k3s-prod-04_uptimekuma_monitor.id },
      ]
    },
    {
      name = "K3s-Cl-Prod-02"
      monitor_list = [
        { id = uptimekuma_monitor_ping.k3s-prod-05_uptimekuma_monitor.id },
        { id = uptimekuma_monitor_ping.k3s-prod-06_uptimekuma_monitor.id },
        { id = uptimekuma_monitor_ping.k3s-prod-07_uptimekuma_monitor.id },
      ]
    },
    {
      name = "Proxmox VE"
      monitor_list = [
        { id = uptimekuma_monitor_ping.pve-prod-01_uptimekuma_monitor.id },
        { id = uptimekuma_monitor_ping.pve-prod-02_uptimekuma_monitor.id },
        { id = uptimekuma_monitor_ping.pve-prod-03_uptimekuma_monitor.id },
      ]
    },
    {
      name = "DNS"
      monitor_list = [
        { id = uptimekuma_monitor_ping.dns-prod-01_uptimekuma_monitor.id },
        { id = uptimekuma_monitor_ping.dns-prod-02_uptimekuma_monitor.id },
      ]
    },
    {
      name = "Routing"
      monitor_list = [
        { id = uptimekuma_monitor_ping.fw-prod-01_uptimekuma_monitor.id },
        { id = uptimekuma_monitor_ping.fw-prod-02_uptimekuma_monitor.id },
        { id = uptimekuma_monitor_ping.nb-prod-01_uptimekuma_monitor.id },
        { id = uptimekuma_monitor_ping.nb-prod-02_uptimekuma_monitor.id },
        { id = uptimekuma_monitor_ping.ts-prod-01_uptimekuma_monitor.id },
        { id = uptimekuma_monitor_ping.ts-prod-02_uptimekuma_monitor.id },
      ]
    },
    {
      name = "Traefik"
      monitor_list = [
        { id = uptimekuma_monitor_http.traefik-calagopus-prod-01.id },
        { id = uptimekuma_monitor_http.traefik-dns-prod-01.id },
        { id = uptimekuma_monitor_http.traefik-dns-prod-02.id },
        { id = uptimekuma_monitor_http.traefik-gl-prod-01.id },
        { id = uptimekuma_monitor_http.traefik-gl-runner-prod-01.id },
        { id = uptimekuma_monitor_http.traefik-immich-prod-01.id },
        { id = uptimekuma_monitor_http.traefik-infisical-prod-01.id },
        { id = uptimekuma_monitor_http.traefik-media-prod-01.id },
        { id = uptimekuma_monitor_http.traefik-media-prod-02.id },
        { id = uptimekuma_monitor_http.traefik-mon-prod-01.id },
        { id = uptimekuma_monitor_http.traefik-nb-prod-01.id },
        { id = uptimekuma_monitor_http.traefik-nb-prod-02.id },
        { id = uptimekuma_monitor_http.traefik-pve-prod-01.id },
        { id = uptimekuma_monitor_http.traefik-pve-prod-02.id },
        { id = uptimekuma_monitor_http.traefik-pve-prod-03.id },
        { id = uptimekuma_monitor_http.traefik-ts-prod-01.id },
        { id = uptimekuma_monitor_http.traefik-ts-prod-02.id },
        { id = uptimekuma_monitor_http.traefik-wings-prod-01.id },
      ]
    },
    {
      name = "Storage"
      monitor_list = [
        { id = uptimekuma_monitor_ping.nas-prod-01_uptimekuma_monitor.id },
        { id = uptimekuma_monitor_ping.pbs-prod-01_uptimekuma_monitor.id },
      ]
    },
    {
      name = "Edge"
      monitor_list = [
        { id = uptimekuma_monitor_ping.vps-prod-01_uptimekuma_monitor.id },
        { id = uptimekuma_monitor_ping.vps-prod-02_uptimekuma_monitor.id },
      ]
    },
    {
      name = "VMs"
      monitor_list = [
        { id = uptimekuma_monitor_ping.gl-prod-01_uptimekuma_monitor.id },
        { id = uptimekuma_monitor_ping.gl-runner-prod-01_uptimekuma_monitor.id },
        { id = uptimekuma_monitor_ping.immich-prod-01_uptimekuma_monitor.id },
        { id = uptimekuma_monitor_ping.infisical-prod-01_uptimekuma_monitor.id },
        { id = uptimekuma_monitor_ping.media-prod-01_uptimekuma_monitor.id },
        { id = uptimekuma_monitor_ping.media-prod-02_uptimekuma_monitor.id },
        { id = uptimekuma_monitor_ping.mon-prod-01_uptimekuma_monitor.id },
        { id = uptimekuma_monitor_ping.wings-prod-01_uptimekuma_monitor.id },
      ]
    },
    {
      name = "Media"
      monitor_list = [
        { id = uptimekuma_monitor_http.jellyfin-prod-01.id },
        { id = uptimekuma_monitor_http.prowlarr-prod-01.id },
        { id = uptimekuma_monitor_http.qbittorrent-prod-01.id },
        { id = uptimekuma_monitor_http.radarr-prod-01.id },
        { id = uptimekuma_monitor_http.seerr-prod-01.id },
        { id = uptimekuma_monitor_http.sonarr-prod-01.id },
      ]
    },
    {
      name = "Git"
      monitor_list = [
        { id = uptimekuma_monitor_http.github.id },
        { id = uptimekuma_monitor_http.gitlab-prod-01.id },
        { id = uptimekuma_monitor_http.kolidae-gitea.id },
      ]
    },
    {
      name = "Monitoring"
      monitor_list = [
        { id = uptimekuma_monitor_http.grafana-prod-01.id },
        { id = uptimekuma_monitor_http.prometheus-prod-01.id },
      ]
    },
  ]
}
