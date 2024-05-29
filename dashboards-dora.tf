# Please add your Team name and the Secure Pipelines you wish to graph in the pipelines-list.csv
# 
# DO NOT USE template2.csv and template3.csv.
# These are work-in-progress for continuous improvements and may be removed in future

locals {
  secure_pipelines = {
    for f in csvdecode(file("./dashboards/dev-platform/pipelines-list.csv")) :
    "${f.team}-${f.samstackname1}" => f
  }

  dora_dashboards2 = {
    for f in csvdecode(file("./dashboards/dev-platform/template2.csv")) :
    "${f.team}-${f.samstackname1}-${f.samstackname2}" => f
  }

  dora_dashboards3 = {
    for f in csvdecode(file("./dashboards/dev-platform/template3.csv")) :
    "${f.team}-${f.samstackname1}-${f.samstackname2}-${f.samstackname3}" => f
  }
}

#######################################
# Secure Pipelines on the Dashboard
#######################################
resource "dynatrace_json_dashboard" "Team-DORA-Dashboards1" {
  for_each = local.secure_pipelines

  contents = templatefile("./dashboards/dev-platform/teams_pipeline_dora_dashboard.tftpl", {
    title                  = "${each.value.team} ${each.value.samstackname1}"
    owner                  = each.value.email
    sam_stack_names_string = each.value.samstackname1
    sam_stack_names        = ["${each.value.samstackname1}"]
  })
}

#######################################
# Test Dashboard with 2 pipelines
#######################################
resource "dynatrace_json_dashboard" "Team-DORA-Dashboards2" {
  for_each = local.dora_dashboards2

  contents = templatefile("./dashboards/dev-platform/teams_pipeline_dora_dashboard.tftpl", {
    title                  = "${each.value.team} ${each.value.samstackname1} ${each.value.samstackname2}"
    owner                  = each.value.email
    sam_stack_names_string = "${each.value.samstackname1} & ${each.value.samstackname2}"
    sam_stack_names        = ["${each.value.samstackname1}", "${each.value.samstackname2}"]
  })
}

#######################################
# Test Dashboard with 3 pipelines
#######################################
resource "dynatrace_json_dashboard" "Team-DORA-Dashboards3" {
  for_each = local.dora_dashboards3

  contents = templatefile("./dashboards/dev-platform/teams_pipeline_dora_dashboard.tftpl", {
    title                  = "${each.value.team} ${each.value.samstackname1} ${each.value.samstackname2} ${each.value.samstackname3}"
    owner                  = each.value.email
    sam_stack_names_string = "${each.value.samstackname1} & ${each.value.samstackname2} & ${each.value.samstackname3}"
    sam_stack_names        = ["${each.value.samstackname1}", "${each.value.samstackname2}", "${each.value.samstackname3}"]
  })
}

resource "dynatrace_dashboard_sharing" "Team-DORA-Dashboards1" {
  for_each = local.secure_pipelines

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
  for_each = local.dora_dashboards2

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
  for_each = local.dora_dashboards3

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
