resource "authentik_provider_proxy" "traefik-media-prod-01_authentik_provider" {
  name               = "Provider for Traefik (media-prod-01)"
  external_host      = "https://traefik.media-prod-01.internal.dontddos.me"
  mode               = "forward_single"
  authorization_flow = data.authentik_flow.explicit-authorization-flow.id
  invalidation_flow  = data.authentik_flow.default-provider-invalidation-flow.id
}

resource "authentik_application" "traefik-media-prod-01_authentik_application" {
  name              = "Traefik (Media-Prod-01)"
  slug              = "traefik-media-prod-01"
  protocol_provider = authentik_provider_proxy.traefik-media-prod-01_authentik_provider.id
  meta_icon         = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/svg/traefik.svg"
  group             = "Networking"
}

resource "authentik_policy_binding" "traefik-media-prod-01_lab-admins_authentik_policy_binding" {
  target = authentik_application.traefik-media-prod-01_authentik_application.uuid
  group  = data.authentik_group.lab_admins.id
  order  = 0
}