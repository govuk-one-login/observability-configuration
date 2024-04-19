# Please add your Team name and the Secure Pipelines you wish to graph
# Below are 3 "variables" you can choose to populate:
# 1 - "teams1" - if you want to track only 1 pipeline
# 2 - "teams2" - if you want to track only 2 pipelines
# 3 - "teams3" - if you want to track only 3 pipelines

#######################################
# Use this to track only 1 pipeline
#######################################
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
  }
}

#######################################
# Use this to track only 2 pipelines
#######################################
variable "teams2" {
  description = "map"
  default = {
    "team-a" = {
      owner         = "team-a@company.org"
      samstackname1 = "frontend"
      samstackname2 = "backend-api"
    }
    "team-b" = {
      owner         = "team-b@company.org"
      samstackname1 = "check-hmrc-cri-api"
      samstackname2 = "check-hmrc-cri-front"
    }
    "team-c" = {
      owner         = "team-c@company.org"
      samstackname1 = "core-front"
      samstackname2 = "core-back"
    }
    "team-d" = {
      owner         = "team-d@company.org"
      samstackname1 = "ipv-cri-passport-api"
      samstackname2 = "ipv-cri-passport-front"
    }
    "team-e" = {
      owner         = "team-d@company.org"
      samstackname1 = "passport-api"
      samstackname2 = "passport-front"
    }
  }
}

#######################################
# Use this to track only 3 pipeline
#######################################
variable "teams3" {
  description = "map"
  default = {
    "team-a" = {
      owner         = "team-a@company.org"
      samstackname1 = "frontend"
      samstackname2 = "backend-api"
      samstackname3 = "backend-api"
    }
  }
}

#######################################
# 1 Secure Pipelines on the Dashboard
#######################################
resource "dynatrace_json_dashboard" "Team-DORA-Dashboards1" {
  for_each = var.teams1

  contents = templatefile("./dashboards/dev-platform/TEMPLATE_dashboard.json", {
    owner        = each.value.owner
    samstackname = each.value.samstackname
  })
}

#######################################
# 2 Secure Pipelines on the Dashboard
#######################################
resource "dynatrace_json_dashboard" "Team-DORA-Dashboards2" {
  for_each = var.teams2

  contents = templatefile("./dashboards/dev-platform/TEMPLATE2_dashboard.json", {
    owner         = each.value.owner
    samstackname1 = each.value.samstackname1
    samstackname2 = each.value.samstackname2
  })
}

#######################################
# 3 Secure Pipelines on the Dashboard
#######################################
resource "dynatrace_json_dashboard" "Team-DORA-Dashboards3" {
  for_each = var.teams3

  contents = templatefile("./dashboards/dev-platform/TEMPLATE3_dashboard.json", {
    owner         = each.value.owner
    samstackname1 = each.value.samstackname1
    samstackname2 = each.value.samstackname2
    samstackname3 = each.value.samstackname3
  })
}

resource "dynatrace_dashboard_sharing" "Team-DORA-Dashboards1" {
  for_each = var.teams1

  dashboard_id = dynatrace_json_dashboard.Team-DORA-Dashboards1[each.key].id
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

  dashboard_id = dynatrace_json_dashboard.Team-DORA-Dashboards2[each.key].id
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

resource "dynatrace_dashboard_sharing" "Team-DORA-Dashboards3" {
  for_each = var.teams3

  dashboard_id = dynatrace_json_dashboard.Team-DORA-Dashboards3[each.key].id
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
