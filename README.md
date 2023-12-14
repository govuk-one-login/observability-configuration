# Dynatrace Configuration

This repository contains Terraform configuration for Dynatrace.

Key features of Dynatrace will be managed here.

## Setup

To test, the following environment variables must be set:

`DYNATRACE_ENV_URL`: the URL of the Dynatrace environment you are targeting.

`DYNATRACE_API_TOKEN`: an API token with the following scopes:

- ReadConfig
- WriteConfig
- settings.read
- settings.write
- slo.read
- slo.write
- ExternalSyntheticConfiguration
- credentialVault.read

An OAuth client (`DT_ACCOUNT_ID`, `DT_CLIENT_ID`, `DT_CLIENT_SECRET`), with the following scopes:

- account-idm-read

Use `terraform workspace select nonproduction` to target the non-production state.

You will also need valid AWS credentials for the `di-observability-prod` account.

Then, you can use `terraform plan` to test changes, `terraform apply` to apply them (though this should be done by CI/CD really).
