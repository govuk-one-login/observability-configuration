resource "dynatrace_application_detection_rule" "web_application" {
  application_identifier = dynatrace_web_application.web_application.id
  filter_config {
    application_match_target = "DOMAIN"
    application_match_type   = "MATCHES"
    pattern                  = var.hostname
  }
}
