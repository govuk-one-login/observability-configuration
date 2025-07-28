module "apigw_metrics" {
  source        = "./modules/documents"
  document_path = "core/apigw-metrics.json"
  document_name = "IPV Core APIGW Metrics"
  document_type = "dashboard"
}

### Fraud Pod ###

module "ssf-infrastructure" {
  source = "./modules/documents"
  document_path = "fraud/ssf/ssf-infrastructure.json"
  document_name = "Shared Signals Infrastructure Dashboard"
  document_type = "dashboard"
}

module "ticf-cri-infrastructure" {
  source = "./modules/documents"
  document_path = "fraud/ssf/ticf-cri-infrastructure.json"
  document_name = "TICF-CRI Infrastructure Dashboard"
  document_type = "dashboard"
}