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

Use `terraform workspace select nonproduction` to target the non-production state.
