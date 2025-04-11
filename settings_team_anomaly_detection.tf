###############################
# TEAM Specific Metric Events #
###############################

# Amplify
resource "dynatrace_metric_events" "team_amplify_5xx_errors" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Amplify 5xx Errors Alert"
  event_template {
    description = "The {metricname} value was {alert_condition} {threshold}. Amplify details: {dims}"
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
    metric_selector = "cloud.aws.amplifyhosting.5xxErrorsByAccountIdRegion:filter(and(or(eq(\"aws.account.id\",${var.team_account_id})))):sort(value(auto,descending)):limit(20)"
  }
}

resource "dynatrace_metric_events" "team_amplify_high_latency" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Amplify High Latency Alert"
  event_template {
    description = "The {metricname} value was {alert_condition} normal behavior. Amplify details: {dims}"
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
    metric_selector = "cloud.aws.amplifyhosting.latencyByAccountIdRegion:filter(and(or(eq(\"aws.account.id\",${var.team_account_id})))):sort(value(auto,descending)):limit(20)"
  }
}

# Appsync
resource "dynatrace_metric_events" "team_appsync_connect_client_error" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Appsync Connect Client Error Alert"
  event_template {
    description = "The {metricname} value was {alert_condition} {threshold}. Appsync details: {dims}"
    davis_merge = true
    event_type  = "ERROR"
    title       = "TEAM Appsync Connect Client Error Alert"
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
    metric_selector = "cloud.aws.appsync.connectClientErrorByAccountIdGraphQLAPIIdRegion:sort(value(auto,descending)):limit(20):filter(and(or(eq(\"aws.account.id\",${var.team_account_id}))))"
  }
}

resource "dynatrace_metric_events" "team_appsync_connect_server_error" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Appsync Connect Server Error Alert"
  event_template {
    description = "The {metricname} value was {alert_condition} {threshold}. Appsync details: {dims}"
    davis_merge = true
    event_type  = "ERROR"
    title       = "TEAM Appsync Connect Client Server Alert"
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
    metric_selector = "cloud.aws.appsync.connectServerErrorByAccountIdGraphQLAPIIdRegion:sort(value(auto,descending)):limit(20):filter(and(or(eq(\"aws.account.id\",${var.team_account_id}))))"
  }
}

resource "dynatrace_metric_events" "team_appsync_disconnect_client_error" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Appsync Disconnect Client Error Alert"
  event_template {
    description = "The {metricname} value was {alert_condition} {threshold}. Appsync details: {dims}"
    davis_merge = true
    event_type  = "ERROR"
    title       = "TEAM Appsync Disconnect Client Error Alert"
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
    metric_selector = "cloud.aws.appsync.disconnectClientErrorByAccountIdGraphQLAPIIdRegion:sort(value(auto,descending)):limit(20):filter(and(or(eq(\"aws.account.id\",${var.team_account_id}))))"
  }
}

resource "dynatrace_metric_events" "team_appsync_disconnect_server_error" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Appsync Disconnect Server Error Alert"
  event_template {
    description = "The {metricname} value was {alert_condition} {threshold}. Appsync details: {dims}"
    davis_merge = true
    event_type  = "ERROR"
    title       = "TEAM Appsync Disconnect Client Server Alert"
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
    metric_selector = "cloud.aws.appsync.disconnectServerErrorByAccountIdGraphQLAPIIdRegion:sort(value(auto,descending)):limit(20):filter(and(or(eq(\"aws.account.id\",${var.team_account_id}))))"
  }
}

resource "dynatrace_metric_events" "team_appsync_subscribe_client_error" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Appsync Subscribe Client Error Alert"
  event_template {
    description = "The {metricname} value was {alert_condition} {threshold}. Appsync details: {dims}"
    davis_merge = true
    event_type  = "ERROR"
    title       = "TEAM Appsync Subscribe Client Error Alert"
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
    metric_selector = "cloud.aws.appsync.subscribeClientErrorByAccountIdGraphQLAPIIdRegion:sort(value(auto,descending)):limit(20):filter(and(or(eq(\"aws.account.id\",${var.team_account_id}))))"
  }
}

resource "dynatrace_metric_events" "team_appsync_subscribe_server_error" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Appsync Subscribe Server Error Alert"
  event_template {
    description = "The {metricname} value was {alert_condition} {threshold}. Appsync details: {dims}"
    davis_merge = true
    event_type  = "ERROR"
    title       = "TEAM Appsync Subscribe Server Error Alert"
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
    metric_selector = "cloud.aws.appsync.subscribeServerErrorByAccountIdGraphQLAPIIdRegion:sort(value(auto,descending)):limit(20):filter(and(or(eq(\"aws.account.id\",${var.team_account_id}))))"
  }
}

resource "dynatrace_metric_events" "team_appsync_unsubscribe_client_error" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Appsync Unsubscribe Client Error Alert"
  event_template {
    description = "The {metricname} value was {alert_condition} {threshold}. Appsync details: {dims}"
    davis_merge = true
    event_type  = "ERROR"
    title       = "TEAM Appsync Unsubscribe Client Error Alert"
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
    metric_selector = "cloud.aws.appsync.unsubscribeClientErrorByAccountIdGraphQLAPIIdRegion:sort(value(auto,descending)):limit(20):filter(and(or(eq(\"aws.account.id\",${var.team_account_id}))))"
  }
}

resource "dynatrace_metric_events" "team_appsync_unsubscribe_server_error" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Appsync Unsubscribe Sever Error Alert"
  event_template {
    description = "The {metricname} value was {alert_condition} {threshold}. Appsync details: {dims}"
    davis_merge = true
    event_type  = "ERROR"
    title       = "TEAM Appsync Unsubscribe Sever Error Alert"
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
    metric_selector = "cloud.aws.appsync.unsubscribeServerErrorByAccountIdGraphQLAPIIdRegion:sort(value(auto,descending)):limit(20):filter(and(or(eq(\"aws.account.id\",${var.team_account_id}))))"
  }
}

# DynamoDB
resource "dynatrace_metric_events" "team_dynamodb_read_capacity_consumption" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM DynamoDB Read Capacity Consumption Alert"
  event_template {
    description = "The {metricname} value was {alert_condition} normal behavior. DynamoDB details: {dims}"
    davis_merge = true
    event_type  = "RESOURCE"
    title       = "TEAM DynamoDB Read Capacity Consumption Alert"
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
    metric_selector = "cloud.aws.dynamodb.consumedReadCapacityUnitsByAccountIdRegionTableName:filter(and(contains(\"tablename\",\"-main\")), eq(\"aws.account.id\",${var.team_account_id})):splitBy(tablename):sort(value(auto,descending)):limit(20)"
  }
}

resource "dynatrace_metric_events" "team_dynamodb_read_throttles" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM DynamoDB Read Throttle Alert"
  event_template {
    description = "The {metricname} value was {alert_condition} normal behavior. DynamoDB details: {dims}"
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
    metric_selector = "cloud.aws.dynamodb.readThrottleEventsByAccountIdRegionTableName:filter(and(or(contains(\"tablename\",\"-main\")),eq(\"aws.account.id\", ${var.team_account_id}))):splitBy(\"tablename\"):sort(value(auto,descending)):limit(20)"
  }
}

resource "dynatrace_metric_events" "team_dynamodb_user_error" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM DynamoDB User Error Alert"
  event_template {
    description = "The {metricname} value was {alert_condition} {threshold}. DynamoDB details: {dims}"
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
    metric_selector = "cloud.aws.dynamodb.userErrorsByAccountIdRegion:filter(and(or(contains(\"tablename\",\"-main\")),eq(\"aws.account.id\", ${var.team_account_id}))):splitBy(\"tablename\"):sort(value(auto,descending)):limit(20)"
  }
}

resource "dynatrace_metric_events" "team_dynamodb_write_capacity_consumption" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM DynamoDB Write Capacity Consumption Alert"
  event_template {
    description = "The {metricname} value was {alert_condition} normal behavior. DynamoDB details: {dims}"
    davis_merge = true
    event_type  = "RESOURCE"
    title       = "TEAM DynamoDB Write Capacity Consumption Alert"
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
    metric_selector = "cloud.aws.dynamodb.consumedWriteCapacityUnitsByAccountIdRegionTableName:filter(and(or(contains(\"tablename\",\"-main\")),eq(\"aws.account.id\", ${var.team_account_id}))):splitBy(\"tablename\"):sort(value(auto,descending)):limit(20)"
  }
}

resource "dynatrace_metric_events" "team_dynamodb_write_throttles" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM DynamoDB Write Throttle Alert"
  event_template {
    description = "The {metricname} value was {alert_condition} normal behavior. DynamoDB details: {dims}"
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
    metric_selector = "cloud.aws.dynamodb.writeThrottleEventsByAccountIdRegionTableName:filter(and(or(contains(\"tablename\",\"-main\")),eq(\"aws.account.id\", ${var.team_account_id}))):splitBy(\"tablename\"):sort(value(auto,descending)):limit(20)"
  }
}

resource "dynatrace_metric_events" "team_dynamodb_server_error" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM DynamoDB Server Error Alert"
  event_template {
    description = "The {metricname} value was {alert_condition} {threshold}. DynamoDB details: {dims}"
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
    metric_selector = "cloud.aws.dynamodb.systemErrorsByAccountIdOperationRegionTableName:filter(and(or(eq(\"aws.account.id\", ${var.team_account_id}))),contains(\"tablename\",\"-main\")):splitBy(aws.region):sort(value(auto,descending)):limit(20)"
  }
}

# Lambda
resource "dynatrace_metric_events" "team_lambda_error" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Lambda Error Alert"
  event_template {
    description = "The {metricname} value was {alert_condition} {threshold}. Function details: {dims}"
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
    metric_selector = "cloud.aws.lambda.errorsByAccountIdFunctionNameRegionResource:filter(and(eq(\"aws.account.id\", ${var.team_account_id}), contains(\"functionname\", \"-main\"))):splitBy(\"functionname\"):sort(value(auto,descending)):limit(20)"
  }
}

resource "dynatrace_metric_events" "team_lambda_throttles" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Lambda Throttle Alert"
  event_template {
    description = "The {metricname} value was {alert_condition} {threshold}. Function details: {dims}"
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
    metric_selector = "cloud.aws.lambda.throttlesByAccountIdFunctionNameRegion:filter(and(eq(\"aws.account.id\", ${var.team_account_id}), contains(\"functionname\", \"-main\"))):splitBy(\"functionname\"):sort(value(auto,descending)):limit(20)"
  }
}

# Step Functions
resource "dynatrace_metric_events" "team_step_functions_execution_duration" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Step Functions Execution Duration Alert"
  event_template {
    description = "The {metricname} value was {alert_condition} normal behavior."
    davis_merge = true
    event_type  = "ERROR"
    title       = "TEAM Step Functions Execution Duration Alert"
  }
  model_properties {
    type               = "STATIC_THRESHOLD"
    alert_condition    = "ABOVE"
    threshold          = 8
    alert_on_no_data   = false
    violating_samples  = 1
    samples            = 3
    dealerting_samples = 3
  }
  query_definition {
    type            = "METRIC_SELECTOR"
    metric_selector = "cloud.aws.states.executionTimeByAccountIdRegionStateMachineArn:sort(value(auto,descending)):filter(and(or(eq(\"aws.account.id\", ${var.team_account_id})))):splitBy(statemachinearn)"
  }
}

resource "dynatrace_metric_events" "team_step_functions_execution_aborted" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Step Functions Execution Aborted Alert"
  event_template {
    description = "The {metricname} value was {alert_condition} normal behavior."
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
    metric_selector = "cloud.aws.states.executionsAbortedByAccountIdRegionStateMachineArn:filter(and(or(eq(\"aws.account.id\",${var.team_account_id})))):splitBy(statemachinearn):sum:sort(value(sum,descending)):limit(20)"
  }
}

resource "dynatrace_metric_events" "team_step_functions_execution_failed" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Step Functions Execution Failed Alert"
  event_template {
    description = "The {metricname} value was {alert_condition} normal behavior."
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
    metric_selector = "cloud.aws.states.executionsFailedByAccountIdRegionStateMachineArn:filter(and(or(eq(\"aws.account.id\",${var.team_account_id})))):splitBy(statemachinearn):sum:sort(value(sum,descending)):limit(20)"
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
    description = "The {metricname} value was {alert_condition} {threshold}. Function details: {dims}"
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
    metric_selector = "cloud.aws.lambda.errorsByAccountIdFunctionNameRegion:filter(prefix(\"functionname\",\"TEAMPolicyLambda-PolicyPublishingFunction\"))"
  }
}

resource "dynatrace_metric_events" "team_policy_lambda_throttles" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Policy Publishing Function Lambda Throttle Alert"
  event_template {
    description = "The {metricname} value was {alert_condition} {threshold}. Function details: {dims}"
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
    metric_selector = "cloud.aws.lambda.throttlesByAccountIdFunctionNameRegion:filter(prefix(\"functionname\",\"TEAMPolicyLambda-PolicyPublishingFunction\"))"
  }
}

# Dead Letter Queue
resource "dynatrace_metric_events" "team_policy_dlq_messages" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Policy Publishing Function DLQ Message Alert"
  event_template {
    description = "The {metricname} value was {alert_condition} normal behavior."
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
    metric_selector = "cloud.aws.sqs.approximateNumberOfMessagesVisibleByAccountIdQueueNameRegion:filter(and(eq(\"aws.account.id\",${var.team_account_id}),eq(\"queuename\",\"TEAMPolicyPublishingFunctionDLQ\")))"
  }
}

# DynamoDB
resource "dynatrace_metric_events" "team_policy_dynamodb_approvers_server_error" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Policy Publishing Function Approvers Table Server Error Alert"
  event_template {
    description = "The {metricname} value was {alert_condition} {threshold}. DynamoDB details: {dims}"
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
    metric_selector = "cloud.aws.dynamodb.systemErrorsByAccountIdOperationRegionTableName:filter(and(eq(\"aws.account.id\",${var.team_account_id}),prefix(\"tablename\",\"Approvers\"))):splitBy(\"aws.account.id\",tablename):sort(value(auto,descending)):limit(20)"
  }
}

resource "dynatrace_metric_events" "team_policy_dynamodb_eligibility_server_error" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Policy Publishing Function Eligibility Table Server Error Alert"
  event_template {
    description = "The {metricname} value was {alert_condition} {threshold}. DynamoDB details: {dims}"
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
    metric_selector = "cloud.aws.dynamodb.systemErrorsByAccountIdOperationRegionTableName:filter(and(eq(\"aws.account.id\",${var.team_account_id}),prefix(\"tablename\",\"Eligibility\"))):splitBy(\"aws.account.id\",tablename):sort(value(auto,descending)):limit(20)"
  }
}

resource "dynatrace_metric_events" "team_policy_dynamodb_approvers_throttles" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Policy Publishing Function Approvers Table User Throttle Alert"
  event_template {
    description = "The {metricname} value was {alert_condition} {threshold}. DynamoDB details: {dims}"
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
    metric_selector = "cloud.aws.dynamodb.throttledRequestsByAccountIdOperationRegionTableName:filter(and(eq(\"aws.account.id\",${var.team_account_id}),prefix(\"tablename\",\"Approvers\"))):splitBy(\"aws.account.id\",tablename):sort(value(auto,descending)):limit(20)"
  }
}

resource "dynatrace_metric_events" "team_policy_dynamodb_eligibility_throttles" {
  count   = local.is_production ? 1 : 0
  enabled = true
  summary = "TEAM Policy Publishing Function Eligibility Table Throttle Alert"
  event_template {
    description = "The {metricname} value was {alert_condition} {threshold}. DynamoDB details: {dims}"
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
    metric_selector = "cloud.aws.dynamodb.throttledRequestsByAccountIdOperationRegionTableName:filter(and(eq(\"aws.account.id\",${var.team_account_id}),prefix(\"tablename\",\"Eligibility\"))):splitBy(\"aws.account.id\",tablename):sort(value(auto,descending)):limit(20)"
  }
}