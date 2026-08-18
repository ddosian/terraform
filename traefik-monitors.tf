resource "uptimekuma_monitor_http" "traefik-calagopus-prod-01" {
  name                  = "Traefik (Calagopus-Prod-01)"
  url                   = "https://traefik.calagopus-prod-01.internal.dontddos.me"
  interval              = 60
  timeout               = 30
  max_retries           = 2
  retry_interval        = 60
  active                = true
  accepted_status_codes = ["200-299"]
  notification_ids = [
    1,
    2,
  ]
  parent = uptimekuma_monitor_group.traefik_monitor_group.id
}

resource "uptimekuma_monitor_http" "traefik-dns-prod-01" {
  name                  = "Traefik (DNS-Prod-01)"
  url                   = "https://traefik.dns-prod-01.internal.dontddos.me"
  interval              = 60
  timeout               = 30
  max_retries           = 2
  retry_interval        = 60
  active                = true
  accepted_status_codes = ["200-299"]
  notification_ids = [
    1,
    2,
  ]
  parent = uptimekuma_monitor_group.traefik_monitor_group.id
}

resource "uptimekuma_monitor_http" "traefik-dns-prod-02" {
  name                  = "Traefik (DNS-Prod-02)"
  url                   = "https://traefik.dns-prod-02.internal.dontddos.me"
  interval              = 60
  timeout               = 30
  max_retries           = 2
  retry_interval        = 60
  active                = true
  accepted_status_codes = ["200-299"]
  notification_ids = [
    1,
    2,
  ]
  parent = uptimekuma_monitor_group.traefik_monitor_group.id
}

resource "uptimekuma_monitor_http" "traefik-gl-prod-01" {
  name                  = "Traefik (GL-Prod-01)"
  url                   = "https://traefik.gl-prod-01.internal.dontddos.me"
  interval              = 60
  timeout               = 30
  max_retries           = 2
  retry_interval        = 60
  active                = true
  accepted_status_codes = ["200-299"]
  notification_ids = [
    1,
    2,
  ]
  parent = uptimekuma_monitor_group.traefik_monitor_group.id
}

resource "uptimekuma_monitor_http" "traefik-gl-runner-prod-01" {
  name                  = "Traefik (GL-Runner-Prod-01)"
  url                   = "https://traefik.gl-runner-prod-01.internal.dontddos.me"
  interval              = 60
  timeout               = 30
  max_retries           = 2
  retry_interval        = 60
  active                = true
  accepted_status_codes = ["200-299"]
  notification_ids = [
    1,
    2,
  ]
  parent = uptimekuma_monitor_group.traefik_monitor_group.id
}

resource "uptimekuma_monitor_http" "traefik-immich-prod-01" {
  name                  = "Traefik (Immich-Prod-01)"
  url                   = "https://traefik.immich-prod-01.internal.dontddos.me"
  interval              = 60
  timeout               = 30
  max_retries           = 2
  retry_interval        = 60
  active                = true
  accepted_status_codes = ["200-299"]
  notification_ids = [
    1,
    2,
  ]
  parent = uptimekuma_monitor_group.traefik_monitor_group.id
}

resource "uptimekuma_monitor_http" "traefik-infisical-prod-01" {
  name                  = "Traefik (Infisical-Prod-01)"
  url                   = "https://traefik.infisical-prod-01.internal.dontddos.me"
  interval              = 60
  timeout               = 30
  max_retries           = 2
  retry_interval        = 60
  active                = true
  accepted_status_codes = ["200-299"]
  notification_ids = [
    1,
    2,
  ]
  parent = uptimekuma_monitor_group.traefik_monitor_group.id
}

resource "uptimekuma_monitor_http" "traefik-media-prod-01" {
  name                  = "Traefik (Media-Prod-01)"
  url                   = "https://traefik.media-prod-01.internal.dontddos.me"
  interval              = 60
  timeout               = 30
  max_retries           = 2
  retry_interval        = 60
  active                = true
  accepted_status_codes = ["200-299"]
  notification_ids = [
    1,
    2,
  ]
  parent = uptimekuma_monitor_group.traefik_monitor_group.id
}

resource "uptimekuma_monitor_http" "traefik-media-prod-02" {
  name                  = "Traefik (Media-Prod-02)"
  url                   = "https://traefik.media-prod-02.internal.dontddos.me"
  interval              = 60
  timeout               = 30
  max_retries           = 2
  retry_interval        = 60
  active                = true
  accepted_status_codes = ["200-299"]
  notification_ids = [
    1,
    2,
  ]
  parent = uptimekuma_monitor_group.traefik_monitor_group.id
}

resource "uptimekuma_monitor_http" "traefik-mon-prod-01" {
  name                  = "Traefik (Mon-Prod-01)"
  url                   = "https://traefik.mon-prod-01.internal.dontddos.me"
  interval              = 60
  timeout               = 30
  max_retries           = 2
  retry_interval        = 60
  active                = true
  accepted_status_codes = ["200-299"]
  notification_ids = [
    1,
    2,
  ]
  parent = uptimekuma_monitor_group.traefik_monitor_group.id
}

resource "uptimekuma_monitor_http" "traefik-nb-prod-01" {
  name                  = "Traefik (NB-Prod-01)"
  url                   = "https://traefik.nb-prod-01.internal.dontddos.me"
  interval              = 60
  timeout               = 30
  max_retries           = 2
  retry_interval        = 60
  active                = true
  accepted_status_codes = ["200-299"]
  notification_ids = [
    1,
    2,
  ]
  parent = uptimekuma_monitor_group.traefik_monitor_group.id
}

resource "uptimekuma_monitor_http" "traefik-nb-prod-02" {
  name                  = "Traefik (NB-Prod-02)"
  url                   = "https://traefik.nb-prod-02.internal.dontddos.me"
  interval              = 60
  timeout               = 30
  max_retries           = 2
  retry_interval        = 60
  active                = true
  accepted_status_codes = ["200-299"]
  notification_ids = [
    1,
    2,
  ]
  parent = uptimekuma_monitor_group.traefik_monitor_group.id
}

resource "uptimekuma_monitor_http" "traefik-pve-prod-01" {
  name                  = "Traefik (PVE-Prod-01)"
  url                   = "https://traefik.pve-prod-01.internal.dontddos.me"
  interval              = 60
  timeout               = 30
  max_retries           = 2
  retry_interval        = 60
  active                = true
  accepted_status_codes = ["200-299"]
  notification_ids = [
    1,
    2,
  ]
  parent = uptimekuma_monitor_group.traefik_monitor_group.id
}

resource "uptimekuma_monitor_http" "traefik-pve-prod-02" {
  name                  = "Traefik (PVE-Prod-02)"
  url                   = "https://traefik.pve-prod-02.internal.dontddos.me"
  interval              = 60
  timeout               = 30
  max_retries           = 2
  retry_interval        = 60
  active                = true
  accepted_status_codes = ["200-299"]
  notification_ids = [
    1,
    2,
  ]
  parent = uptimekuma_monitor_group.traefik_monitor_group.id
}

resource "uptimekuma_monitor_http" "traefik-pve-prod-03" {
  name                  = "Traefik (PVE-Prod-03)"
  url                   = "https://traefik.pve-prod-03.internal.dontddos.me"
  interval              = 60
  timeout               = 30
  max_retries           = 2
  retry_interval        = 60
  active                = true
  accepted_status_codes = ["200-299"]
  notification_ids = [
    1,
    2,
  ]
  parent = uptimekuma_monitor_group.traefik_monitor_group.id
}

resource "uptimekuma_monitor_http" "traefik-ts-prod-01" {
  name                  = "Traefik (TS-Prod-01)"
  url                   = "https://traefik.ts-prod-01.internal.dontddos.me"
  interval              = 60
  timeout               = 30
  max_retries           = 2
  retry_interval        = 60
  active                = true
  accepted_status_codes = ["200-299"]
  notification_ids = [
    1,
    2,
  ]
  parent = uptimekuma_monitor_group.traefik_monitor_group.id
}

resource "uptimekuma_monitor_http" "traefik-ts-prod-02" {
  name                  = "Traefik (TS-Prod-02)"
  url                   = "https://traefik.ts-prod-02.internal.dontddos.me"
  interval              = 60
  timeout               = 30
  max_retries           = 2
  retry_interval        = 60
  active                = true
  accepted_status_codes = ["200-299"]
  notification_ids = [
    1,
    2,
  ]
  parent = uptimekuma_monitor_group.traefik_monitor_group.id
}

resource "uptimekuma_monitor_http" "traefik-wings-prod-01" {
  name                  = "Traefik (Wings-Prod-01)"
  url                   = "https://traefik.wings-prod-01.internal.dontddos.me"
  interval              = 60
  timeout               = 30
  max_retries           = 2
  retry_interval        = 60
  active                = true
  accepted_status_codes = ["200-299"]
  notification_ids = [
    1,
    2,
  ]
  parent = uptimekuma_monitor_group.traefik_monitor_group.id
}

resource "uptimekuma_monitor_http" "traefik-nc-prod-01" {
  name                  = "Traefik (NC-Prod-01)"
  url                   = "https://traefik.nc-prod-01.internal.dontddos.me"
  interval              = 60
  timeout               = 30
  max_retries           = 2
  retry_interval        = 60
  active                = true
  accepted_status_codes = ["200-299"]
  notification_ids = [
    1,
    2,
  ]
  parent = uptimekuma_monitor_group.traefik_monitor_group.id
}
