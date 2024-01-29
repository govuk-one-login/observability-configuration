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
      delay_in_minutes = 0
      severity_level   = "RESOURCE_CONTENTION"
    }
  }
}