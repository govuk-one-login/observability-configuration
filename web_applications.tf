locals {
  one_login_subdomains = [
    {
      hostname = "signin"
      name = "Authentication"
    },
    {
      hostname = "home"
      name = "Home"
    },
    {
      hostname = "identity",
      name = "IPV Core"
    },
    {
      hostname = "review-a"
      name = "Address CRI"
    },
    {
      hostname = "review-b"
      name = "Address CRI"
    },
    {
      hostname = "review-bav"
      name = "Bank Account Verification CRI"
    },
    {
      hostname = "review-c"
      name = "Claimed Identity Collector CRI"
    },
    {
      hostname = "review-d"
      name = "Driving License CRI"
    },
    {
      hostname = "review-f"
      name = "Fraud CRI"
    },
    {
      hostname = "review-hc"
      name = "HMRC NINO Check CRI"
    },
    {
      hostname = "review-k"
      name = "Experian KBV CRI"
    },
    {
      hostname = "review-o"
      name = "Face to Face CRI"
    },
    {
      hostname = "review-pa"
      name = "Passport CRI"
    },
    {
      hostname = "review-hk"
      name = "HMRC KBV CRI"
    }
  ]
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
  for_each = var.environment == "nonproduction" ? toset(local.one_login_subdomains) : []
  source   = "./modules/web_application"

  hostname       = "${each.value["hostname"]}.staging.account.gov.uk"
  name           = "${each.value["name"]} Staging"
  enabled        = true
  opt_in_enabled = true
}
