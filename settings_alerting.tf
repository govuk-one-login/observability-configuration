resource "dynatrace_alerting" "di-alerting-profile" {
  name            = "di-alerting-profile"
  management_zone = ""
  rules {
    rule {
      include_mode     = "NONE"
      delay_in_minutes = 0
      severity_level   = "AVAILABILITY"
    }
    rule {
      include_mode     = "NONE"
      delay_in_minutes = 0
      severity_level   = "CUSTOM_ALERT"
    }
    rule {
      include_mode     = "NONE"
      delay_in_minutes = 0
      severity_level   = "ERRORS"
    }
    rule {
      include_mode     = "NONE"
      delay_in_minutes = 0
      severity_level   = "MONITORING_UNAVAILABLE"
    }
    rule {
      include_mode     = "NONE"
      delay_in_minutes = 0
      severity_level   = "PERFORMANCE"
    }
    rule {
      include_mode     = "NONE"
      delay_in_minutes = 30
      severity_level   = "RESOURCE_CONTENTION"
    }
  }

  filters {
    filter {
      custom {
        title {
          operator       = "CONTAINS"
          value          = "TEAM"
          case_sensitive = true
          enabled        = true
          negate         = true
        }
      }
    }
  }

}

resource "dynatrace_alerting" "di-team-alerting" {
  name            = "T.E.A.M. Alerting"
  management_zone = ""
  rules {
    rule {
      include_mode     = "NONE"
      delay_in_minutes = 0
      severity_level   = "AVAILABILITY"
    }
    rule {
      include_mode     = "NONE"
      delay_in_minutes = 0
      severity_level   = "CUSTOM_ALERT"
    }
    rule {
      include_mode     = "NONE"
      delay_in_minutes = 0
      severity_level   = "ERRORS"
    }
    rule {
      include_mode     = "NONE"
      delay_in_minutes = 0
      severity_level   = "MONITORING_UNAVAILABLE"
    }
    rule {
      include_mode     = "NONE"
      delay_in_minutes = 0
      severity_level   = "PERFORMANCE"
    }
    rule {
      include_mode     = "NONE"
      delay_in_minutes = 30
      severity_level   = "RESOURCE_CONTENTION"
    }
  }

  filters {
    filter {
      custom {
        title {
          operator       = "CONTAINS"
          value          = "TEAM"
          case_sensitive = true
          enabled        = true
        }
      }
    }
  }
}

