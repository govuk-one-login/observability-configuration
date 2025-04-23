module "fpad_infrastructre_dashboard" {
  source = "./modules/documents"
  document_path = "fpad/fpad_infrastructure_dashboard.json"
  document_name = "FPAD Infrastructre Dashboard"
  document_type = "dashboard"
}

module "apigw_metrics" {
  source = "./modules/documents"
  document_path = "core/apigw_metrics.json"
  document_name = "IPV Core APIGW Metrics"
  document_type = "dashboard"
}
