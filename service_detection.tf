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
        contribution_type = "OriginalValue"
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
        contribution_type = "OriginalValue"
      }
    }
  }
}