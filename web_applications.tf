locals {
  one_login_subdomains = {
    signin = {
      hostname         = "signin"
      name             = "Authentication"
      manual_injection = false
    },
    home = {
      hostname         = "home"
      name             = "Home"
      manual_injection = true
    },
    identity = {
      hostname         = "identity",
      name             = "IPV Core"
      manual_injection = true
    },
    review-a = {
      hostname         = "review-a"
      name             = "Address CRI"
      manual_injection = false
    },
    review-b = {
      hostname         = "review-b"
      name             = "Document App CRI"
      manual_injection = false
    },
    review-bav = {
      hostname         = "review-bav"
      name             = "Bank Account Verification CRI"
      manual_injection = false
    },
    review-c = {
      hostname         = "review-c"
      name             = "Claimed Identity Collector CRI"
      manual_injection = false
    },
    review-d = {
      hostname         = "review-d"
      name             = "Driving License CRI"
      manual_injection = false
    },
    review-f = {
      hostname         = "review-f"
      name             = "Fraud CRI"
      manual_injection = false
    },
    review-hc = {
      hostname         = "review-hc"
      name             = "HMRC NINO Check CRI"
      manual_injection = false
    },
    review-k = {
      hostname         = "review-k"
      name             = "Experian KBV CRI"
      manual_injection = false
    },
    review-o = {
      hostname         = "review-o"
      name             = "Face to Face CRI"
      manual_injection = false
    },
    review-pa = {
      hostname         = "review-pa"
      name             = "Passport CRI"
      manual_injection = false
    }
  }
}

module "web_application_staging" {
  count  = var.environment == "nonproduction" ? 1 : 0
  source = "./modules/web_application"

  hostname         = "staging.account.gov.uk"
  name             = "Staging"
  enabled          = true
  opt_in_enabled   = true
  manual_injection = false
}

module "web_application_staging_subdomains" {
  for_each = var.environment == "nonproduction" ? local.one_login_subdomains : {}
  source   = "./modules/web_application"

  hostname         = "${each.value["hostname"]}.staging.account.gov.uk"
  name             = "${each.value["name"]} Staging"
  enabled          = true
  opt_in_enabled   = true
  manual_injection = each.value["manual_injection"]
}

module "web_application_integration" {
  count  = var.environment == "nonproduction" ? 1 : 0
  source = "./modules/web_application"

  hostname         = "integration.account.gov.uk"
  name             = "Integration"
  enabled          = true
  opt_in_enabled   = true
  manual_injection = false
}

module "web_application_integration_subdomains" {
  for_each = var.environment == "nonproduction" ? local.one_login_subdomains : {}
  source   = "./modules/web_application"

  hostname         = "${each.value["hostname"]}.integration.account.gov.uk"
  name             = "${each.value["name"]} Integration"
  enabled          = true
  opt_in_enabled   = true
  manual_injection = each.value["manual_injection"]
}

module "web_application_production" {
  count  = var.environment == "production" ? 1 : 0
  source = "./modules/web_application"

  hostname         = "account.gov.uk"
  name             = "Production"
  enabled          = true
  opt_in_enabled   = true
  manual_injection = false
}

module "web_application_production_subdomains" {
  for_each = var.environment == "production" ? local.one_login_subdomains : {}
  source   = "./modules/web_application"

  hostname         = "${each.value["hostname"]}.account.gov.uk"
  name             = "${each.value["name"]} Production"
  enabled          = true
  opt_in_enabled   = true
  manual_injection = each.value["manual_injection"]
}
