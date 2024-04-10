# Unified services endpoint metrics
resource "dynatrace_unified_services_metrics" "environment" {
  enable_endpoint_metrics = true
  service_id              = "environment"
}

# Service detection rules for External Web Requests 
resource "dynatrace_service_external_web_request" "YOTI" {
  name    = "YOTI"
  enabled = true
  conditions {
    condition {
      attribute              = "HostName"
      compare_operation_type = "StringEndsWith"
      text_values            = local.is_production ? ["proxy.review-o.account.gov.uk"] : ["yotistub.review-o.staging.account.gov.uk"]
    }
  }
  id_contributors {
    port_for_service_id = false
    application_id {
      enable_id_contributor = false
    }
    context_root {
      enable_id_contributor = false
    }
    public_domain_name {
      enable_id_contributor = true
      service_id_contributor {
        contribution_type   = "OriginalValue"
        copy_from_host_name = true
      }
    }
  }
}

resource "dynatrace_service_external_web_request" "Ordnance_Survey" {
  name    = "Ordnance Survey"
  enabled = true
  conditions {
    condition {
      attribute              = "HostName"
      compare_operation_type = "StringEndsWith"
      text_values            = ["api.os.uk"]
    }
  }
  id_contributors {
    port_for_service_id = false
    application_id {
      enable_id_contributor = false
    }
    context_root {
      enable_id_contributor = false
    }
    public_domain_name {
      enable_id_contributor = true
      service_id_contributor {
        contribution_type   = "OriginalValue"
        copy_from_host_name = true
      }
    }
  }
}

resource "dynatrace_service_external_web_request" "Zendesk" {
  count   = local.is_production ? 1 : 0
  name    = "Zendesk"
  enabled = true
  conditions {
    condition {
      attribute              = "HostName"
      compare_operation_type = "StringEndsWith"
      text_values            = ["zendesk.com"]
    }
  }
  id_contributors {
    port_for_service_id = false
    application_id {
      enable_id_contributor = false
    }
    context_root {
      enable_id_contributor = false
    }
    public_domain_name {
      enable_id_contributor = true
      service_id_contributor {
        contribution_type   = "OriginalValue"
        copy_from_host_name = true
      }
    }
  }
}

resource "dynatrace_service_external_web_request" "Crosscore_API" {
  name    = "Crosscore API"
  enabled = true
  conditions {
    condition {
      attribute              = "HostName"
      compare_operation_type = "StringEndsWith"
      text_values            = local.is_production ? ["api.crosscore.uk.experian.com"] : ["api.uat.crosscore.uk.experian.com"]
    }
  }
  id_contributors {
    port_for_service_id = false
    application_id {
      enable_id_contributor = false
    }
    context_root {
      enable_id_contributor = false
    }
    public_domain_name {
      enable_id_contributor = true
      service_id_contributor {
        contribution_type   = "OriginalValue"
        copy_from_host_name = true
      }
    }
  }
}

resource "dynatrace_service_external_web_request" "HMPO_API" {
  name    = "HMPO API"
  enabled = true
  conditions {
    condition {
      attribute              = "HostName"
      compare_operation_type = "StringEndsWith"
      text_values            = local.is_production ? ["api.dvadigital.homeoffice.gov.uk"] : ["api-dvadigital-cte.np.homeoffice.gov.uk"]
    }
  }
  id_contributors {
    port_for_service_id = false
    application_id {
      enable_id_contributor = false
    }
    context_root {
      enable_id_contributor = false
    }
    public_domain_name {
      enable_id_contributor = true
      service_id_contributor {
        contribution_type   = "OriginalValue"
        copy_from_host_name = true
      }
    }
  }
}

resource "dynatrace_service_external_web_request" "DVA_API" {
  count   = local.is_production ? 1 : 0
  name    = "DVA API"
  enabled = true
  conditions {
    condition {
      attribute              = "HostName"
      compare_operation_type = "StringEndsWith"
      text_values            = ["driverlicensingcheck.nidirect.gov.uk"]
    }
  }
  id_contributors {
    port_for_service_id = false
    application_id {
      enable_id_contributor = false
    }
    context_root {
      enable_id_contributor = false
    }
    public_domain_name {
      enable_id_contributor = true
      service_id_contributor {
        contribution_type   = "OriginalValue"
        copy_from_host_name = true
      }
    }
  }
}

resource "dynatrace_service_external_web_request" "DVLA_API" {
  name    = "DVLA API"
  enabled = true
  conditions {
    condition {
      attribute              = "HostName"
      compare_operation_type = "StringEndsWith"
      text_values            = local.is_production ? ["driver-vehicle-licensing.api.gov.uk"] : ["uat.driver-vehicle-licensing.api.gov.uk"]
    }
  }
  id_contributors {
    port_for_service_id = false
    application_id {
      enable_id_contributor = false
    }
    context_root {
      enable_id_contributor = false
    }
    public_domain_name {
      enable_id_contributor = true
      service_id_contributor {
        contribution_type   = "OriginalValue"
        copy_from_host_name = true
      }
    }
  }
}

resource "dynatrace_service_external_web_request" "AWS" {
  count   = local.is_production ? 1 : 0
  name    = "AWS"
  enabled = true
  conditions {
    condition {
      attribute              = "HostName"
      compare_operation_type = "StringEndsWith"
      text_values            = ["amazonaws.com"]
    }
  }
  id_contributors {
    port_for_service_id = false
    application_id {
      enable_id_contributor = false
    }
    context_root {
      enable_id_contributor = false
    }
    public_domain_name {
      enable_id_contributor = true
      service_id_contributor {
        contribution_type   = "OriginalValue"
        copy_from_host_name = true
      }
    }
  }
}

resource "dynatrace_service_external_web_request" "Post_Office" {
  name    = "Post Office"
  enabled = true
  conditions {
    condition {
      attribute              = "HostName"
      compare_operation_type = "StringEndsWith"
      text_values            = ["locations.pol-platform.co.uk"]
    }
  }
  id_contributors {
    port_for_service_id = false
    application_id {
      enable_id_contributor = false
    }
    context_root {
      enable_id_contributor = false
    }
    public_domain_name {
      enable_id_contributor = true
      service_id_contributor {
        contribution_type   = "OriginalValue"
        copy_from_host_name = true
      }
    }
  }
}

resource "dynatrace_service_external_web_request" "Experian" {
  name    = "Experian"
  enabled = true
  conditions {
    condition {
      attribute              = "HostName"
      compare_operation_type = "StringEndsWith"
      text_values            = ["uk-api.experian.com"]
    }
  }
  id_contributors {
    port_for_service_id = false
    application_id {
      enable_id_contributor = false
    }
    context_root {
      enable_id_contributor = false
    }
    public_domain_name {
      enable_id_contributor = true
      service_id_contributor {
        contribution_type   = "OriginalValue"
        copy_from_host_name = true
      }
    }
  }
}

# Service detection rules for External Web Requests 
resource "dynatrace_service_external_web_service" "Redis" {
  name    = "Redis"
  enabled = true
  conditions {
    condition {
      attribute              = "Endpoint"
      compare_operation_type = "StringEndsWith"
      text_values            = ["cache.amazonaws.com"]
    }
  }
  id_contributors {
    detect_as_web_request_service = false
    url_path {
      enable_id_contributor = false
    }
  }
}
