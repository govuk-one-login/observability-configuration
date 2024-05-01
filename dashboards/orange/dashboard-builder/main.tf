locals {
  combination = {
    kbv_hmrc_account_id   = var.kbv_hmrc_account_id
    address_account_id    = var.address_account_id
    team_email            = var.team_email
    team_name             = var.team_name
    application_environment = var.application_environment
  }
}

resource "address_cri_dashboard" "dashboard" {
  template_path = "${path.module}/templates/address-cri.tpl.json"
  combination = local.combination
}

resource "address_cri_metrics_dashboard" "dashboard" {
  template_path = "${path.module}/templates/address-lambda-metrics.tpl.json"
  combination = local.combination
}


resource "kbv_cri_dashboard" "dashboard" {
  template_path = "${path.module}/templates/kbv-cri.tpl.json"
  combination = local.combination
}

resource "kbv_cri_metrics_dashboard" "dashboard" {
  template_path = "${path.module}/templates/kbv-lambda-metrics.tpl.json"
  combination = local.combination
}


resource "accountmanagement-slas_dashboard" "dashboard" {
  template_path = "${path.module}/templates/accountmanagement-slas-Orange.tpl.json"
  combination = local.combination
}

resource "apigw-metrics_dashboard" "dashboard" {
  template_path = "${path.module}/templates/apigw-metrics.tpl.json"
  combination = local.combination
}


resource "ecs-metrics_dashboard" "dashboard" {
  template_path = "${path.module}/templates/ecs-metrics.tpl.json"
  combination = local.combination
}

resource "services_dashboard" "dashboard" {
  template_path = "${path.module}/templates/services.tpl.json"
  combination = local.combination
}


