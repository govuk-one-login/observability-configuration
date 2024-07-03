{
  "metadata": {
  },
  "dashboardMetadata": {
    "name": "di-auth-check-experian-${application_environment}",
    "shared": true,
    "owner": "matt.votsikas-mclean@digital.cabinet-office.gov.uk",
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
        "width": 874,
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
        "width": 570,
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
                    "value": "${check_account_id}",
                    "evaluator": "EQ"
                  },
                  {
                    "value": "${api_account_id}",
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
                    "value": "PendingEmailCheckResultsDeadLetterQueue",
                    "evaluator": "EQ"
                  },
                  {
                    "value": "${application_environment}-pending-email-check-dlq",
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
        "resolution=null&(cloud.aws.sqs.approximateNumberOfMessagesVisibleByAccountIdQueueNameRegion:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\"),eq(\"aws.account.id\",\"${api_account_id}\")),or(eq(queuename,PendingEmailCheckResultsQueue),eq(queuename,PendingEmailCheckResultsDeadLetterQueue),eq(queuename,${application_environment}-pending-email-check-dlq),eq(queuename,${application_environment}-pending-email-check-queue)))):splitBy(\"aws.account.id\",queuename):max:sort(value(max,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 38,
        "left": 570,
        "width": 304,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "There should be very little messages in a queue. If the number is building up notably over time it indicates an issue clearing the queues. If this happens, investigate.\n\nAny messages in a DLQ queue will not clear themselves and require someone to investigate and resolve."
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 342,
        "left": 570,
        "width": 304,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "The oldest message in any of these queues should really be no more than a minute, with the vast majority a few seconds.\n\nLarge message ages indicate an issue. Investigate."
    },
    {
      "name": "SQS oldest message ages",
      "nameSize": "",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 342,
        "left": 0,
        "width": 570,
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
        "resolution=null&(cloud.aws.sqs.approximateAgeOfOldestMessageByAccountIdQueueNameRegion:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\"),eq(\"aws.account.id\",\"${api_account_id}\")),or(eq(queuename,PendingEmailCheckResultsQueue),eq(queuename,${application_environment}-pending-email-check-queue)))):splitBy(\"aws.account.id\",queuename):sort(value(auto,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Phone Number",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 684,
        "left": 0,
        "width": 912,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false
    },
    {
      "name": "Phone Check Confidence",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1634,
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
        "top": 1634,
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
        "top": 1330,
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
        "top": 1330,
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
        "top": 1330,
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
        "top": 1634,
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
        "top": 1064,
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
        "top": 1938,
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
        "top": 722,
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
        "top": 912,
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
        "resolution=Inf&(cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(status,\"200\")),or(eq(\"aws.account.id\",\"${api_account_id}\")))):splitBy():min:sort(value(min,descending)):limit(20)):limit(100):names",
        "resolution=null&(cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(status,\"200\")),or(eq(\"aws.account.id\",\"${api_account_id}\")))):splitBy():min:sort(value(min,descending)):limit(20))"
      ]
    },
    {
      "name": "Maximum",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 912,
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
        "resolution=Inf&(cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(status,\"200\")),or(eq(\"aws.account.id\",\"${api_account_id}\")))):splitBy():max:sort(value(max,descending)):limit(20)):limit(100):names",
        "resolution=null&(cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(status,\"200\")),or(eq(\"aws.account.id\",\"${api_account_id}\")))):splitBy():max:sort(value(max,descending)):limit(20))"
      ]
    },
    {
      "name": "Experian API Call Latency by Response Status",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1064,
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
        "top": 722,
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
        "resolution=null&(cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(status,\"200\")),or(eq(\"aws.account.id\",\"${api_account_id}\")))):splitBy():avg:sort(value(avg,descending)):limit(20)):limit(100):names,(cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(status,\"200\")),or(eq(\"aws.account.id\",\"${api_account_id}\")))):splitBy():max:sort(value(max,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Median",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 760,
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
        "resolution=Inf&(cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(status,\"200\")),or(eq(\"aws.account.id\",\"${api_account_id}\")))):splitBy():median:sort(value(median,descending)):limit(20)):limit(100):names",
        "resolution=null&(cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(status,\"200\")),or(eq(\"aws.account.id\",\"${api_account_id}\")))):splitBy():median:sort(value(median,descending)):limit(20))"
      ]
    }
  ]
}