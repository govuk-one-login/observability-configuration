# Unified services endpoint metrics
resource "dynatrace_unified_services_metrics" "environment" {
  enable_endpoint_metrics = true
  service_id              = "environment"
}

# Service detection rules for External Web Requests 

# YOTI
module "yoti" {
  source = "./modules/service_detection"
  name   = "YOTI"
  url    = local.is_production ? "proxy.review-o.account.gov.uk" : "yotistub.review-o.staging.account.gov.uk"
}

# Ordnance Survey
module "ordnance_survey" {
  source = "./modules/service_detection"
  name   = "Ordnance Survey"
  url    = "api.os.uk"
}

# Crosscore API
module "crosscore_api" {
  source = "./modules/service_detection"
  name   = "Crosscore API"
  url    = local.is_production ? "api.crosscore.uk.experian.com" : "api.uat.crosscore.uk.experian.com"
}

# HMPO API
module "hmpo_api" {
  source = "./modules/service_detection"
  name   = "HMPO API"
  url    = local.is_production ? "api.dvadigital.homeoffice.gov.uk" : "api-dvadigital-cte.np.homeoffice.gov.uk"
}

# DVLA API
module "dvla_api" {
  source = "./modules/service_detection"
  name   = "DVLA API"
  url    = local.is_production ? "driver-vehicle-licensing.api.gov.uk" : "uat.driver-vehicle-licensing.api.gov.uk"
}

# Post Office
module "post_office" {
  source = "./modules/service_detection"
  name   = "Post Office"
  url    = "locations.pol-platform.co.uk"
}

# Experian
module "experian" {
  source = "./modules/service_detection"
  name   = "Experian"
  url    = "uk-api.experian.com"
}

# Zendesk Production only
module "zendesk" {
  count  = local.is_production ? 1 : 0
  source = "./modules/service_detection"
  name   = "Zendesk"
  url    = "zendesk.com"
}

# ReadID Token Production only
resource "dynatrace_service_external_web_request" "readid_token" {
  name    = "ReadID Token"
  enabled = true
  conditions {
    condition {
      attribute              = "HostName"
      compare_operation_type = "StringEndsWith"
      text_values            = ["readid.com"]
    }
    condition {
      attribute              = "Url"
      compare_operation_type = "StringContains"
      text_values            = ["oauth/token"]
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

# ReadID Sessions Production only
resource "dynatrace_service_external_web_request" "readid_sessions" {
  name    = "ReadID sessions"
  enabled = true
  conditions {
    condition {
      attribute              = "HostName"
      compare_operation_type = "StringEndsWith"
      text_values            = ["readid.com"]
    }
    condition {
      attribute              = "Url"
      compare_operation_type = "StringContains"
      text_values            = ["odata/v1/ODataServlet"]
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

# HMRC NINo Production only
resource "dynatrace_service_external_web_request" "hmrc_nino" {
  name    = "HMRC NINo"
  enabled = true
  conditions {
    condition {
      attribute              = "HostName"
      compare_operation_type = "StringEndsWith"
      text_values            = ["api.service.hmrc.gov.uk"]
    }
    condition {
      attribute              = "Url"
      compare_operation_type = "StringContains"
      text_values            = ["individuals/authentication"]
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

# OTG Production only
resource "dynatrace_service_external_web_request" "otg" {
  name    = "OTG"
  enabled = true
  conditions {
    condition {
      attribute              = "HostName"
      compare_operation_type = "StringEndsWith"
      text_values            = ["api.service.hmrc.gov.uk"]
    }
    condition {
      attribute              = "Url"
      compare_operation_type = "StringContains"
      text_values            = ["oauth/token"]
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

# DVA API Production only
module "dva_api" {
  count  = local.is_production ? 1 : 0
  source = "./modules/service_detection"
  name   = "DVA API"
  url    = "driverlicensingcheck.nidirect.gov.uk"
}

# AWS Production only
module "aws" {
  count  = local.is_production ? 1 : 0
  source = "./modules/service_detection"
  name   = "AWS"
  url    = "amazonaws.com"
}

# Google APIs
module "google_apis" {
  count  = local.is_production ? 1 : 0
  source = "./modules/service_detection"
  name   = "Google APIs"
  url    = "googleapis.com"
}

# Service Now
module "service_now" {
  count  = local.is_production ? 1 : 0
  source = "./modules/service_detection"
  name   = "Service Now"
  url    = "service-now.com"
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
