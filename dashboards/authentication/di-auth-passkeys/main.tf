locals {
  passkeys = {
    application_environment = var.application_environment
    account_id              = var.account_id
  }
}

resource "dynatrace_json_dashboard" "main" {
  contents = templatefile("${path.module}/di-auth-passkeys.json.tpl", local.passkeys)
}

data "dynatrace_iam_group" "all" {
  name = "all"
}

resource "dynatrace_dashboard_sharing" "main" {
  dashboard_id = dynatrace_json_dashboard.main.id

  enabled = true
  preset  = true

  permissions {
    permission {
      level = "VIEW"
      type  = "ALL"
    }
  }
}
