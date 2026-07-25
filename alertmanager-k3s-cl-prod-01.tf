resource "authentik_provider_proxy" "alertmanager-k3s-cl-prod-01_authentik_provider" {
  name               = "Provider for Alertmanager (K3s-Cl-Prod-01)"
  external_host      = "https://alertmanager.k3s-cl-prod-01.internal.dontddos.me"
  mode               = "forward_single"
  authorization_flow = data.authentik_flow.explicit-authorization-flow.id
  invalidation_flow  = data.authentik_flow.default-provider-invalidation-flow.id
}

resource "authentik_application" "alertmanager-k3s-cl-prod-01_authentik_application" {
  name              = "Alertmanager (K3s-Cl-Prod-01)"
  slug              = "alertmanager-k3s-cl-prod-01"
  protocol_provider = authentik_provider_proxy.alertmanager-k3s-cl-prod-01_authentik_provider.id
  meta_icon         = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/svg/alertmanager.svg"
  group             = "Monitoring"
}

resource "authentik_policy_binding" "alertmanager-k3s-cl-prod-01_lab-admins_authentik_policy_binding" {
  target = authentik_application.alertmanager-k3s-cl-prod-01_authentik_application.uuid
  group  = data.authentik_group.lab_admins.id
  order  = 0
}

resource "authentik_policy_binding" "alertmanager-k3s-cl-prod-01_monitoring_authentik_policy_binding" {
  target = authentik_application.alertmanager-k3s-cl-prod-01_authentik_application.uuid
  group  = data.authentik_group.monitoring.id
  order  = 0
}