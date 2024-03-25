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

resource "dynatrace_json_dashboard" "dora_metrics_dashboard" {
  contents = file("${path.module}/dashboards/dev-platform/dora_metrics_dashboard.json")
}

resource "dynatrace_dashboard_sharing" "dora_metrics_dashboard" {
  dashboard_id = dynatrace_json_dashboard.dora_metrics_dashboard.id

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

resource "dynatrace_json_dashboard" "dns" {
  contents = file("${path.module}/dashboards/dns.json")
}

resource "dynatrace_dashboard_sharing" "dns" {
  dashboard_id = dynatrace_json_dashboard.dns.id

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

module "dora_demo_sam_app_dashboard" {
  source = "./modules/dashboard"
  path   = "dev-platform/dora_demo_sam_app_dashboard.json"
}

resource "dynatrace_json_dashboard" "dora_demo_sam_app_dashboard" {
  contents = file("./dashboards/dev-platform/dora_demo_sam_app_dashboard.json")
}

resource "dynatrace_dashboard_sharing" "dora_demo_sam_app_dashboard" {
  dashboard_id = dynatrace_json_dashboard.dora_demo_sam_app_dashboard.id

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

module "test_team_1_dashboard" {
  source = "./modules/dashboard"
  path   = "dev-platform/test_team_1_dashboard.json"
}

resource "dynatrace_json_dashboard" "test_team_1_dashboard" {
  contents = file("./dashboards/dev-platform/test_team_1_dashboard.json")
}

resource "dynatrace_dashboard_sharing" "test_team_1_dashboard" {
  dashboard_id = dynatrace_json_dashboard.test_team_1_dashboard.id

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

module "test_team_2_dashboard" {
  source = "./modules/dashboard"
  path   = "dev-platform/test_team_2_dashboard.json"
}

resource "dynatrace_json_dashboard" "test_team_2_dashboard" {
  contents = file("./dashboards/dev-platform/test_team_2_dashboard.json")
}

resource "dynatrace_dashboard_sharing" "test_team_2_dashboard" {
  dashboard_id = dynatrace_json_dashboard.test_team_2_dashboard.id

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

variable "teams1" {
  description = "map"
  default = {
    "team-a" = {
      owner        = "team-a@company.org"
      samstackname = "fraud-cri-front"
    }
    "team-b" = {
      owner        = "team-b@company.org"
      samstackname = "ipv-cri-passport-front"
    }
    "team-c" = {
      owner        = "team-c@company.org"
      samstackname = "backend-api"
    }
    "team-d" = {
      owner        = "team-d@company.org"
      samstackname = "address-cri-front"
    }
  }
}

variable "teams2" {
  description = "map"
  default = {
    "team-a" = {
      owner         = "team-a@company.org"
      samstackname1 = "frontend"
      samstackname2 = "backend-api"
    }
  }
}

# 1 Secure Pipelines on the Dashboard
resource "dynatrace_json_dashboard" "Team-DORA-Dashboards1" {
  for_each = var.teams1

  contents = templatefile("./dashboards/dev-platform/TEMPLATE_dashboard.json", {
    owner        = each.value.owner
    samstackname = each.value.samstackname
  })
}

# 2 Secure Pipelines on the Dashboard
resource "dynatrace_json_dashboard" "Team-DORA-Dashboards2" {
  for_each = var.teams2

  contents = templatefile("./dashboards/dev-platform/TEMPLATE2_dashboard.json", {
    owner         = each.value.owner
    samstackname1 = each.value.samstackname1
    samstackname2 = each.value.samstackname2
  })
}

resource "dynatrace_dashboard_sharing" "Team-DORA-Dashboards1" {
  for_each = var.teams1

  dashboard_id = dynatrace_json_dashboard.Team-DORA-Dashboards[each.key].id
  enabled      = true
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

resource "dynatrace_dashboard_sharing" "Team-DORA-Dashboards2" {
  for_each = var.teams2

  dashboard_id = dynatrace_json_dashboard.Team-DORA-Dashboards[each.key].id
  enabled      = true
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

resource "dynatrace_json_dashboard" "aws_service_quotas" {
  contents = file("${path.module}/dashboards/aws_service_quotas.json")
}

resource "dynatrace_dashboard_sharing" "aws_service_quotas" {
  dashboard_id = dynatrace_json_dashboard.aws_service_quotas.id

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