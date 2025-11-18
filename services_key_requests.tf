data "dynatrace_entity" "di-ipv-cri-check-hmrc-front" {
  name = "di-ipv-cri-check-hmrc-front"
  type = "SERVICE"
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
