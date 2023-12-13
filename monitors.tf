module "oidc-jwks-monitor" {
  for_each = toset(var.environment == "production" ? [
    "oidc.account.gov.uk",
    "api-backend-api.review-b.account.gov.uk"
    ] : flatten([for env in local.aws_environments : [
      "oidc.${env}.account.gov.uk",
      "api-backend-api.review-b.${env}.account.gov.uk",
  ]]))

  source      = "./modules/monitors/jwks"
  domain_name = each.value
}
