resource "dynatrace_browser_monitor" "monitor" {
  name      = var.domain_name
  enabled   = true
  frequency = 15
  locations = [
    for l in data.dynatrace_synthetic_locations.locations.locations : l.entity_id
    if l.cloud_platform == "AMAZON_EC2"
  ]
  anomaly_detection {
    loading_time_thresholds {
      enabled = true
    }
    outage_handling {
      global_outage = true
      # local_outage = false
      retry_on_error = true
      global_outage_policy {
        consecutive_runs = 1
      }
    }
  }
  key_performance_metrics {
    load_action_kpm = "VISUALLY_COMPLETE"
    xhr_action_kpm  = "VISUALLY_COMPLETE"
  }
  script {
    type = "clickpath"
    configuration {
      bypass_csp = true
      # disable_web_security = false
      # monitor_frames       = false
      device {
        name        = "Desktop"
        orientation = "landscape"
      }
    }
    events {
      event {
        description = "Loading of \"https://${var.domain_name}\""
        navigate {
          url = "https://${var.domain_name}"
          dynamic "authentication" {
            for_each = toset(data.dynatrace_credentials.userpass.*.id)

            content {
              creds = authentication.value
              type  = "http_authentication"
            }
          }

          wait {
            wait_for = "page_complete"
          }
        }
      }
      event {
        description = "click on \"sign-in-button\""
        click {
          button = 0
          target {
            locators {
              locator {
                type  = "css"
                value = "#sign-in-button"
              }
            }
          }
          wait {
            wait_for = "page_complete"
          }
        }
      }
      event {
        description = "click on \"Enter your email address to sign in to your GOV.UK One Login\""
        click {
          button = 0
          target {
            locators {
              locator {
                type  = "css"
                value = "#email"
              }
            }
          }
        }
      }
      event {
        description = "keystrokes on \"Enter your email address to sign in to your GOV.UK One Login\""
        keystrokes {
          simulate_blur_event = true
          credential {
            field    = "username"
            vault_id = "CREDENTIALS_VAULT-AC396CDF85B34D5C"
          }
          target {
            locators {
              locator {
                type  = "css"
                value = "#email"
              }
            }
          }
        }
      }
      event {
        description = "click on \"Continue\""
        click {
          button = 0
          target {
            locators {
              locator {
                type  = "css"
                value = "button[type=\"submit\"]"
              }
            }
          }
          wait {
            wait_for = "page_complete"
          }
        }
      }
      event {
        description = "click on \"Enter your password\""
        click {
          button = 0
          target {
            locators {
              locator {
                type  = "css"
                value = "#password"
              }
            }
          }
        }
      }
      event {
        description = "keystrokes on \"Enter your password\""
        keystrokes {
          simulate_blur_event = true
          credential {
            field    = "password"
            vault_id = "CREDENTIALS_VAULT-AC396CDF85B34D5C"
          }
          target {
            locators {
              locator {
                type  = "css"
                value = "#password"
              }
            }
          }
        }
      }
      event {
        description = "click on \"Continue\""
        click {
          button = 0
          target {
            locators {
              locator {
                type  = "css"
                value = "button[type=\"submit\"]"
              }
            }
          }
          wait {
            wait_for = "page_complete"
          }
        }
      }
      event {
        description = "click on \"Enter the 6 digit security code shown in your authenticator app\""
        click {
          button = 0
          target {
            locators {
              locator {
                type  = "css"
                value = "#code"
              }
            }
          }
        }
      }
      event {
        description = "Generate OTP"
        javascript {
          code = templatefile("${path.module}/otp.js", { creds = data.dynatrace_credentials.otp.id })
        }
      }
      event {
        description = "click on \"Continue\""
        click {
          button = 0
          target {
            locators {
              locator {
                type  = "css"
                value = "button[type=\"submit\"]"
              }
            }
          }
          wait {
            wait_for = "page_complete"
          }
        }
      }
    }
  }
}

data "dynatrace_credentials" "otp" {
  name = "signin-otp-${var.environment}"
}

data "dynatrace_credentials" "userpass" {
  count = var.use_basic_authentication ? 1 : 0
  name  = "signin-userpass-${var.environment}"
}

data "dynatrace_credentials" "login" {
  name = "signin-${var.environment}"
}

data "dynatrace_synthetic_locations" "locations" {
  name = "London"
}
