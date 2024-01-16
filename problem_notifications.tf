resource "dynatrace_slack_notification" "slack_notification" {
    active  = true
    name    = "di-slack-notification"
    profile = "di-alerting-profile"
    url     = local.is_production ? "https://hooks.slack.com/services/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" : "https://hooks.slack.com/services/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"
    channel = local.is_production ? "#di-dynatrace-prod-alerts" : "#di-dynatrace-alerts"
    message = "{State} {ProblemSeverity} Problem {ProblemID}: {ImpactedEntity}"
}