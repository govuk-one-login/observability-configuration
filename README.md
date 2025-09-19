# Dynatrace Configuration

This repository contains Terraform configuration for Dynatrace.

Key features of Dynatrace will be managed here.

## Requirements
- pre-commit:

```bash
pip install pre-commit
pre-commit install -tpre-commit -tprepare-commit-msg -tcommit-msg
```
Note: Dont use "brew' on mac, this can fail to compile some modules.

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

## Contributing

This repository is *PUBLIC*, do not commit anything sensitive. If you feel you have to, reach out to the Observability team to discuss your use case.

### Adding a dashboard using Dynatrace Classic

Dashboards should be created in the Dynatrace Web UI in the first instance, unless you really, really want to handcraft some JSON.

- Once you have the dashboard, under the context menu click `Export`. This will download a JSON file representing the dashboard.
- Save this JSON file under the `dashboards/` directory of this repo, potentially under a directory specific to your team (i.e. `dashboards/live-service/`).
- Optionally, you can tailor the JSON that was produced if you want.
- Find the "ID" property in your dashboard and delete it from your JSON file. 

Then add a block like this to `dashboards.tf`:

```terraform
module "mydashboard_dashboard" {
  source = "./modules/dashboard"
  path   = "myteam/mydashboard.json"
}
```

### Adding a dashboard using new Dynatrace dashboards

- Create the dashboard within the Dynatrace web UI.
- Click `⋮` next to the dashboard name and click `Download`, this will download a JSON file of the created dashboard.
- Save this JSON file under the `documents/` directory of this repo, potentially under a directory specific to your team (i.e. `documents/core/`).
- Optionally, you can tailor the JSON that was produced if you want.

Then add a block like this to `documents.tf`:

```terraform
module "mydashboard_dashboard" {  
  source        = "./modules/documents"
  document_path = "myteam/mydashboard.json"
  document_name = "the name of your dashboard"
  document_type = "dashboard"
}
```

### Dashboard review and deployment process

Commit these files on a new branch, push and open a pull request. A member of the Observability team will be able to review and merge. Send a message on the [#di-observability-team](https://gds.slack.com/archives/C04UF0B02NR) channel on Slack about your PR.

Once merged, the workflow will apply the Terraform and create the dashboard in all Dynatrace environments. This will not overwrite the dashboard you initially created, you can delete that dashboard after you've exported it and the new dashboard has been created.
