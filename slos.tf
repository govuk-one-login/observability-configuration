resource "dynatrace_slo_v2" "perf001" {
  name               = "95% of user-facing requests < 1s"
  enabled            = true
  custom_description = "95% of user-facing requests to be served within 1 second"
  evaluation_type    = "AGGREGATE"
  evaluation_window  = "-1M"
  filter             = "type(CUSTOM_DEVICE)"
  metric_expression  = "((cloud.aws.apigateway.latencyByAccountIdApiNameRegionStage:avg:partition(\"latency\",value(\"good\",le(1000))):splitBy():count:default(0))/(cloud.aws.apigateway.latencyByAccountIdApiNameRegionStage:avg:splitBy():count)*(100)):default(100,always)"
  metric_name        = "nfr_perf001"
  target_success     = 95
  target_warning     = 97
  error_budget_burn_rate {
    burn_rate_visualization_enabled = true
    fast_burn_threshold             = 10
  }
}

resource "dynatrace_slo_v2" "perf002" {
  name               = "99% of user-facing requests < 2.5s"
  enabled            = true
  custom_description = "99% of user-facing requests to be served within 2.5 second"
  evaluation_type    = "AGGREGATE"
  evaluation_window  = "-1M"
  filter             = "type(CUSTOM_DEVICE)"
  metric_expression  = "((cloud.aws.apigateway.latencyByAccountIdApiNameRegionStage:avg:partition(\"latency\",value(\"good\",le(2500))):splitBy():count:default(0))/(cloud.aws.apigateway.latencyByAccountIdApiNameRegionStage:avg:splitBy():count)*(100)):default(100,always)"
  metric_name        = "nfr_perf002"
  target_success     = 99
  target_warning     = 99.5
  error_budget_burn_rate {
    burn_rate_visualization_enabled = true
    fast_burn_threshold             = 10
  }
}

resource "dynatrace_slo_v2" "dva_availability" {
  name               = "DVA Availability"
  enabled            = true
  custom_description = "DVA Availability (99.9%)"
  evaluation_type    = "AGGREGATE"
  evaluation_window  = "-1M"
  filter             = "type(SERVICE),entityId(SERVICE-FF8DF82736246DDE)"
  metric_expression  = "(100)*(builtin:service.errors.total.successCount:splitBy())/(builtin:service.requestCount.total:splitBy())"
  metric_name        = "dva_availability"
  target_success     = 99.9
  target_warning     = 99.95
  error_budget_burn_rate {
    burn_rate_visualization_enabled = true
    fast_burn_threshold             = 10
  }
}

resource "dynatrace_slo_v2" "dvla_availability" {
  name               = "DVLA Availability"
  enabled            = true
  custom_description = "DVLA Availability (99.9%)"
  evaluation_type    = "AGGREGATE"
  evaluation_window  = "-1M"
  filter             = "type(SERVICE),entityId(SERVICE-63AD630610311EBF)"
  metric_expression  = "(100)*(builtin:service.errors.total.successCount:splitBy())/(builtin:service.requestCount.total:splitBy())"
  metric_name        = "dvla_availability"
  target_success     = 99.9
  target_warning     = 99.95
  error_budget_burn_rate {
    burn_rate_visualization_enabled = true
    fast_burn_threshold             = 10
  }
}

resource "dynatrace_slo_v2" "hmpo_availability" {
  name               = "HMPO Availability"
  enabled            = true
  custom_description = "HMPO Availability (99.9%)"
  evaluation_type    = "AGGREGATE"
  evaluation_window  = "-1M"
  filter             = "type(SERVICE),entityId(SERVICE-3EEEDBD9F4EDEF7A)"
  metric_expression  = "(100)*(builtin:service.errors.total.successCount:splitBy())/(builtin:service.requestCount.total:splitBy())"
  metric_name        = "hmpo_availability"
  target_success     = 99.9
  target_warning     = 99.95
  error_budget_burn_rate {
    burn_rate_visualization_enabled = true
    fast_burn_threshold             = 10
  }
}

resource "dynatrace_slo_v2" "experian_availability" {
  name               = "Experian Availability"
  enabled            = true
  custom_description = "Experian Availability (99.9%)"
  evaluation_type    = "AGGREGATE"
  evaluation_window  = "-1M"
  filter             = "type(SERVICE),entityId(SERVICE-818DC917074D5BBF)"
  metric_expression  = "(100)*(builtin:service.errors.total.successCount:splitBy())/(builtin:service.requestCount.total:splitBy())"
  metric_name        = "experian_availability"
  target_success     = 99.9
  target_warning     = 99.95
  error_budget_burn_rate {
    burn_rate_visualization_enabled = true
    fast_burn_threshold             = 10
  }
}

resource "dynatrace_slo_v2" "yoti_availability" {
  count              = local.is_production ? 1 : 0
  name               = "YOTI Availability"
  enabled            = true
  custom_description = "YOTI Availability (99.9%)"
  evaluation_type    = "AGGREGATE"
  evaluation_window  = "-1M"
  filter             = "type(SERVICE),entityId(SERVICE-C5EE09FA3C77F46F)"
  metric_expression  = "(100)*(builtin:service.errors.total.successCount:splitBy())/(builtin:service.requestCount.total:splitBy())"
  metric_name        = "yoti_availability"
  target_success     = 99.9
  target_warning     = 99.95
  error_budget_burn_rate {
    burn_rate_visualization_enabled = true
    fast_burn_threshold             = 10
  }
}

resource "dynatrace_slo_v2" "zendesk_availability" {
  count              = local.is_production ? 1 : 0
  name               = "Zendesk Availability"
  enabled            = true
  custom_description = "Zendesk Availability (99.9%)"
  evaluation_type    = "AGGREGATE"
  evaluation_window  = "-1M"
  filter             = "type(SERVICE),entityId(SERVICE-90FD06AA9A3046B8)"
  metric_expression  = "(100)*(builtin:service.errors.total.successCount:splitBy())/(builtin:service.requestCount.total:splitBy())"
  metric_name        = "zendesk_availability"
  target_success     = 99.9
  target_warning     = 99.95
  error_budget_burn_rate {
    burn_rate_visualization_enabled = true
    fast_burn_threshold             = 10
  }
}

resource "dynatrace_slo_v2" "google_oauth_availability" {
  count              = local.is_production ? 1 : 0
  name               = "Google OAuth2 Availability"
  enabled            = true
  custom_description = "Google OAuth2 Availability (99.9%)"
  evaluation_type    = "AGGREGATE"
  evaluation_window  = "-1M"
  filter             = "type(SERVICE),entityId(SERVICE-6639F9C59EB7A18A)"
  metric_expression  = "(100)*(builtin:service.errors.total.successCount:splitBy())/(builtin:service.requestCount.total:splitBy())"
  metric_name        = "google_oauth_availability"
  target_success     = 99.9
  target_warning     = 99.95
  error_budget_burn_rate {
    burn_rate_visualization_enabled = true
    fast_burn_threshold             = 10
  }
}

resource "dynatrace_slo_v2" "google_apis_availability" {
  count              = local.is_production ? 1 : 0
  name               = "Google APIs Availability"
  enabled            = true
  custom_description = "Google APIs Availability (99.9%)"
  evaluation_type    = "AGGREGATE"
  evaluation_window  = "-1M"
  filter             = "type(SERVICE),entityId(SERVICE-C9807A7AEA6C6DFE)"
  metric_expression  = "(100)*(builtin:service.errors.total.successCount:splitBy())/(builtin:service.requestCount.total:splitBy())"
  metric_name        = "google_apis_availability"
  target_success     = 99.9
  target_warning     = 99.95
  error_budget_burn_rate {
    burn_rate_visualization_enabled = true
    fast_burn_threshold             = 10
  }
}

resource "dynatrace_slo_v2" "google_sheets_availability" {
  count              = local.is_production ? 1 : 0
  name               = "Google Sheets Availability"
  enabled            = true
  custom_description = "Google Sheets Availability (99.9%)"
  evaluation_type    = "AGGREGATE"
  evaluation_window  = "-1M"
  filter             = "type(SERVICE),entityId(SERVICE-D58719FFAB1F810A)"
  metric_expression  = "(100)*(builtin:service.errors.total.successCount:splitBy())/(builtin:service.requestCount.total:splitBy())"
  metric_name        = "google_sheets_availability"
  target_success     = 99.9
  target_warning     = 99.95
  error_budget_burn_rate {
    burn_rate_visualization_enabled = true
    fast_burn_threshold             = 10
  }
}

resource "dynatrace_slo_v2" "service_now_availability" {
  count              = local.is_production ? 1 : 0
  name               = "Service Now Availability"
  enabled            = true
  custom_description = "Service Now Availability (99.9%)"
  evaluation_type    = "AGGREGATE"
  evaluation_window  = "-1M"
  filter             = "type(SERVICE),entityId(SERVICE-41210C73E70E0781)"
  metric_expression  = "(100)*(builtin:service.errors.total.successCount:splitBy())/(builtin:service.requestCount.total:splitBy())"
  metric_name        = "service_now_availability"
  target_success     = 99.9
  target_warning     = 99.95
  error_budget_burn_rate {
    burn_rate_visualization_enabled = true
    fast_burn_threshold             = 10
  }
}

resource "dynatrace_slo_v2" "account_management_service" {
  count              = local.is_production ? 1 : 0
  name               = "Account Management Service (AVLB002)"
  enabled            = true
  custom_description = "Request-based SLO to determine the Availability, averaged across all resources within the AWS accounts that make up this Service (99.90%)"
  evaluation_type    = "AGGREGATE"
  evaluation_window  = "-1M"
  filter             = "type(SERVICE),mzName([AWS] di-account-data-production,[AWS] di-account-production,[AWS] di-account-interventions-production,[AWS] di-fraud-admin-interface-prod,[AWS] di-fraud-ssf-production)"
  metric_expression  = "(100)*(builtin:service.errors.total.successCount:splitBy())/(builtin:service.requestCount.total:splitBy())"
  metric_name        = "account_management_service"
  target_success     = 99.9
  target_warning     = 99.95
  error_budget_burn_rate {
    burn_rate_visualization_enabled = true
    fast_burn_threshold             = 10
  }
}

resource "dynatrace_slo_v2" "identify_proofing_and_verification_service" {
  count              = local.is_production ? 1 : 0
  name               = "Identify Proofing and Verification Service (AVLB002)"
  enabled            = true
  custom_description = "Request-based SLO to determine the Availability, averaged across all resources within the AWS accounts that make up this Service (99.90%)"
  evaluation_type    = "AGGREGATE"
  evaluation_window  = "-1M"
  filter             = "type(SERVICE),mzName([AWS] di-ipv-cri-kbv-prod,[AWS] di-facetoface-cri-prod,[AWS] di-ipv-cri-dl-prod,[AWS] di-ipv-cri-kbv-hmrc-prod,[AWS] dcmaw-gds-prod,[AWS] di-facetoface-prod,[AWS] di-ipv-cri-passport-prod,[AWS] di-ipv-cri-check-hmrc-prod,[AWS] di-ipv-cri-passporta-prod,[AWS] di-ipv-core-prod,[AWS] di-ipv-cri-fraud-prod,[AWS] di-ipv-cri-address-prod,[AWS] di-ipvreturn-prod,[AWS] di-ipv-spot-prod,[AWS] di-ipv-contra-indicators-prod,[AWS] di-ipv-cri-otg-hmrc-prod,[AWS] di-bav-cri-prod,[AWS] di-ticf-cri-production,[AWS] gds-mobile-production-secrets,[AWS] di-sts-prod)"
  metric_expression  = "(100)*(builtin:service.errors.total.successCount:splitBy())/(builtin:service.requestCount.total:splitBy())"
  metric_name        = "identify_proofing_and_verification_service"
  target_success     = 99.5
  target_warning     = 99.8
  error_budget_burn_rate {
    burn_rate_visualization_enabled = true
    fast_burn_threshold             = 10
  }
}

resource "dynatrace_slo_v2" "identity_re_use_service" {
  count              = local.is_production ? 1 : 0
  name               = "Identity Re-Use Service (AVLB002)"
  enabled            = true
  custom_description = "Request-based SLO to determine the Availability, averaged across all resources within the AWS accounts that make up this Service (99.90%)"
  evaluation_type    = "AGGREGATE"
  evaluation_window  = "-1M"
  filter             = "type(SERVICE),mzName([AWS] di-ipv-core-prod,[AWS] di-id-reuse-core-production)"
  metric_expression  = "(100)*(builtin:service.errors.total.successCount:splitBy())/(builtin:service.requestCount.total:splitBy())"
  metric_name        = "identity_re_use_service"
  target_success     = 99.9
  target_warning     = 99.95
  error_budget_burn_rate {
    burn_rate_visualization_enabled = true
    fast_burn_threshold             = 10
  }
}

resource "dynatrace_slo_v2" "sign_in_sign_up_service" {
  count              = local.is_production ? 1 : 0
  name               = "Sign In / Sign Up Service (AVLB002)"
  enabled            = true
  custom_description = "Request-based SLO to determine the Availability, averaged across all resources within the AWS accounts that make up this Service (99.90%)"
  evaluation_type    = "AGGREGATE"
  evaluation_window  = "-1M"
  filter             = "type(SERVICE),mzName([AWS] gds-di-production)"
  metric_expression  = "(100)*(builtin:service.errors.total.successCount:splitBy())/(builtin:service.requestCount.total:splitBy())"
  metric_name        = "sign_in_sign_up_service"
  target_success     = 99.9
  target_warning     = 99.95
  error_budget_burn_rate {
    burn_rate_visualization_enabled = true
    fast_burn_threshold             = 10
  }
}
