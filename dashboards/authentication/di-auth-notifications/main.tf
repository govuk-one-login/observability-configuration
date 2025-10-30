locals {
  notifications = {
    application_environment = var.application_environment
    account_ids             = jsonencode([for id in var.auth_account_ids : { value = id, evaluator = "IN" }])
    account_ids_list        = join(",", [for id in var.auth_account_ids : "\"${id}\""])
  }
}

resource "dynatrace_json_dashboard" "main" {
  contents = templatefile("${path.module}/di-auth-notifications.json.tpl", local.notifications)
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
