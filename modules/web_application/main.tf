resource "dynatrace_web_application" "web_application" {
  name                                 = var.name
  type                                 = "AUTO_INJECTED"
  cost_control_user_session_percentage = var.user_session_percentage
  load_action_key_performance_metric   = "VISUALLY_COMPLETE"
  real_user_monitoring_enabled         = var.enabled
  xhr_action_key_performance_metric    = "ACTION_DURATION"
  custom_action_apdex_settings {
    frustrating_fallback_threshold = 15000
    frustrating_threshold          = 15000
    tolerated_fallback_threshold   = 8000
    tolerated_threshold            = 8000
  }
  load_action_apdex_settings {
    frustrating_fallback_threshold = 15000
    frustrating_threshold          = 15000
    tolerated_fallback_threshold   = 8000
    tolerated_threshold            = 8000
  }
  monitoring_settings {
    cache_control_header_optimizations = true
    injection_mode                     = "JAVASCRIPT_TAG"
    fetch_requests                     = true
    xml_http_request                   = true
    advanced_javascript_tag_settings {
      max_action_name_length = 100
      max_errors_to_capture  = 10
      additional_event_handlers {
        max_dom_nodes = 5000
      }
      global_event_capture_settings {
        change      = true
        click       = true
        doubleclick = true
        keydown     = true
        keyup       = true
        mousedown   = true
        mouseup     = true
        scroll      = true
        touch_end   = true
        touch_start = true
      }
    }
    content_capture {
      javascript_errors                 = true
      visually_complete_and_speed_index = true
      resource_timing_settings {
        instrumentation_delay = 50
        w3c_resource_timings  = true
      }
      timeout_settings {
        temporary_action_limit         = 0
        temporary_action_total_timeout = 100
      }
      visually_complete_settings {
        exclude_url_regex = "google-analytics"
      }
    }
    javascript_framework_support {
    }
    javascript_injection_rules {
      rule {
        rule         = var.injection_rule 
        url_operator = var.injection_operator
      }
    }
  }
  session_replay_config {
    enabled                       = false
    cost_control_percentage       = 100
    enable_css_resource_capturing = true
  }
  user_action_naming_settings {
    ignore_case                  = true
    query_parameter_cleanups     = ["cfid", "phpsessid", "__sid", "cftoken", "sid"]
    split_user_actions_by_domain = true
    xhr_action_naming_rules {
      rule {
        template = "{userInteraction (default)} on {elementIdentifier (default)} in {pageUrlPath (default)}"
      }
    }
  }
  meta_data_capture_settings {
    capture {
      capturing_name  = "document.referrer"
      name            = "Referrer"
      public_metadata = false
      type            = "JAVA_SCRIPT_VARIABLE"
      unique_id       = 30
      use_last_value  = false
    }
    capture {
      capturing_name  = "navigator.userAgent"
      name            = "User agent"
      public_metadata = false
      type            = "JAVA_SCRIPT_VARIABLE"
      unique_id       = 31
      use_last_value  = false
    }
    capture {
      capturing_name  = "utm_source"
      name            = "UTM source"
      public_metadata = false
      type            = "QUERY_STRING"
      unique_id       = 32
      use_last_value  = false
    }
    capture {
      capturing_name  = "utm_medium"
      name            = "UTM medium"
      public_metadata = false
      type            = "QUERY_STRING"
      unique_id       = 33
      use_last_value  = false
    }
    capture {
      capturing_name  = "utm_campaign"
      name            = "UTM campaign"
      public_metadata = false
      type            = "QUERY_STRING"
      unique_id       = 34
      use_last_value  = false
    }
    capture {
      capturing_name  = "utm_term"
      name            = "UTM term"
      public_metadata = false
      type            = "QUERY_STRING"
      unique_id       = 35
      use_last_value  = false
    }
    capture {
      capturing_name  = "utm_content"
      name            = "UTM content"
      public_metadata = false
      type            = "QUERY_STRING"
      unique_id       = 36
      use_last_value  = false
    }
  }
  user_action_and_session_properties {
    property {
      aggregation                   = "FIRST"
      display_name                  = "Referrer"
      id                            = 30
      ignore_case                   = false
      key                           = "referrer"
      long_string_length            = 0
      metadata_id                   = 30
      origin                        = "META_DATA"
      store_as_session_property     = true
      store_as_user_action_property = false
      type                          = "STRING"
    }
    property {
      aggregation                   = "LAST"
      display_name                  = "User agent"
      id                            = 31
      ignore_case                   = false
      key                           = "useragent"
      long_string_length            = 0
      metadata_id                   = 31
      origin                        = "META_DATA"
      store_as_session_property     = true
      store_as_user_action_property = false
      type                          = "STRING"
    }
    property {
      aggregation                   = "LAST"
      display_name                  = "UTM source"
      id                            = 32
      ignore_case                   = false
      key                           = "utm_source"
      long_string_length            = 0
      metadata_id                   = 32
      origin                        = "META_DATA"
      store_as_session_property     = true
      store_as_user_action_property = false
      type                          = "STRING"
    }
    property {
      aggregation                   = "LAST"
      display_name                  = "UTM medium"
      id                            = 33
      ignore_case                   = false
      key                           = "utm_medium"
      long_string_length            = 0
      metadata_id                   = 33
      origin                        = "META_DATA"
      store_as_session_property     = true
      store_as_user_action_property = false
      type                          = "STRING"
    }
    property {
      aggregation                   = "LAST"
      display_name                  = "UTM campaign"
      id                            = 34
      ignore_case                   = false
      key                           = "utm_campaign"
      long_string_length            = 0
      metadata_id                   = 34
      origin                        = "META_DATA"
      store_as_session_property     = true
      store_as_user_action_property = false
      type                          = "STRING"
    }
    property {
      aggregation                   = "LAST"
      display_name                  = "UTM term"
      id                            = 35
      ignore_case                   = false
      key                           = "utm_term"
      long_string_length            = 0
      metadata_id                   = 35
      origin                        = "META_DATA"
      store_as_session_property     = true
      store_as_user_action_property = false
      type                          = "STRING"
    }
    property {
      aggregation                   = "LAST"
      display_name                  = "UTM content"
      id                            = 36
      ignore_case                   = false
      key                           = "utm_content"
      long_string_length            = 0
      metadata_id                   = 36
      origin                        = "META_DATA"
      store_as_session_property     = true
      store_as_user_action_property = false
      type                          = "STRING"
    }
  }
  waterfall_settings {
    resource_browser_caching_threshold            = 50
    resources_threshold                           = 100000
    slow_cnd_resources_threshold                  = 200000
    slow_first_party_resources_threshold          = 200000
    slow_third_party_resources_threshold          = 200000
    speed_index_visually_complete_ratio_threshold = 50
    uncompressed_resources_threshold              = 860
  }
  xhr_action_apdex_settings {
    frustrating_fallback_threshold = 12000
    frustrating_threshold          = 12000
    tolerated_fallback_threshold   = 3000
    tolerated_threshold            = 3000
  }
}