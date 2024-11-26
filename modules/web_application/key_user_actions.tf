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

# Fraud Key User Actions

# Home Key User Actions

# Document App CRI Key User Actions

# Experian KBV CRI Key User Actions

# Face to Face CRI Key User Actions

# Claimed Identity Collector CRI Key User Actions

# Driving License CRI Key User Actions

# Passport CRI Key User Actions

# Bank Account Verification CRI Key User Actions

# HMRC KBV CRI Key User Actions

# HMRC NINO Check CRI Key User Actions