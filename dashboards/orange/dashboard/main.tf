variable params {
  description = "values to build a dashboard"
  type = map(string)
}

variable template_path {
  description = "path to the dashboards template"
}

resource "dynatrace_json_dashboard" "dashboard" {
  contents = templatefile(var.template_path, var.params)
}

data "dynatrace_iam_group" "all" {
  name = "all"
}

resource "dynatrace_dashboard_sharing" "dashboard_sharing" {
  dashboard_id = dynatrace_json_dashboard.dashboard.id

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