resource "authentik_provider_proxy" "traefik-nb-prod-02_authentik_provider" {
  name               = "Provider for Traefik (nb-prod-02)"
  external_host      = "https://traefik.nb-prod-02.internal.dontddos.me"
  mode               = "forward_single"
  authorization_flow = data.authentik_flow.explicit-authorization-flow.id
  invalidation_flow  = data.authentik_flow.default-provider-invalidation-flow.id
}

resource "authentik_application" "traefik-nb-prod-02_authentik_application" {
  name              = "Traefik (NB-Prod-02)"
  slug              = "traefik-nb-prod-02"
  protocol_provider = authentik_provider_proxy.traefik-nb-prod-02_authentik_provider.id
  meta_icon         = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/svg/traefik.svg"
  group             = "Networking"
}

resource "authentik_policy_binding" "traefik-nb-prod-02_lab-admins_authentik_policy_binding" {
  target = authentik_application.traefik-nb-prod-02_authentik_application.uuid
  group  = data.authentik_group.lab_admins.id
  order  = 0
}