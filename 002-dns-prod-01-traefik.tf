resource "authentik_provider_proxy" "traefik-dns-prod-01_authentik_provider" {
  name               = "Provider for Traefik (dns-prod-01)"
  external_host      = "https://traefik.dns-prod-01.internal.dontddos.me"
  mode               = "forward_single"
  authorization_flow = data.authentik_flow.explicit-authorization-flow.id
  invalidation_flow  = data.authentik_flow.default-provider-invalidation-flow.id
}

resource "authentik_application" "traefik-dns-prod-01_authentik_application" {
  name              = "Traefik (DNS-Prod-01)"
  slug              = "traefik-dns-prod-01"
  protocol_provider = authentik_provider_proxy.traefik-dns-prod-01_authentik_provider.id
  meta_icon         = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/svg/traefik.svg"
  group             = "Networking"
}

resource "authentik_policy_binding" "traefik-dns-prod-01_lab-admins_authentik_policy_binding" {
  target = authentik_application.traefik-dns-prod-01_authentik_application.uuid
  group  = data.authentik_group.lab_admins.id
  order  = 0
}