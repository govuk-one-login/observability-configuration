locals {
  ecs_scaling = {
    apigwid      = var.apigwid
    service_name = var.service_name
  }
}

resource "dynatrace_json_dashboard" "ecs_scaling" {
  contents = templatefile("../../dashboards/scaling/ecs-service.json.tpl", local.ecs_scaling)
}

data "dynatrace_iam_group" "all" {
  name = "all"
}

resource "dynatrace_dashboard_sharing" "main" {
  dashboard_id = dynatrace_json_dashboard.ecs_scaling.id

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
