variable "teamscloudfront1" {
  description = "map"
  default = {
    "team-a" = {
      owneremail = "team-a@company.org"
      teamname   = "Kiwi - di-bav-cri"
      awsaccprod = "096369912800"
      awsaccint  = "603505715695"
    }
    "team-b" = {
      owneremail = "team-a@company.org"
      teamname   = "Kiwi - di-facetoface-cri"
      awsaccprod = "377086294028"
      awsaccint  = "766319219145"
    }
    "team-c" = {
      owneremail = "team-a@company.org"
      teamname   = "Kiwi - di-facetoface"
      awsaccprod = "270790667266"
      awsaccint  = "341874137503"
    }
    "team-d" = {
      owneremail = "team-a@company.org"
      teamname   = "Kiwi - di-ipvreturn"
      awsaccprod = "821078365651"
      awsaccint  = "988112579449"
    }
    "team-e" = {
      owneremail = "pawankumar.kushwaha@digital.cabinet-office.gov.uk"
      teamname   = "Auth - gds-di-production"
      awsaccprod = "172348255554"
      awsaccint  = "761723964695"
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
