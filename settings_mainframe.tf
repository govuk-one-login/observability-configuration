# Mainframe
# Transaction monitoring
resource "dynatrace_mainframe_transaction_monitoring" "mainframe_transaction_monitoring" {
  monitor_all_incoming_web_requests              = false
  monitor_all_ctg_protocols                      = false
  group_cics_regions                             = true
  zos_cics_service_detection_uses_transaction_id = true
  group_ims_regions                              = true
  zos_ims_service_detection_uses_transaction_id  = true
  node_limit                                     = 500
}

# Not in use - Transaction start filters
# Not in use - IBM MQ filters
# Not in use - IBM MQ IMS bridges
# Not in use - IBM MQ queue sharing groups
# Not in use - IBM MQ queue managers