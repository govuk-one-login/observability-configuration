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
  }
}