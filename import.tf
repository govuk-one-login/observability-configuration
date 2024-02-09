locals {
  built_in_wordpress                 = local.is_production ? "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkMWYzZWQwMWMtMDM4Yy0zMWE4LWE2ZjMtMTNlYjRlMGYxNDE1vu9U3hXa3q0" : "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkZWQxMjUwNDEtNTFmYS0zNzA0LTkxZTktZGE3Y2NhMGExNzZmvu9U3hXa3q0"
  built_in_jre                       = local.is_production ? "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkMGM1MjUzMDgtZGIyYS0zNjk1LTlkZDAtMTk4ZDhiNGI1Y2Izvu9U3hXa3q0" : "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkNzc2MmI1MDktMzMxNi0zMjc4LTllODktNDYzYTc1NWVmMzJlvu9U3hXa3q0"
  built_in_java_cassandra            = local.is_production ? "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkNGQ5MTJkZmMtZjE2OC0zM2UzLTg3MTMtZGE1Y2I3NDgyNTg0vu9U3hXa3q0" : "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkYzQ0ZDBhYmEtMjk3Zi0zYzI2LThlNzAtYWUwYzMwNDFhNmQ4vu9U3hXa3q0"
  built_in_apache                    = local.is_production ? "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkNGE4ZjEzZTEtODE1ZC0zNmJkLTlhYzktODM5YmUzNjc4MGJjvu9U3hXa3q0" : "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkYmM3ZmMxOWYtNjAwNC0zMGYyLWFhMjEtMDYyYThlMjgyN2Izvu9U3hXa3q0"
  built_in_java_ibm_ctg              = local.is_production ? "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkOGI0MzY1NGItNDJjMy0zYTYxLWE3NTMtN2E0NDk0YjgzMzEzvu9U3hXa3q0" : "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkZmVhMjgwMTMtNzI1Mi0zY2M0LWIxYTQtZWQ3ZDQ0OWEwM2Y3vu9U3hXa3q0"
  built_in_hibernate                 = local.is_production ? "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkOTUwNGI5MTMtMmE4Ny0zNTg0LWJjYjEtYWUyMzY4MTgzN2Rjvu9U3hXa3q0" : "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkZmU2NmM2MzktMDNhZC0zZDM0LTg4OWUtMDg0ODcwNDhjNWYxvu9U3hXa3q0"
  built_in_java_ibm_mq               = local.is_production ? "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkMjA0NWI1ZjgtZWEwZS0zMjU1LTk1OWItNTRiN2ZkOWY5NjA0vu9U3hXa3q0" : "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkZjdhOWRjNjItNTNiYS0zNjU5LThjNDMtZDFhM2FjODg4MzA4vu9U3hXa3q0"
  built_in_java_tests                = local.is_production ? "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkMDVkYzRiY2ItYWUxNC0zOWQzLWI5ODItOGYxNjJjZjZhMzEzvu9U3hXa3q0" : "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkNmI2ZGFlNTctMmYwMC0zMzYyLWJkNDItYzBlYjViNmE4MzZmvu9U3hXa3q0"
  built_in_jboss                     = local.is_production ? "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkMjNmZjgyZWMtZTc4OC0zN2E0LTlmNmYtNzViYTc3OTQ3OTM0vu9U3hXa3q0" : "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkMmEwNWVlMjMtYTRiYy0zZGIyLWFmMTgtYmNmNTA0Y2MyMzE0vu9U3hXa3q0"
  built_in_java_mongodb              = local.is_production ? "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkMjIwOTAwMDYtNGFlZS0zZmQ0LTgzMTQtMjZlZjQ0NTRhZjhmvu9U3hXa3q0" : "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkM2JhYTYyZGMtYzk0Ny0zYzgxLTk5NmYtMTc1ZDRmMDI5MjFjvu9U3hXa3q0"
  built_in_mule                      = local.is_production ? "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkNjlhN2QxODQtM2E2Yy0zY2UzLThmODktOWRjMDA0OGFjOGYyvu9U3hXa3q0" : "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkMWE4NWVhZDEtNmJjMi0zM2NiLTk3NzYtNjlkNGM2NDZkYjk1vu9U3hXa3q0"
  built_in_java_rabbitmq             = local.is_production ? "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkYjg4N2Q4NGItYjIyNy0zYzU1LWJhNWItMDJhZTc0ZDU3YTU3vu9U3hXa3q0" : "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkMWM5MzQ0OTUtNmQ3OS0zMjVkLWFlNmYtMDY3MjM1MjhlYzI0vu9U3hXa3q0"
  built_in_spring                    = local.is_production ? "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkNDcwNjk5ZWQtYWIzNy0zNDJlLThlYjktMWMyMTAwNWU5MmNlvu9U3hXa3q0" : "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkNGVjMGFjMmMtM2JhMC0zMDQxLTkwODQtMGFkYzMyZmJkNDI1vu9U3hXa3q0"
  built_in_tibco                     = local.is_production ? "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkMjMxZjI3ZTMtNGQxOS0zMmQ1LWFkMDMtNjZjYmUzZWRmMmRkvu9U3hXa3q0" : "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkMGQ3NWIwZTktZTFkNi0zNWVmLThmZTctZjVjZTMxYWEwNTc3vu9U3hXa3q0"
  built_in_oracle_weblogic           = local.is_production ? "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkOGVlOTkzY2YtNDgxMi0zN2RhLWE4NmUtY2ZkY2E4OTE2Yjdivu9U3hXa3q0" : "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkM2EzNGY3NzUtZjBhZS0zZGFjLWE0OWEtNzg5NDQwODhmMmU4vu9U3hXa3q0"
  built_in_ibm_websphere             = local.is_production ? "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkNGUxMzU3ZjctZDFiNS0zMzQ0LTk2OGUtZmM3MTFkNzhjOTU2vu9U3hXa3q0" : "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkZDIwM2Y2MTgtYjI2MC0zZDhhLThkMWMtOWEzN2RkMDI2MzNhvu9U3hXa3q0"
  built_in_net_clr                   = local.is_production ? "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkNTI2NzdkODYtNTNmMC0zNWU2LTljMDQtNDM4MmNhNjBjMTQzvu9U3hXa3q0" : "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkYTU3YzQ3ZDAtY2JlZC0zMjg3LTlhNDUtNGUzMmRhNGRmNTExvu9U3hXa3q0"
  built_in_net_entity_framework_core = local.is_production ? "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkZDgyM2MxZGYtYTBlNC0zODRiLWI0NjItMjUzNDczZTdhNWMxvu9U3hXa3q0" : "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkMzk5MTc0OTctM2ZiYi0zYmMyLTg5ZGItM2UwMmVmMGI0Yzkwvu9U3hXa3q0"
  built_in_net_logging               = local.is_production ? "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkNzk3NWQ5ZDEtNjk0NC0zMGY1LWEyM2UtNTZkNmM0ZDkxNGEyvu9U3hXa3q0" : "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkYTFiNWIyYjAtYjJiOS0zYTE3LWI3MDktNTViZDg2YmY3MjFivu9U3hXa3q0"
  built_in_net_azure_service         = local.is_production ? "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkYmUwMDYyYjAtNWZmMy0zYWFmLTliZTctMTgzNzdlZDBmYzk0vu9U3hXa3q0" : "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkZjEyZGQ2NTktYzZkMy0zMDJlLThjYTUtZTA0Nzc5ZjU2MmMxvu9U3hXa3q0"
  built_in_asp_net_core              = local.is_production ? "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkNmVhMjZlM2ItNmJjOS0zNDc1LWE3MzYtMTY2YmZhYjJhNjUwvu9U3hXa3q0" : "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkMDMwOTA3MmUtNmE5ZS0zYTUxLWFmNmMtNTJiNzUxMGFkMzI0vu9U3hXa3q0"
  built_in_net_rabbitmq              = local.is_production ? "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkNWFmNzliZGQtMGI0ZC0zZWNkLWFkMGMtM2EyZDM3OTRkM2E5vu9U3hXa3q0" : "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkMTEwMTIwMTYtY2YxNy0zZGIxLWJiMDgtYTYzYzljNjM1OGIwvu9U3hXa3q0"
  built_in_net_ibm_mq                = local.is_production ? "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkYzEyMzI3MjItYWZkYy0zYmUxLTk4NGQtNzdjZTUwNDk5Yjc3vu9U3hXa3q0" : "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkODY3MGZjNWYtNDFhOS0zNTE3LWJkN2UtNTIwMjA1ZmI5ZmJivu9U3hXa3q0"
  built_in_net_mongodb               = local.is_production ? "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkMWNlYTllZTgtMDI5ZS0zNTdkLTg2ZmQtOTViOGZjOTkyZmMyvu9U3hXa3q0" : "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkYzRiN2M1MmItZDA5ZC0zYTJhLWIwYmEtZWI3OWQ1ZGJjODA5vu9U3hXa3q0"
  built_in_go_standard_library       = local.is_production ? "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkZDE2MmNjODMtZjU5NC0zNjJmLTg0MGUtODRlMjg3ZjhhMWExvu9U3hXa3q0" : "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkNmE4MjgzYTYtNzM5Zi0zZGUxLWJlNzgtMTRiOGZkNGY4MGYzvu9U3hXa3q0"
  built_in_go_database               = local.is_production ? "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkODlmZjQ5OWUtYmEyMS0zNTQ1LWJiOGYtZTk2NjA2ZGViZGE3vu9U3hXa3q0" : "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkYzg1NWVmYjMtMGJkNS0zMzkzLThjYmYtYTE1OThmZDY0YTQyvu9U3hXa3q0"
}

import {
  to = dynatrace_api_detection.built_in_wordpress
  id = local.built_in_wordpress
}

import {
  to = dynatrace_api_detection.built_in_jre
  id = local.built_in_jre
}

import {
  to = dynatrace_api_detection.built_in_java_cassandra
  id = local.built_in_java_cassandra
}

import {
  to = dynatrace_api_detection.built_in_apache
  id = local.built_in_apache
}

import {
  to = dynatrace_api_detection.built_in_java_ibm_ctg
  id = local.built_in_java_ibm_ctg
}

import {
  to = dynatrace_api_detection.built_in_hibernate
  id = local.built_in_hibernate
}

import {
  to = dynatrace_api_detection.built_in_java_ibm_mq
  id = local.built_in_java_ibm_mq
}

import {
  to = dynatrace_api_detection.built_in_java_tests
  id = local.built_in_java_tests
}

import {
  to = dynatrace_api_detection.built_in_jboss
  id = local.built_in_jboss
}

import {
  to = dynatrace_api_detection.built_in_java_mongodb
  id = local.built_in_java_mongodb
}

import {
  to = dynatrace_api_detection.built_in_mule
  id = local.built_in_mule
}

import {
  to = dynatrace_api_detection.built_in_java_rabbitmq
  id = local.built_in_java_rabbitmq
}

import {
  to = dynatrace_api_detection.built_in_spring
  id = local.built_in_spring
}

import {
  to = dynatrace_api_detection.built_in_tibco
  id = local.built_in_tibco
}

import {
  to = dynatrace_api_detection.built_in_oracle_weblogic
  id = local.built_in_oracle_weblogic
}

import {
  to = dynatrace_api_detection.built_in_ibm_websphere
  id = local.built_in_ibm_websphere
}

import {
  to = dynatrace_api_detection.built_in_net_clr
  id = local.built_in_net_clr
}

import {
  to = dynatrace_api_detection.built_in_net_entity_framework_core
  id = local.built_in_net_entity_framework_core
}

import {
  to = dynatrace_api_detection.built_in_net_logging
  id = local.built_in_net_logging
}

import {
  to = dynatrace_api_detection.built_in_net_azure_service
  id = local.built_in_net_azure_service
}

import {
  to = dynatrace_api_detection.built_in_asp_net_core
  id = local.built_in_asp_net_core
}

import {
  to = dynatrace_api_detection.built_in_net_rabbitmq
  id = local.built_in_net_rabbitmq
}

import {
  to = dynatrace_api_detection.built_in_net_ibm_mq
  id = local.built_in_net_ibm_mq
}

import {
  to = dynatrace_api_detection.built_in_net_mongodb
  id = local.built_in_net_mongodb
}

import {
  to = dynatrace_api_detection.built_in_go_standard_library
  id = local.built_in_go_standard_library
}

import {
  to = dynatrace_api_detection.built_in_go_database
  id = local.built_in_go_database
}


# import {
#   to = dynatrace_api_detection.built_in_wordpress
#   id = "vu9U3hXa3q0AAAABABxidWlsdGluOmFwaXMuZGV0ZWN0aW9uLXJ1bGVzAAZ0ZW5hbnQABnRlbmFudAAkZWQxMjUwNDEtNTFmYS0zNzA0LTkxZTktZGE3Y2NhMGExNzZmvu9U3hXa3q0"
# }
