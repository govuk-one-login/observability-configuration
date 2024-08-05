# Server-side service monitoring
# Not in use - Service naming
# Not in use - Request attributes
# Calculated service metrics
resource "dynatrace_calculated_service_metric" "liveserviceshub" {
  name             = "LiveServicesHub"
  enabled          = true
  management_zones = []
  metric_key       = "calc:service.liveserviceshub"
  unit             = "MILLI_SECOND_PER_MINUTE"
  conditions {
    condition {
      attribute = "SERVICE_TYPE"
      comparison {
        negate = false
        service_type {
          operator = "EQUALS_ANY_OF"
          values   = ["WEB_REQUEST_SERVICE", "WEB_SERVICE"]
        }
      }
    }
  }
  metric_definition {
    metric = "REQUEST_COUNT"
  }
  dimension_definition {
    name              = "Dimension"
    dimension         = "{Relative-URL} onelogingovuk.service-now.com/csm"
    top_x             = 100
    top_x_direction   = "DESCENDING"
    top_x_aggregation = "SINGLE_VALUE"
  }
}
# Terraform resource does not exist for Request naming

# API detection rules
resource "dynatrace_api_detection" "built_in_wordpress" {
  api_color       = "#b4e5f9"
  api_name        = "Built-In Wordpress"
  technology      = "PHP"
  third_party_api = true
  conditions {
    condition {
      base    = "FILE_NAME"
      matcher = "CONTAINS"
      pattern = "wp-includes/"
    }
  }
}

resource "dynatrace_api_detection" "built_in_jre" {
  api_color       = "#c95218"
  api_name        = "Built-In JRE"
  technology      = "Java"
  third_party_api = true
  conditions {
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "com.oracle."
    }
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "com.dynatrace.agent.introspection.casp.flawfinder.tracking.wrappers."
    }
    condition {
      base    = "FQCN"
      matcher = "CONTAINS"
      pattern = "DtStringConcat_"
    }
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "java."
    }
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "jdk."
    }
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "com.dynatrace.agent.introspection.casp.flawfinder.access."
    }
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "sun."
    }
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "javax."
    }
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "com.sun."
    }
  }
}

resource "dynatrace_api_detection" "built_in_java_cassandra" {
  api_color       = "#debbf3"
  api_name        = "Built-In Java Cassandra"
  technology      = "Java"
  third_party_api = true
  conditions {
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "me.prettyprint.cassandra."
    }
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "org.apache.cassandra."
    }
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "com.netflix.astyanax."
    }
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "com.datastax."
    }
  }
}

resource "dynatrace_api_detection" "built_in_apache" {
  api_color       = "#2ab6f4"
  api_name        = "Built-In Apache"
  technology      = "Java"
  third_party_api = true
  conditions {
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "org.apache."
    }
  }
}

resource "dynatrace_api_detection" "built_in_java_ibm_ctg" {
  api_color       = "#c9a000"
  api_name        = "Built-In Java IBM CTG"
  technology      = "Java"
  third_party_api = true
  conditions {
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "com.ibm.ctg."
    }
  }
}

resource "dynatrace_api_detection" "built_in_hibernate" {
  api_color       = "#522273"
  api_name        = "Built-In Hibernate"
  technology      = "Java"
  third_party_api = true
  conditions {
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "org.hibernate."
    }
  }
}

resource "dynatrace_api_detection" "built_in_java_ibm_mq" {
  api_color       = "#ffd0ab"
  api_name        = "Built-In Java IBM MQ"
  technology      = "Java"
  third_party_api = true
  conditions {
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "com.ibm.mq."
    }
  }
}

resource "dynatrace_api_detection" "built_in_java_tests" {
  api_color       = "#008cdb"
  api_name        = "Built-In Java tests"
  technology      = "Java"
  third_party_api = true
  conditions {
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "junit.framework."
    }
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "org.junit."
    }
  }
}

resource "dynatrace_api_detection" "built_in_jboss" {
  api_color       = "#fff29a"
  api_name        = "Built-In JBoss"
  technology      = "Java"
  third_party_api = true
  conditions {
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "org.jboss."
    }
  }
}

resource "dynatrace_api_detection" "built_in_java_mongodb" {
  api_color       = "#fff29a"
  api_name        = "Built-In Java MongoDB"
  technology      = "Java"
  third_party_api = true
  conditions {
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "com.novus.casbah.mongodb."
    }
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "com.mongodb."
    }
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "org.bson."
    }
  }
}

resource "dynatrace_api_detection" "built_in_mule" {
  api_color       = "#008cdb"
  api_name        = "Built-In Mule"
  technology      = "Java"
  third_party_api = true
  conditions {
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "org.mule."
    }
  }
}

resource "dynatrace_api_detection" "built_in_java_rabbitmq" {
  api_color       = "#aeebf0"
  api_name        = "Built-In Java RabbitMQ"
  technology      = "Java"
  third_party_api = true
  conditions {
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "com.rabbitmq."
    }
  }
}

resource "dynatrace_api_detection" "built_in_spring" {
  api_color       = "#debbf3"
  api_name        = "Built-In Spring"
  technology      = "Java"
  third_party_api = true
  conditions {
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "org.springframework."
    }
  }
}

resource "dynatrace_api_detection" "built_in_tibco" {
  api_color       = "#a972cc"
  api_name        = "Built-In TIBCO"
  technology      = "Java"
  third_party_api = true
  conditions {
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "org.tibco."
    }
  }
}

resource "dynatrace_api_detection" "built_in_oracle_weblogic" {
  api_color       = "#7c38a1"
  api_name        = "Built-In Oracle WebLogic"
  technology      = "Java"
  third_party_api = true
  conditions {
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "com.bea."
    }
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "com.weblogic."
    }
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "bea."
    }
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "weblogic."
    }
  }
}

resource "dynatrace_api_detection" "built_in_ibm_websphere" {
  api_color       = "#4fd5e0"
  api_name        = "Built-In IBM WebSphere"
  technology      = "Java"
  third_party_api = true
  conditions {
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "com.ibm.websphere."
    }
  }
}

resource "dynatrace_api_detection" "built_in_net_clr" {
  api_color       = "#7c38a1"
  api_name        = "Built-In .NET CLR"
  technology      = "dotNet"
  third_party_api = true
  conditions {
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "System."
    }
  }
}

resource "dynatrace_api_detection" "built_in_net_entity_framework_core" {
  api_color       = "#4fd5e0"
  api_name        = "Built-In .NET Entity Framework Core"
  technology      = "dotNet"
  third_party_api = true
  conditions {
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "Microsoft.EntityFrameworkCore."
    }
  }
}

resource "dynatrace_api_detection" "built_in_net_logging" {
  api_color       = "#ffa86c"
  api_name        = "Built-In .NET Logging"
  technology      = "dotNet"
  third_party_api = true
  conditions {
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "Microsoft.EnterpriseInstrumentation.EventSource."
    }
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "Microsoft.Extensions.Logging."
    }
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "Microsoft.Practices.EnterpriseLibrary.Logging."
    }
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "log4net."
    }
  }
}

resource "dynatrace_api_detection" "built_in_net_azure_service" {
  api_color       = "#fff29a"
  api_name        = "Built-In .NET Azure Service Fabric"
  technology      = "dotNet"
  third_party_api = true
  conditions {
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "Microsoft.ServiceFabric."
    }
  }
}

resource "dynatrace_api_detection" "built_in_asp_net_core" {
  api_color       = "#008cdb"
  api_name        = "Built-In ASP.NET Core"
  technology      = "dotNet"
  third_party_api = true
  conditions {
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "Microsoft.AspNetCore."
    }
  }
}

resource "dynatrace_api_detection" "built_in_net_rabbitmq" {
  api_color       = "#aeebf0"
  api_name        = "Built-In .NET RabbitMQ"
  technology      = "dotNet"
  third_party_api = true
  conditions {
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "RabbitMQ."
    }
  }
}

resource "dynatrace_api_detection" "built_in_net_ibm_mq" {
  api_color       = "#ffd0ab"
  api_name        = "Built-In .NET IBM MQ"
  technology      = "dotNet"
  third_party_api = true
  conditions {
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "IBM.XMS."
    }
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "IBM.WMQ."
    }
  }
}

resource "dynatrace_api_detection" "built_in_net_mongodb" {
  api_color       = "#fff29a"
  api_name        = "Built-In .NET MongoDB"
  technology      = "dotNet"
  third_party_api = true
  conditions {
    condition {
      base    = "FQCN"
      matcher = "BEGINS_WITH"
      pattern = "MongoDB."
    }
  }
}

resource "dynatrace_api_detection" "built_in_go_standard_library" {
  api_color       = "#4fd5e0"
  api_name        = "Built-In Go Standard Library"
  technology      = "Go"
  third_party_api = true
  conditions {
    condition {
      base    = "PACKAGE"
      matcher = "BEGINS_WITH"
      pattern = "net"
    }
    condition {
      base    = "PACKAGE"
      matcher = "BEGINS_WITH"
      pattern = "io"
    }
    condition {
      base    = "PACKAGE"
      matcher = "BEGINS_WITH"
      pattern = "runtime"
    }
    condition {
      base    = "PACKAGE"
      matcher = "BEGINS_WITH"
      pattern = "sync"
    }
    condition {
      base    = "PACKAGE"
      matcher = "BEGINS_WITH"
      pattern = "os"
    }
  }
}

resource "dynatrace_api_detection" "built_in_go_database" {
  api_color       = "#fff29a"
  api_name        = "Built-In Go Database"
  technology      = "Go"
  third_party_api = true
  conditions {
    condition {
      base    = "PACKAGE"
      matcher = "BEGINS_WITH"
      pattern = "database"
    }
  }
}

# Terraform resource does not exist for Deep monitoring in version 1.58.5
# Not in use - URL-based sampling
# Not in use - Span capturing

# Span entry points
resource "dynatrace_span_entry_point" "suppress_client_spans" {
  name   = "Suppress client spans"
  action = "DONT_CREATE_ENTRYPOINT"
  matches {
    match {
      comparison = "EQUALS"
      source     = "SPAN_KIND"
      value      = "CLIENT"
    }
  }
}

resource "dynatrace_span_entry_point" "suppress_internal_spans" {
  name   = "Suppress internal spans"
  action = "DONT_CREATE_ENTRYPOINT"
  matches {
    match {
      comparison = "EQUALS"
      source     = "SPAN_KIND"
      value      = "INTERNAL"
    }
  }
}

resource "dynatrace_span_entry_point" "suppress_producer_spans" {
  name   = "Suppress producer spans"
  action = "DONT_CREATE_ENTRYPOINT"
  matches {
    match {
      comparison = "EQUALS"
      source     = "SPAN_KIND"
      value      = "PRODUCER"
    }
  }
}

# Not in use - Span context propagation

# Attribute capturing
## Attribute data masking 
resource "dynatrace_attribute_masking" "client_ip" {
  enabled = true
  key     = "client.ip"
  masking = "MASK_ENTIRE_VALUE"
}

resource "dynatrace_attribute_masking" "db_connection_string" {
  enabled = true
  key     = "db.connection_string"
  masking = "MASK_ENTIRE_VALUE"
}

resource "dynatrace_attribute_masking" "db_statement" {
  enabled = true
  key     = "db.statement"
  masking = "MASK_ENTIRE_VALUE"
}

resource "dynatrace_attribute_masking" "graphql_document" {
  enabled = true
  key     = "graphql.document"
  masking = "MASK_ENTIRE_VALUE"
}

resource "dynatrace_attribute_masking" "http_request_headers" {
  enabled = true
  key     = "http.request.headers"
  masking = "MASK_ENTIRE_VALUE"
}

resource "dynatrace_attribute_masking" "http_response_headers" {
  enabled = true
  key     = "http.response.headers"
  masking = "MASK_ENTIRE_VALUE"
}

resource "dynatrace_attribute_masking" "http_target" {
  enabled = true
  key     = "http.target"
  masking = "MASK_ENTIRE_VALUE"
}

resource "dynatrace_attribute_masking" "http_url" {
  enabled = true
  key     = "http.url"
  masking = "MASK_ENTIRE_VALUE"
}

resource "dynatrace_attribute_masking" "messaging_url" {
  enabled = true
  key     = "messaging.url"
  masking = "MASK_ENTIRE_VALUE"
}

resource "dynatrace_attribute_masking" "process_command_args" {
  enabled = true
  key     = "process.command_args"
  masking = "MASK_ENTIRE_VALUE"
}

resource "dynatrace_attribute_masking" "process_command_line" {
  enabled = true
  key     = "process.command_line"
  masking = "MASK_ENTIRE_VALUE"
}

resource "dynatrace_attribute_masking" "url_full" {
  enabled = true
  key     = "url.full"
  masking = "MASK_ENTIRE_VALUE"
}

resource "dynatrace_attribute_masking" "url_path" {
  enabled = true
  key     = "url.path"
  masking = "MASK_ENTIRE_VALUE"
}

resource "dynatrace_attribute_masking" "url_query" {
  enabled = true
  key     = "url.query"
  masking = "MASK_ENTIRE_VALUE"
}

## Not in use - Blocked attributes
## Preferences
resource "dynatrace_attributes_preferences" "attributes_preferences" {
  persistence_mode = "ALLOW_ALL_ATTRIBUTES"
}

# Failure detection parameters
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

# Failure detection rules
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
