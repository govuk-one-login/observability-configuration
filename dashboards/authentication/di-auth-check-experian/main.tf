locals {
  check_experian = {
    api_account_id          = var.api_account_id
    check_account_id        = var.check_account_id
    application_environment = var.application_environment
  }
}

resource "dynatrace_json_dashboard" "main" {
  contents = templatefile("${path.module}/di-auth-check-experian.json.tpl", local.check_experian)
}

data "dynatrace_iam_group" "all" {
  name = "all"
}

resource "dynatrace_dashboard_sharing" "main" {
  dashboard_id = dynatrace_json_dashboard.main.id

  enabled = true

  permissions {
    permission {
      level = "VIEW"
      type  = "ALL"
    }
    permission {
      id    = data.dynatrace_iam_group.all.id
      level = "VIEW"
      type  = "GROUP"
    }
  }
}
