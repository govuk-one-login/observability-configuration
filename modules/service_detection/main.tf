resource "dynatrace_service_external_web_request" "main" {
  name    = var.name
  enabled = true
  conditions {
    condition {
      attribute              = var.conditions_attribute
      compare_operation_type = var.conditions_compare_operation_type
      text_values            = [var.url]
    }
  }
  id_contributors {
    port_for_service_id = var.port_for_service_id
    application_id {
      enable_id_contributor = var.application_id_enable_id_contributor
    }
    context_root {
      enable_id_contributor = var.context_root_enable_id_contributor
    }
    public_domain_name {
      enable_id_contributor = var.public_domain_name_enable_id_contributor
      service_id_contributor {
        contribution_type   = var.public_domain_name_contribution_type
        copy_from_host_name = var.public_domain_name_copy_from_host_name
      }
    }
  }
}
