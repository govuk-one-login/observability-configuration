variable combination {
  description = "values to build a dashboard"
  type = object({})
}

variable template_path {
  description = "path to the dashboards template"
}

resource "dashboard" "main" {
  contents = templatefile(var.template_path, var.combination)
}

data "dynatrace_iam_group" "all" {
  name = "all"
}

resource "dynatrace_dashboard_sharing" "main" {
  dashboard_id = dashboard.main.id

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