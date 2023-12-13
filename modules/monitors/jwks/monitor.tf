resource "dynatrace_http_monitor" "monitor" {
  name      = "${var.domain_name}/.well-known/jwks.json"
  frequency = 15
  locations = [
    for l in data.dynatrace_synthetic_locations.locations.locations : l.entity_id
    if l.cloud_platform == "AMAZON_EC2"
  ]
  enabled = true

  anomaly_detection {
    loading_time_thresholds {
      enabled = true
    }

    outage_handling {
      global_outage  = true
      local_outage   = false
      retry_on_error = false

      global_outage_policy {
        consecutive_runs = 1
      }
    }
  }

  script {
    request {
      description     = "Check https://${var.domain_name}/.well-known/jwks.json for validity."
      method          = "GET"
      url             = "https://${var.domain_name}/.well-known/jwks.json"
      post_processing = file("${path.module}/post-processing.js")

      configuration {
        accept_any_certificate = false
        follow_redirects       = true
        sensitive_data         = false
      }
    }
  }
}

data "dynatrace_synthetic_locations" "locations" {
  name = "London"
}
