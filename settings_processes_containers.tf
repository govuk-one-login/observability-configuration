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
resource "dynatrace_process_group_monitoring" "process_group_monitoring" {
  monitoring_state = "MONITORING_ON"
  process_group_id = ""
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
