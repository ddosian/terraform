resource "uptimekuma_monitor_group" "kubernetes_monitor_group" {
  name   = "Kubernetes"
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