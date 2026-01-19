data "dynatrace_entity" "di-ipv-cri-check-hmrc-front" {
  name = "di-ipv-cri-check-hmrc-front"
  type = "SERVICE"
  from = var.key_requests_from_date
}

module "cri_check_hmrc_front_key_requests" {
  source               = "./modules/service_key_requests"
  key_requests_service = data.dynatrace_entity.di-ipv-cri-check-hmrc-front.id
  key_requests_names = [
    "/",
    "/abandon",
    "/could-not-match-national-insurance",
    "/enter-national-insurance-number",
    "/how-continue-national-insurance",
    "/oauth2/authorize",
    "/oauth2/callback"
  ]
}

data "dynatrace_entity" "di-ipv-cri-address-front" {
  name = "di-ipv-cri-address-front"
  type = "SERVICE"
  from = var.key_requests_from_date
}

module "cri_address_front_key_requests" {
  source               = "./modules/service_key_requests"
  key_requests_service = data.dynatrace_entity.di-ipv-cri-address-front.id
  key_requests_names = [
    "/",
    "/address",
    "/address/edit",
    "/enter-non-UK-address",
    "/oauth2/authorize",
    "/oauth2/callback",
    "/prepopulate",
    "/previous/address",
    "/previous/problem",
    "/previous/results",
    "/previous/search",
    "/problem",
    "/results",
    "/summary/confirm",
    "/summary/non-UK-confirm",
    "/what-country"
  ]
}

data "dynatrace_entity" "di-ipv-cri-kbv-front" {
  name = "di-ipv-cri-kbv-front"
  type = "SERVICE"
  from = var.key_requests_from_date
}

module "cri_experian_kbv_front_key_requests" {
  source               = "./modules/service_key_requests"
  key_requests_service = data.dynatrace_entity.di-ipv-cri-kbv-front.id
  key_requests_names = [
    "/",
    "/kbv/abandon",
    "/kbv/done",
    "/kbv/load-question",
    "/kbv/question",
    "/oauth2/authorize",
    "/oauth2/callback"
  ]
}

data "dynatrace_entity" "di-ipv-cri-fraud-front" {
  name = "di-ipv-cri-fraud-front"
  type = "SERVICE"
  from = var.key_requests_from_date
}

module "cri_fraud_front_key_requests" {
  source               = "./modules/service_key_requests"
  key_requests_service = data.dynatrace_entity.di-ipv-cri-fraud-front.id
  key_requests_names = [
    "/",
    "/check",
    "/oauth2/authorize",
    "/oauth2/callback"
  ]
}

data "dynatrace_entity" "di-ipv-cri-uk-driving-licence-front" {
  name = "di-ipv-cri-uk-driving-licence-front"
  type = "SERVICE"
  from = var.key_requests_from_date
}

module "cri_uk-driving-licence_front_key_requests" {
  source               = "./modules/service_key_requests"
  key_requests_service = data.dynatrace_entity.di-ipv-cri-uk-driving-licence-front.id
  key_requests_names = [
    "/",
    "/details",
    "/licence-user",
    "/validate",
    "/oauth2/authorize",
    "/oauth2/callback"
  ]
}

data "dynatrace_entity" "di-ipv-cri-uk-passport-front-v1" {
  name = "di-ipv-cri-uk-passport-front-v1"
  type = "SERVICE"
  from = var.key_requests_from_date
}

module "cri_uk-passport-front-v1_key_requests" {
  source               = "./modules/service_key_requests"
  key_requests_service = data.dynatrace_entity.di-ipv-cri-uk-passport-front-v1.id
  key_requests_names = [
    "/",
    "/details",
    "/licence-user",
    "/validate",
    "/oauth2/authorize",
    "/oauth2/callback"
  ]
}

data "dynatrace_entity" "di-cic-front" {
  name = "di-cic-front"
  type = "SERVICE"
  from = var.key_requests_from_date
}

module "cri_cic-front_key_requests" {
  source               = "./modules/service_key_requests"
  key_requests_service = data.dynatrace_entity.di-cic-front.id
  key_requests_names = [
    "/confirm-details",
    "/confirm-details-no-photo-id",
    "/done",
    "/enter-date-birth",
    "/enter-date-birth-no-photo-id",
    "/enter-name",
    "/enter-name-no-photo-id",
    "/error",
    "/journey-type",
    "/oauth2/authorize",
    "/oauth2/callback"
  ]
}

data "dynatrace_entity" "di-ipv-cri-f2f-front" {
  name = "di-ipv-cri-f2f-front"
  type = "SERVICE"
  from = var.key_requests_from_date
}

module "cri_f2f-front_key_requests" {
  source               = "./modules/service_key_requests"
  key_requests_service = data.dynatrace_entity.di-ipv-cri-f2f-front.id
  key_requests_names = [
    "/abort",
    "/check-details",
    "/choose-photo-id-post-office",
    "/done",
    "/error",
    "/oauth2/authorize",
    "/oauth2/callback",
    "/post-office-customer-letter-find-address",
    "/prove-identity-post-office"
  ]
}

#IPV return
data "dynatrace_entity" "node_project" {
  name = "node_project"
  type = "SERVICE"
  from = var.key_requests_from_date
}

module "cri_ipv-return_key_requests" {
  source               = "./modules/service_key_requests"
  key_requests_service = data.dynatrace_entity.node_project.id
  key_requests_names = [
    "/callback",
    "/resume"
  ]
}

data "dynatrace_entity" "ipv-cri-bav-front" {
  name = "ipv-cri-bav-front"
  type = "SERVICE"
  from = var.key_requests_from_date
}

module "cri_bav-front_key_requests" {
  source               = "./modules/service_key_requests"
  key_requests_service = data.dynatrace_entity.ipv-cri-bav-front.id
  key_requests_names = [
    "/abort",
    "/check-details",
    "/done",
    "/name-info",
    "/oauth2/authorize",
    "/oauth2/callback"
  ]
}
