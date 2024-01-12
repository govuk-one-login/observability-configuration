# OneAgent features 
resource "dynatrace_oneagent_features" "oneagent_features" {
  for_each        = local.oneagent_features
  enabled         = each.value.enabled
  instrumentation = each.value.enabled
  key             = each.value.key
  scope           = "environment"
}

# Disk options 
resource "dynatrace_disk_options" "disk_options" {
  nfs_show_all = false
}

# Log audit events
resource "dynatrace_audit_log" "audit_log" {
  enabled = local.is_production ? false : true
}

# Network zones settings 
resource "dynatrace_network_zones" "network_zones" {
  enabled = false
}

# Extension Execution Controller 
resource "dynatrace_extension_execution_controller" "extension_execution_controller" {
  enabled             = local.is_production ? false : true
  ingest_active       = true
  performance_profile = "DEFAULT"
  scope               = "environment"
  statsd_active       = true
}

# Terms of use
resource "dynatrace_eula_settings" "eula_settings" {
  scope       = "environment"
  enable_eula = true
}

# Network security 
resource "dynatrace_activegate_token" "activegate_token" {
  auth_token_enforcement_manually_enabled = false
  expiring_token_notifications_enabled    = true
}

# Container Registry
resource "dynatrace_container_registry" "container_registry" {
  container_registry = ""
}

# Data privacy - General
resource "dynatrace_data_privacy" "data_privacy" {
  application_id = "environment"
  data_collection {
    opt_in_mode_enabled = true
  }
  do_not_track {
    comply_with_do_not_track = true
    do_not_track             = "anonymous"
  }
  masking {
    personal_data_uri_masking_enabled = true
    user_action_masking_enabled       = false
  }
  user_tracking {
    persistent_cookie_enabled = false
  }
}

# Data privacy - OneAgent Side Masking
resource "dynatrace_oneagent_side_masking" "oneagent_side_masking" {
  is_email_masking_enabled     = false
  is_financial_masking_enabled = false
  is_numbers_masking_enabled   = false
  is_query_masking_enabled     = false
}

# Data privacy - IP Masking
resource "dynatrace_ip_address_masking" "ip_address_masking" {
  enabled = true
  type    = "all"
}

# Data privacy - Session replay
resource "dynatrace_session_replay_web_privacy" "session_replay_web_privacy" {
  application_id     = "environment"
  enable_opt_in_mode = false
  masking_presets {
    playback_masking_preset  = local.is_production ? "MASK_USER_INPUT" : "MASK_ALL"
    recording_masking_preset = local.is_production ? "MASK_USER_INPUT" : "MASK_ALL"
  }
}

# Hub subscriptions - Not used

# Limit outbound connections
resource "dynatrace_limit_outbound_connections" "limit_outbound_connections" {
  allowed_outbound_connections {
    enforced = true
  }
}


