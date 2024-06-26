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

module "service_dashboard" {
  count  = local.is_production ? 1 : 0
  source = "./modules/dashboard"
  path   = "service-health-overview.json"
}

module "ls_lambda_errors" {
  count  = local.is_production ? 1 : 0
  source = "./modules/dashboard"
  path   = "ls-operations-lambda-errors.json"
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

module "txma-shared-signals-integration" {
  source = "./modules/dashboard"
  path   = "txma/txma-shared-signals-integration.json"
}

module "txma-shared-signals-production" {
  source = "./modules/dashboard"
  path   = "txma/txma-shared-signals-production.json"
}

module "txma-integration" {
  source = "./modules/dashboard"
  path   = "txma/txma-integration.json"
}

module "txma-production" {
  source = "./modules/dashboard"
  path   = "txma/txma-production.json"
}

module "txma-deployment-production" {
  source = "./modules/dashboard"
  path   = "txma/txma-deployment-production.json"
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

### Authentication ###

module "di_auth_check_experian_build_dashboard" {
  count  = local.is_production ? 0 : 1
  source = "./dashboards/authentication/di-auth-check-experian"

  api_account_id          = "761723964695"
  check_account_id        = "851725166715"
  application_environment = "build"
}
module "di_auth_check_experian_staging_dashboard" {
  count  = local.is_production ? 0 : 1
  source = "./dashboards/authentication/di-auth-check-experian"

  api_account_id          = "758531536632"
  check_account_id        = "891377189576"
  application_environment = "staging"
}
module "di_auth_check_experian_integration_dashboard" {
  count  = local.is_production ? 0 : 1
  source = "./dashboards/authentication/di-auth-check-experian"

  api_account_id          = "761723964695"
  check_account_id        = "211125427676"
  application_environment = "integration"
}
module "di_auth_check_experian_production_dashboard" {
  count  = local.is_production ? 1 : 0
  source = "./dashboards/authentication/di-auth-check-experian"

  api_account_id          = "172348255554"
  check_account_id        = "637423504848"
  application_environment = "production"
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
# multi-account boards
module "accountmanagement_slas_dashboard" {
  source = "./modules/dashboard"
  path   = "orange/accountmanagement-slas-Orange.json"
}

module "apigw_metrics_dashboard" {
  source = "./modules/dashboard"
  path   = "orange/apigw-metrics.json"
}

module "ecs_metrics_dashboard" {
  source = "./modules/dashboard"
  path   = "orange/ecs-metrics.json"
}

module "services_dashboard" {
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

# check_hmrc CRI
module "check_hmrc_dashboard" {
  source = "./modules/dashboard"
  path   = "orange/check-hmrc-cri.json"
}
module "check_hmrc_lambda_metrics_dashboard" {
  source = "./modules/dashboard"
  path   = "orange/check-hmrc-lambda-metrics.json"
}

# kbv CRI
module "kbv_dashboard" {
  source = "./modules/dashboard"
  path   = "orange/kbv-cri.json"
}
module "kbv_lambda_metrics_dashboard" {
  source = "./modules/dashboard"
  path   = "orange/kbv-lambda-metrics.json"
}

# otg CRI
module "otg_dashboard" {
  source = "./modules/dashboard"
  path   = "orange/otg-cri.json"
}
module "otg_lambda_metrics_dashboard" {
  source = "./modules/dashboard"
  path   = "orange/otg-lambda-metrics.json"
}

### Orchestration ###
module "orch_ais_production" {
  count  = local.is_production ? 1 : 0
  source = "./modules/dashboard"
  path   = "orchestration/account-interventions-prod.json"
}
module "orch_ais_staging" {
  count  = local.is_production ? 0 : 1
  source = "./modules/dashboard"
  path   = "orchestration/account-interventions-staging.json"
}
module "orch_ais_integration" {
  count  = local.is_production ? 0 : 1
  source = "./modules/dashboard"
  path   = "orchestration/account-interventions-integration.json"
}

# Authentication
module "auth_ais_production" {
  count  = local.is_production ? 1 : 0
  source = "./modules/dashboard"
  path   = "authentication/account-interventions-prod.json"
}
module "auth_ais_staging" {
  count  = local.is_production ? 0 : 1
  source = "./modules/dashboard"
  path   = "authentication/account-interventions-staging.json"
}
module "aith_ais_integration" {
  count  = local.is_production ? 0 : 1
  source = "./modules/dashboard"
  path   = "authentication/account-interventions-integration.json"
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


### Capacity & Performance Dashboards ###

module "performance_application" {
  source = "./modules/dashboard"
  path   = "capacity/application-performance-review.json"
}

module "critical_conformance" {
  source = "./modules/dashboard"
  path   = "capacity/critical-conformance.json"
}

module "pab_conformance" {
  source = "./modules/dashboard"
  path   = "capacity/pab-conformance.json"
}

### Scaling Dashboards ###

module "demo_node_app_build" {
  count        = local.is_production ? 0 : 1 # Only create in non_production
  source       = "../modules/ecs_scaling"
  path         = "scaling/ecs-service.json"
  service_name = "node-app-ContainerService-ozXYrbF86Fau"
  apigwid      = "dcbmiq3klk"
}

### DAP ###

module "dap_dashboard" {
  source = "./modules/dashboard"
  path   = "dap/data-and-analytics-prod.json"
}

### DevPlatform ###

module "pipelines_dora_dashboard" {
  source = "./modules/dashboard"
  path   = "dev-platform/pipelines_dora_metrics_dashboard.json"
}
