# Problem notifications 
resource "dynatrace_slack_notification" "slack_notification" {
  active  = true
  name    = "di-slack-notification"
  profile = dynatrace_alerting.di-alerting-profile.id
  url     = local.is_production ? jsondecode(data.aws_secretsmanager_secret_version.pr.secret_string)["SLACK_URL"] : jsondecode(data.aws_secretsmanager_secret_version.np.secret_string)["SLACK_URL"]
  channel = local.is_production ? jsondecode(data.aws_secretsmanager_secret_version.pr.secret_string)["SLACK_CHANNEL"] : jsondecode(data.aws_secretsmanager_secret_version.np.secret_string)["SLACK_CHANNEL"]
  message = "{State} {ProblemSeverity} Problem {ProblemID}: {ImpactedEntity}"
}

resource "dynatrace_slack_notification" "SPICE_capacity_alerts" {
  count   = local.is_production ? 1 : 0
  active  = true
  name    = "quicksight-alerts"
  profile = dynatrace_alerting.quicksight-alerting-profile.id
  url     = jsondecode(data.aws_secretsmanager_secret_version.pr.secret_string)["QUICKSIGHT_SLACK_URL"]
  channel = jsondecode(data.aws_secretsmanager_secret_version.pr.secret_string)["QUICKSIGHT_SLACK_CHANNEL"]
  message = "{State} {ProblemSeverity} Problem {ProblemID}: {ImpactedEntity}"
}
