# Please add your Team name and the Secure Pipelines you wish to graph in the pipelines-list.csv
# 
# DO NOT USE template2.csv and template3.csv.
# These are work-in-progress for continuous improvements and may be removed in future

locals {
  secure_pipelines_multiple_sam_stack_names = {
    for f in csvdecode(file("./dashboards/dev-platform/pipelines-list-multi-sam-stack-names.csv")) : f.team => f...
  }

  secure_pipelines_list = {
    for f in csvdecode(file("./dashboards/dev-platform/pipelines-list.csv")) : f.team => f...
  }
}

########################################
# Secure Pipelines with multiple SamStackName on the Dashboard
#######################################
resource "dynatrace_json_dashboard" "Team-DORA-Dashboards4" {
  for_each = local.secure_pipelines_multiple_sam_stack_names

  contents = templatefile("./dashboards/dev-platform/teams_pipeline_dora_dashboard_multiple_ssn.tftpl", {
    team                       = each.key
    owner                      = each.value[0].email
    application_name           = [for app in each.value : app.application_name]
    sam_stack_name_build       = [for app in each.value : app.sam_stack_name_build]
    sam_stack_name_staging     = [for app in each.value : app.sam_stack_name_staging]
    sam_stack_name_production  = [for app in each.value : app.sam_stack_name_production]
    sam_stack_name_integration = [for app in each.value : app.sam_stack_name_integration]
  })
}

resource "dynatrace_json_dashboard" "Team-DORA-Dashboards" {
  for_each = local.secure_pipelines_list

  contents = templatefile("./dashboards/dev-platform/teams_pipeline_dora_dashboard_multiple_ssn.tftpl", {
    team                       = each.key
    owner                      = each.value[0].email
    application_name           = [for app in each.value : app.application_name]
    sam_stack_name_build       = [for app in each.value : app.sam_stack_name_build]
    sam_stack_name_staging     = [for app in each.value : app.sam_stack_name_staging]
    sam_stack_name_production  = [for app in each.value : app.sam_stack_name_production]
    sam_stack_name_integration = [for app in each.value : app.sam_stack_name_integration]
  })
}

resource "dynatrace_json_dashboard" "Team-DORA-CFR-Dashboards" {
  for_each = local.secure_pipelines_list

  contents = templatefile("./dashboards/dev-platform/teams_pipeline_dora_dashboard_cfr.tftpl", {
    team                       = each.key
    owner                      = each.value[0].email
    application_name           = [for app in each.value : app.application_name]
    sam_stack_name_build       = [for app in each.value : app.sam_stack_name_build]
    sam_stack_name_staging     = [for app in each.value : app.sam_stack_name_staging]
    sam_stack_name_production  = [for app in each.value : app.sam_stack_name_production]
    sam_stack_name_integration = [for app in each.value : app.sam_stack_name_integration]
  })
}

resource "dynatrace_dashboard_sharing" "Team-DORA-Dashboards4" {
  for_each = local.secure_pipelines_multiple_sam_stack_names

  dashboard_id = dynatrace_json_dashboard.Team-DORA-Dashboards4[each.key].id
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

resource "dynatrace_dashboard_sharing" "Team-DORA-Dashboards" {
  for_each = local.secure_pipelines_list

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
resource "dynatrace_dashboard_sharing" "Team-DORA-CFR-Dashboards" {
  for_each = local.secure_pipelines_list

  dashboard_id = dynatrace_json_dashboard.Team-DORA-CFR-Dashboards[each.key].id
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
