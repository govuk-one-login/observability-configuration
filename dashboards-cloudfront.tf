variable "teamscloudfront1" {
  description = "map"
  type = map(object({
    owneremail = string
    teamname   = string
    awsaccprod = string
    awsaccint  = string
  }))
  default = {
    "team-a" = {
      owneremail = "cri-kiwi-team@digital.cabinet-office.gov.uk"
      teamname   = "Kiwi - BAV-CRI"
      awsaccprod = "096369912800"
      awsaccint  = "603505715695"
    }
    "team-b" = {
      owneremail = "cri-kiwi-team@digital.cabinet-office.gov.uk"
      teamname   = "Kiwi - F2F-CRI"
      awsaccprod = "377086294028"
      awsaccint  = "766319219145"
    }
    "team-c" = {
      owneremail = "cri-kiwi-team@digital.cabinet-office.gov.uk"
      teamname   = "Kiwi - CIC-CRI"
      awsaccprod = "270790667266"
      awsaccint  = "341874137503"
    }
    "team-d" = {
      owneremail = "cri-kiwi-team@digital.cabinet-office.gov.uk"
      teamname   = "Kiwi - IPVReturn-CRI"
      awsaccprod = "821078365651"
      awsaccint  = "988112579449"
    }
    "team-f" = {
      owneremail = "cri-orange-team@digital.cabinet-office.gov.uk"
      teamname   = "Orange - NINo-CRI"
      awsaccprod = "239207391607"
      awsaccint  = "488209198322"
    }
    "team-g" = {
      owneremail = "cri-orange-team@digital.cabinet-office.gov.uk"
      teamname   = "Orange - Address-CRI"
      awsaccprod = "608988268245"
      awsaccint  = "993720532118"
    }
    "team-h" = {
      owneremail = "cri-orange-team@digital.cabinet-office.gov.uk"
      teamname   = "Orange - Experian-KBV-CRI"
      awsaccprod = "014243362159"
      awsaccint  = "023997819930"
    }
    "team-i" = {
      owneremail = "pranjal.bhatnagar@digital.cabinet-office.gov.uk"
      teamname   = "Mobile - ID Check"
      awsaccprod = "671922655609"
      awsaccint  = "110965769736"
    }
    "team-j" = {
      owneremail = "cri-lime-team@digital.cabinet-office.gov.uk"
      teamname   = "Lime - Fraud-CRI"
      awsaccprod = "378781532883"
      awsaccint  = "867638632908"
    }
    "team-k" = {
      owneremail = "cri-lime-team@digital.cabinet-office.gov.uk"
      teamname   = "Lime - Passport-CRI"
      awsaccprod = "194537773050"
      awsaccint  = "142452478840"
    }
    "team-l" = {
      owneremail = "cri-lime-team@digital.cabinet-office.gov.uk"
      teamname   = "LIME - Driving-Licence-CRI"
      awsaccprod = "161017977784"
      awsaccint  = "372912692139"
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
