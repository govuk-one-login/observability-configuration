variable "teamscloudfront1" {
  description = "map"
  default = {
    "team-a" = {
      owneremail = "team-a@company.org"
      teamname   = "di-bav-cri"
      awsaccprod = "096369912800"
      awsaccint  = "603505715695"
    }
    "team-b" = {
      owneremail = "team-a@company.org"
      teamname   = "di-bav-cri"
      awsaccprod = "096369912800"
      awsaccint  = "603505715695"
    }
  }
}

# 1 Secure Pipelines on the Dashboard
resource "dynatrace_json_dashboard" "Team-Cloudfront-Dashboards" {
  for_each = var.teamscloudfront1

  contents = templatefile("./dashboards/dev-platform/TEMPLATE_cloudfront_dashboard.json", {
    owneremail = each.value.owneremail
    teamname   = each.value.teamname
    awsaccprod = each.value.awsaccprod
    awsaccint  = each.value.awsaccint
  })
}

resource "dynatrace_dashboard_sharing" "Team-Cloudfront-Dashboards" {
  for_each = var.teamscloudfront1

  dashboard_id = dynatrace_json_dashboard.Team-Cloudfront-Dashboards[each.key].id
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
