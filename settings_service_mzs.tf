resource "dynatrace_management_zone_v2" "all" {
  for_each = local.accounts

  name        = each.value.name
  description = "Resources & Services running in ${each.value.name} (${each.value.id}"
  rules {
    rule {
      type            = "SELECTOR"
      enabled         = true
      entity_selector = "type(CUSTOM_DEVICE),fromRelationships.isAccessibleBy(type(AWS_CREDENTIALS),awsAccountId(${each.value.id}))"
    }
    rule {
      type    = "ME"
      enabled = true
      attribute_rule {
        entity_type               = "PROCESS_GROUP"
        pg_to_host_propagation    = true
        pg_to_service_propagation = true
        attribute_conditions {
          condition {
            key            = "PROCESS_GROUP_PREDEFINED_METADATA"
            operator       = "CONTAINS"
            dynamic_key    = "AWS_ECS_CLUSTER"
            string_value   = each.value.id
            case_sensitive = false
          }
        }
      }
    }
    rule {
      type    = "ME"
      enabled = true
      attribute_rule {
        entity_type = "AWS_NETWORK_LOAD_BALANCER"
        attribute_conditions {
          condition {
            key            = "AWS_ACCOUNT_ID"
            operator       = "EQUALS"
            string_value   = each.value.id
            case_sensitive = false
          }
        }
      }
    }
    rule {
      type    = "ME"
      enabled = true
      attribute_rule {
        entity_type = "AWS_APPLICATION_LOAD_BALANCER"
        attribute_conditions {
          condition {
            key            = "AWS_ACCOUNT_ID"
            operator       = "EQUALS"
            string_value   = each.value.id
            case_sensitive = false
          }
        }
      }
    }
    rule {
      type    = "ME"
      enabled = true
      attribute_rule {
        entity_type = "AWS_AUTO_SCALING_GROUP"
        attribute_conditions {
          condition {
            key            = "AWS_ACCOUNT_ID"
            operator       = "EQUALS"
            string_value   = each.value.id
            case_sensitive = false
          }
        }
      }
    }
    rule {
      type    = "ME"
      enabled = true
      attribute_rule {
        entity_type = "AWS_RELATIONAL_DATABASE_SERVICE"
        attribute_conditions {
          condition {
            key            = "AWS_ACCOUNT_ID"
            operator       = "EQUALS"
            string_value   = each.value.id
            case_sensitive = false
          }
        }
      }
    }
    rule {
      type    = "ME"
      enabled = true
      attribute_rule {
        entity_type = "AWS_CLASSIC_LOAD_BALANCER"
        attribute_conditions {
          condition {
            key            = "AWS_ACCOUNT_ID"
            operator       = "EQUALS"
            string_value   = each.value.id
            case_sensitive = false
          }
        }
      }
    }
    rule {
      type    = "ME"
      enabled = true
      attribute_rule {
        entity_type                 = "SERVICE"
        service_to_host_propagation = true
        service_to_pgpropagation    = true
        attribute_conditions {
          condition {
            key            = "PROCESS_GROUP_PREDEFINED_METADATA"
            operator       = "CONTAINS"
            dynamic_key    = "AWS_ECS_CLUSTER"
            string_value   = each.value.id
            case_sensitive = false
          }
        }
      }
    }
    rule {
      type    = "ME"
      enabled = true
      attribute_rule {
        entity_type           = "HOST"
        host_to_pgpropagation = true
        attribute_conditions {
          condition {
            key            = "AWS_ACCOUNT_ID"
            operator       = "EQUALS"
            string_value   = each.value.id
            case_sensitive = false
          }
        }
      }
    }
    rule {
      type    = "ME"
      enabled = true
      attribute_rule {
        entity_type = "AWS_ACCOUNT"
        attribute_conditions {
          condition {
            key            = "AWS_ACCOUNT_ID"
            operator       = "EQUALS"
            string_value   = each.value.id
            case_sensitive = false
          }
        }
      }
    }
    rule {
      type            = "SELECTOR"
      enabled         = true
      entity_selector = "type(SERVICE),fromRelationships.runsOn(type(AWS_LAMBDA_FUNCTION),fromRelationships.isAccessibleBy(type(AWS_CREDENTIALS),awsAccountId(${each.value.id})))"
    }

    rule {
      type    = "DIMENSION"
      enabled = true
      dimension_rule {
        applies_to = "METRIC"

        dimension_conditions {
          condition {
            condition_type = "DIMENSION"
            rule_matcher   = "EQUALS"
            key            = "aws.account.id"
            value          = each.value.id
          }
        }
      }
    }
  }
}
