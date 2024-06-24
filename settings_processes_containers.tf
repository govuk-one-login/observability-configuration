# Processes and containers

# Process group naming
resource "dynatrace_processgroup_naming" "nodejs" {
  count   = local.is_production ? 0 : 1
  name    = "NodeJS"
  enabled = true
  format  = "{ProcessGroup:NodeJsAppName}"
  conditions {
    condition {
      key {
        type      = "STATIC"
        attribute = "PROCESS_GROUP_TECHNOLOGY"
      }
      tech {
        operator = "EQUALS"
        value {
          type = "NODE_JS"
        }
      }
    }
    condition {
      process_metadata {
        attribute   = "PROCESS_GROUP_PREDEFINED_METADATA"
        dynamic_key = "NODE_JS_APP_NAME"
      }
      string {
        operator = "EXISTS"
      }
    }
  }
}

# Process instance snapshots
resource "dynatrace_process_visibility" "process_visibility" {
  enabled       = false
  max_processes = 100
}

# Not in use - Process availability

# Process group monitoring

resource "dynatrace_process_monitoring" "process_monitoring" {
  auto_monitoring = true
}

# Not in use - Custom process monitoring rules

# Built-in process monitoring rules
resource "dynatrace_builtin_process_monitoring" "builtin_process_monitoring" {
  php_script                            = true
  exe_phpcgi                            = true
  aspnetcore                            = true
  exe_w3wp                              = true
  exe_filebeat                          = true
  exe_metricbeat                        = true
  exe_packetbeat                        = true
  exe_auditbeat                         = true
  exe_heartbeat                         = true
  exe_functionbeat                      = true
  go_static                             = true
  exe_caddy                             = true
  exe_influxd                           = true
  exe_adapter                           = true
  exe_auctioneer                        = true
  exe_bbs                               = true
  exe_ccuploader                        = true
  exe_doppler                           = true
  exe_gorouter                          = true
  exe_locket                            = true
  exe_metron                            = true
  exe_rep                               = true
  exe_routeemitter                      = true
  exe_routeregistrar                    = true
  exe_routingapi                        = true
  exe_schedular                         = true
  exe_silkdaemon                        = true
  exe_switchboard                       = true
  exe_syslogdrainbinder                 = true
  exe_tpswatcher                        = true
  exe_trafficcontroller                 = true
  node_prebuildinstall                  = true
  node_npm                              = true
  node_grunt                            = true
  node_typescript                       = true
  node_yarn                             = true
  node_corepack                         = true
  node_nodepregyp                       = true
  node_nodegyp                          = true
  node_gulpcli                          = true
  node_binpm2                           = true
  cf_appsmanagerjs                      = true
  exe_grootfs                           = true
  exe_tardis                            = true
  exe_tmpbuildpacks                     = true
  cf                                    = true
  k8s_containerpod                      = true
  docker_pauseamd64                     = true
  exe_oc                                = true
  exe_caliconode                        = true
  exe_userbinpiper                      = true
  k8s_cassandraoperator                 = true
  exe_uipath                            = true
  exe_openhandlecollector               = true
  k8s_namespace                         = true
  container                             = true
  exe_optcnibinhostlocal                = true
  exe_mqsi                              = true
  jar_eclipseequinox                    = true
  exe_casclient                         = true
  jar_dtibmmqconnector                  = true
  exe_agentworker                       = true
  aspnetcore_agentworker                = true
  exe_agentlistener                     = true
  aspnetcore_agentlistener              = true
  exe_flexnetjobexecutorservice         = true
  exe_flexnetmaintenanceremotingservice = true
}

# Built-in detection rules
resource "dynatrace_process_group_detection_flags" "process_group_detection_flags" {
  ignore_unique_identifiers                   = true
  use_catalina_base                           = false
  use_docker_container_name                   = false
  auto_detect_cassandra_clusters              = true
  add_node_js_script_name                     = true
  auto_detect_tibco_container_edition_engines = true
  identify_jboss_server_by_system_property    = true
  auto_detect_web_methods_integration_server  = true
  auto_detect_spring_boot                     = true
  auto_detect_tibco_engines                   = true
  split_oracle_database_pg                    = false
  split_oracle_listener_pg                    = false
  auto_detect_web_sphere_liberty_application  = true
  short_lived_processes_monitoring            = true
  group_ibmmqby_instance_name                 = true
}

# Not in use - Simple detection rules

# Advanced detection rules
resource "dynatrace_process_group_detection" "aws_ecs_family_ecsservicetaskdefinition" {
  enabled = true
  process_detection {
    property         = "AWS_ECS_FAMILY"
    contained_string = "ECSServiceTaskDefinition"
  }
  group_extraction {
    property        = "AWS_ECS_FAMILY"
    standalone_rule = true
    delimiter {
      remove_ids = true
      to         = "-ECSServiceTaskDefinition"
    }
  }
}

# Not in use - Declarative process grouping

# Container monitoring
resource "dynatrace_container_technology" "container_technology" {
  bosh_process_manager = true
  containerd           = true
  crio                 = true
  docker               = true
  docker_windows       = false
  garden               = true
  podman               = false
  winc                 = false
}

# Not in use - Container monitoring rules

# Built-in container monitoring rules
resource "dynatrace_container_builtin_rule" "container_builtin_rule" {
  ignore_kubernetes_pause_container = true
  ignore_docker_pause_container     = true
  ignore_open_shift_sdn_namespace   = true
  ignore_open_shift_build_pod_name  = true
}

# Cloud application and workload detection
resource "dynatrace_cloudapp_workloaddetection" "cloud_app_workload_detection" {
  cloud_foundry {
    enabled = true
  }
  docker {
    enabled = true
  }
  kubernetes {
    enabled = true
    filters {
      filter {
        enabled = true
        inclusion_toggles {
          inc_namespace = true
          inc_basepod   = false
          inc_container = true
          inc_stage     = true
          inc_product   = true
        }
        match_filter {
          match_operator = "EXISTS"
        }
      }
    }
  }
}
