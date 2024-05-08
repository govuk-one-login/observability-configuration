resource "dynatrace_browser_monitor" "monitor" {
  name      = "${var.domain_name} - Check webchat loads"
  enabled   = var.enabled
  frequency = var.frequency
  locations = [
    for l in data.dynatrace_synthetic_locations.locations.locations : l.entity_id
    if l.cloud_platform == "AMAZON_EC2"
  ]
  anomaly_detection {
    loading_time_thresholds {
      enabled = true
    }
    outage_handling {
      global_outage  = true
      retry_on_error = false
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
      device {
        name        = "Desktop"
        orientation = "landscape"
      }
    }
    events {
      event {
        description = "Loading English contact page"
        navigate {
          url = "https://${var.domain_name}/contact-gov-uk-one-login?lng=en"
          wait {
            wait_for = "validation"
            timeout  = 10000
            validation {
              type          = "element_match"
              fail_if_found = false
              target {
                locators {
                  locator {
                    type  = "css"
                    value = "button.sa-chat-tab"
                  }

                }
              }
            }
          }
        }
      }
      event {
        description = "Loading Welsh contact page"
        navigate {
          url = "https://${var.domain_name}/contact-gov-uk-one-login?lng=cy"
          wait {
            wait_for = "validation"
            timeout  = 10000
            validation {
              type          = "element_match"
              fail_if_found = false
              target {
                locators {
                  locator {
                    type  = "css"
                    value = "button.sa-chat-tab"
                  }

                }
              }
            }
          }
        }
      }
    }
  }
}

data "dynatrace_synthetic_locations" "locations" {
  name = "London"
}
