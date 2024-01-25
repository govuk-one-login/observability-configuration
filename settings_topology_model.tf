# Generic types
resource "dynatrace_generic_types" "service" {
  name         = "span:service"
  enabled      = false
  created_by   = "Dynatrace"
  display_name = "Service"
  rules {
    rule {
      icon_pattern          = "opentelemetry"
      id_pattern            = "{service.name}"
      instance_name_pattern = "{service.name}"
      attributes {
        attribute {
          display_name = "Service Name"
          key          = "servicename"
          pattern      = "{service.name}"
        }
      }
      sources {
        source {
          source_type = "Spans"
        }
        source {
          condition   = "$eq(builtin:span_responsetime)"
          source_type = "Metrics"
        }
        source {
          condition   = "$eq(builtin:span_throughput)"
          source_type = "Metrics"
        }
        source {
          condition   = "$eq(builtin:span_failure_rate)"
          source_type = "Metrics"
        }
      }
    }
  }
}

resource "dynatrace_generic_types" "service_instance" {
  name         = "span:service_instance"
  enabled      = false
  created_by   = "Dynatrace"
  display_name = "Service Instance"
  rules {
    rule {
      icon_pattern          = "opentelemetry"
      id_pattern            = "{dt.entity.host} {service.name}"
      instance_name_pattern = "{service.name}"
      sources {
        source {
          source_type = "Spans"
        }
      }
    }
  }
}

resource "dynatrace_generic_types" "os_service" {
  name         = "os:service"
  enabled      = true
  created_by   = "Dynatrace"
  display_name = "OS Service"
  rules {
    rule {
      id_pattern            = "{dt.osservice.name}{dt.entity.host}"
      instance_name_pattern = "{dt.osservice.display_name}"
      sources {
        source {
          condition   = "$eq(builtin:osservice.availability)"
          source_type = "Metrics"
        }
      }
    }
    rule {
      id_pattern            = "{dt.osservice.name}{dt.entity.host}"
      instance_name_pattern = "{dt.osservice.display_name}"
      attributes {
        attribute {
          display_name = "OS Service Name"
          key          = "name"
          pattern      = "{dt.osservice.name}"
        }
        attribute {
          display_name = "OS Service Display Name"
          key          = "display_name"
          pattern      = "{dt.osservice.display_name}"
        }
        attribute {
          display_name = "OS Service Path"
          key          = "path"
          pattern      = "{dt.osservice.path}"
        }
        attribute {
          display_name = "OS Service Status"
          key          = "status"
          pattern      = "{dt.osservice.status}"
        }
        attribute {
          display_name = "OS Service Startup Type"
          key          = "startup_type"
          pattern      = "{dt.osservice.startup_type}"
        }
        attribute {
          display_name = "OS Service Alerting"
          key          = "alerting"
          pattern      = "{dt.osservice.alerting}"
        }
        attribute {
          display_name = "OS Service Manufacturer"
          key          = "manufacturer"
          pattern      = "{dt.osservice.manufacturer}"
        }
      }
      sources {
        source {
          source_type = "Topology"
        }
      }
    }
    rule {
      id_pattern            = "{dt.osservice.name}{dt.entity.host}"
      instance_name_pattern = "{dt.osservice.display_name}"
      sources {
        source {
          condition   = "$eq(AVAILABILITY_EVENT)"
          source_type = "Events"
        }
      }
    }
  }
}

# Generic relationships


# Not used - Grail Security Context 