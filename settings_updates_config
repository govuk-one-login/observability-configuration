#OneAgent
resource "dynatrace_oneagent_updates" "OneAgent" {
  scope          = "environment"
  target_version = "latest"
  update_mode    = "AUTOMATIC"
}

#Maintenance Windows for OneAgent
resource "dynatrace_update_windows" "MaintenanceWindows" {
  enabled    = false
}

#ActiveGate
resource "dynatrace_activegate_updates" "ActiveGate" {
  auto_update = true
  scope = "environment"
}