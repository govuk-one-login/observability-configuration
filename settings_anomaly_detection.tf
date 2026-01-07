# Web Applications - Anomaly detection for applications 
resource "dynatrace_web_app_anomalies" "web_app_anomalies" {
  error_rate {
    enabled                   = true
    error_rate_detection_mode = "auto"
    error_rate_auto {
      absolute_increase = 0
      relative_increase = 50
      over_alerting_protection {
        actions_per_minute     = 10
        minutes_abnormal_state = 1
      }
    }
  }
  response_time {
    enabled        = true
    detection_mode = "auto"
    response_time_auto {
      over_alerting_protection {
        actions_per_minute     = 10
        minutes_abnormal_state = 1
      }
      response_time_all {
        degradation_milliseconds = 100
        degradation_percent      = 50
      }
      response_time_slowest {
        slowest_degradation_milliseconds = 1000
        slowest_degradation_percent      = 100
      }
    }
  }
  traffic_drops {
    enabled = true
    traffic_drops {
      abnormal_state_abnormal_state = 1
      traffic_drop_percentage       = 50
    }
  }
  traffic_spikes {
    enabled = false
  }
}

# Mobile apps - Anomaly detection for mobile applications
resource "dynatrace_mobile_app_anomalies" "mobile_app_anomalies" {
  error_rate_increase {
    enabled        = true
    detection_mode = "auto"
    error_rate_increase_auto {
      threshold_absolute = 5
      threshold_relative = 50
    }
  }
  slow_user_actions {
    enabled        = true
    detection_mode = "auto"
    slow_user_actions_auto {
      duration_avoid_overalerting {
        min_action_rate = 10
      }
      duration_threshold_all {
        duration_threshold  = 200
        slowdown_percentage = 50
      }
      duration_threshold_slowest {
        duration_threshold  = 100
        slowdown_percentage = 100
      }
    }
  }
  unexpected_high_load {
    enabled = false
  }
  unexpected_low_load {
    enabled              = true
    threshold_percentage = 50
  }
}

# Mobile apps - Crash rate increase
resource "dynatrace_mobile_app_crash_rate" "mobile_app_crash_rate" {
  crash_rate_increase {
    enabled        = true
    detection_mode = "auto"
    crash_rate_increase_auto {
      baseline_violation_percentage = 150
      concurrent_users              = 100
      sensitivity                   = "low"
    }
  }
}
# Custom apps
resource "dynatrace_custom_app_anomalies" "custom_app_anomalies" {
  error_rate_increase {
    enabled        = true
    detection_mode = "auto"
    error_rate_increase_auto {
      threshold_absolute = 5
      threshold_relative = 50
    }
  }
  slow_user_actions {
    enabled        = true
    detection_mode = "auto"
    slow_user_actions_auto {
      duration_avoid_overalerting {
        min_action_rate = 10
      }
      duration_threshold_all {
        duration_threshold  = 100
        slowdown_percentage = 50
      }
      duration_threshold_slowest {
        duration_threshold  = 1000
        slowdown_percentage = 100
      }
    }
  }
  unexpected_high_load {
    enabled = false
  }
  unexpected_low_load {
    enabled              = true
    threshold_percentage = 50
  }
}

# Custom apps - Crash rate increase
resource "dynatrace_custom_app_crash_rate" "custom_app_crash_rate" {
  crash_rate_increase {
    enabled        = true
    detection_mode = "auto"
    crash_rate_increase_auto {
      baseline_violation_percentage = 150
      concurrent_users              = 100
      sensitivity                   = "low"
    }
  }
}

# Services
resource "dynatrace_service_anomalies_v2" "service_detection_anomalies" {
  failure_rate {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      absolute_increase = 40
      relative_increase = 50
      over_alerting_protection {
        minutes_abnormal_state = 5
        requests_per_minute    = 10
      }
    }
  }
  load_drops {
    enabled = false
  }
  load_spikes {
    enabled = false
  }
  response_time {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      over_alerting_protection {
        minutes_abnormal_state = 5
        requests_per_minute    = 10
      }
      response_time_all {
        degradation_milliseconds = 2000
        degradation_percent      = 50
      }
      response_time_slowest {
        slowest_degradation_milliseconds = 1000
        slowest_degradation_percent      = 100
      }
    }
  }
}

# Database services
resource "dynatrace_database_anomalies_v2" "database_anomalies" {
  scope = "environment"
  database_connections {
    enabled             = true
    max_failed_connects = 5
    time_period         = 5
  }
  failure_rate {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      absolute_increase = 0
      relative_increase = 50
      over_alerting_protection {
        minutes_abnormal_state = 5
        requests_per_minute    = 10
      }
    }
  }
  load_drops {
    enabled = false
  }
  load_spikes {
    enabled = false
  }
  response_time {
    enabled        = true
    detection_mode = "auto"
    auto_detection {
      over_alerting_protection {
        minutes_abnormal_state = 5
        requests_per_minute    = 10
      }
      response_time_all {
        degradation_milliseconds = 5
        degradation_percent      = 50
      }
      response_time_slowest {
        slowest_degradation_milliseconds = 20
        slowest_degradation_percent      = 100
      }
    }
  }
}

# Metric events
resource "dynatrace_metric_events" "amazon_ecs_cpu_utilization_by_service_name_aws" {
  count                      = local.is_production ? 0 : 1
  enabled                    = true
  event_entity_dimension_key = "dt.entity.custom_device"
  summary                    = "Amazon ECS CPU utilization (by service name) [AWS]"
  event_template {
    description = "The {metricname} value of {severity} was {alert_condition} your custom threshold of {threshold}."
    davis_merge = true
    event_type  = "RESOURCE"
    title       = "Amazon ECS CPU utilization (by service name) [AWS]"
  }
  model_properties {
    type               = "STATIC_THRESHOLD"
    alert_condition    = "ABOVE"
    alert_on_no_data   = false
    dealerting_samples = 10
    samples            = 10
    threshold          = 95
    violating_samples  = 3
  }
  query_definition {
    type        = "METRIC_KEY"
    aggregation = "AVG"
    metric_key  = "cloud.aws.ecs.cpuUtilizationByAccountIdClusterNameRegionServiceName"
    entity_filter {
    }
  }
}

resource "dynatrace_metric_events" "amazon_ecs_memory_utilization" {
  count                      = local.is_production ? 0 : 1
  enabled                    = true
  event_entity_dimension_key = "dt.entity.custom_device"
  summary                    = "Amazon ECS Memory utilization (by service name) [AWS]"
  event_template {
    description = "The {metricname} value of {severity} was {alert_condition} your custom threshold of {threshold}."
    davis_merge = true
    event_type  = "RESOURCE"
    title       = "Amazon ECS Memory utilization (by service name) [AWS]"
  }
  model_properties {
    type               = "STATIC_THRESHOLD"
    alert_condition    = "ABOVE"
    alert_on_no_data   = false
    dealerting_samples = 10
    samples            = 10
    threshold          = 95
    violating_samples  = 3
  }
  query_definition {
    type        = "METRIC_KEY"
    aggregation = "AVG"
    metric_key  = "cloud.aws.ecs.memoryUtilizationByAccountIdClusterNameRegionServiceName"
    entity_filter {
    }
  }
}

resource "dynatrace_metric_events" "aws_codebuild_cpu_utilized_percent" {
  count                      = local.is_production ? 0 : 1
  enabled                    = true
  event_entity_dimension_key = "dt.entity.custom_device"
  summary                    = "AWS CodeBuild CPU utilized percent (by build id/build number) [AWS]"
  event_template {
    description = "The {metricname} value of {severity} was {alert_condition} your custom threshold of {threshold}."
    davis_merge = true
    event_type  = "RESOURCE"
    title       = "AWS CodeBuild CPU utilized percent (by build id/build number) [AWS]"
  }
  model_properties {
    type               = "STATIC_THRESHOLD"
    alert_condition    = "ABOVE"
    alert_on_no_data   = false
    dealerting_samples = 10
    samples            = 10
    threshold          = 95
    violating_samples  = 3
  }
  query_definition {
    type        = "METRIC_KEY"
    aggregation = "AVG"
    metric_key  = "cloud.aws.codebuild.cpuUtilizedPercentByAccountIdBuildIdBuildNumberProjectNameRegion"
    entity_filter {
    }
  }
}

resource "dynatrace_metric_events" "aws_codebuild_memory_utilized_percent" {
  count                      = local.is_production ? 0 : 1
  enabled                    = true
  event_entity_dimension_key = "dt.entity.custom_device"
  summary                    = "AWS CodeBuild memory utilized percent (by build id/build number) [AWS]"
  event_template {
    description = "The {metricname} value of {severity} was {alert_condition} your custom threshold of {threshold}."
    davis_merge = true
    event_type  = "RESOURCE"
    title       = "AWS CodeBuild memory utilized percent (by build id/build number) [AWS]"
  }
  model_properties {
    type               = "STATIC_THRESHOLD"
    alert_condition    = "ABOVE"
    alert_on_no_data   = false
    dealerting_samples = 10
    samples            = 10
    threshold          = 95
    violating_samples  = 3
  }
  query_definition {
    type        = "METRIC_KEY"
    aggregation = "AVG"
    metric_key  = "cloud.aws.codebuild.memoryUtilizedPercentByAccountIdBuildIdBuildNumberProjectNameRegion"
    entity_filter {
    }
  }
}

# Transit Gateway Metric Events
## Send-Requests Lambda Errors
resource "dynatrace_metric_events" "tgw_egress_errors" {
  count                      = local.is_production ? 0 : 1
  enabled                    = true
  event_entity_dimension_key = "dt.entity.custom_device"
  summary                    = "Transit Gateway Production Hub has Egress Errors"
  event_template {
    description = "The {metricname} value of {severity} was {alert_condition} your custom threshold of {threshold}."
    davis_merge = true
    event_type  = "RESOURCE"
    title       = "Transit Gateway Production Hub has Egress Errors"
  }
  model_properties {
    type               = "STATIC_THRESHOLD"
    alert_condition    = "ABOVE"
    alert_on_no_data   = false
    dealerting_samples = 5
    samples            = 5
    threshold          = 0
    violating_samples  = 3
  }
  query_definition {
    type        = "METRIC_KEY"
    aggregation = "SUM"
    metric_key  = "cloud.aws.prod-hub-send-requests.prodhubsendrequestserrorsByAccountIdRegion"
    entity_filter {
    }
  }
}

## TGW Production NFW is blocking traffic
resource "dynatrace_metric_events" "tgw_egress_errors" {
  count                      = local.is_production ? 0 : 1
  enabled                    = true
  event_entity_dimension_key = "dt.entity.custom_device"
  summary                    = "Transit Gateway Production Hub Network Firewall is blocking traffic"
  event_template {
    description = "The {metricname} value of {severity} was {alert_condition} your custom threshold of {threshold}."
    davis_merge = true
    event_type  = "RESOURCE"
    title       = "Transit Gateway Production Hub  Network Firewall is blocking traffic"
  }
  model_properties {
    type               = "STATIC_THRESHOLD"
    alert_condition    = "ABOVE"
    alert_on_no_data   = false
    dealerting_samples = 5
    samples            = 5
    threshold          = 0
    violating_samples  = 3
  }
  query_definition {
    type        = "METRIC_KEY"
    aggregation = "SUM"
    metric_key  = "cloud.aws.networkfirewall.droppedPacketsByAccountIdAvailabilityZoneEngineFirewallNameRegion"
    dimension_filter {
      filter {
        dimension_key = "aws.account.id"
        dimension_value = "510900712898"
      }
    }
    entity_filter {
    }
  }
}

# Frequent issue detection
resource "dynatrace_frequent_issues" "frequent_issue_detection" {
  detect_apps  = true
  detect_txn   = true
  detect_infra = true
}


#Infrastructure
#Hosts
resource "dynatrace_host_anomalies_v2" "host_anomalies" {
  scope = "environment"
  host {
    connection_lost_detection {
      enabled               = true
      on_graceful_shutdowns = "DONT_ALERT_ON_GRACEFUL_SHUTDOWN"
    }
    high_cpu_saturation_detection {
      enabled        = true
      detection_mode = "auto"
    }
    high_gc_activity_detection {
      enabled        = true
      detection_mode = "auto"
    }
    high_memory_detection {
      enabled        = true
      detection_mode = "auto"
    }
    high_system_load_detection {
      enabled        = true
      detection_mode = "auto"
    }
    out_of_memory_detection {
      enabled        = true
      detection_mode = "auto"
    }
    out_of_threads_detection {
      enabled        = true
      detection_mode = "auto"
    }
  }
  network {
    high_network_detection {
      enabled = false
    }
    network_dropped_packets_detection {
      enabled        = true
      detection_mode = "auto"
    }
    network_errors_detection {
      enabled        = true
      detection_mode = "auto"
    }
    network_high_retransmission_detection {
      enabled = false
    }
    network_tcp_problems_detection {
      enabled = false
    }
  }
}

#Disks
resource "dynatrace_disk_anomalies_v2" "Disk_anomalies" {
  scope = "environment"
  disk {
    disk_low_inodes_detection {
      enabled        = true
      detection_mode = "auto"
    }
    disk_low_space_detection {
      enabled        = true
      detection_mode = "auto"
    }
    disk_slow_writes_and_reads_detection {
      enabled = false
    }
  }
}

#AWS
resource "dynatrace_aws_anomalies" "aws_anomalies" {
  ec_2_candidate_high_cpu_detection {
    enabled        = true
    detection_mode = "auto"
  }
  elb_high_connection_errors_detection {
    enabled        = true
    detection_mode = "auto"
  }
  lambda_high_error_rate_detection {
    enabled = false
  }
  rds_high_cpu_detection {
    enabled        = true
    detection_mode = "auto"
  }
  rds_high_memory_detection {
    enabled        = true
    detection_mode = "auto"
  }
  rds_high_write_read_latency_detection {
    enabled        = true
    detection_mode = "auto"
  }
  rds_low_storage_detection {
    enabled        = true
    detection_mode = "auto"
  }
  rds_restarts_sequence_detection {
    enabled        = true
    detection_mode = "auto"
  }
}

#VMware
resource "dynatrace_vmware_anomalies" "vmware_anomalies" {
  dropped_packets_detection {
    enabled        = true
    detection_mode = "auto"
  }
  esxi_high_cpu_detection {
    enabled        = true
    detection_mode = "auto"
  }
  esxi_high_memory_detection {
    enabled        = true
    detection_mode = "auto"
  }
  guest_cpu_limit_detection {
    enabled        = true
    detection_mode = "auto"
  }
  low_datastore_space_detection {
    enabled        = true
    detection_mode = "auto"
  }
  overloaded_storage_detection {
    enabled        = true
    detection_mode = "auto"
  }
  slow_physical_storage_detection {
    enabled        = true
    detection_mode = "auto"
  }
  undersized_storage_detection {
    enabled        = true
    detection_mode = "auto"
  }
}

#Kubernetes
#Cluster
resource "dynatrace_k8s_cluster_anomalies" "k8s_cluster_anomalies" {
  scope = "environment"
  cpu_requests_saturation {
    enabled = false
  }
  memory_requests_saturation {
    enabled = false
  }
  monitoring_issues {
    enabled = false
  }
  pods_saturation {
    enabled = false
  }
  readiness_issues {
    enabled = true
    configuration {
      observation_period_in_minutes = 5
      sample_period_in_minutes      = 3
    }
  }
}

#node
resource "dynatrace_k8s_node_anomalies" "k8s_node_anomalies" {
  scope = "environment"
  cpu_requests_saturation {
    enabled = false
  }
  memory_requests_saturation {
    enabled = false
  }
  pods_saturation {
    enabled = false
  }
  readiness_issues {
    enabled = false
  }
  node_problematic_condition {
    enabled = false
  }
}

#namespace
resource "dynatrace_k8s_namespace_anomalies" "k8s_namespace_anomalies" {
  scope = "environment"
  cpu_limits_quota_saturation {
    enabled = false
  }
  cpu_requests_quota_saturation {
    enabled = false
  }
  memory_limits_quota_saturation {
    enabled = false
  }
  memory_requests_quota_saturation {
    enabled = false
  }
  pods_quota_saturation {
    enabled = false
  }
}

#workload
resource "dynatrace_k8s_workload_anomalies" "k8s_workload_anomalies" {
  scope = "environment"
  container_restarts {
    enabled = false
  }
  deployment_stuck {
    enabled = false
  }
  not_all_pods_ready {
    enabled = false
  }
  pending_pods {
    enabled = false
  }
  pod_stuck_in_terminating {
    enabled = false
  }
  workload_without_ready_pods {
    enabled = false
  }
  high_cpu_throttling {
    enabled = false
  }
  high_cpu_usage {
    enabled = false
  }
  high_memory_usage {
    enabled = false
  }
  job_failure_events {
    enabled = false
  }
  oom_kills {
    enabled = false
  }
  pod_backoff_events {
    enabled = false
  }
  pod_eviction_events {
    enabled = false
  }
  pod_preemption_events {
    enabled = false
  }
}

#Persistent volume claim anomaly detection
resource "dynatrace_k8s_pvc_anomalies" "k8s_pvc_anomalies" {
  scope = "environment"
  low_disk_space_critical {
    enabled = false
  }
  low_disk_space_critical_percentage {
    enabled = false
  }
}
