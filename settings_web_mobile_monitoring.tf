# Not in use - Source maps and symbol files

# User experience score 
resource "dynatrace_user_experience_score" "user_experience_score" {
  consider_last_action                  = true
  consider_rage_click                   = true
  max_frustrated_user_actions_threshold = 30
  min_satisfied_user_actions_threshold  = 50
}

# Usability analytics
resource "dynatrace_usability_analytics" "usability_analytics" {
  detect_rage_clicks = true
}

# Not in use - User session custom metrics 
# Not in use - User action custom metrics 
# Not in use - Map IP addresses to locations 

# IP determination
resource "dynatrace_rum_ip_determination" "rproxy_remote_address" {
  header_name = "rproxy_remote_address"
}

resource "dynatrace_rum_ip_determination" "true_client_ip" {
  header_name = "True-Client-IP"
}

resource "dynatrace_rum_ip_determination" "x_client_ip" {
  header_name = "X-Client-Ip"
}

resource "dynatrace_rum_ip_determination" "x_cluster_client_ip" {
  header_name = "X-Cluster-Client-Ip"
}

resource "dynatrace_rum_ip_determination" "x_forwarded_for" {
  header_name = "X-Forwarded-For"
}

resource "dynatrace_rum_ip_determination" "forwarded" {
  count       = local.is_production ? 1 : 0
  header_name = "Forwarded"
}

resource "dynatrace_rum_ip_determination" "x_http_client_ip" {
  header_name = "X-Http-Client-Ip"
}

resource "dynatrace_rum_ip_determination" "cf_connecting_ip" {
  header_name = "CF-Connecting-IP"
}

# Not in use - Provider breakdown
# Not in use - Resource URL cleanup rules
# Not in use - Resource types 

# Resource capture for Session Replay 
resource "dynatrace_session_replay_resource_capture" "replay_resource_capture" {
  application_id            = "environment"
  enable_resource_capturing = local.is_production ? false : true
}

# Application detection 
resource "dynatrace_application_detection_rule" "APPLICATION-230FF579D5229BB5" {
  count                  = local.is_production ? 0 : 1
  application_identifier = "APPLICATION-230FF579D5229BB5"
  filter_config {
    application_match_target = "DOMAIN"
    application_match_type   = "MATCHES"
    pattern                  = "signin.build.account.gov.uk"
  }
}

resource "dynatrace_application_detection_rule" "APPLICATION-2E7AE613F224F6A6" {
  count                  = local.is_production ? 0 : 1
  application_identifier = "APPLICATION-2E7AE613F224F6A6"
  filter_config {
    application_match_target = "DOMAIN"
    application_match_type   = "MATCHES"
    pattern                  = "signin.integration.account.gov.uk"
  }
}
resource "dynatrace_application_detection_rule" "APPLICATION-F8F4580A29A88578" {
  count                  = local.is_production ? 0 : 1
  application_identifier = "APPLICATION-F8F4580A29A88578"
  filter_config {
    application_match_target = "DOMAIN"
    application_match_type   = "MATCHES"
    pattern                  = "signin.staging.account.gov.uk"
  }
}

# Host name determination
resource "dynatrace_rum_host_headers" "x_forwarded_host" {
  header_name = "X-Forwarded-Host"
}

resource "dynatrace_rum_host_headers" "forwarded" {
  count       = local.is_production ? 1 : 0
  header_name = "Forwarded"
}

resource "dynatrace_rum_host_headers" "x_host" {
  header_name = "X-Host"
}

resource "dynatrace_rum_host_headers" "host" {
  header_name = "Host"
}

# Not in use - Advanced setup
# Not in use - Beacon origins for CORS
# Not in use - Advanced correlation

# Enablement and cost control
resource "dynatrace_web_app_enablement" "web_app_enablement" {
  rum {
    enabled                  = false
    cost_and_traffic_control = 100
  }
  session_replay {
    enabled                  = false
    cost_and_traffic_control = 100
  }
}

# RUM overload prevention 
resource "dynatrace_rum_overload_prevention" "rum_overload_prevention" {
  overload_prevention_limit = 3500
}

# RUM JavaScript updates
resource "dynatrace_web_app_javascript_updates" "web_app_javascript_updates" {
  javascript_version = "LATEST_STABLE"
}

# Not in use - Custom RUM JavaScript version

# Enablement and cost control 
resource "dynatrace_mobile_app_enablement" "mobile_app_enablement" {
  rum {
    enabled                  = false
    cost_and_traffic_control = 100
  }
  session_replay {
    on_crash = false
  }
}

# Not in use - Private Synthetic locations

# Synthetic availability
resource "dynatrace_synthetic_availability" "synthetic_availability" {
  exclude_maintenance_windows = false
}

# Outage handling - Browser monitor default settings
resource "dynatrace_browser_monitor_outage" "browser_monitor_outage" {
  global_consecutive_outage_count_threshold = 1
  global_outages                            = true
  local_outages                             = false
  retry_on_error                            = true
}

# Outage handling - HTTP monitor default settings
resource "dynatrace_http_monitor_outage" "http_monitor_outage" {
  global_consecutive_outage_count_threshold = 1
  global_outages                            = true
  local_outages                             = false
}
