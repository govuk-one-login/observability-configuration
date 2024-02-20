#OneAgent
resource "dynatrace_oneagent_updates" "OneAgent" {
  scope          = "environment"
  target_version = "latest"
  update_mode    = "AUTOMATIC"
}

#ActiveGate
resource "dynatrace_activegate_updates" "ActiveGate" {
  auto_update = true
  scope = "environment"
}