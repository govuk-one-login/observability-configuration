# IPV Core Key User Actions
resource "dynatrace_key_user_action" "page_ipv_success" {
  count          = strcontains(var.hostname, "identity") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /ipv/page/page-ipv-success"
  type           = "Load"
}

resource "dynatrace_key_user_action" "page_dcmaw_success" {
  count          = strcontains(var.hostname, "identity") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /ipv/page/page-dcmaw-success"
  type           = "Load"
}

# Authentication Key User Actions
resource "dynatrace_key_user_action" "account_created" {
  count          = strcontains(var.hostname, "signin") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /account-created"
  type           = "Load"
}

resource "dynatrace_key_user_action" "sign_in_or_create" {
  count          = strcontains(var.hostname, "signin") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /sign-in-or-create"
  type           = "Load"
}

resource "dynatrace_key_user_action" "check_your_phone" {
  count          = strcontains(var.hostname, "signin") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /check-your-phone"
  type           = "Load"
}

resource "dynatrace_key_user_action" "check_your_email" {
  count          = strcontains(var.hostname, "signin") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /check-your-email"
  type           = "Load"
}

resource "dynatrace_key_user_action" "create_password" {
  count          = strcontains(var.hostname, "signin") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /create-password"
  type           = "Load"
}

resource "dynatrace_key_user_action" "get_security_codes" {
  count          = strcontains(var.hostname, "signin") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /get-security-codes"
  type           = "Load"
}

resource "dynatrace_key_user_action" "ipv_callback" {
  count          = strcontains(var.hostname, "signin") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /ipv-callback"
  type           = "Load"
}

resource "dynatrace_key_user_action" "enter_code" {
  count          = strcontains(var.hostname, "signin") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /enter-code"
  type           = "Load"
}

# Address CRI Key User Actions
resource "dynatrace_key_user_action" "results" {
  count          = strcontains(var.hostname, "review-a") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /results"
  type           = "Load"
}

resource "dynatrace_key_user_action" "confirm" {
  count          = strcontains(var.hostname, "review-a") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /summary/confirm"
  type           = "Load"
}

resource "dynatrace_key_user_action" "search" {
  count          = strcontains(var.hostname, "review-a") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /search"
  type           = "Load"
}

resource "dynatrace_key_user_action" "address" {
  count          = strcontains(var.hostname, "review-a") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /address"
  type           = "Load"
}

resource "dynatrace_key_user_action" "click_address" {
  count          = strcontains(var.hostname, "review-a") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "click on continue in /address"
  type           = "Xhr"
}

resource "dynatrace_key_user_action" "click_confirm" {
  count          = strcontains(var.hostname, "review-a") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "click on i confirm my details are correct in /summary/confirm"
  type           = "Xhr"
}

# Fraud Key User Actions
resource "dynatrace_key_user_action" "check" {
  count          = strcontains(var.hostname, "review-f") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /check"
  type           = "Load"
}

resource "dynatrace_key_user_action" "click_check" {
  count          = strcontains(var.hostname, "review-f") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "click on continue in /check"
  type           = "Xhr"
}

# Home Key User Actions
resource "dynatrace_key_user_action" "your_services" {
  count          = strcontains(var.hostname, "home") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /your-services"
  type           = "Load"
}

resource "dynatrace_key_user_action" "contact_one_login" {
  count          = strcontains(var.hostname, "home") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /contact-gov-uk-one-login"
  type           = "Load"
}

resource "dynatrace_key_user_action" "security" {
  count          = strcontains(var.hostname, "home") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /security"
  type           = "Load"
}

resource "dynatrace_key_user_action" "enter_password" {
  count          = strcontains(var.hostname, "home") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /enter-password"
  type           = "Load"
}

resource "dynatrace_key_user_action" "account_not_found" {
  count          = strcontains(var.hostname, "home") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /account-not-found"
  type           = "Load"
}

# Document App CRI Key User Actions
resource "dynatrace_key_user_action" "select_device" {
  count          = strcontains(var.hostname, "review-b") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /dca/oauth2/selectdevice"
  type           = "Load"
}

resource "dynatrace_key_user_action" "doc_check" {
  count          = strcontains(var.hostname, "review-b") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /ipv/page/page-multiple-doc-check"
  type           = "Load"
}

resource "dynatrace_key_user_action" "download_app" {
  count          = strcontains(var.hostname, "review-b") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /dca/oauth2/downloadapp"
  type           = "Load"
}

resource "dynatrace_key_user_action" "app" {
  count          = strcontains(var.hostname, "review-b") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /dca/oauth2/idcheckapp"
  type           = "Load"
}

resource "dynatrace_key_user_action" "handoff" {
  count          = strcontains(var.hostname, "review-b") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /dca/app/handoff"
  type           = "Load"
}

resource "dynatrace_key_user_action" "timeout" {
  count          = strcontains(var.hostname, "review-b") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /dca/oauth2/timeout"
  type           = "Load"
}

resource "dynatrace_key_user_action" "link_error" {
  count          = strcontains(var.hostname, "review-b") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /dca/app/linkerror"
  type           = "Load"
}

resource "dynatrace_key_user_action" "handoff_error" {
  count          = strcontains(var.hostname, "review-b") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /dca/app/handofferror"
  type           = "Load"
}

# Experian KBV CRI Key User Actions
resource "dynatrace_key_user_action" "question" {
  count          = strcontains(var.hostname, "review-k") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /kbv/question"
  type           = "Load"
}

resource "dynatrace_key_user_action" "question_click" {
  count          = strcontains(var.hostname, "review-k") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "click on continue in /kbv/question"
  type           = "Xhr"
}

# Face to Face CRI Key User Actions
resource "dynatrace_key_user_action" "post_office" {
  count          = strcontains(var.hostname, "review-o") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /prove-identity-post-office"
  type           = "Load"
}

resource "dynatrace_key_user_action" "post_office_error" {
  count          = strcontains(var.hostname, "review-o") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /error"
  type           = "Load"
}

resource "dynatrace_key_user_action" "find_post_office" {
  count          = strcontains(var.hostname, "review-o") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /find-post-office-prove-identity"
  type           = "Load"
}

resource "dynatrace_key_user_action" "check_details_post_office" {
  count          = strcontains(var.hostname, "review-o") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /check-details"
  type           = "Load"
}

resource "dynatrace_key_user_action" "post_office_click_confirm" {
  count          = strcontains(var.hostname, "review-o") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "click on confirm and submit in /check-details"
  type           = "Xhr"
}

# Claimed Identity Collector CRI Key User Actions
resource "dynatrace_key_user_action" "confirm_details_no_photo" {
  count          = strcontains(var.hostname, "review-c") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /confirm-details-no-photo-id"
  type           = "Load"
}

resource "dynatrace_key_user_action" "enter_name_no_photo" {
  count          = strcontains(var.hostname, "review-c") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /enter-name-no-photo-id"
  type           = "Load"
}

resource "dynatrace_key_user_action" "error_no_photo" {
  count          = strcontains(var.hostname, "review-c") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /error"
  type           = "Load"
}

resource "dynatrace_key_user_action" "click_confirm_photo_details" {
  count          = strcontains(var.hostname, "review-c") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "click on i confirm my details are correct in /confirm-details"
  type           = "Xhr"
}

# Driving License CRI Key User Actions
resource "dynatrace_key_user_action" "license_issuer" {
  count          = strcontains(var.hostname, "review-d") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /licence-issuer"
  type           = "Load"
}

resource "dynatrace_key_user_action" "driving_license_details" {
  count          = strcontains(var.hostname, "review-d") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /details"
  type           = "Load"
}

resource "dynatrace_key_user_action" "give_dvla_consent" {
  count          = strcontains(var.hostname, "review-d") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "click on give dvla your consent to check your driving licence details in /details"
  type           = "Xhr"
}

resource "dynatrace_key_user_action" "driving_license_click_continue" {
  count          = strcontains(var.hostname, "review-d") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "click on continue in /details"
  type           = "Xhr"
}

# Passport CRI Key User Actions
resource "dynatrace_key_user_action" "passport_details" {
  count          = strcontains(var.hostname, "review-pa") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /details"
  type           = "Load"
}

resource "dynatrace_key_user_action" "passport_search" {
  count          = strcontains(var.hostname, "review-pa") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /search"
  type           = "Load"
}

resource "dynatrace_key_user_action" "pyi_attempt_recovery" {
  count          = strcontains(var.hostname, "review-pa") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "loading of page /ipv/page/pyi-attempt-recovery"
  type           = "Load"
}

resource "dynatrace_key_user_action" "passport_click_details" {
  count          = strcontains(var.hostname, "review-pa") ? 1 : 0
  application_id = dynatrace_web_application.web_application.id
  name           = "click on continue in /details"
  type           = "Xhr"
}