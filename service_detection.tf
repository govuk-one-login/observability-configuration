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

resource "dynatrace_service_external_web_request" "Zendesk" {
  name    = "Zendesk"
  enabled = true
  conditions {
    condition {
      count                  = local.is_production ? 1 : 0
      attribute              = "URLHostName"
      compare_operation_type = "EndsWith"
      ignore_case            = false
      text_values            = ["zendesk.com"]
    }
  }
  id_contributors {
    port_for_service_id = false
    application_id {
      enable_id_contributor = false
      service_id_contributor {
        contribution_type = "OriginalValue"
      }
    }
    context_root {
      enable_id_contributor = false
      service_id_contributor {
        contribution_type = "OriginalValue"
      }
    }
    public_domain_name {
      enable_id_contributor = true
      service_id_contributor {
        contribution_type   = "OriginalValue"
        copy_from_host_name = true
        transformations {
          transformation {
            transformation_type = "BEFORE"
          }
        }
      }
    }
  }
}

resource "dynatrace_service_external_web_request" "Crosscore_API" {
  name    = "Crosscore_API"
  enabled = true
  conditions {
    condition {
      attribute              = "URLHostName"
      compare_operation_type = "EndsWith"
      ignore_case            = false
      text_values            = local.is_production ? ["api.crosscore.uk.experian.com"] : ["api.uat.crosscore.uk.experian.com"]
    }
  }
  id_contributors {
    port_for_service_id = false
    application_id {
      enable_id_contributor = false
      service_id_contributor {
        contribution_type = "OriginalValue"
      }
    }
    context_root {
      enable_id_contributor = false
      service_id_contributor {
        contribution_type = "OriginalValue"
      }
    }
    public_domain_name {
      enable_id_contributor = true
      service_id_contributor {
        contribution_type   = "OriginalValue"
        copy_from_host_name = true
        transformations {
          transformation {
            transformation_type = "BEFORE"
          }
        }
      }
    }
  }
}

resource "dynatrace_service_external_web_request" "HMPO_API" {
  name    = "HMPO_API"
  enabled = true
  conditions {
    condition {
      attribute              = "URLHostName"
      compare_operation_type = "EndsWith"
      ignore_case            = false
      text_values            = local.is_production ? ["api.dvadigital.homeoffice.gov.uk"] : ["api-dvadigital-cte.np.homeoffice.gov.uk"]
    }
  }
  id_contributors {
    port_for_service_id = false
    application_id {
      enable_id_contributor = false
      service_id_contributor {
        contribution_type = "OriginalValue"
      }
    }
    context_root {
      enable_id_contributor = false
      service_id_contributor {
        contribution_type = "OriginalValue"
      }
    }
    public_domain_name {
      enable_id_contributor = true
      service_id_contributor {
        contribution_type   = "OriginalValue"
        copy_from_host_name = true
        transformations {
          transformation {
            transformation_type = "BEFORE"
          }
        }
      }
    }
  }
}

resource "dynatrace_service_external_web_request" "DVA_API" {
  name    = "DVA_API"
  enabled = true
  conditions {
    condition {
      count                  = local.is_production ? 1 : 0
      attribute              = "URLHostName"
      compare_operation_type = "EndsWith"
      ignore_case            = false
      text_values            = ["driverlicensingcheck.nidirect.gov.uk"]
    }
  }
  id_contributors {
    port_for_service_id = false
    application_id {
      enable_id_contributor = false
      service_id_contributor {
        contribution_type = "OriginalValue"
      }
    }
    context_root {
      enable_id_contributor = false
      service_id_contributor {
        contribution_type = "OriginalValue"
      }
    }
    public_domain_name {
      enable_id_contributor = true
      service_id_contributor {
        contribution_type   = "OriginalValue"
        copy_from_host_name = true
        transformations {
          transformation {
            transformation_type = "BEFORE"
          }
        }
      }
    }
  }
}

resource "dynatrace_service_external_web_request" "DVLA_API" {
  name    = "DVLA_API"
  enabled = true
  conditions {
    condition {
      attribute              = "URLHostName"
      compare_operation_type = "EndsWith"
      ignore_case            = false
      text_values            = local.is_production ? ["driver-vehicle-licensing.api.gov.uk"] : ["uat.driver-vehicle-licensing.api.gov.uk"]
    }
  }
  id_contributors {
    port_for_service_id = false
    application_id {
      enable_id_contributor = false
      service_id_contributor {
        contribution_type = "OriginalValue"
      }
    }
    context_root {
      enable_id_contributor = false
      service_id_contributor {
        contribution_type = "OriginalValue"
      }
    }
    public_domain_name {
      enable_id_contributor = true
      service_id_contributor {
        contribution_type   = "OriginalValue"
        copy_from_host_name = true
        transformations {
          transformation {
            transformation_type = "BEFORE"
          }
        }
      }
    }
  }
}

resource "dynatrace_service_external_web_request" "AWS" {
  name    = "AWS"
  enabled = true
  conditions {
    condition {
      count                  = local.is_production ? 1 : 0
      attribute              = "URLHostName"
      compare_operation_type = "EndsWith"
      ignore_case            = false
      text_values            = ["amazonaws.com"]
    }
  }
  id_contributors {
    port_for_service_id = false
    application_id {
      enable_id_contributor = false
      service_id_contributor {
        contribution_type = "OriginalValue"
      }
    }
    context_root {
      enable_id_contributor = false
      service_id_contributor {
        contribution_type = "OriginalValue"
      }
    }
    public_domain_name {
      enable_id_contributor = true
      service_id_contributor {
        contribution_type   = "OriginalValue"
        copy_from_host_name = true
        transformations {
          transformation {
            transformation_type = "BEFORE"
          }
        }
      }
    }
  }
}