# resource "dynatrace_web_app_custom_injection" "web_application" {
#   count          = var.manual_injection == true ? 1 : 0
#   enabled        = true
#   application_id = dynatrace_web_application.web_application.id
#   operator       = "AllPages"
#   rule           = "DoNotInject"
# }