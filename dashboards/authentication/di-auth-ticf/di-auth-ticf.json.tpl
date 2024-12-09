{
  "metadata": {
  },
  "dashboardMetadata": {
    "name": "Authentication - TICF CRI (${application_environment})",
    "shared": true,
    "owner": "becka.lelew@digital.cabinet-office.gov.uk",
    "hasConsistentColors": false,
    "tags": [
      "authentication"
    ]
  },
  "tiles": [
      {
        "name": "Response from TICF CRI by status",
        "nameSize": "large",
        "tileType": "DATA_EXPLORER",
        "configured": true,
        "bounds": {
          "top": 38,
          "left": 38,
          "width": 798,
          "height": 304
        },
        "tileFilter": {},
        "isAutoRefreshDisabled": false,
        "customName": "Data explorer results",
        "queries": [
          {
            "id": "A",
            "metric": "cloud.aws.authentication.ticfCriResponseReceivedByAccountIdEnvironmentLogGroupRegionServiceNameServiceTypeStatusCode",
            "spaceAggregation": "COUNT",
            "timeAggregation": "DEFAULT",
            "splitBy": [],
            "sortBy": "DESC",
            "sortByDimension": "",
            "filterBy": {
              "filterOperator": "AND",
              "nestedFilters": [
                {
                  "filter": "statuscode",
                  "filterType": "DIMENSION",
                  "filterOperator": "OR",
                  "nestedFilters": [],
                  "criteria": [
                    {
                      "value": "202",
                      "evaluator": "EQ"
                    }
                  ]
                },
                {
                  "filter": "environment",
                  "filterType": "DIMENSION",
                  "filterOperator": "OR",
                  "nestedFilters": [],
                  "criteria": [
                    {
                      "value": "${application_environment}",
                      "evaluator": "EQ"
                    }
                  ]
                }
              ],
              "criteria": []
            },
            "limit": 20,
            "rate": "NONE",
            "enabled": true
          },
          {
            "id": "B",
            "metric": "cloud.aws.authentication.ticfCriResponseReceivedByAccountIdEnvironmentLogGroupRegionServiceNameServiceTypeStatusCode",
            "spaceAggregation": "COUNT",
            "timeAggregation": "DEFAULT",
            "splitBy": [],
            "sortBy": "DESC",
            "sortByDimension": "",
            "filterBy": {
              "filterOperator": "AND",
              "nestedFilters": [
                {
                  "filter": "environment",
                  "filterType": "DIMENSION",
                  "filterOperator": "OR",
                  "nestedFilters": [],
                  "criteria": [
                    {
                      "value": "${application_environment}",
                      "evaluator": "EQ"
                    }
                  ]
                },
                {
                  "filter": "statuscode",
                  "filterType": "DIMENSION",
                  "filterOperator": "OR",
                  "nestedFilters": [],
                  "criteria": [
                    {
                      "value": "400",
                      "evaluator": "EQ"
                    }
                  ]
                }
              ],
              "criteria": []
            },
            "limit": 20,
            "rate": "NONE",
            "enabled": true
          },
          {
            "id": "C",
            "metric": "cloud.aws.authentication.ticfCriResponseReceivedByAccountIdEnvironmentLogGroupRegionServiceNameServiceTypeStatusCode",
            "spaceAggregation": "COUNT",
            "timeAggregation": "DEFAULT",
            "splitBy": [],
            "sortBy": "DESC",
            "sortByDimension": "",
            "filterBy": {
              "filterOperator": "AND",
              "nestedFilters": [
                {
                  "filter": "environment",
                  "filterType": "DIMENSION",
                  "filterOperator": "OR",
                  "nestedFilters": [],
                  "criteria": [
                    {
                      "value": "${application_environment}",
                      "evaluator": "EQ"
                    }
                  ]
                },
                {
                  "filter": "statuscode",
                  "filterType": "DIMENSION",
                  "filterOperator": "OR",
                  "nestedFilters": [],
                  "criteria": [
                    {
                      "value": "403",
                      "evaluator": "EQ"
                    }
                  ]
                }
              ],
              "criteria": []
            },
            "limit": 20,
            "rate": "NONE",
            "enabled": false
          },
          {
            "id": "D",
            "metric": "cloud.aws.authentication.ticfCriResponseReceivedByAccountIdEnvironmentLogGroupRegionServiceNameServiceTypeStatusCode",
            "spaceAggregation": "COUNT",
            "timeAggregation": "DEFAULT",
            "splitBy": [],
            "sortBy": "DESC",
            "sortByDimension": "",
            "filterBy": {
              "filterOperator": "AND",
              "nestedFilters": [
                {
                  "filter": "environment",
                  "filterType": "DIMENSION",
                  "filterOperator": "OR",
                  "nestedFilters": [],
                  "criteria": [
                    {
                      "value": "${application_environment}",
                      "evaluator": "EQ"
                    }
                  ]
                },
                {
                  "filter": "statuscode",
                  "filterType": "DIMENSION",
                  "filterOperator": "OR",
                  "nestedFilters": [],
                  "criteria": [
                    {
                      "value": "500",
                      "evaluator": "EQ"
                    }
                  ]
                }
              ],
              "criteria": []
            },
            "limit": 20,
            "rate": "NONE",
            "enabled": true
          },
          {
            "id": "E",
            "metric": "cloud.aws.authentication.ticfCriResponseReceivedByAccountIdEnvironmentLogGroupRegionServiceNameServiceTypeStatusCode",
            "spaceAggregation": "COUNT",
            "timeAggregation": "DEFAULT",
            "splitBy": [],
            "sortBy": "DESC",
            "sortByDimension": "",
            "filterBy": {
              "filterOperator": "AND",
              "nestedFilters": [
                {
                  "filter": "statuscode",
                  "filterType": "DIMENSION",
                  "filterOperator": "OR",
                  "nestedFilters": [],
                  "criteria": [
                    {
                      "value": "200",
                      "evaluator": "EQ"
                    }
                  ]
                },
                {
                  "filter": "environment",
                  "filterType": "DIMENSION",
                  "filterOperator": "OR",
                  "nestedFilters": [],
                  "criteria": [
                    {
                      "value": "${application_environment}",
                      "evaluator": "EQ"
                    }
                  ]
                }
              ],
              "criteria": []
            },
            "limit": 20,
            "rate": "NONE",
            "enabled": true
          }
        ],
        "visualConfig": {
          "type": "GRAPH_CHART",
          "global": {},
          "rules": [
            {
              "matcher": "A:",
              "unitTransform": "auto",
              "valueFormat": "auto",
              "properties": {
                "color": "DEFAULT",
                "seriesType": "LINE",
                "alias": "202"
              },
              "seriesOverrides": []
            },
            {
              "matcher": "B:",
              "unitTransform": "auto",
              "valueFormat": "auto",
              "properties": {
                "color": "DEFAULT",
                "seriesType": "LINE",
                "alias": "400"
              },
              "seriesOverrides": []
            },
            {
              "matcher": "D:",
              "unitTransform": "auto",
              "valueFormat": "auto",
              "properties": {
                "color": "DEFAULT",
                "seriesType": "LINE",
                "alias": "403"
              },
              "seriesOverrides": []
            },
            {
              "matcher": "F:",
              "unitTransform": "auto",
              "valueFormat": "auto",
              "properties": {
                "color": "DEFAULT",
                "seriesType": "LINE",
                "alias": "500"
              },
              "seriesOverrides": []
            },
            {
              "matcher": "G:",
              "unitTransform": "auto",
              "valueFormat": "auto",
              "properties": {
                "color": "DEFAULT",
                "seriesType": "LINE",
                "alias": "200"
              },
              "seriesOverrides": []
            }
          ],
          "axes": {
            "xAxis": {
              "displayName": "",
              "visible": true
            },
            "yAxes": [
              {
                "displayName": "",
                "visible": true,
                "min": "AUTO",
                "max": "AUTO",
                "position": "LEFT",
                "queryIds": [
                  "A",
                  "B",
                  "F",
                  "G"
                ],
                "defaultAxis": true
              }
            ]
          },
          "heatmapSettings": {
            "yAxis": "VALUE"
          },
          "thresholds": [
            {
              "axisTarget": "LEFT",
              "rules": [
                {
                  "color": "#7dc540"
                },
                {
                  "color": "#f5d30f"
                },
                {
                  "color": "#dc172a"
                }
              ],
              "visible": true
            }
          ],
          "tableSettings": {
            "hiddenColumns": []
          },
          "graphChartSettings": {
            "connectNulls": false
          },
          "honeycombSettings": {
            "showHive": true,
            "showLegend": true,
            "showLabels": false
          }
        },
        "queriesSettings": {
          "resolution": ""
        },
        "metricExpressions": [
          "resolution=null&(cloud.aws.authentication.ticfCriResponseReceivedByAccountIdEnvironmentLogGroupRegionServiceNameServiceTypeStatusCode:filter(and(or(eq(statuscode,\"202\")),or(eq(environment,${application_environment})))):splitBy():count:sort(value(avg,descending)):limit(20)):limit(100):names,(cloud.aws.authentication.ticfCriResponseReceivedByAccountIdEnvironmentLogGroupRegionServiceNameServiceTypeStatusCode:filter(and(or(eq(environment,${application_environment})),or(eq(statuscode,\"400\")))):splitBy():count:sort(value(avg,descending)):limit(20)):limit(100):names,(cloud.aws.authentication.ticfCriResponseReceivedByAccountIdEnvironmentLogGroupRegionServiceNameServiceTypeStatusCode:filter(and(or(eq(environment,${application_environment})),or(eq(statuscode,\"500\")))):splitBy():count:sort(value(avg,descending)):limit(20)):limit(100):names,(cloud.aws.authentication.ticfCriResponseReceivedByAccountIdEnvironmentLogGroupRegionServiceNameServiceTypeStatusCode:filter(and(or(eq(environment,${application_environment})),or(eq(statuscode,\"200\")))):splitBy():count:sort(value(avg,descending)):limit(20)):limit(100):names"
        ]
      },
      {
        "name": "TICF CRI Timeouts",
        "tileType": "DATA_EXPLORER",
        "configured": true,
        "bounds": {
          "top": 342,
          "left": 38,
          "width": 798,
          "height": 266
        },
        "tileFilter": {},
        "isAutoRefreshDisabled": false,
        "customName": "Data explorer results",
        "queries": [
          {
            "id": "A",
            "metric": "cloud.aws.authentication.ticfCriServiceTimeoutByAccountIdEnvironmentLogGroupRegionServiceNameServiceType",
            "spaceAggregation": "COUNT",
            "timeAggregation": "DEFAULT",
            "splitBy": [],
            "sortBy": "DESC",
            "sortByDimension": "",
            "filterBy": {
              "filterOperator": "AND",
              "nestedFilters": [
                {
                  "filter": "environment",
                  "filterType": "DIMENSION",
                  "filterOperator": "OR",
                  "nestedFilters": [],
                  "criteria": [
                    {
                      "value": "${application_environment}",
                      "evaluator": "EQ"
                    }
                  ]
                }
              ],
              "criteria": []
            },
            "limit": 20,
            "rate": "NONE",
            "enabled": true
          }
        ],
        "visualConfig": {
          "type": "GRAPH_CHART",
          "global": {},
          "rules": [
            {
              "matcher": "A:",
              "unitTransform": "auto",
              "valueFormat": "0",
              "properties": {
                "color": "DEFAULT",
                "seriesType": "LINE"
              },
              "seriesOverrides": []
            }
          ],
          "axes": {
            "xAxis": {
              "displayName": "",
              "visible": true
            },
            "yAxes": [
              {
                "displayName": "",
                "visible": true,
                "min": "AUTO",
                "max": "AUTO",
                "position": "LEFT",
                "queryIds": [
                  "A"
                ],
                "defaultAxis": true
              }
            ]
          },
          "heatmapSettings": {
            "yAxis": "VALUE"
          },
          "thresholds": [
            {
              "axisTarget": "LEFT",
              "rules": [
                {
                  "color": "#7dc540"
                },
                {
                  "color": "#f5d30f"
                },
                {
                  "color": "#dc172a"
                }
              ],
              "visible": true
            }
          ],
          "tableSettings": {
            "hiddenColumns": []
          },
          "graphChartSettings": {
            "connectNulls": false
          },
          "honeycombSettings": {
            "showHive": true,
            "showLegend": true,
            "showLabels": false
          }
        },
        "queriesSettings": {
          "resolution": ""
        },
        "metricExpressions": [
          "resolution=null&(cloud.aws.authentication.ticfCriServiceTimeoutByAccountIdEnvironmentLogGroupRegionServiceNameServiceType:filter(and(or(eq(environment,${application_environment})))):splitBy():count:sort(value(avg,descending)):limit(20)):limit(100):names"
        ]
      },
      {
        "name": "TICF call errors",
        "tileType": "DATA_EXPLORER",
        "configured": true,
        "bounds": {
          "top": 608,
          "left": 38,
          "width": 798,
          "height": 266
        },
        "tileFilter": {},
        "isAutoRefreshDisabled": false,
        "customName": "Data explorer results",
        "queries": [
          {
            "id": "A",
            "metric": "cloud.aws.authentication.ticfCriServiceErrorByAccountIdEnvironmentLogGroupRegionServiceNameServiceType",
            "spaceAggregation": "COUNT",
            "timeAggregation": "DEFAULT",
            "splitBy": [],
            "sortBy": "DESC",
            "sortByDimension": "",
            "filterBy": {
              "nestedFilters": [],
              "criteria": []
            },
            "limit": 20,
            "rate": "NONE",
            "enabled": true
          }
        ],
        "visualConfig": {
          "type": "GRAPH_CHART",
          "global": {},
          "rules": [
            {
              "matcher": "A:",
              "properties": {
                "color": "DEFAULT"
              },
              "seriesOverrides": []
            }
          ],
          "axes": {
            "xAxis": {
              "displayName": "",
              "visible": true
            },
            "yAxes": [
              {
                "displayName": "",
                "visible": true,
                "min": "AUTO",
                "max": "AUTO",
                "position": "LEFT",
                "queryIds": [
                  "A"
                ],
                "defaultAxis": true
              }
            ]
          },
          "heatmapSettings": {
            "yAxis": "VALUE"
          },
          "thresholds": [
            {
              "axisTarget": "LEFT",
              "rules": [
                {
                  "color": "#7dc540"
                },
                {
                  "color": "#f5d30f"
                },
                {
                  "color": "#dc172a"
                }
              ],
              "visible": true
            }
          ],
          "tableSettings": {
            "hiddenColumns": []
          },
          "graphChartSettings": {
            "connectNulls": false
          },
          "honeycombSettings": {
            "showHive": true,
            "showLegend": true,
            "showLabels": false
          }
        },
        "queriesSettings": {
          "resolution": ""
        },
        "metricExpressions": [
          "resolution=null&(cloud.aws.authentication.ticfCriServiceErrorByAccountIdEnvironmentLogGroupRegionServiceNameServiceType:splitBy():count:sort(value(avg,descending)):limit(20)):limit(100):names"
        ]
      }
    ]
}
