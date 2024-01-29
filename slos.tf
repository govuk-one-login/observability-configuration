resource "dynatrace_slo_v2" "perf001" {
  name               = "NFR PERF001"
  enabled            = true
  custom_description = "95% of user-facing requests to be served within 1 second"
  evaluation_type    = "AGGREGATE"
  evaluation_window  = "-1w"
  filter             = "type(CUSTOM_DEVICE)"
  metric_expression  = "((ext:cloud.aws.apiGateway.latency:avg:partition(\"latency\",value(\"good\",le(1000))):splitBy():count:default(0))/(ext:cloud.aws.apiGateway.latency:avg:splitBy():count)*(100)):default(100,always)"
  metric_name        = "nfr_perf001"
  target_success     = 95
  target_warning     = 97
  error_budget_burn_rate {
    burn_rate_visualization_enabled = true
    fast_burn_threshold             = 10
  }
}

resource "dynatrace_slo_v2" "perf002" {
  name               = "NFR PERF002"
  enabled            = true
  custom_description = "99% of user-facing requests to be served within 2.5 second"
  evaluation_type    = "AGGREGATE"
  evaluation_window  = "-1w"
  filter             = "type(CUSTOM_DEVICE)"
  metric_expression  = "((ext:cloud.aws.apiGateway.latency:avg:partition(\"latency\",value(\"good\",le(2500))):splitBy():count:default(0))/(ext:cloud.aws.apiGateway.latency:avg:splitBy():count)*(100)):default(100,always)"
  metric_name        = "nfr_perf002"
  target_success     = 99
  target_warning     = 99.5
  error_budget_burn_rate {
    burn_rate_visualization_enabled = true
    fast_burn_threshold             = 10
  }
}

resource "dynatrace_slo_v2" "dva" {
  name               = "DVA Uptime"
  enabled            = true
  custom_description = "DVA Uptime (99.9%)"
  evaluation_type    = "AGGREGATE"
  evaluation_window  = "-1w"
  filter             = "type(SERVICE),entityId(SERVICE-FF8DF82736246DDE)"
  metric_expression  = "(100)*(builtin:service.errors.total.successCount:splitBy())/(builtin:service.requestCount.total:splitBy())"
  metric_name        = "dva_uptime"
  target_success     = 99.9
  target_warning     = 99.95
  error_budget_burn_rate {
    burn_rate_visualization_enabled = true
    fast_burn_threshold             = 10
  }
}

resource "dynatrace_slo_v2" "dvla" {
  name               = "DVLA Uptime"
  enabled            = true
  custom_description = "DVLA Uptime (99.9%)"
  evaluation_type    = "AGGREGATE"
  evaluation_window  = "-1w"
  filter             = "type(SERVICE),entityId(SERVICE-63AD630610311EBF)"
  metric_expression  = "(100)*(builtin:service.errors.total.successCount:splitBy())/(builtin:service.requestCount.total:splitBy())"
  metric_name        = "dvla_uptime"
  target_success     = 99.9
  target_warning     = 99.95
  error_budget_burn_rate {
    burn_rate_visualization_enabled = true
    fast_burn_threshold             = 10
  }
}

resource "dynatrace_slo_v2" "hmpo" {
  name               = "HMPO Uptime"
  enabled            = true
  custom_description = "HMPO Uptime (99.9%)"
  evaluation_type    = "AGGREGATE"
  evaluation_window  = "-1w"
  filter             = "type(SERVICE),entityId(SERVICE-3EEEDBD9F4EDEF7A)"
  metric_expression  = "(100)*(builtin:service.errors.total.successCount:splitBy())/(builtin:service.requestCount.total:splitBy())"
  metric_name        = "hmpo_uptime"
  target_success     = 99.9
  target_warning     = 99.95
  error_budget_burn_rate {
    burn_rate_visualization_enabled = true
    fast_burn_threshold             = 10
  }
}

resource "dynatrace_slo_v2" "experian" {
  name               = "Experian Uptime"
  enabled            = true
  custom_description = "Experian Uptime (99.9%)"
  evaluation_type    = "AGGREGATE"
  evaluation_window  = "-1w"
  filter             = "type(SERVICE),entityId(SERVICE-85D75242ED17D58D)"
  metric_expression  = "(100)*(builtin:service.errors.total.successCount:splitBy())/(builtin:service.requestCount.total:splitBy())"
  metric_name        = "experian_uptime"
  target_success     = 99.9
  target_warning     = 99.95
  error_budget_burn_rate {
    burn_rate_visualization_enabled = true
    fast_burn_threshold             = 10
  }
}

resource "dynatrace_slo_v2" "account_management_journey" {
  name               = "Account Management Journey (AVLB002)"
  enabled            = true
  custom_description = "Request-based SLO to determine the Reliability of a journey, averaged across all services within the AWS accounts that make up this journey (99.90%)"
  evaluation_type    = "AGGREGATE"
  evaluation_window  = "-1w"
  filter             = "type(SERVICE), mzName(di-account-data-production, di-account-production, di-account-interventions-production, di-fraud-admin-interface-prod, di-fraud-ssf-production)"
  metric_expression  = "(100)*(builtin:service.errors.total.successCount:splitBy())/(builtin:service.requestCount.total:splitBy())"
  metric_name        = "account_management_journey"
  target_success     = 99.9
  target_warning     = 99.95
  error_budget_burn_rate {
    burn_rate_visualization_enabled = true
    fast_burn_threshold             = 10
  }
}

resource "dynatrace_slo_v2" "identify_proofing_and_verification_journey" {
  name               = "Identify Proofing and Verification Journey (AVLB002)"
  enabled            = true
  custom_description = "Request-based SLO to determine the Reliability of a journey, averaged across all services within the AWS accounts that make up this journey (99.90%)"
  evaluation_type    = "AGGREGATE"
  evaluation_window  = "-1w"
  filter             = "type(SERVICE), mzName(di-ipv-cri-kbv-prod, di-facetoface-cri-prod, di-ipv-cri-dl-prod, di-ipv-cri-kbv-hmrc-prod, dcmaw-gds-prod, di-facetoface-prod, di-ipv-cri-passport-prod, di-ipv-cri-check-hmrc-prod, di-ipv-cri-passporta-prod, di-ipv-core-prod, di-ipv-cri-fraud-prod, di-ipv-cri-address-prod, di-ipvreturn-prod, di-ipv-spot-prod, di-ipv-contra-indicators-prod, di-ipv-cri-otg-hmrc-prod, di-bav-cri-prod, di-ticf-cri-production, gds-mobile-production-secrets, di-sts-prod)"
  metric_expression  = "(100)*(builtin:service.errors.total.successCount:splitBy())/(builtin:service.requestCount.total:splitBy())"
  metric_name        = "identify_proofing_and_verification_journey"
  target_success     = 99.5
  target_warning     = 99.8
  error_budget_burn_rate {
    burn_rate_visualization_enabled = true
    fast_burn_threshold             = 10
  }
}

resource "dynatrace_slo_v2" "identity_re_use_journey" {
  name               = "Identity Re-Use Journey (AVLB002)"
  enabled            = true
  custom_description = "Request-based SLO to determine the Reliability of a journey, averaged across all services within the AWS accounts that make up this journey (99.90%)"
  evaluation_type    = "AGGREGATE"
  evaluation_window  = "-1w"
  filter             = "type(SERVICE), mzName(di-ipv-core-prod, di-id-reuse-core-production)"
  metric_expression  = "(100)*(builtin:service.errors.total.successCount:splitBy())/(builtin:service.requestCount.total:splitBy())"
  metric_name        = "identity_re_use_journey"
  target_success     = 99.9
  target_warning     = 99.95
  error_budget_burn_rate {
    burn_rate_visualization_enabled = true
    fast_burn_threshold             = 10
  }
}

resource "dynatrace_slo_v2" "sign_in_sign_up_journey" {
  name               = "Sign In / Sign Up Journey (AVLB002)"
  enabled            = true
  custom_description = "Request-based SLO to determine the Reliability of a journey, averaged across all services within the AWS accounts that make up this journey (99.90%)"
  evaluation_type    = "AGGREGATE"
  evaluation_window  = "-1w"
  filter             = "type(SERVICE),mzName(gds-di-production)"
  metric_expression  = "(100)*(builtin:service.errors.total.successCount:splitBy())/(builtin:service.requestCount.total:splitBy())"
  metric_name        = "sign_in___sign_up_journey"
  target_success     = 99.9
  target_warning     = 99.95
  error_budget_burn_rate {
    burn_rate_visualization_enabled = true
    fast_burn_threshold             = 10
  }
}