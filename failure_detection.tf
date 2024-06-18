resource "dynatrace_failure_detection_parameters" "ignore_page_not_found" {
  name = "ignore-page-not-found"

  broken_links {
    http_404_not_found_failures = false
  }

  http_response_codes {
    client_side_errors                        = "400-599"
    server_side_errors                        = "500-599"
    fail_on_missing_response_code_client_side = false
    fail_on_missing_response_code_server_side = false
  }

  exception_rules {
    ignore_all_exceptions         = false
    ignore_span_failure_detection = false

    ignored_exceptions {
      custom_handled_exception {
        message_pattern = "Page not found"
      }
    }
  }
}

resource "dynatrace_failure_detection_rules" "ignore_page_not_found" {
  name         = "ignore-page-not-found"
  enabled      = true
  parameter_id = dynatrace_failure_detection_parameters.ignore_page_not_found.id

  conditions {
    condition {
      attribute = "SERVICE_TYPE"
      predicate {
        predicate_type = "SERVICE_TYPE_EQUALS"
        service_type = [
          "WebRequest",
          "WebService"
        ]
      }
    }
  }
}

resource "dynatrace_failure_detection_parameters" "ignore_invalid_csrf_token" {
  name = "ignore-invalid-csrf-token"

  broken_links {
    http_404_not_found_failures = false
  }

  http_response_codes {
    client_side_errors                        = "400-599"
    server_side_errors                        = "500-599"
    fail_on_missing_response_code_client_side = false
    fail_on_missing_response_code_server_side = false
  }

  exception_rules {
    ignore_all_exceptions         = false
    ignore_span_failure_detection = false

    ignored_exceptions {
      custom_handled_exception {
        message_pattern = "invalid csrf token"
      }
    }
  }
}

resource "dynatrace_failure_detection_rules" "ignore_invalid_csrf_token" {
  name         = "ignore-invalid-csrf-token"
  enabled      = true
  parameter_id = dynatrace_failure_detection_parameters.ignore_invalid_csrf_token.id

  conditions {
    condition {
      attribute = "SERVICE_TYPE"
      predicate {
        predicate_type = "SERVICE_TYPE_EQUALS"
        service_type = [
          "WebRequest",
          "WebService"
        ]
      }
    }
  }
}

resource "dynatrace_failure_detection_parameters" "ignore_missing_prereq_for_this_step" {
  name = "ignore-missing-prereq-for-this-step"

  broken_links {
    http_404_not_found_failures = false
  }

  http_response_codes {
    client_side_errors                        = "400-599"
    server_side_errors                        = "500-599"
    fail_on_missing_response_code_client_side = false
    fail_on_missing_response_code_server_side = false
  }

  exception_rules {
    ignore_all_exceptions         = false
    ignore_span_failure_detection = false

    ignored_exceptions {
      custom_handled_exception {
        message_pattern = "Missing prereq for this step"
      }
    }
  }
}

resource "dynatrace_failure_detection_rules" "ignore_missing_prereq_for_this_step" {
  name         = "ignore-missing-prereq-for-this-step"
  enabled      = true
  parameter_id = dynatrace_failure_detection_parameters.ignore_missing_prereq_for_this_step.id

  conditions {
    condition {
      attribute = "SERVICE_TYPE"
      predicate {
        predicate_type = "SERVICE_TYPE_EQUALS"
        service_type = [
          "WebRequest",
          "WebService"
        ]
      }
    }
  }
}
