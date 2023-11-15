resource "dynatrace_json_dashboard" "signin-signup" {
  contents = file("${path.module}/dashboards/signin-signup.json")
}

resource "dynatrace_dashboard_sharing" "signin-signup" {
  dashboard_id = dynatrace_json_dashboard.signin-signup.id

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
    permission {
      id    = data.dynatrace_iam_group.observability.id
      level = "EDIT"
      type  = "GROUP"
    }
    permission {
      id    = data.dynatrace_iam_group.service-operations.id
      level = "EDIT"
      type  = "GROUP"
    }
  }
}
