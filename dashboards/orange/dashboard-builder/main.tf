locals {
  params = {
    kbv_account_id   = var.kbv_account_id
    address_account_id    = var.address_account_id
    otg_account_id        = var.otg_account_id
    team_email            = var.team_email
    team_name             = var.team_name
    application_environment = var.application_environment
  }
}

module "address_cri_dashboard" {
  source = "../dashboard"
  template_path = "${path.module}/templates/address-cri.tpl.json"
  params = local.params
}

module "address_cri_metrics_dashboard" {
  source = "../dashboard"
  template_path = "${path.module}/templates/address-lambda-metrics.tpl.json"
  params = local.params
}


module "kbv_cri_dashboard"  {
  source = "../dashboard"
  template_path = "${path.module}/templates/kbv-cri.tpl.json"
  params = local.params
}

module "kbv_cri_metrics_dashboard"  {
  source = "../dashboard"
  template_path = "${path.module}/templates/kbv-lambda-metrics.tpl.json"
  params = local.params
}

module "otg_cri_dashboard"  {
  source = "../dashboard"
  template_path = "${path.module}/templates/otg-cri.tpl.json"
  params = local.params
}

module "otg_cri_metrics_dashboard"  {
  source = "../dashboard"
  template_path = "${path.module}/templates/otg-lambda-metrics.tpl.json"
  params = local.params
}

module "check_hmrc_cri_dashboard"  {
  source = "../dashboard"
  template_path = "${path.module}/templates/check-hmrc-cri.tpl.json"
  params = local.params
}

module "check_hmrc_cri_metrics_dashboard"  {
  source = "../dashboard"
  template_path = "${path.module}/templates/check-hmrc-lambda-metrics.tpl.json"
  params = local.params
}


module "accountmanagement_slas_dashboard"  {
  source = "../dashboard"
  template_path = "${path.module}/templates/accountmanagement-slas-Orange.tpl.json"
  params = local.params
}

module "apigw_metrics_dashboard"  {
  source = "../dashboard"
  template_path = "${path.module}/templates/apigw-metrics.tpl.json"
  params = local.params
}


module "ecs_metrics_dashboard"  {
  source = "../dashboard"
  template_path = "${path.module}/templates/ecs-metrics.tpl.json"
  params = local.params
}

module "services_dashboard"  {
  source = "../dashboard"
  template_path = "${path.module}/templates/services.tpl.json"
  params = local.params
}


