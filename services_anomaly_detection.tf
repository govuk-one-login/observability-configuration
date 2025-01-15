# Anomaly detection settings to be applied at a service level
resource "dynatrace_service_anomalies_v2" "dva_anomaly_settings" {
  scope = "SERVICE-FF8DF82736246DDE"
  failure_rate {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      absolute_increase = 40
      relative_increase = 50
      over_alerting_protection {
        minutes_abnormal_state = 5
        requests_per_minute    = 1
      }
    }
  }
  load_drops {
    enabled = false
  }
  load_spikes {
    enabled = false
  }
  response_time {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      over_alerting_protection {
        minutes_abnormal_state = 5
        requests_per_minute    = 1
      }
      response_time_all {
        degradation_milliseconds = 2000
        degradation_percent      = 50
      }
      response_time_slowest {
        slowest_degradation_milliseconds = 1000
        slowest_degradation_percent      = 100
      }
    }
  }
}

resource "dynatrace_service_anomalies_v2" "dvla_anomaly_settings" {
  scope = "SERVICE-63AD630610311EBF"
  failure_rate {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      absolute_increase = 40
      relative_increase = 50
      over_alerting_protection {
        minutes_abnormal_state = 5
        requests_per_minute    = 1
      }
    }
  }
  load_drops {
    enabled = false
  }
  load_spikes {
    enabled = false
  }
  response_time {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      over_alerting_protection {
        minutes_abnormal_state = 5
        requests_per_minute    = 1
      }
      response_time_all {
        degradation_milliseconds = 2000
        degradation_percent      = 50
      }
      response_time_slowest {
        slowest_degradation_milliseconds = 1000
        slowest_degradation_percent      = 100
      }
    }
  }
}

resource "dynatrace_service_anomalies_v2" "hmpo_anomaly_settings" {
  scope = "SERVICE-3EEEDBD9F4EDEF7A"
  failure_rate {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      absolute_increase = 40
      relative_increase = 50
      over_alerting_protection {
        minutes_abnormal_state = 5
        requests_per_minute    = 1
      }
    }
  }
  load_drops {
    enabled = false
  }
  load_spikes {
    enabled = false
  }
  response_time {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      over_alerting_protection {
        minutes_abnormal_state = 5
        requests_per_minute    = 1
      }
      response_time_all {
        degradation_milliseconds = 2000
        degradation_percent      = 50
      }
      response_time_slowest {
        slowest_degradation_milliseconds = 1000
        slowest_degradation_percent      = 100
      }
    }
  }
}

resource "dynatrace_service_anomalies_v2" "experian_anomaly_settings" {
  scope = "SERVICE-818DC917074D5BBF"
  failure_rate {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      absolute_increase = 40
      relative_increase = 50
      over_alerting_protection {
        minutes_abnormal_state = 5
        requests_per_minute    = 1
      }
    }
  }
  load_drops {
    enabled = false
  }
  load_spikes {
    enabled = false
  }
  response_time {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      over_alerting_protection {
        minutes_abnormal_state = 5
        requests_per_minute    = 1
      }
      response_time_all {
        degradation_milliseconds = 2000
        degradation_percent      = 50
      }
      response_time_slowest {
        slowest_degradation_milliseconds = 1000
        slowest_degradation_percent      = 100
      }
    }
  }
}

resource "dynatrace_service_anomalies_v2" "readid_anomaly_settings" {
  scope = "SERVICE-4233EC82FB3675E8"
  failure_rate {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      absolute_increase = 40
      relative_increase = 50
      over_alerting_protection {
        minutes_abnormal_state = 5
        requests_per_minute    = 1
      }
    }
  }
  load_drops {
    enabled = false
  }
  load_spikes {
    enabled = false
  }
  response_time {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      over_alerting_protection {
        minutes_abnormal_state = 5
        requests_per_minute    = 1
      }
      response_time_all {
        degradation_milliseconds = 2000
        degradation_percent      = 50
      }
      response_time_slowest {
        slowest_degradation_milliseconds = 1000
        slowest_degradation_percent      = 100
      }
    }
  }
}

resource "dynatrace_service_anomalies_v2" "yoti_anomaly_settings" {
  scope = "SERVICE-C5EE09FA3C77F46F"
  failure_rate {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      absolute_increase = 40
      relative_increase = 50
      over_alerting_protection {
        minutes_abnormal_state = 5
        requests_per_minute    = 1
      }
    }
  }
  load_drops {
    enabled = false
  }
  load_spikes {
    enabled = false
  }
  response_time {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      over_alerting_protection {
        minutes_abnormal_state = 5
        requests_per_minute    = 1
      }
      response_time_all {
        degradation_milliseconds = 2000
        degradation_percent      = 50
      }
      response_time_slowest {
        slowest_degradation_milliseconds = 1000
        slowest_degradation_percent      = 100
      }
    }
  }
}

resource "dynatrace_service_anomalies_v2" "zendesk_anomaly_settings" {
  scope = "SERVICE-90FD06AA9A3046B8"
  failure_rate {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      absolute_increase = 40
      relative_increase = 50
      over_alerting_protection {
        minutes_abnormal_state = 5
        requests_per_minute    = 1
      }
    }
  }
  load_drops {
    enabled = false
  }
  load_spikes {
    enabled = false
  }
  response_time {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      over_alerting_protection {
        minutes_abnormal_state = 5
        requests_per_minute    = 1
      }
      response_time_all {
        degradation_milliseconds = 2000
        degradation_percent      = 50
      }
      response_time_slowest {
        slowest_degradation_milliseconds = 1000
        slowest_degradation_percent      = 100
      }
    }
  }
}

resource "dynatrace_service_anomalies_v2" "google_oauth_anomaly_settings" {
  scope = "SERVICE-6639F9C59EB7A18A"
  failure_rate {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      absolute_increase = 40
      relative_increase = 50
      over_alerting_protection {
        minutes_abnormal_state = 5
        requests_per_minute    = 1
      }
    }
  }
  load_drops {
    enabled = false
  }
  load_spikes {
    enabled = false
  }
  response_time {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      over_alerting_protection {
        minutes_abnormal_state = 5
        requests_per_minute    = 1
      }
      response_time_all {
        degradation_milliseconds = 2000
        degradation_percent      = 50
      }
      response_time_slowest {
        slowest_degradation_milliseconds = 1000
        slowest_degradation_percent      = 100
      }
    }
  }
}

resource "dynatrace_service_anomalies_v2" "google_apis_anomaly_settings" {
  scope = "SERVICE-C9807A7AEA6C6DFE"
  failure_rate {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      absolute_increase = 40
      relative_increase = 50
      over_alerting_protection {
        minutes_abnormal_state = 5
        requests_per_minute    = 1
      }
    }
  }
  load_drops {
    enabled = false
  }
  load_spikes {
    enabled = false
  }
  response_time {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      over_alerting_protection {
        minutes_abnormal_state = 5
        requests_per_minute    = 1
      }
      response_time_all {
        degradation_milliseconds = 2000
        degradation_percent      = 50
      }
      response_time_slowest {
        slowest_degradation_milliseconds = 1000
        slowest_degradation_percent      = 100
      }
    }
  }
}

resource "dynatrace_service_anomalies_v2" "google_sheets_anomaly_settings" {
  scope = "SERVICE-D58719FFAB1F810A"
  failure_rate {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      absolute_increase = 40
      relative_increase = 50
      over_alerting_protection {
        minutes_abnormal_state = 5
        requests_per_minute    = 1
      }
    }
  }
  load_drops {
    enabled = false
  }
  load_spikes {
    enabled = false
  }
  response_time {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      over_alerting_protection {
        minutes_abnormal_state = 5
        requests_per_minute    = 1
      }
      response_time_all {
        degradation_milliseconds = 2000
        degradation_percent      = 50
      }
      response_time_slowest {
        slowest_degradation_milliseconds = 1000
        slowest_degradation_percent      = 100
      }
    }
  }
}

resource "dynatrace_service_anomalies_v2" "servicenow_anomaly_settings" {
  scope = "SERVICE-41210C73E70E0781"
  failure_rate {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      absolute_increase = 40
      relative_increase = 50
      over_alerting_protection {
        minutes_abnormal_state = 5
        requests_per_minute    = 1
      }
    }
  }
  load_drops {
    enabled = false
  }
  load_spikes {
    enabled = false
  }
  response_time {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      over_alerting_protection {
        minutes_abnormal_state = 5
        requests_per_minute    = 1
      }
      response_time_all {
        degradation_milliseconds = 2000
        degradation_percent      = 50
      }
      response_time_slowest {
        slowest_degradation_milliseconds = 1000
        slowest_degradation_percent      = 100
      }
    }
  }
}

resource "dynatrace_service_anomalies_v2" "onboarding_product_page_anomaly_settings" {
  scope = "SERVICE-9713F44B641C67F8"
  failure_rate {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      absolute_increase = 40
      relative_increase = 50
      over_alerting_protection {
        minutes_abnormal_state = 5
        requests_per_minute    = 1
      }
    }
  }
  load_drops {
    enabled = false
  }
  load_spikes {
    enabled = false
  }
  response_time {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      over_alerting_protection {
        minutes_abnormal_state = 30
        requests_per_minute    = 10
      }
      response_time_all {
        degradation_milliseconds = 4000
        degradation_percent      = 50
      }
      response_time_slowest {
        slowest_degradation_milliseconds = 60000
        slowest_degradation_percent      = 100
      }
    }
  }
}