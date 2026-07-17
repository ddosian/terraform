resource "authentik_provider_proxy" "traefik-pve-prod-03_authentik_provider" {
  name               = "Provider for Traefik (pve-prod-03)"
  external_host      = "https://traefik.pve-prod-03.internal.dontddos.me"
  mode               = "forward_single"
  authorization_flow = data.authentik_flow.explicit-authorization-flow.id
  invalidation_flow  = data.authentik_flow.default-provider-invalidation-flow.id
}

resource "authentik_application" "traefik-pve-prod-03_authentik_application" {
  name              = "Traefik (pve-prod-03)"
  slug              = "traefik-pve-prod-03"
  protocol_provider = authentik_provider_proxy.traefik-pve-prod-03_authentik_provider.id
  meta_icon         = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/svg/traefik.svg"
  group             = "Networking"
}

resource "authentik_policy_binding" "traefik-pve-prod-03_lab-admins_authentik_policy_binding" {
  target = authentik_application.traefik-pve-prod-03_authentik_application.uuid
  group  = data.authentik_group.lab_admins.id
  order  = 0
}