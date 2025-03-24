locals {
  one_login_subdomains = {
    signin = {
      hostname                = "signin"
      name                    = "Authentication"
      user_session_percentage = 50
      injection_rule          = "AUTOMATIC_INJECTION"
      injection_operator      = "ALL_PAGES"
    },
    home = {
      hostname                = "home"
      name                    = "Home"
      user_session_percentage = 50
      injection_rule          = "DO_NOT_INJECT"
      injection_operator      = "ALL_PAGES"
    },
    identity = {
      hostname                = "identity"
      name                    = "IPV Core"
      user_session_percentage = 50
      injection_rule          = "DO_NOT_INJECT"
      injection_operator      = "ALL_PAGES"
    },
    review-a = {
      hostname                = "review-a"
      name                    = "Address CRI"
      user_session_percentage = 50
      injection_rule          = "AUTOMATIC_INJECTION"
      injection_operator      = "ALL_PAGES"
    },
    review-b = {
      hostname                = "review-b"
      name                    = "Document App CRI"
      user_session_percentage = 50
      injection_rule          = "AUTOMATIC_INJECTION"
      injection_operator      = "ALL_PAGES"
    },
    review-bav = {
      hostname                = "review-bav"
      name                    = "Bank Account Verification CRI"
      user_session_percentage = 50
      injection_rule          = "AUTOMATIC_INJECTION"
      injection_operator      = "ALL_PAGES"
    },
    review-c = {
      hostname                = "review-c"
      name                    = "Claimed Identity Collector CRI"
      user_session_percentage = 50
      injection_rule          = "AUTOMATIC_INJECTION"
      injection_operator      = "ALL_PAGES"
    },
    review-d = {
      hostname                = "review-d"
      name                    = "Driving License CRI"
      user_session_percentage = 50
      injection_rule          = "AUTOMATIC_INJECTION"
      injection_operator      = "ALL_PAGES"
    },
    review-f = {
      hostname                = "review-f"
      name                    = "Fraud CRI"
      user_session_percentage = 50
      injection_rule          = "AUTOMATIC_INJECTION"
      injection_operator      = "ALL_PAGES"
    },
    review-hc = {
      hostname                = "review-hc"
      name                    = "HMRC NINO Check CRI"
      user_session_percentage = 50
      injection_rule          = "AUTOMATIC_INJECTION"
      injection_operator      = "ALL_PAGES"
    },
    review-k = {
      hostname                = "review-k"
      name                    = "Experian KBV CRI"
      user_session_percentage = 50
      injection_rule          = "AUTOMATIC_INJECTION"
      injection_operator      = "ALL_PAGES"
    },
    review-o = {
      hostname                = "review-o"
      name                    = "Face to Face CRI"
      user_session_percentage = 50
      injection_rule          = "AUTOMATIC_INJECTION"
      injection_operator      = "ALL_PAGES"
    },
    review-pa = {
      hostname                = "review-pa"
      name                    = "Passport CRI"
      user_session_percentage = 50
      injection_rule          = "AUTOMATIC_INJECTION"
      injection_operator      = "ALL_PAGES"
    }
  }
}

module "web_application_staging" {
  count  = var.environment == "nonproduction" ? 1 : 0
  source = "./modules/web_application"

  hostname                = "staging.account.gov.uk"
  name                    = "Staging"
  enabled                 = true
  opt_in_enabled          = true
  user_session_percentage = 50
  injection_rule          = "AUTOMATIC_INJECTION"
  injection_operator      = "ALL_PAGES"
}

module "web_application_staging_subdomains" {
  for_each = var.environment == "nonproduction" ? local.one_login_subdomains : {}
  source   = "./modules/web_application"

  hostname                = "${each.value["hostname"]}.staging.account.gov.uk"
  name                    = "${each.value["name"]} Staging"
  enabled                 = true
  opt_in_enabled          = true
  user_session_percentage = each.value["user_session_percentage"]
  injection_rule          = each.value["injection_rule"]
  injection_operator      = each.value["injection_operator"]
}

module "web_application_integration" {
  count  = var.environment == "nonproduction" ? 1 : 0
  source = "./modules/web_application"

  hostname                = "integration.account.gov.uk"
  name                    = "Integration"
  enabled                 = true
  opt_in_enabled          = true
  user_session_percentage = 50
  injection_rule          = "AUTOMATIC_INJECTION"
  injection_operator      = "ALL_PAGES"
}

module "web_application_integration_subdomains" {
  for_each = var.environment == "nonproduction" ? local.one_login_subdomains : {}
  source   = "./modules/web_application"

  hostname                = "${each.value["hostname"]}.integration.account.gov.uk"
  name                    = "${each.value["name"]} Integration"
  enabled                 = true
  opt_in_enabled          = true
  user_session_percentage = each.value["user_session_percentage"]
  injection_rule          = each.value["injection_rule"]
  injection_operator      = each.value["injection_operator"]
}

module "web_application_production" {
  count  = var.environment == "production" ? 1 : 0
  source = "./modules/web_application"

  hostname                = "account.gov.uk"
  name                    = "Production"
  enabled                 = true
  opt_in_enabled          = true
  user_session_percentage = 50
  injection_rule          = "AUTOMATIC_INJECTION"
  injection_operator      = "ALL_PAGES"
}

module "web_application_production_subdomains" {
  for_each = var.environment == "production" ? local.one_login_subdomains : {}
  source   = "./modules/web_application"

  hostname                = "${each.value["hostname"]}.account.gov.uk"
  name                    = "${each.value["name"]} Production"
  enabled                 = true
  opt_in_enabled          = true
  user_session_percentage = each.value["user_session_percentage"]
  injection_rule          = each.value["injection_rule"]
  injection_operator      = each.value["injection_operator"]
}
