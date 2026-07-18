resource "authentik_group" "argocd_admins" {
  name         = "ArgoCD Admins"
  users        = [data.authentik_user.dontddos.id]
}

resource "authentik_group" "argocd_viewers" {
  name         = "ArgoCD Viewers"
}

resource "authentik_provider_oauth2" "k3s-cl-prod-02_argocd_authentik_provider" {
  name               = "Provider for ArgoCD (K3s-Cl-Prod-02)"
  client_id          = "k3sclprod02argocd"
  authorization_flow = data.authentik_flow.explicit-authorization-flow.id
  invalidation_flow  = data.authentik_flow.default-provider-invalidation-flow.id
  property_mappings = [
    data.authentik_property_mapping_provider_scope.email.id,
    data.authentik_property_mapping_provider_scope.openid.id,
    data.authentik_property_mapping_provider_scope.profile.id,
  ]
  allowed_redirect_uris = [
    {
      matching_mode     = "strict",
      redirect_uri_type = "authorization",
      url               = "https://argocd.k3s-cl-prod-02.internal.dontddos.me/api/dex/callback",
    },
    {
      matching_mode     = "strict",
      redirect_uri_type = "authorization",
      url               = "https://localhost:8085/auth/callback",
    }
  ]
  grant_types = [
    "authorization_code",
    "implicit",
    "hybrid",
    "refresh_token",
    "client_credentials",
    "password",
    "urn:ietf:params:oauth:grant-type:device_code",
  ]
  signing_key = data.authentik_certificate_key_pair.authentik_self_signed_cert.id
}

resource "authentik_application" "k3s-cl-prod-02_argocd_authentik_application" {
  name              = "ArgoCD (K3s-Cl-Prod-02)"
  slug              = "argocd"
  protocol_provider = authentik_provider_oauth2.k3s-cl-prod-02_argocd_authentik_provider.id
  meta_icon         = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/svg/argo-cd.svg"
  group             = "Infrastructure"
}

resource "authentik_policy_binding" "k3s-cl-prod-02_argocd_argocd_admins_authentik_policy_binding" {
  target = authentik_application.k3s-cl-prod-02_argocd_authentik_application.uuid
  group  = authentik_group.argocd_admins.id
  order  = 0
}

resource "authentik_policy_binding" "k3s-cl-prod-02_argocd_argocd_viewers_authentik_policy_binding" {
  target = authentik_application.k3s-cl-prod-02_argocd_authentik_application.uuid
  group  = authentik_group.argocd_viewers.id
  order  = 0
}