resource "dynatrace_key_requests" "key_requests" {
  service = var.key_requests_service
  names   = var.key_requests_names
}
