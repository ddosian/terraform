variable "gitlab_client_id" {
  type = string
}

variable "gitlab_client_secret" {
  type      = string
  sensitive = true
}

resource "authentik_provider_oauth2" "gitlab_authentik_provider" {
  name               = "Provider for Gitlab"
  client_id          = var.gitlab_client_id
  client_secret      = var.gitlab_client_secret
  authorization_flow = data.authentik_flow.explicit-authorization-flow.id
  invalidation_flow  = data.authentik_flow.default-provider-invalidation-flow.id
  sub_mode           = "user_email"
  property_mappings = [
    data.authentik_property_mapping_provider_scope.email.id,
    data.authentik_property_mapping_provider_scope.openid.id,
    data.authentik_property_mapping_provider_scope.profile.id,
  ]
  allowed_redirect_uris = [
    {
      matching_mode = "strict",
      url           = "https://gitlab.dontddos.me/users/auth/openid_connect/callback",
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

resource "authentik_application" "Gitlab_authentik_application" {
  name              = "Gitlab"
  slug              = "gitlab"
  protocol_provider = authentik_provider_oauth2.gitlab_authentik_provider.id
  meta_icon         = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/svg/gitlab.svg"
  group             = "Infrastructure"
}
