locals {
  international_phone_numbers = {
    application_environment = var.application_environment
    old_account_id          = var.old_account_id
    account_id              = var.account_id
  }
}

resource "dynatrace_json_dashboard" "main" {
  contents = templatefile("${path.module}/di-auth-international-phone-numbers.json.tpl", local.international_phone_numbers)
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
