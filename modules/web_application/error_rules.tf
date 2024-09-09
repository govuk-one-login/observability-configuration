resource "dynatrace_application_error_rules" "web_application" {
  web_application_id         = dynatrace_web_application.web_application.id
  ignore_custom_errors_apdex = false
  ignore_http_errors_apdex   = false
  ignore_js_errors_apdex     = false
  http_errors {
    rule {
      capture                     = false
      consider_blocked_requests   = false
      consider_for_ai             = false
      consider_unknown_error_code = false
      error_codes                 = "404"
      impact_apdex                = false
      filter_by_url               = true
      filter                      = "ENDS_WITH"
      url                         = "favicon.ico"
    }
    rule {
      capture                     = true
      consider_blocked_requests   = false
      consider_for_ai             = true
      consider_unknown_error_code = false
      error_codes                 = "404"
      impact_apdex                = false
      filter_by_url               = true
      filter                      = "ENDS_WITH"
      url                         = ".js"
    }
    rule {
      capture                     = true
      consider_blocked_requests   = false
      consider_for_ai             = true
      consider_unknown_error_code = false
      error_codes                 = "404"
      impact_apdex                = false
      filter_by_url               = true
      filter                      = "ENDS_WITH"
      url                         = ".css"
    }
    rule {
      capture                     = true
      consider_blocked_requests   = false
      consider_for_ai             = false
      consider_unknown_error_code = false
      error_codes                 = "400-499"
      impact_apdex                = false
      filter_by_url               = false
    }
    rule {
      capture                     = true
      consider_blocked_requests   = false
      consider_for_ai             = true
      consider_unknown_error_code = false
      error_codes                 = "500-599"
      impact_apdex                = true
      filter_by_url               = false
    }
    rule {
      capture                     = true
      consider_blocked_requests   = false
      consider_for_ai             = false
      consider_unknown_error_code = false
      error_codes                 = "970-979"
      impact_apdex                = true
      filter_by_url               = false
    }
    rule {
      capture                     = true
      consider_blocked_requests   = false
      consider_for_ai             = false
      consider_unknown_error_code = true
      impact_apdex                = false
      filter_by_url               = false
    }
    rule {
      capture                     = true
      consider_blocked_requests   = true
      consider_for_ai             = true
      consider_unknown_error_code = false
      impact_apdex                = true
      filter_by_url               = false
    }
  }
}