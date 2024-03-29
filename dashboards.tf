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

module "txma_shared_signals" {
  source = "./modules/dashboard"
  path   = "txma/txma_shared_signals_dashboard.json"
}

module "account-interventions-service" {
  source = "./modules/dashboard"
  path   = "account-interventions-service/account_interventions_service_dashboard.json"
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

### Core ###

module "core_lambda_metrics_dashboard" {
  source = "./modules/dashboard"
  path   = "core/lambda.json"
}

module "core_services_dashboard" {
  source = "./modules/dashboard"
  path   = "core/services.json"
}


### SPOT ###

module "spot_lambda_metrics_dashboard" {
  source = "./modules/dashboard"
  path   = "spot/lambda-metrics.json"
}


### Kiwi ###

# Cross-service
module "kiwi_apigw_metrics_dashboard" {
  source = "./modules/dashboard"
  path   = "kiwi/apigw-metrics.json"
}

module "kiwi_ecs_metrics_dashboard" {
  source = "./modules/dashboard"
  path   = "kiwi/ecs-metrics.json"
}

module "kiwi_services_dashboard" {
  source = "./modules/dashboard"
  path   = "kiwi/services.json"
}

# CIC CRI
module "cic_dashboard" {
  source = "./modules/dashboard"
  path   = "kiwi/cic-cri.json"
}

module "cic_lambda_metrics_dashboard" {
  source = "./modules/dashboard"
  path   = "kiwi/cic-lambda-metrics.json"
}

# F2F CRI
module "f2f_dashboard" {
  source = "./modules/dashboard"
  path   = "kiwi/f2f-cri.json"
}

module "f2f_lambda_metrics_dashboard" {
  source = "./modules/dashboard"
  path   = "kiwi/f2f-lambda-metrics.json"
}

# IPVReturn CRI
module "ipr_dashboard" {
  source = "./modules/dashboard"
  path   = "kiwi/ipr-cri.json"
}

module "ipr_lambda_metrics_dashboard" {
  source = "./modules/dashboard"
  path   = "kiwi/ipr-lambda-metrics.json"
}


### Lime ###

# Cross-service
module "lime_apigw_metrics_dashboard" {
  source = "./modules/dashboard"
  path   = "lime/apigw-metrics.json"
}

module "lime_ecs_metrics_dashboard" {
  source = "./modules/dashboard"
  path   = "lime/ecs-metrics.json"
}

module "lime_services_dashboard" {
  source = "./modules/dashboard"
  path   = "lime/services.json"
}

# Driving Licence CRI
module "dl_lambda_metrics_dashboard" {
  source = "./modules/dashboard"
  path   = "lime/dl-lambda-metrics.json"
}

# Fraud CRI
module "fraud_dashboard" {
  source = "./modules/dashboard"
  path   = "lime/fraud-cri.json"
}
module "fraud_lambda_metrics_dashboard" {
  source = "./modules/dashboard"
  path   = "lime/fraud-lambda-metrics.json"
}

# Passport CRI
module "passport_dashboard" {
  source = "./modules/dashboard"
  path   = "lime/passport-cri.json"
}
module "passport_lambda_metrics_dashboard" {
  source = "./modules/dashboard"
  path   = "lime/passport-lambda-metrics.json"
}


### Orange ###

# Cross-service
module "orange_apigw_metrics_dashboard" {
  source = "./modules/dashboard"
  path   = "orange/apigw-metrics.json"
}

module "orange_ecs_metrics_dashboard" {
  source = "./modules/dashboard"
  path   = "orange/ecs-metrics.json"
}

module "orange_services_dashboard" {
  source = "./modules/dashboard"
  path   = "orange/services.json"
}

# Address CRI
module "address_dashboard" {
  source = "./modules/dashboard"
  path   = "orange/address-cri.json"
}

module "address_lambda_metrics_dashboard" {
  source = "./modules/dashboard"
  path   = "orange/address-lambda-metrics.json"
}

# KBV CRI
module "kbv_dashboard" {
  source = "./modules/dashboard"
  path   = "orange/kbv-cri.json"
}
module "kbv_lambda_metrics_dashboard" {
  source = "./modules/dashboard"
  path   = "orange/kbv-lambda-metrics.json"
}

### SLA ###
module "core_sla_dashboard" {
  source = "./modules/dashboard"
  path   = "service-level-agreements/core.json"
}

module "kiwi_sla_dashboard" {
  source = "./modules/dashboard"
  path   = "service-level-agreements/kiwi.json"
}

module "lime_sla_dashboard" {
  source = "./modules/dashboard"
  path   = "service-level-agreements/lime.json"
}

module "orange_sla_dashboard" {
  source = "./modules/dashboard"
  path   = "service-level-agreements/orange.json"
}
