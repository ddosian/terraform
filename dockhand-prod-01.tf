variable "dockhand_client_id" {
  type = string
}

variable "dockhand_client_secret" {
  type      = string
  sensitive = true
}

resource "authentik_provider_oauth2" "dockhand-prod-01_authentik_provider" {
  name               = "Provider for Dockhand-Prod-01"
  client_id          = var.dockhand_client_id
  client_secret      = var.dockhand_client_secret
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
      url               = "https://dockhand-prod-01.k3s-cl-prod-02.internal.dontddos.me/api/auth/oidc/callback",
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
}

resource "authentik_application" "dockhand-prod-01_authentik_application" {
  name              = "Dockhand-Prod-01"
  slug              = "dockhand"
  protocol_provider = authentik_provider_oauth2.dockhand-prod-01_authentik_provider.id
  meta_icon         = "https://cdn.jsdelivr.net/gh/selfhst/icons/png/dockhand.png"
  group             = "Infrastructure"
}

resource "authentik_policy_binding" "dockhand-prod-01_lab-admins_authentik_policy_binding" {
  target = authentik_application.dockhand-prod-01_authentik_application.uuid
  group  = data.authentik_group.lab_admins.id
  order  = 0
}