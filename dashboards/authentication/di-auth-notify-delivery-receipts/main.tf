locals {
  notify_delivery_receipts = {
    application_environment = var.application_environment
  }
}

resource "dynatrace_json_dashboard" "main" {
  contents = templatefile("${path.module}/di-auth-notify-delivery-receipts.json.tpl", local.notify_delivery_receipts)
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
