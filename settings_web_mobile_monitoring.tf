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
