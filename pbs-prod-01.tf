resource "adguard_rewrite" "pbs-prod-01_record" {
  domain = "pbs-prod-01.internal.dontddos.me"
  answer = "10.77.1.109"
}

# Uptime Kuma Monitor
resource "uptimekuma_monitor_ping" "pbs-prod-01_uptimekuma_monitor" {
  name           = "PBS-Prod-01"
  hostname       = "pbs-prod-01.internal.dontddos.me"
  interval       = 60
  timeout        = 30
  max_retries    = 2
  retry_interval = 60
  upside_down    = false
  active         = true
  packet_size    = 56
}

resource "authentik_provider_oauth2" "pbs-prod-01_authentik_provider" {
  name               = "Provider for PBS-Prod-01"
  client_id          = "pbsprod01"
  authorization_flow = data.authentik_flow.explicit-authorization-flow.id
  invalidation_flow  = data.authentik_flow.default-provider-invalidation-flow.id
  sub_mode           = "user_email"
  signing_key = data.authentik_certificate_key_pair.authentik_self_signed_cert.id
  property_mappings = [
    data.authentik_property_mapping_provider_scope.email.id,
    data.authentik_property_mapping_provider_scope.openid.id,
    data.authentik_property_mapping_provider_scope.profile.id,
  ]
  allowed_redirect_uris = [
    {
      matching_mode     = "strict",
      redirect_uri_type = "authorization",
      url               = "https://pbs-prod-01.internal.dontddos.me:8007",
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

resource "authentik_application" "pbs-prod-01_authentik_application" {
  name              = "PBS-Prod-01"
  slug              = "pbs-prod-01"
  protocol_provider = authentik_provider_oauth2.pbs-prod-01_authentik_provider.id
  meta_icon         = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/svg/proxmox-light.svg"
  group             = "Infrastructure"
}

resource "authentik_policy_binding" "pbs-prod-01_lab-admins_authentik_policy_binding" {
  target = authentik_application.pbs-prod-01_authentik_application.uuid
  group  = data.authentik_group.lab_admins.id
  order  = 0
}