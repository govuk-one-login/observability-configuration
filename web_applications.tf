locals {
  one_login_subdomains = {
    signin = {
      hostname = "signin"
      name     = "Authentication"
    },
    home = {
      hostname = "home"
      name     = "Home"
    },
    identity = {
      hostname = "identity"
      name     = "IPV Core"
    },
    review-a = {
      hostname = "review-a"
      name     = "Address CRI"
    },
    review-b = {
      hostname = "review-b"
      name     = "Document App CRI"
    },
    review-bav = {
      hostname = "review-bav"
      name     = "Bank Account Verification CRI"
    },
    review-c = {
      hostname = "review-c"
      name     = "Claimed Identity Collector CRI"
    },
    review-d = {
      hostname = "review-d"
      name     = "Driving License CRI"
    },
    review-f = {
      hostname = "review-f"
      name     = "Fraud CRI"
    },
    review-hc = {
      hostname = "review-hc"
      name     = "HMRC NINO Check CRI"
    },
    review-k = {
      hostname = "review-k"
      name     = "Experian KBV CRI"
    },
    review-o = {
      hostname = "review-o"
      name     = "Face to Face CRI"
    },
    review-pa = {
      hostname = "review-pa"
      name     = "Passport CRI"
    }
  }
}

module "web_application_staging" {
  count  = var.environment == "nonproduction" ? 1 : 0
  source = "./modules/web_application"

  hostname       = "staging.account.gov.uk"
  name           = "Staging"
  enabled        = true
  opt_in_enabled = true
}

module "web_application_staging_subdomains" {
  for_each = var.environment == "nonproduction" ? local.one_login_subdomains : {}
  source   = "./modules/web_application"

  hostname       = "${each.value["hostname"]}.staging.account.gov.uk"
  name           = "${each.value["name"]} Staging"
  enabled        = true
  opt_in_enabled = true
}

module "web_application_integration" {
  count  = var.environment == "nonproduction" ? 1 : 0
  source = "./modules/web_application"

  hostname       = "integration.account.gov.uk"
  name           = "Integration"
  enabled        = true
  opt_in_enabled = true
}

module "web_application_integration_subdomains" {
  for_each = var.environment == "nonproduction" ? local.one_login_subdomains : {}
  source   = "./modules/web_application"

  hostname       = "${each.value["hostname"]}.integration.account.gov.uk"
  name           = "${each.value["name"]} Integration"
  enabled        = true
  opt_in_enabled = true
}

module "web_application_production" {
  count  = var.environment == "production" ? 1 : 0
  source = "./modules/web_application"

  hostname       = "account.gov.uk"
  name           = "Production"
  enabled        = true
  opt_in_enabled = true
}

module "web_application_production_subdomains" {
  for_each = var.environment == "production" ? local.one_login_subdomains : {}
  source   = "./modules/web_application"

  hostname       = "${each.value["hostname"]}.account.gov.uk"
  name           = "${each.value["name"]} Production"
  enabled        = true
  opt_in_enabled = true
}
