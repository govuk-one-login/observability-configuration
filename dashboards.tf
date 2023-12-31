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

resource "dynatrace_json_dashboard" "slos" {
  contents = file("${path.module}/dashboards/slos.json")
}

resource "dynatrace_dashboard_sharing" "slos" {
  dashboard_id = dynatrace_json_dashboard.slos.id

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

resource "dynatrace_json_dashboard" "team-idc-app" {
  contents = file("${path.module}/dashboards/team-idc-app.json")
}

resource "dynatrace_dashboard_sharing" "team-idc-app" {
  dashboard_id = dynatrace_json_dashboard.team-idc-app.id

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