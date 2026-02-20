###############################
# TEAM Specific Metric Events #
###############################

# Amplify
resource "dynatrace_metric_events" "team_amplify_5xx_errors" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Amplify 5xx Errors Alert"
  event_template {
    description = <<-EOT
    The {metricname} value was {alert_condition} {threshold}.

    Amplify details: {dims}.

    If assistance is needed, please reach out to #di-aws-control-tower.
    EOT

    davis_merge = true
    event_type  = "ERROR"
    title       = "TEAM Amplify 5xx Errors Alert"
  }
  model_properties {
    type               = "STATIC_THRESHOLD"
    alert_condition    = "ABOVE"
    threshold          = 0
    alert_on_no_data   = false
    violating_samples  = 1
    samples            = 3
    dealerting_samples = 3
  }
  query_definition {
    type            = "METRIC_SELECTOR"
    metric_selector = "cloud.aws.amplifyhosting.5xxErrorsByAccountIdRegion:sum:filter(and(eq(\"aws.account.id\",${var.team_account_id}))):splitBy(\"aws.account.id\")"
  }
}

resource "dynatrace_metric_events" "team_amplify_high_latency" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Amplify High Latency Alert"
  event_template {
    description = <<-EOT
    The {metricname} value was {alert_condition} normal behavior.

    Amplify details: {dims}.
    
    If assistance is needed, please reach out to #di-aws-control-tower.
    EOT

    davis_merge = true
    event_type  = "SLOWDOWN"
    title       = "TEAM Amplify High Latency Alert"
  }
  model_properties {
    type               = "AUTO_ADAPTIVE_THRESHOLD"
    alert_condition    = "ABOVE"
    alert_on_no_data   = false
    violating_samples  = 1
    samples            = 3
    dealerting_samples = 3
    signal_fluctuation = 1
  }
  query_definition {
    type            = "METRIC_SELECTOR"
    metric_selector = "cloud.aws.amplifyhosting.latencyByAccountIdRegion:filter(and(eq(\"aws.account.id\",${var.team_account_id}))):splitBy(\"aws.account.id\")"
  }
}

# DynamoDB
resource "dynatrace_metric_events" "team_dynamodb_read_throttles" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM DynamoDB Read Throttle Alert"
  event_template {
    description = <<-EOT
    The {metricname} value was {alert_condition} normal behavior.
    
    DynamoDB details: {dims}.
    
    If assistance is needed, please reach out to #di-aws-control-tower.
    EOT

    davis_merge = true
    event_type  = "SLOWDOWN"
    title       = "TEAM DynamoDB Read Throttle Alert"
  }
  model_properties {
    type               = "AUTO_ADAPTIVE_THRESHOLD"
    alert_condition    = "ABOVE"
    alert_on_no_data   = false
    violating_samples  = 1
    samples            = 3
    dealerting_samples = 3
    signal_fluctuation = 1
  }
  query_definition {
    type            = "METRIC_SELECTOR"
    metric_selector = "cloud.aws.dynamodb.readThrottleEventsByAccountIdRegionTableName:sum:filter(and(or(contains(\"tablename\",\"-main\")),eq(\"aws.account.id\",${var.team_account_id}):splitBy(\"tablename\")"
  }
}

resource "dynatrace_metric_events" "team_dynamodb_user_error" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM DynamoDB User Error Alert"
  event_template {
    description = <<-EOT
    The {metricname} value was {alert_condition} {threshold}.

    DynamoDB details: {dims}.
    
    If assistance is needed, please reach out to #di-aws-control-tower.
    EOT

    davis_merge = true
    event_type  = "ERROR"
    title       = "TEAM DynamoDB User Error Alert"
  }
  model_properties {
    type               = "STATIC_THRESHOLD"
    alert_condition    = "ABOVE"
    threshold          = 0
    alert_on_no_data   = false
    violating_samples  = 1
    samples            = 3
    dealerting_samples = 3
  }
  query_definition {
    type            = "METRIC_SELECTOR"
    metric_selector = "cloud.aws.dynamodb.userErrorsByAccountIdRegion:sum:filter(and(or(contains(\"tablename\",\"-main\")),eq(\"aws.account.id\",${var.team_account_id}):splitBy(\"tablename\")"
  }
}

resource "dynatrace_metric_events" "team_dynamodb_write_throttles" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM DynamoDB Write Throttle Alert"
  event_template {
    description = <<-EOT
    The {metricname} value was {alert_condition} normal behavior.
    
    DynamoDB details: {dims}.
    
    If assistance is needed, please reach out to #di-aws-control-tower.
    EOT

    davis_merge = true
    event_type  = "SLOWDOWN"
    title       = "TEAM DynamoDB Write Throttle Alert"
  }
  model_properties {
    type               = "AUTO_ADAPTIVE_THRESHOLD"
    alert_condition    = "ABOVE"
    alert_on_no_data   = false
    violating_samples  = 1
    samples            = 3
    dealerting_samples = 3
    signal_fluctuation = 1
  }
  query_definition {
    type            = "METRIC_SELECTOR"
    metric_selector = "cloud.aws.dynamodb.writeThrottleEventsByAccountIdRegionTableName:sum:filter(and(or(eq(\"aws.account.id\",${var.team_account_id}),contains(\"tablename\",\"-main\")))):splitBy(\"tablename\")"
  }
}

resource "dynatrace_metric_events" "team_dynamodb_server_error" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM DynamoDB Server Error Alert"
  event_template {
    description = <<-EOT
    The {metricname} value was {alert_condition} {threshold}.
    
    DynamoDB details: {dims}.
    
    If assistance is needed, please reach out to #di-aws-control-tower.
    EOT

    davis_merge = true
    event_type  = "SLOWDOWN"
    title       = "TEAM DynamoDB Server Error Alert"
  }
  model_properties {
    type               = "STATIC_THRESHOLD"
    alert_condition    = "ABOVE"
    threshold          = 0
    alert_on_no_data   = false
    violating_samples  = 1
    samples            = 3
    dealerting_samples = 3
  }
  query_definition {
    type            = "METRIC_SELECTOR"
    metric_selector = "cloud.aws.dynamodb.systemErrorsByAccountIdOperationRegionTableName:sum:filter(and(or(eq(\"aws.account.id\",${var.team_account_id}),contains(\"tablename\",\"-main\")):splitBy(\"tablename\")"
  }
}

# Lambda
resource "dynatrace_metric_events" "team_lambda_error" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Lambda Error Alert"
  event_template {
    description = <<-EOT
    The {metricname} value was {alert_condition} {threshold}.
    
    Lambda function details: {dims}.
    
    If assistance is needed, please reach out to #di-aws-control-tower.
    EOT

    davis_merge = true
    event_type  = "ERROR"
    title       = "TEAM Lambda Error Alert"
  }
  model_properties {
    type               = "STATIC_THRESHOLD"
    alert_condition    = "ABOVE"
    threshold          = 0
    alert_on_no_data   = false
    violating_samples  = 1
    samples            = 3
    dealerting_samples = 3
  }
  query_definition {
    type            = "METRIC_SELECTOR"
    metric_selector = "cloud.aws.lambda.errorsByAccountIdFunctionNameRegionResource:sum:filter(and(eq(\"aws.account.id\",${var.team_account_id}), contains(\"functionname\", \"-main\"))):splitBy(\"functionname\")"
  }
}

resource "dynatrace_metric_events" "team_lambda_throttles" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Lambda Throttle Alert"
  event_template {
    description = <<-EOT
    The {metricname} value was {alert_condition} {threshold}.
    
    Lambda function details: {dims}.
    
    If assistance is needed, please reach out to #di-aws-control-tower.
    EOT

    davis_merge = true
    event_type  = "ERROR"
    title       = "TEAM Lambda Throttle Alert"
  }
  model_properties {
    type               = "STATIC_THRESHOLD"
    alert_condition    = "ABOVE"
    threshold          = 0
    alert_on_no_data   = false
    violating_samples  = 1
    samples            = 3
    dealerting_samples = 3
  }
  query_definition {
    type            = "METRIC_SELECTOR"
    metric_selector = "cloud.aws.lambda.throttlesByAccountIdFunctionNameRegion:sum:filter(and(eq(\"aws.account.id\",${var.team_account_id}), contains(\"functionname\", \"-main\"))):splitBy(\"functionname\")"
  }
}

# Step Functions
resource "dynatrace_metric_events" "team_step_functions_execution_duration" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Step Functions Execution Duration Alert"
  event_template {
    description = <<-EOT
    The {metricname} value was {alert_condition} normal behavior.

    Step function details: {dims}.

    If assistance is needed, please reach out to #di-aws-control-tower.
    EOT

    davis_merge = true
    event_type  = "SLOWDOWN"
    title       = "TEAM Step Functions Execution Duration Alert"
  }
  model_properties {
    type               = "AUTO_ADAPTIVE_THRESHOLD"
    alert_condition    = "ABOVE"
    alert_on_no_data   = false
    violating_samples  = 1
    samples            = 3
    dealerting_samples = 3
    signal_fluctuation = 1
  }
  query_definition {
    type            = "METRIC_SELECTOR"
    metric_selector = "cloud.aws.states.executionTimeByAccountIdRegionStateMachineArn:sort(value(auto,descending)):filter(and(or(eq(\"aws.account.id\", ${var.team_account_id})))):splitBy(statemachinearn)"
  }
}

resource "dynatrace_metric_events" "team_step_functions_execution_duration_exceed" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Step Functions Execution Duration Exceeded 9 Hours Alert"
  event_template {
    description = <<-EOT
    The {metricname} value was {alert_condition} the allowed TEAM session duration of 9.1 hours.

    Step function details: {dims}.

    Follow the steps outlined in the official TEAM documentation to revoke the session that has exceeded 9 hours:
    https://aws-samples.github.io/iam-identity-center-team/docs/guides/approver.html#revoke-elevated-access

    If assistance is needed, please reach out to #di-aws-control-tower.
    EOT

    davis_merge = true
    event_type  = "SLOWDOWN"
    title       = "TEAM Step Functions Execution Duration Exceeded 9 Hours Alert"
  }
  model_properties {
    type               = "STATIC_THRESHOLD"
    alert_condition    = "ABOVE"
    threshold          = 32760000 # 9.1 hours in milliseconds
    alert_on_no_data   = false
    violating_samples  = 1
    samples            = 3
    dealerting_samples = 3
  }
  query_definition {
    type            = "METRIC_SELECTOR"
    metric_selector = "cloud.aws.states.executionTimeByAccountIdRegionStateMachineArn:max:filter(and(eq(\"aws.account.id\", ${var.team_account_id}),contains(\"statemachinearn\",\"TEAM-Grant-SM-main\"))):splitBy(statemachinearn)"
  }
}

resource "dynatrace_metric_events" "team_step_functions_execution_aborted" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Step Functions Execution Aborted Alert"
  event_template {
    description = <<-EOT
    The {metricname} value was {alert_condition} {threshold}.
    
    Step function details: {dims}.
    
    If assistance is needed, please reach out to #di-aws-control-tower.
    EOT

    davis_merge = true
    event_type  = "ERROR"
    title       = "TEAM Step Functions Execution Aborted Alert"
  }
  model_properties {
    type               = "STATIC_THRESHOLD"
    alert_condition    = "ABOVE"
    threshold          = 0
    alert_on_no_data   = false
    violating_samples  = 1
    samples            = 3
    dealerting_samples = 3
  }
  query_definition {
    type            = "METRIC_SELECTOR"
    metric_selector = "cloud.aws.states.executionsAbortedByAccountIdRegionStateMachineArn:sum:filter(and(or(eq(\"aws.account.id\",${var.team_account_id}):splitBy(statemachinearn)"
  }
}

resource "dynatrace_metric_events" "team_step_functions_execution_failed" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Step Functions Execution Failed Alert"
  event_template {
    description = <<-EOT
    The {metricname} value was {alert_condition} {threshold}.

    Step function details: {dims}.

    If assistance is needed, please reach out to #di-aws-control-tower.
    EOT

    davis_merge = true
    event_type  = "ERROR"
    title       = "TEAM Step Functions Execution Failed Alert"
  }
  model_properties {
    type               = "STATIC_THRESHOLD"
    alert_condition    = "ABOVE"
    threshold          = 0
    alert_on_no_data   = false
    violating_samples  = 1
    samples            = 3
    dealerting_samples = 3
  }
  query_definition {
    type            = "METRIC_SELECTOR"
    metric_selector = "cloud.aws.states.executionsFailedByAccountIdRegionStateMachineArn:sum:filter(and(or(eq(\"aws.account.id\",${var.team_account_id})))):splitBy(statemachinearn)"
  }
}

################################################################
# Alerts Specific to TEAM Policy Publishing Function Resources #
################################################################

# Lambda
resource "dynatrace_metric_events" "team_policy_lambda_error" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Policy Publishing Function Lambda Error Alert"
  event_template {
    description = <<-EOT
    The {metricname} value was {alert_condition} {threshold}.

    Lambda function details: {dims}.

    Follow the runbook at https://govukverify.atlassian.net/wiki/spaces/PLAT/pages/5286527019/T.E.A.M+Policy+resync to resync the TEAM policies.

    If assistance is needed, please reach out to #di-aws-control-tower.
    EOT

    davis_merge = true
    event_type  = "ERROR"
    title       = "TEAM Policy Publishing Function Lambda Error Alert"
  }
  model_properties {
    type               = "STATIC_THRESHOLD"
    alert_condition    = "ABOVE"
    threshold          = 0
    alert_on_no_data   = false
    violating_samples  = 1
    samples            = 3
    dealerting_samples = 3
  }
  query_definition {
    type            = "METRIC_SELECTOR"
    metric_selector = "cloud.aws.lambda.errorsByAccountIdFunctionNameRegion:sum:filter(prefix(\"functionname\",\"TEAMPolicyLambda-PolicyPublishingFunction\")):splitBy(\"functionname\")"
  }
}

resource "dynatrace_metric_events" "team_policy_lambda_throttles" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Policy Publishing Function Lambda Throttle Alert"
  event_template {
    description = <<-EOT
    The {metricname} value was {alert_condition} {threshold}.
    
    Lambda function details: {dims}.
    
    Follow the runbook at https://govukverify.atlassian.net/wiki/spaces/PLAT/pages/5286527019/T.E.A.M+Policy+resync to resync the TEAM policies.

    If assistance is needed, please reach out to #di-aws-control-tower.
    EOT

    davis_merge = true
    event_type  = "SLOWDOWN"
    title       = "TEAM Policy Publishing Function Lambda Throttle Alert"
  }
  model_properties {
    type               = "STATIC_THRESHOLD"
    alert_condition    = "ABOVE"
    threshold          = 0
    alert_on_no_data   = false
    violating_samples  = 1
    samples            = 3
    dealerting_samples = 3
  }
  query_definition {
    type            = "METRIC_SELECTOR"
    metric_selector = "cloud.aws.lambda.throttlesByAccountIdFunctionNameRegion:sum:filter(prefix(\"functionname\",\"TEAMPolicyLambda-PolicyPublishingFunction\")):splitBy(\"functionname\")"
  }
}

# Dead Letter Queue
resource "dynatrace_metric_events" "team_policy_dlq_messages" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Policy Publishing Function DLQ Message Alert"
  event_template {
    description = <<-EOT
    The {metricname} value was {alert_condition} {threshold}.

    Dead-letter queue details: {dims}.

    Follow the runbook at https://govukverify.atlassian.net/wiki/spaces/PLAT/pages/5286527019/T.E.A.M+Policy+resync to resync the TEAM policies.

    If assistance is needed, please reach out to #di-aws-control-tower.
    EOT

    davis_merge = true
    event_type  = "ERROR"
    title       = "TEAM Policy Publishing Function DLQ Message Alert"
  }
  model_properties {
    type               = "STATIC_THRESHOLD"
    alert_condition    = "ABOVE"
    threshold          = 0
    alert_on_no_data   = false
    violating_samples  = 1
    samples            = 3
    dealerting_samples = 3
  }
  query_definition {
    type            = "METRIC_SELECTOR"
    metric_selector = "cloud.aws.sqs.approximateNumberOfMessagesVisibleByAccountIdQueueNameRegion:filter(eq(\"queuename\",\"TEAMPolicyPublishingFunctionDLQ\")):splitBy(\"queuename\")"
  }
}

# DynamoDB
resource "dynatrace_metric_events" "team_policy_dynamodb_approvers_server_error" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Policy Publishing Function Approvers Table Server Error Alert"
  event_template {
    description = <<-EOT
    The {metricname} value was {alert_condition} {threshold}.

    DynamoDB details: {dims}.
    
    Follow the runbook at https://govukverify.atlassian.net/wiki/spaces/PLAT/pages/5286527019/T.E.A.M+Policy+resync to resync the TEAM policies.

    If assistance is needed, please reach out to #di-aws-control-tower.
    EOT

    davis_merge = true
    event_type  = "ERROR"
    title       = "TEAM Policy Publishing Function Approvers Table Server Error Alert"
  }
  model_properties {
    type               = "STATIC_THRESHOLD"
    alert_condition    = "ABOVE"
    threshold          = 0
    alert_on_no_data   = false
    violating_samples  = 1
    samples            = 3
    dealerting_samples = 3
  }
  query_definition {
    type            = "METRIC_SELECTOR"
    metric_selector = "cloud.aws.dynamodb.systemErrorsByAccountIdOperationRegionTableName:sum:filter(and(eq(\"aws.account.id\",${var.team_account_id}),prefix(\"tablename\",\"Approvers\"))):splitBy(tablename)"
  }
}

resource "dynatrace_metric_events" "team_policy_dynamodb_eligibility_server_error" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Policy Publishing Function Eligibility Table Server Error Alert"
  event_template {
    description = <<-EOT
    The {metricname} value was {alert_condition} {threshold}.
    
    DynamoDB details: {dims}.
    
    Follow the runbook at https://govukverify.atlassian.net/wiki/spaces/PLAT/pages/5286527019/T.E.A.M+Policy+resync to resync the TEAM policies.

    If assistance is needed, please reach out to #di-aws-control-tower.
    EOT

    davis_merge = true
    event_type  = "ERROR"
    title       = "TEAM Policy Publishing Function Eligibility Table Server Error Alert"
  }
  model_properties {
    type               = "STATIC_THRESHOLD"
    alert_condition    = "ABOVE"
    threshold          = 0
    alert_on_no_data   = false
    violating_samples  = 1
    samples            = 3
    dealerting_samples = 3
  }
  query_definition {
    type            = "METRIC_SELECTOR"
    metric_selector = "cloud.aws.dynamodb.systemErrorsByAccountIdOperationRegionTableName:sum:filter(and(eq(\"aws.account.id\",${var.team_account_id}),prefix(\"tablename\",\"Eligibility\"))):splitBy(tablename)"
  }
}

resource "dynatrace_metric_events" "team_policy_dynamodb_approvers_throttles" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Policy Publishing Function Approvers Table User Throttle Alert"
  event_template {
    description = <<-EOT
    The {metricname} value was {alert_condition} {threshold}.
    
    DynamoDB details: {dims}.
    
    Follow the runbook at https://govukverify.atlassian.net/wiki/spaces/PLAT/pages/5286527019/T.E.A.M+Policy+resync to resync the TEAM policies.

    If assistance is needed, please reach out to #di-aws-control-tower.
    EOT

    davis_merge = true
    event_type  = "SLOWDOWN"
    title       = "TEAM Policy Publishing Function Approvers Table User Throttle Alert"
  }
  model_properties {
    type               = "STATIC_THRESHOLD"
    alert_condition    = "ABOVE"
    threshold          = 0
    alert_on_no_data   = false
    violating_samples  = 1
    samples            = 3
    dealerting_samples = 3
  }
  query_definition {
    type            = "METRIC_SELECTOR"
    metric_selector = "cloud.aws.dynamodb.throttledRequestsByAccountIdOperationRegionTableName:sum:filter(and(eq(\"aws.account.id\",${var.team_account_id}),prefix(\"tablename\",\"Approvers\"))):splitBy(tablename)"
  }
}

resource "dynatrace_metric_events" "team_policy_dynamodb_eligibility_throttles" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Policy Publishing Function Eligibility Table Throttle Alert"
  event_template {
    description = <<-EOT
    The {metricname} value was {alert_condition} {threshold}.
    
    DynamoDB details: {dims}.
    
    Follow the runbook at https://govukverify.atlassian.net/wiki/spaces/PLAT/pages/5286527019/T.E.A.M+Policy+resync to resync the TEAM policies.

    If assistance is needed, please reach out to #di-aws-control-tower.
    EOT

    davis_merge = true
    event_type  = "SLOWDOWN"
    title       = "TEAM Policy Publishing Function Eligibility Table Throttle Alert"
  }
  model_properties {
    type               = "STATIC_THRESHOLD"
    alert_condition    = "ABOVE"
    threshold          = 0
    alert_on_no_data   = false
    violating_samples  = 1
    samples            = 3
    dealerting_samples = 3
  }
  query_definition {
    type            = "METRIC_SELECTOR"
    metric_selector = "cloud.aws.dynamodb.throttledRequestsByAccountIdOperationRegionTableName:sum:filter(and(eq(\"aws.account.id\",${var.team_account_id}),prefix(\"tablename\",\"Eligibility\"))):splitBy(tablename)"
  }
}