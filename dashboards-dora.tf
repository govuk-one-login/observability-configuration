# Please add your Team name and the Secure Pipelines you wish to graph
# There are 3 template csv files you can choose to populate:
# 1 - "template1" - if you want to track only 1 pipeline
# 2 - "template2" - if you want to track only 2 pipelines
# 3 - "template3" - if you want to track only 3 pipelines

#######################################
# 1 Secure Pipelines on the Dashboard
#######################################
resource "dynatrace_json_dashboard" "Team-DORA-Dashboards1" {
  for_each = {
    for f in csvdecode(file("./dashboards/dev-platform/template1.csv")) :
    f.team => f
  }

  contents = templatefile("./dashboards/dev-platform/TEMPLATE1_dashboard.json", {
    title         = each.value.samstackname1
    owner         = each.value.email
    samstackname1 = each.value.samstackname1
  })
}

#######################################
# 2 Secure Pipelines on the Dashboard
#######################################
resource "dynatrace_json_dashboard" "Team-DORA-Dashboards2" {
  for_each = {
    for f in csvdecode(file("./dashboards/dev-platform/template2.csv")) :
    f.team => f
  }

  contents = templatefile("./dashboards/dev-platform/TEMPLATE2_dashboard.json", {
    title         = "${each.value.samstackname1} - ${each.value.samstackname2}"
    owner         = each.value.email
    samstackname1 = each.value.samstackname1
    samstackname2 = each.value.samstackname2
  })
}

#######################################
# 3 Secure Pipelines on the Dashboard
#######################################
resource "dynatrace_json_dashboard" "Team-DORA-Dashboards3" {
  for_each = {
    for f in csvdecode(file("./dashboards/dev-platform/template3.csv")) :
    f.team => f
  }

  contents = templatefile("./dashboards/dev-platform/TEMPLATE3_dashboard.json", {
    title         = "${each.value.samstackname1} - ${each.value.samstackname2} - ${each.value.samstackname3}"
    owner         = each.value.email
    samstackname1 = each.value.samstackname1
    samstackname2 = each.value.samstackname2
    samstackname3 = each.value.samstackname3
  })
}

resource "dynatrace_dashboard_sharing" "Team-DORA-Dashboards1" {
  for_each = {
    for f in csvdecode(file("./dashboards/dev-platform/template1.csv")) :
    f.team => f
  }

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
  for_each = {
    for f in csvdecode(file("./dashboards/dev-platform/template2.csv")) :
    f.team => f
  }

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
  for_each = {
    for f in csvdecode(file("./dashboards/dev-platform/template3.csv")) :
    f.team => f
  }

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
