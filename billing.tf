locals {
  billing = {
    metrics = "(builtin:billing.custom_metrics_classic.usage:default(0) * ${var.metrics_cost})"
    full_stack = "(builtin:billing.full_stack_monitoring.usage:default(0) * ${var.full_stack_cost})"
    serverless = "(builtin:billing.serverless_functions_classic.usage:default(0) * ${var.serverless_cost})"
    synthetic_actions = "(builtin:billing.synthetic.actions.usage:default(0) * ${var.synthetic_actions_cost})"
    synthetic_requests = "(builtin:billing.synthetic.requests.usage:default(0) * ${var.synthetic_requests_cost})"
    height = 38 * 8
    width = 38 * 32
  }
}

resource "dynatrace_json_dashboard" "billing" {
  contents = templatefile("${path.module}/dashboards/billing.json.tpl", local.billing)
}

resource "dynatrace_dashboard_sharing" "billing" {
  dashboard_id = dynatrace_json_dashboard.billing.id

  enabled = true

  permissions {
    permission {
      level = "VIEW"
      type  = "ALL"
    }
    permission {
      id    = data.dynatrace_iam_group.all.id
      level = "VIEW"
      type  = "GROUP"
    }
  }
}