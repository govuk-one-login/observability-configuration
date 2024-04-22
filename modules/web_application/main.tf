resource "dynatrace_web_application" "web_application" {
  name                                 = var.hostname
  type                                 = "AUTO_INJECTED"
  cost_control_user_session_percentage = 100
  load_action_key_performance_metric   = "VISUALLY_COMPLETE"
  real_user_monitoring_enabled         = true
  xhr_action_key_performance_metric    = "VISUALLY_COMPLETE"
  custom_action_apdex_settings {
    frustrating_fallback_threshold = 12000
    frustrating_threshold          = 12000
    tolerated_fallback_threshold   = 3000
    tolerated_threshold            = 3000
  }
  load_action_apdex_settings {
    frustrating_fallback_threshold = 12000
    frustrating_threshold          = 12000
    tolerated_fallback_threshold   = 3000
    tolerated_threshold            = 3000
  }
  monitoring_settings {
    cache_control_header_optimizations = true
    injection_mode                     = "JAVASCRIPT_TAG"
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
    }
    javascript_framework_support {
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
