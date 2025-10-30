{
  "metadata": {
  },
  "dashboardMetadata": {
    "name": "di-auth-check-experian-${application_environment}",
    "shared": true,
    "owner": "christian.sophocleous@digital.cabinet-office.gov.uk",
    "hasConsistentColors": false
  },
  "tiles": [
    {
      "name": "Email Address",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 0,
        "left": 0,
        "width": 912,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false
    },
    {
      "name": "SQS message counts",
      "nameSize": "",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 38,
        "left": 0,
        "width": 456,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.sqs.approximateNumberOfMessagesVisibleByAccountIdQueueNameRegion",
          "spaceAggregation": "MAX",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "aws.account.id",
            "queuename"
          ],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${api_account_id}",
                    "evaluator": "EQ"
                  },
                  {
                    "value": "${check_account_id}",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "queuename",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "PendingEmailCheckResultsQueue",
                    "evaluator": "EQ"
                  },
                  {
                    "value": "${application_environment}-pending-email-check-queue",
                    "evaluator": "EQ"
                  },
                  {
                    "value": "${application_environment}-pending-email-check-dlq",
                    "evaluator": "EQ"
                  },
                  {
                    "value": "PendingEmailCheckResultsDeadLetterQueue",
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
        "resolution=null&(cloud.aws.sqs.approximateNumberOfMessagesVisibleByAccountIdQueueNameRegion:filter(and(or(eq(queuename,PendingEmailCheckResultsQueue),eq(queuename,${application_environment}-pending-email-check-queue),eq(queuename,PendingEmailCheckResultsDeadLetterQueue),eq(queuename,${application_environment}-pending-email-check-dlq)),or(eq(\"aws.account.id\",\"${api_account_id}\"),eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy(\"aws.account.id\",queuename):max:sort(value(max,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "SQS oldest message ages",
      "nameSize": "",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 38,
        "left": 456,
        "width": 456,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.sqs.approximateAgeOfOldestMessageByAccountIdQueueNameRegion",
          "spaceAggregation": "AUTO",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "aws.account.id",
            "queuename"
          ],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${api_account_id}",
                    "evaluator": "EQ"
                  },
                  {
                    "value": "${check_account_id}",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "queuename",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "PendingEmailCheckResultsQueue",
                    "evaluator": "EQ"
                  },
                  {
                    "value": "${application_environment}-pending-email-check-queue",
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
        "resolution=null&(cloud.aws.sqs.approximateAgeOfOldestMessageByAccountIdQueueNameRegion:filter(and(or(eq(\"aws.account.id\",\"${api_account_id}\"),eq(\"aws.account.id\",\"${check_account_id}\")),or(eq(queuename,PendingEmailCheckResultsQueue),eq(queuename,${application_environment}-pending-email-check-queue)))):splitBy(\"aws.account.id\",queuename):sort(value(auto,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Phone Check Confidence",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 3230,
        "left": 0,
        "width": 304,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Pie",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype",
          "spaceAggregation": "SUM",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "confidence"
          ],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${api_account_id}",
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
        "type": "PIE_CHART",
        "global": {
          "hideLegend": false
        },
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
            "visible": true
          },
          "yAxes": []
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
        "resolution=Inf&(cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(or(eq(\"aws.account.id\",\"${api_account_id}\")))):splitBy(confidence):sum:sort(value(sum,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Disposable Numbers",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 3230,
        "left": 304,
        "width": 304,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Pie",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype",
          "spaceAggregation": "SUM",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "disposable"
          ],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${api_account_id}",
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
        "type": "PIE_CHART",
        "global": {
          "hideLegend": false
        },
        "rules": [
          {
            "matcher": "A:",
            "unitTransform": "auto",
            "valueFormat": "auto",
            "properties": {
              "color": "DEFAULT",
              "seriesType": "LINE",
              "alias": "Disposable Numbers"
            },
            "seriesOverrides": []
          }
        ],
        "axes": {
          "xAxis": {
            "visible": true
          },
          "yAxes": []
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
        "resolution=Inf&(cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(or(eq(\"aws.account.id\",\"${api_account_id}\")))):splitBy(disposable):sum:sort(value(sum,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Completed Checks",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2926,
        "left": 0,
        "width": 304,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Single value",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype",
          "spaceAggregation": "COUNT",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${api_account_id}",
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
        "type": "SINGLE_VALUE",
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
            "visible": true
          },
          "yAxes": []
        },
        "heatmapSettings": {
          "yAxis": "VALUE"
        },
        "singleValueSettings": {
          "showTrend": true,
          "showSparkLine": true,
          "linkTileColorToThreshold": true
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
        "resolution=Inf&(cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(or(eq(\"aws.account.id\",\"${api_account_id}\")))):splitBy():count:sort(value(avg,descending)):limit(20)):limit(100):names",
        "resolution=null&(cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(or(eq(\"aws.account.id\",\"${api_account_id}\")))):splitBy():count:sort(value(avg,descending)):limit(20))"
      ]
    },
    {
      "name": "UK Telephone Numbers",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2926,
        "left": 304,
        "width": 304,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Single value",
      "queries": [
        {
          "id": "A",
          "spaceAggregation": "AUTO",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "metricSelector": "cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(eq(\"aws.account.id\",\"${api_account_id}\"), or(eq(country,GBR),eq(country,IMN),eq(country,GGY)))):splitBy():count:sort(value(avg,descending)):limit(20)",
          "rate": "NONE",
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "SINGLE_VALUE",
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
            "visible": true
          },
          "yAxes": []
        },
        "heatmapSettings": {
          "yAxis": "VALUE"
        },
        "singleValueSettings": {
          "showTrend": true,
          "showSparkLine": true,
          "linkTileColorToThreshold": true
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
        "resolution=Inf&(cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(eq(\"aws.account.id\",\"${api_account_id}\"),or(eq(country,GBR),eq(country,IMN),eq(country,GGY)))):splitBy():count:sort(value(avg,descending)):limit(20)):limit(100):names",
        "resolution=null&(cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(eq(\"aws.account.id\",\"${api_account_id}\"),or(eq(country,GBR),eq(country,IMN),eq(country,GGY)))):splitBy():count:sort(value(avg,descending)):limit(20))"
      ]
    },
    {
      "name": "Non UK Telephone Numbers",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2926,
        "left": 608,
        "width": 304,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Single value",
      "queries": [
        {
          "id": "A",
          "spaceAggregation": "AUTO",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "metricSelector": "cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(eq(\"aws.account.id\",\"${api_account_id}\"), not(or(eq(country,GBR),eq(country,IMN),eq(country,GGY))))):splitBy():count:sort(value(avg,descending)):limit(20)",
          "rate": "NONE",
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "SINGLE_VALUE",
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
            "visible": true
          },
          "yAxes": []
        },
        "heatmapSettings": {
          "yAxis": "VALUE"
        },
        "singleValueSettings": {
          "showTrend": true,
          "showSparkLine": true,
          "linkTileColorToThreshold": true
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
        "resolution=Inf&(cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(eq(\"aws.account.id\",\"${api_account_id}\"),not(or(eq(country,GBR),eq(country,IMN),eq(country,GGY))))):splitBy():count:sort(value(avg,descending)):limit(20)):limit(100):names",
        "resolution=null&(cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(eq(\"aws.account.id\",\"${api_account_id}\"),not(or(eq(country,GBR),eq(country,IMN),eq(country,GGY))))):splitBy():count:sort(value(avg,descending)):limit(20))"
      ]
    },
    {
      "name": "Billable Events",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 3230,
        "left": 608,
        "width": 304,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Single value",
      "queries": [
        {
          "id": "A",
          "spaceAggregation": "AUTO",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "metricSelector": "cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(eq(\"aws.account.id\",\"${api_account_id}\"), or(not(eq(type,\"Bad format\")),not(and(eq(type,\"Mobile\"),eq(\"confidence\",\"No Coverage\")))))):splitBy():count:sort(value(avg,descending)):limit(20)",
          "rate": "NONE",
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "SINGLE_VALUE",
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
            "visible": true
          },
          "yAxes": []
        },
        "heatmapSettings": {
          "yAxis": "VALUE"
        },
        "singleValueSettings": {
          "showTrend": true,
          "showSparkLine": true,
          "linkTileColorToThreshold": true
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
        "resolution=Inf&(cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(eq(\"aws.account.id\",\"${api_account_id}\"),or(not(eq(type,\"Bad format\")),not(and(eq(type,Mobile),eq(confidence,\"No Coverage\")))))):splitBy():count:sort(value(avg,descending)):limit(20)):limit(100):names",
        "resolution=null&(cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(eq(\"aws.account.id\",\"${api_account_id}\"),or(not(eq(type,\"Bad format\")),not(and(eq(type,Mobile),eq(confidence,\"No Coverage\")))))):splitBy():count:sort(value(avg,descending)):limit(20))"
      ]
    },
    {
      "name": "Response Statuses",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2660,
        "left": 532,
        "width": 380,
        "height": 266
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.experianResponseReceivedByAccountIdLogGroupRegionServiceNameServiceTypestatusurl",
          "spaceAggregation": "SUM",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "status"
          ],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${api_account_id}",
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
        "resolution=null&(cloud.aws.authentication.experianResponseReceivedByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(\"aws.account.id\",\"${api_account_id}\")))):splitBy(status):sum:sort(value(sum,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Phone Check Results",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 3534,
        "left": 0,
        "width": 912,
        "height": 380
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype",
          "spaceAggregation": "SUM",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "confidence",
            "country",
            "disposable",
            "network_status",
            "operator",
            "type"
          ],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${api_account_id}",
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
        "resolution=null&(cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(or(eq(\"aws.account.id\",\"${api_account_id}\")))):splitBy(confidence,country,disposable,network_status,operator,type):sum:sort(value(sum,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Success Latency",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 2318,
        "left": 532,
        "width": 380,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false
    },
    {
      "name": "Minimum",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2508,
        "left": 532,
        "width": 190,
        "height": 152
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Single value",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl",
          "spaceAggregation": "MIN",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${api_account_id}",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "status",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "200",
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
        "type": "SINGLE_VALUE",
        "global": {},
        "rules": [
          {
            "matcher": "A:",
            "unitTransform": "ms",
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
            "visible": true
          },
          "yAxes": []
        },
        "heatmapSettings": {
          "yAxis": "VALUE"
        },
        "singleValueSettings": {
          "showTrend": true,
          "showSparkLine": false,
          "linkTileColorToThreshold": true
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
        "resolution=Inf&(cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(\"aws.account.id\",\"${api_account_id}\")),or(eq(status,\"200\")))):splitBy():min:sort(value(min,descending)):limit(20)):limit(100):names",
        "resolution=null&(cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(\"aws.account.id\",\"${api_account_id}\")),or(eq(status,\"200\")))):splitBy():min:sort(value(min,descending)):limit(20))"
      ]
    },
    {
      "name": "Maximum",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2508,
        "left": 722,
        "width": 190,
        "height": 152
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Single value",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl",
          "spaceAggregation": "MAX",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${api_account_id}",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "status",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "200",
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
        "type": "SINGLE_VALUE",
        "global": {},
        "rules": [
          {
            "matcher": "A:",
            "unitTransform": "ms",
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
            "visible": true
          },
          "yAxes": []
        },
        "heatmapSettings": {
          "yAxis": "VALUE"
        },
        "singleValueSettings": {
          "showTrend": true,
          "showSparkLine": false,
          "linkTileColorToThreshold": true
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
        "resolution=Inf&(cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(\"aws.account.id\",\"${api_account_id}\")),or(eq(status,\"200\")))):splitBy():max:sort(value(max,descending)):limit(20)):limit(100):names",
        "resolution=null&(cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(\"aws.account.id\",\"${api_account_id}\")),or(eq(status,\"200\")))):splitBy():max:sort(value(max,descending)):limit(20))"
      ]
    },
    {
      "name": "Experian API Call Latency by Response Status",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2660,
        "left": 0,
        "width": 532,
        "height": 266
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl",
          "spaceAggregation": "AVG",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "status"
          ],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${api_account_id}",
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
        "global": {
          "hideLegend": false
        },
        "rules": [
          {
            "matcher": "A:",
            "unitTransform": "ms",
            "valueFormat": "0",
            "properties": {
              "color": "DEFAULT",
              "seriesType": "LINE",
              "alias": "Average"
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
                "B"
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
            "columnId": "",
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
            "queryId": "A",
            "visible": true
          }
        ],
        "tableSettings": {
          "hiddenColumns": [
            "A:status.name",
            "B:status.name"
          ]
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
        "resolution=null&(cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(\"aws.account.id\",\"${api_account_id}\")))):splitBy(status):avg:sort(value(avg,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Experian Successful API Call Latency",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2318,
        "left": 0,
        "width": 532,
        "height": 342
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "B",
          "metric": "cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl",
          "spaceAggregation": "AVG",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "status",
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
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${api_account_id}",
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
          "id": "A",
          "metric": "cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl",
          "spaceAggregation": "MAX",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${api_account_id}",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "status",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "200",
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
        "global": {
          "hideLegend": false
        },
        "rules": [
          {
            "matcher": "B:",
            "unitTransform": "auto",
            "valueFormat": "auto",
            "properties": {
              "color": "BLUE",
              "seriesType": "AREA",
              "alias": "Average"
            },
            "seriesOverrides": []
          },
          {
            "matcher": "A:",
            "unitTransform": "ms",
            "valueFormat": "0",
            "properties": {
              "color": "ORANGE",
              "seriesType": "LINE",
              "alias": "Maximum"
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
                "B",
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
            "columnId": "",
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
            "queryId": "A",
            "visible": true
          }
        ],
        "tableSettings": {
          "hiddenColumns": [
            "A:status.name",
            "B:status.name"
          ]
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
        "resolution=null&(cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(\"aws.account.id\",\"${api_account_id}\")),or(eq(status,\"200\")))):splitBy():avg:sort(value(avg,descending)):limit(20)):limit(100):names,(cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(\"aws.account.id\",\"${api_account_id}\")),or(eq(status,\"200\")))):splitBy():max:sort(value(max,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Median",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2356,
        "left": 532,
        "width": 380,
        "height": 152
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Single value",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl",
          "spaceAggregation": "MEDIAN",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${api_account_id}",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "status",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "200",
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
        "type": "SINGLE_VALUE",
        "global": {},
        "rules": [
          {
            "matcher": "A:",
            "unitTransform": "ms",
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
            "visible": true
          },
          "yAxes": []
        },
        "heatmapSettings": {
          "yAxis": "VALUE"
        },
        "singleValueSettings": {
          "showTrend": true,
          "showSparkLine": false,
          "linkTileColorToThreshold": true
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
        "resolution=Inf&(cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(\"aws.account.id\",\"${api_account_id}\")),or(eq(status,\"200\")))):splitBy():median:sort(value(median,descending)):limit(20)):limit(100):names",
        "resolution=null&(cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(\"aws.account.id\",\"${api_account_id}\")),or(eq(status,\"200\")))):splitBy():median:sort(value(median,descending)):limit(20))"
      ]
    },
    {
      "name": "Email checks started",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 684,
        "left": 456,
        "width": 456,
        "height": 342
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.durationFromRiskAssessmentQueuedToRiskAssessmentStartedByAccountIdCredentialTypeEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType",
          "spaceAggregation": "COUNT",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${check_account_id}",
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
        "type": "SINGLE_VALUE",
        "global": {
          "hideLegend": true
        },
        "rules": [
          {
            "matcher": "A:",
            "unitTransform": "auto",
            "valueFormat": "auto",
            "properties": {
              "color": "TURQUOISE",
              "seriesType": "LINE"
            },
            "seriesOverrides": []
          }
        ],
        "axes": {
          "xAxis": {
            "visible": true
          },
          "yAxes": []
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
        "resolution=Inf&(cloud.aws.authentication.durationFromRiskAssessmentQueuedToRiskAssessmentStartedByAccountIdCredentialTypeEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy():count:sort(value(avg,descending)):limit(20)):limit(100):names",
        "resolution=null&(cloud.aws.authentication.durationFromRiskAssessmentQueuedToRiskAssessmentStartedByAccountIdCredentialTypeEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy():count:sort(value(avg,descending)):limit(20))"
      ]
    },
    {
      "name": "Decision Count by Status (ALLOW/DENY)",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1900,
        "left": 0,
        "width": 646,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Single value",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.emailCheckDecisionMadeByAccountIdEmailCheckResultStatusEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType",
          "spaceAggregation": "COUNT",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${check_account_id}",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "emailcheckresultstatus",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "ALLOW",
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
          "metric": "cloud.aws.authentication.emailCheckDecisionMadeByAccountIdEmailCheckResultStatusEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType",
          "spaceAggregation": "COUNT",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${check_account_id}",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "emailcheckresultstatus",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "DENY",
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
          "metric": "cloud.aws.authentication.emailCheckDecisionMadeByAccountIdEmailCheckResultStatusEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType",
          "spaceAggregation": "COUNT",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${check_account_id}",
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
              "alias": "EmailCheckResultStatus = ALLOW"
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
              "alias": "EmailCheckResultStatus = DENY"
            },
            "seriesOverrides": []
          },
          {
            "matcher": "C:",
            "unitTransform": "auto",
            "valueFormat": "auto",
            "properties": {
              "color": "DEFAULT",
              "seriesType": "LINE",
              "alias": "Total"
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
                "C"
              ],
              "defaultAxis": true
            }
          ]
        },
        "heatmapSettings": {
          "yAxis": "VALUE"
        },
        "singleValueSettings": {
          "showTrend": true,
          "showSparkLine": true,
          "linkTileColorToThreshold": true
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
        "resolution=null&(cloud.aws.authentication.emailCheckDecisionMadeByAccountIdEmailCheckResultStatusEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType:filter(and(or(eq(emailcheckresultstatus,ALLOW)),or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy():count:sort(value(avg,descending)):limit(20)):limit(100):names,(cloud.aws.authentication.emailCheckDecisionMadeByAccountIdEmailCheckResultStatusEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")),or(eq(emailcheckresultstatus,DENY)))):splitBy():count:sort(value(avg,descending)):limit(20)):limit(100):names,(cloud.aws.authentication.emailCheckDecisionMadeByAccountIdEmailCheckResultStatusEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy():count:sort(value(avg,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Decision Outcome",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1900,
        "left": 646,
        "width": 266,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Pie",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.emailCheckDecisionMadeByAccountIdEmailCheckResultStatusEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType",
          "spaceAggregation": "COUNT",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "emailcheckresultstatus"
          ],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${check_account_id}",
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
        "type": "PIE_CHART",
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
            "visible": true
          },
          "yAxes": []
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
        "resolution=Inf&(cloud.aws.authentication.emailCheckDecisionMadeByAccountIdEmailCheckResultStatusEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy(emailcheckresultstatus):count:sort(value(avg,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Time from email submitted to check started",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 342,
        "left": 0,
        "width": 912,
        "height": 342
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.durationFromRiskAssessmentQueuedToRiskAssessmentStartedByAccountIdCredentialTypeEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType",
          "spaceAggregation": "MEDIAN",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${check_account_id}",
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
          "metric": "cloud.aws.authentication.durationFromRiskAssessmentQueuedToRiskAssessmentStartedByAccountIdCredentialTypeEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType",
          "spaceAggregation": "PERCENTILE_90",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${check_account_id}",
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
          "metric": "cloud.aws.authentication.durationFromRiskAssessmentQueuedToRiskAssessmentStartedByAccountIdCredentialTypeEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType",
          "spaceAggregation": "PERCENTILE_75",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${check_account_id}",
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
          "id": "D",
          "metric": "cloud.aws.authentication.durationFromRiskAssessmentQueuedToRiskAssessmentStartedByAccountIdCredentialTypeEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType",
          "spaceAggregation": "PERCENTILE_10",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${check_account_id}",
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
              "alias": "Average"
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
              "alias": "90th percentile"
            },
            "seriesOverrides": []
          },
          {
            "matcher": "C:",
            "unitTransform": "auto",
            "valueFormat": "auto",
            "properties": {
              "color": "ORANGE",
              "seriesType": "LINE",
              "alias": "75th percentile"
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
              "alias": "10th percentile"
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
                "C",
                "D"
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
        "resolution=null&(cloud.aws.authentication.durationFromRiskAssessmentQueuedToRiskAssessmentStartedByAccountIdCredentialTypeEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy():median:sort(value(median,descending)):limit(20)):limit(100):names,(cloud.aws.authentication.durationFromRiskAssessmentQueuedToRiskAssessmentStartedByAccountIdCredentialTypeEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy():percentile(90.0):sort(value(percentile(90.0),descending)):limit(20)):limit(100):names,(cloud.aws.authentication.durationFromRiskAssessmentQueuedToRiskAssessmentStartedByAccountIdCredentialTypeEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy():percentile(75.0):sort(value(percentile(75.0),descending)):limit(20)):limit(100):names,(cloud.aws.authentication.durationFromRiskAssessmentQueuedToRiskAssessmentStartedByAccountIdCredentialTypeEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy():percentile(10.0):sort(value(percentile(10.0),descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Median",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1520,
        "left": 532,
        "width": 380,
        "height": 190
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Single value",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.emailCheckDurationByAccountIdEnvironmentLogGroupRegionServiceNameServiceType",
          "spaceAggregation": "MEDIAN",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${api_account_id}",
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
        "type": "SINGLE_VALUE",
        "global": {},
        "rules": [
          {
            "matcher": "A:",
            "unitTransform": "ms",
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
            "visible": true
          },
          "yAxes": []
        },
        "heatmapSettings": {
          "yAxis": "VALUE"
        },
        "singleValueSettings": {
          "showTrend": true,
          "showSparkLine": true,
          "linkTileColorToThreshold": true
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
        "resolution=Inf&(cloud.aws.authentication.emailCheckDurationByAccountIdEnvironmentLogGroupRegionServiceNameServiceType:filter(and(or(eq(\"aws.account.id\",\"${api_account_id}\")))):splitBy():median:sort(value(median,descending)):limit(20)):limit(100):names",
        "resolution=null&(cloud.aws.authentication.emailCheckDurationByAccountIdEnvironmentLogGroupRegionServiceNameServiceType:filter(and(or(eq(\"aws.account.id\",\"${api_account_id}\")))):splitBy():median:sort(value(median,descending)):limit(20))"
      ]
    },
    {
      "name": "Minimum",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1710,
        "left": 532,
        "width": 190,
        "height": 152
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Single value",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.emailCheckDurationByAccountIdEnvironmentLogGroupRegionServiceNameServiceType",
          "spaceAggregation": "MIN",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${api_account_id}",
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
        "type": "SINGLE_VALUE",
        "global": {},
        "rules": [
          {
            "matcher": "A:",
            "unitTransform": "ms",
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
            "visible": true
          },
          "yAxes": []
        },
        "heatmapSettings": {
          "yAxis": "VALUE"
        },
        "singleValueSettings": {
          "showTrend": true,
          "showSparkLine": true,
          "linkTileColorToThreshold": true
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
        "resolution=Inf&(cloud.aws.authentication.emailCheckDurationByAccountIdEnvironmentLogGroupRegionServiceNameServiceType:filter(and(or(eq(\"aws.account.id\",\"${api_account_id}\")))):splitBy():min:sort(value(min,descending)):limit(20)):limit(100):names",
        "resolution=null&(cloud.aws.authentication.emailCheckDurationByAccountIdEnvironmentLogGroupRegionServiceNameServiceType:filter(and(or(eq(\"aws.account.id\",\"${api_account_id}\")))):splitBy():min:sort(value(min,descending)):limit(20))"
      ]
    },
    {
      "name": "Maximum",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1710,
        "left": 722,
        "width": 190,
        "height": 152
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Single value",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.emailCheckDurationByAccountIdEnvironmentLogGroupRegionServiceNameServiceType",
          "spaceAggregation": "MAX",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${api_account_id}",
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
        "type": "SINGLE_VALUE",
        "global": {},
        "rules": [
          {
            "matcher": "A:",
            "unitTransform": "ms",
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
            "visible": true
          },
          "yAxes": []
        },
        "heatmapSettings": {
          "yAxis": "VALUE"
        },
        "singleValueSettings": {
          "showTrend": true,
          "showSparkLine": true,
          "linkTileColorToThreshold": true
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
        "resolution=Inf&(cloud.aws.authentication.emailCheckDurationByAccountIdEnvironmentLogGroupRegionServiceNameServiceType:filter(and(or(eq(\"aws.account.id\",\"${api_account_id}\")))):splitBy():max:sort(value(max,descending)):limit(20)):limit(100):names",
        "resolution=null&(cloud.aws.authentication.emailCheckDurationByAccountIdEnvironmentLogGroupRegionServiceNameServiceType:filter(and(or(eq(\"aws.account.id\",\"${api_account_id}\")))):splitBy():max:sort(value(max,descending)):limit(20))"
      ]
    },
    {
      "name": "Total Email Check Duration",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1520,
        "left": 0,
        "width": 532,
        "height": 342
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.emailCheckDurationByAccountIdEnvironmentLogGroupRegionServiceNameServiceType",
          "spaceAggregation": "MEDIAN",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${api_account_id}",
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
          "metric": "cloud.aws.authentication.emailCheckDurationByAccountIdEnvironmentLogGroupRegionServiceNameServiceType",
          "spaceAggregation": "MAX",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${api_account_id}",
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
              "alias": "Median EmailCheckDuration"
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
              "alias": "Maximum EmailCheckDuration"
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
              "displayName": "Maximum",
              "visible": true,
              "min": "AUTO",
              "max": "AUTO",
              "position": "LEFT",
              "queryIds": [
                "A",
                "B"
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
        "resolution=null&(cloud.aws.authentication.emailCheckDurationByAccountIdEnvironmentLogGroupRegionServiceNameServiceType:filter(and(or(eq(\"aws.account.id\",\"${api_account_id}\")))):splitBy():median:sort(value(median,descending)):limit(20)):limit(100):names,(cloud.aws.authentication.emailCheckDurationByAccountIdEnvironmentLogGroupRegionServiceNameServiceType:filter(and(or(eq(\"aws.account.id\",\"${api_account_id}\")))):splitBy():max:sort(value(max,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Experian Succcessful API Call Latency",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 1026,
        "left": 0,
        "width": 912,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false
    },
    {
      "name": "Decision Outcome Breakdown",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 1862,
        "left": 0,
        "width": 912,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false
    },
    {
      "name": "Total Duration of Email Check",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 1482,
        "left": 0,
        "width": 912,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 2242,
        "left": 0,
        "width": 912,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "\n-------------------------"
    },
    {
      "name": "Phone Number",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 2280,
        "left": 0,
        "width": 912,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 1064,
        "left": 0,
        "width": 304,
        "height": 152
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "AUT-4870 will fill in this space when possible (currently blocked on a AWS to Dynatrace metric ingestion issue)"
    },
    {
      "name": "Lambda Act level Concurrent usage %",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 684,
        "left": 0,
        "width": 456,
        "height": 342
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "spaceAggregation": "AUTO",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "aws.account.id",
            "aws.region",
            "dt.entity.cloud:aws:account",
            "dt.entity.cloud:aws:region"
          ],
          "metricSelector": "cloud.aws.lambda.concurrentExecutionsByAccountIdRegion:filter(or(eq(\"aws.account.id\",\"${check_account_id}\")))/6000*100",
          "rate": "NONE",
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "SINGLE_VALUE",
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
            "visible": true
          },
          "yAxes": []
        },
        "heatmapSettings": {
          "yAxis": "VALUE"
        },
        "singleValueSettings": {
          "showTrend": true,
          "showSparkLine": true,
          "linkTileColorToThreshold": true
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
        "resolution=Inf&(cloud.aws.lambda.concurrentExecutionsByAccountIdRegion:filter(or(eq(\"aws.account.id\",\"${check_account_id}\")))/6000*100):limit(100):names",
        "resolution=null&(cloud.aws.lambda.concurrentExecutionsByAccountIdRegion:filter(or(eq(\"aws.account.id\",\"${check_account_id}\")))/6000*100)"
      ]
    }
  ]
}