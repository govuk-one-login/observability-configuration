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
    "team-e" = {
      owner        = "team-e@company.org"
      samstackname = "address-cri-front"
    }
    "team-f" = {
      owner        = "team-f@company.org"
      samstackname = "audit-sqs"
    }
    "team-g" = {
      owner        = "team-g@company.org"
      samstackname = "bav-cri-api"
    }
    "team-h" = {
      owner        = "team-h@company.org"
      samstackname = "bav-cri-ddb"
    }
    "team-i" = {
      owner        = "team-i@company.org"
      samstackname = "bav-cri-front"
    }
    "team-j" = {
      owner        = "team-j@company.org"
      samstackname = "bav-cri-kms"
    }
    "team-k" = {
      owner        = "team-k@company.org"
      samstackname = "bav-cri-outbound-proxy"
    }
    "team-l" = {
      owner        = "team-l@company.org"
      samstackname = "bav-cri-waf"
    }
    "team-m" = {
      owner        = "team-m@company.org"
      samstackname = "cic-cri-api"
    }
    "team-n" = {
      owner        = "team-n@company.org"
      samstackname = "cic-cri-ddb"
    }
    "team-n" = {
      owner        = "team-n@company.org"
      samstackname = "cic-cri-front"
    }
    "team-n" = {
      owner        = "team-n@company.org"
      samstackname = "cic-cri-kms"
    }
    "team-o" = {
      owner        = "team-n@company.org"
      samstackname = "cic-cri-waf"
    }
    "team-p" = {
      owner        = "team-n@company.org"
      samstackname = "config-mgmt"
    }
    "team-q" = {
      owner        = "team-n@company.org"
      samstackname = "dl-cri-front"
    }
    "team-r" = {
      owner        = "team-n@company.org"
      samstackname = "dl-cri-v1"
    }
    "team-s" = {
      owner        = "team-n@company.org"
      samstackname = "dns"
    }
    "team-t" = {
      owner        = "team-n@company.org"
      samstackname = "f2f-cri-api"
    }
    "team-u" = {
      owner        = "team-n@company.org"
      samstackname = "f2f-cri-ddb"
    }
    "team-v" = {
      owner        = "team-n@company.org"
      samstackname = "f2f-cri-front"
    }
    "team-w" = {
      owner        = "team-n@company.org"
      samstackname = "f2f-cri-kms"
    }
    "team-x" = {
      owner        = "team-n@company.org"
      samstackname = "f2f-cri-outbound-proxy"
    }
    "team-y" = {
      owner        = "team-n@company.org"
      samstackname = "f2f-cri-waf"
    }
    "team-z" = {
      owner        = "team-n@company.org"
      samstackname = "fa-interface"
    }
    "team-aa" = {
      owner        = "team-n@company.org"
      samstackname = "fraud-cri-front"
    }
    "team-ab" = {
      owner        = "team-n@company.org"
      samstackname = "fraud-cri-v1"
    }
    "team-ac" = {
      owner        = "team-n@company.org"
      samstackname = "ipvreturn-api"
    }
    "team-ad" = {
      owner        = "team-n@company.org"
      samstackname = "ipvreturn-ddb"
    }
    "team-ae" = {
      owner        = "team-n@company.org"
      samstackname = "ipvreturn-front"
    }
    "team-af" = {
      owner        = "team-n@company.org"
      samstackname = "ipvreturn-kms"
    }
    "team-ag" = {
      owner        = "team-n@company.org"
      samstackname = "ipvreturn-waf"
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