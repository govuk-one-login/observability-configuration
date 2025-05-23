resource "dynatrace_muted_requests" "muted_requests" {
  service_id          = var.muted_requests_service_id
  muted_request_names = var.muted_requests_names
}
