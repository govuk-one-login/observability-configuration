resource "dynatrace_service_external_web_request" "#Zendesk#" {
  name             = "#Zendesk#"
  enabled          = true
  conditions {
    condition {
      attribute              = "URLHostName"
      compare_operation_type = "EndsWith"
      ignore_case            = false
      text_values            = [ "zendesk.com" ]
    }
  }
  }
  id_contributors {
    port_for_service_id = false
    }
    context_root {
      enable_id_contributor = false
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

resource "dynatrace_service_external_web_request" "#CrosscoreAPI#" {
  name             = "#CrosscoreAPI#"
  enabled          = true
  conditions {
    condition {
      attribute              = "URLHostName"
      compare_operation_type = "EndsWith"
      ignore_case            = false
      text_values            = [ "api.crosscore.uk.experian.com" ]
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
        transformations {
          transformation {
            transformation_type = "BEFORE"
          }
        }
      }
    }
  }
}

resource "dynatrace_service_external_web_request" "#HMPOAPI#" {
  name             = "#HMPOAPI#"
  enabled          = true
  conditions {
    condition {
      attribute              = "URLHostName"
      compare_operation_type = "EndsWith"
      ignore_case            = false
      text_values            = [ "api.dvadigital.homeoffice.gov.uk" ]
    }
  }
  id_contributors {
    port_for_service_id = false

    }
    context_root {
      enable_id_contributor = false
      
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

resource "dynatrace_service_external_web_request" "#DVAAPI#" {
  name             = "#DVAAPI#"
  enabled          = true
  conditions {
    condition {
      attribute              = "URLHostName"
      compare_operation_type = "EndsWith"
      ignore_case            = false
      text_values            = [ "driverlicensingcheck.nidirect.gov.uk" ]
    }
  }
  id_contributors {
    port_for_service_id = false
    }
    context_root {
      enable_id_contributor = false
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

resource "dynatrace_service_external_web_request" "#DVLAAPI#" {
  name             = "#DVLAAPI#"
  enabled          = true
  conditions {
    condition {
      attribute              = "URLHostName"
      compare_operation_type = "EndsWith"
      ignore_case            = false
      text_values            = [ "driver-vehicle-licensing.api.gov.uk" ]
    }
  }
  id_contributors {
    port_for_service_id = false
    }
    context_root {
      enable_id_contributor = false
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


  resource "dynatrace_service_external_web_request" "#AWS#" {
  name             = "#AWS#"
  enabled          = true
  conditions {
    condition {
      attribute              = "URLHostName"
      compare_operation_type = "EndsWith"
      ignore_case            = false
      text_values            = [ "amazonaws.com" ]
    }
  }
  id_contributors {
    port_for_service_id = false
    }
    context_root {
      enable_id_contributor = false
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

