{
  "metadata": {
    "configurationVersions": [
      7
    ],
    "clusterVersion": "1.347.61.20260921-114555"
  },
  "id": "1d348cee-641c-4541-85c0-6b920115e94d",
  "dashboardMetadata": {
    "name": "di-auth-check-experian-${application_environment}",
    "shared": true,
    "owner": "benjamin.fernandes@digital.cabinet-office.gov.uk",
    "popularity": 10,
    "tilesNameSize": "medium",
    "hasConsistentColors": true
  },
  "tiles": [
    {
      "name": "Oldest message age",
      "nameSize": "",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 152,
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
                    "value": "${application_environment}-pending-email-check-queue",
                    "evaluator": "EQ"
                  },
                  {
                    "value": "PendingEmailCheckResultsQueue",
                    "evaluator": "EQ"
                  }
                ]
              }
            ],
            "criteria": []
          },
          "limit": 20,
          "rate": "NONE",
          "enabled": true,
          "histogram": false
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
        "resolution=null&(cloud.aws.sqs.approximateAgeOfOldestMessageByAccountIdQueueNameRegion:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\"),eq(\"aws.account.id\",\"${api_account_id}\")),or(eq(queuename,${application_environment}-pending-email-check-queue),eq(queuename,PendingEmailCheckResultsQueue)))):splitBy(\"aws.account.id\",queuename):sort(value(auto,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Phone check confidence",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2584,
        "left": 950,
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
          "enabled": true,
          "histogram": false
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
        "resolution=Inf&(cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy(confidence):sum:sort(value(sum,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Disposable numbers",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2584,
        "left": 1254,
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
          "enabled": true,
          "histogram": false
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
        "resolution=Inf&(cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy(disposable):sum:sort(value(sum,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Completed checks",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2280,
        "left": 950,
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
          "enabled": true,
          "histogram": false
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
        "resolution=Inf&(cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy():count:sort(value(avg,descending)):limit(20)):limit(100):names",
        "resolution=null&(cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy():count:sort(value(avg,descending)):limit(20))"
      ]
    },
    {
      "name": "UK telephone numbers",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2280,
        "left": 1254,
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
          "metricSelector": "cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(eq(\"aws.account.id\",\"${check_account_id}\"), or(eq(country,GBR),eq(country,IMN),eq(country,GGY)))):splitBy():count:sort(value(avg,descending)):limit(20)",
          "rate": "NONE",
          "enabled": true,
          "histogram": false
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
        "resolution=Inf&(cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(eq(\"aws.account.id\",\"${check_account_id}\"),or(eq(country,GBR),eq(country,IMN),eq(country,GGY)))):splitBy():count:sort(value(avg,descending)):limit(20)):limit(100):names",
        "resolution=null&(cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(eq(\"aws.account.id\",\"${check_account_id}\"),or(eq(country,GBR),eq(country,IMN),eq(country,GGY)))):splitBy():count:sort(value(avg,descending)):limit(20))"
      ]
    },
    {
      "name": "Non UK telephone numbers",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2280,
        "left": 1558,
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
          "metricSelector": "cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(eq(\"aws.account.id\",\"${check_account_id}\"), not(or(eq(country,GBR),eq(country,IMN),eq(country,GGY))))):splitBy():count:sort(value(avg,descending)):limit(20)",
          "rate": "NONE",
          "enabled": true,
          "histogram": false
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
        "resolution=Inf&(cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(eq(\"aws.account.id\",\"${check_account_id}\"),not(or(eq(country,GBR),eq(country,IMN),eq(country,GGY))))):splitBy():count:sort(value(avg,descending)):limit(20)):limit(100):names",
        "resolution=null&(cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(eq(\"aws.account.id\",\"${check_account_id}\"),not(or(eq(country,GBR),eq(country,IMN),eq(country,GGY))))):splitBy():count:sort(value(avg,descending)):limit(20))"
      ]
    },
    {
      "name": "Billable events",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2584,
        "left": 1558,
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
          "metricSelector": "cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(eq(\"aws.account.id\",\"${check_account_id}\"), or(not(eq(type,\"Bad format\")),not(and(eq(type,\"Mobile\"),eq(\"confidence\",\"No Coverage\")))))):splitBy():count:sort(value(avg,descending)):limit(20)",
          "rate": "NONE",
          "enabled": true,
          "histogram": false
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
        "resolution=Inf&(cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(eq(\"aws.account.id\",\"${check_account_id}\"),or(not(eq(type,\"Bad format\")),not(and(eq(type,Mobile),eq(confidence,\"No Coverage\")))))):splitBy():count:sort(value(avg,descending)):limit(20)):limit(100):names",
        "resolution=null&(cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(eq(\"aws.account.id\",\"${check_account_id}\"),or(not(eq(type,\"Bad format\")),not(and(eq(type,Mobile),eq(confidence,\"No Coverage\")))))):splitBy():count:sort(value(avg,descending)):limit(20))"
      ]
    },
    {
      "name": "Email checks started",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 3268,
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
          "enabled": true,
          "histogram": false
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
      "name": "",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1976,
        "left": 608,
        "width": 304,
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
          "rate": "NONE",
          "enabled": true,
          "histogram": false
        }
      ],
      "visualConfig": {
        "type": "PIE_CHART",
        "global": {
          "hideLegend": true
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
        "resolution=Inf&(cloud.aws.authentication.emailCheckDecisionMadeByAccountIdEmailCheckResultStatusEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy(emailcheckresultstatus):count:sort(value(avg,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Median",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1216,
        "left": 456,
        "width": 456,
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
          "enabled": true,
          "histogram": false
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
        "top": 1406,
        "left": 456,
        "width": 228,
        "height": 190
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
          "enabled": true,
          "histogram": false
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
        "top": 1406,
        "left": 684,
        "width": 228,
        "height": 190
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
          "enabled": true,
          "histogram": false
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
      "name": "📧 Experian API responses",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 798,
        "left": 0,
        "width": 912,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false
    },
    {
      "name": "📧 Decision outcome",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 1634,
        "left": 0,
        "width": 912,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false
    },
    {
      "name": "📧 Total check duration",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 1178,
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
        "top": 836,
        "left": 0,
        "width": 912,
        "height": 304
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
        "top": 3268,
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
          "enabled": true,
          "histogram": false
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
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 0,
        "left": 0,
        "width": 912,
        "height": 76
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "# 📧 Email Checks"
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 0,
        "left": 950,
        "width": 912,
        "height": 76
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "# ☎️ Phone Checks"
    },
    {
      "name": "📧 SQS summary",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 114,
        "left": 0,
        "width": 912,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false
    },
    {
      "name": "☎️ SQS summary",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 114,
        "left": 950,
        "width": 912,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false
    },
    {
      "name": "☎️ Experian API responses",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 798,
        "left": 950,
        "width": 912,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false
    },
    {
      "name": "☎️ Total check duration",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 1178,
        "left": 950,
        "width": 912,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false
    },
    {
      "name": "Message processing queue size",
      "nameSize": "",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 152,
        "left": 950,
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
                    "value": "${authentication_account_id}",
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
                    "value": "${application_environment}-experian-phone-check-dlq",
                    "evaluator": "EQ"
                  },
                  {
                    "value": "${application_environment}-experian-phone-check-queue",
                    "evaluator": "EQ"
                  }
                ]
              }
            ],
            "criteria": []
          },
          "limit": 20,
          "rate": "NONE",
          "enabled": true,
          "histogram": false
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
        "resolution=null&(cloud.aws.sqs.approximateNumberOfMessagesVisibleByAccountIdQueueNameRegion:filter(and(or(eq(\"aws.account.id\",\"${authentication_account_id}\")),or(eq(queuename,${application_environment}-experian-phone-check-dlq),eq(queuename,${application_environment}-experian-phone-check-queue)))):splitBy(\"aws.account.id\",queuename):max:sort(value(max,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Oldest message age",
      "nameSize": "",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 152,
        "left": 1406,
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
                "filter": "queuename",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${application_environment}-experian-phone-check-queue",
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
                    "value": "${authentication_account_id}",
                    "evaluator": "EQ"
                  }
                ]
              }
            ],
            "criteria": []
          },
          "limit": 20,
          "rate": "NONE",
          "enabled": true,
          "histogram": false
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
        "resolution=null&(cloud.aws.sqs.approximateAgeOfOldestMessageByAccountIdQueueNameRegion:filter(and(or(eq(queuename,${application_environment}-experian-phone-check-queue)),or(eq(\"aws.account.id\",\"${authentication_account_id}\")))):splitBy(\"aws.account.id\",queuename):sort(value(auto,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Message processing queue size",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 152,
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
                    "value": "PendingEmailCheckResultsDeadLetterQueue",
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
                    "value": "PendingEmailCheckResultsQueue",
                    "evaluator": "EQ"
                  }
                ]
              }
            ],
            "criteria": []
          },
          "limit": 20,
          "rate": "NONE",
          "enabled": true,
          "histogram": false
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
        "resolution=null&(cloud.aws.sqs.approximateNumberOfMessagesVisibleByAccountIdQueueNameRegion:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\"),eq(\"aws.account.id\",\"${api_account_id}\")),or(eq(queuename,PendingEmailCheckResultsDeadLetterQueue),eq(queuename,${application_environment}-pending-email-check-queue),eq(queuename,${application_environment}-pending-email-check-dlq),eq(queuename,PendingEmailCheckResultsQueue)))):splitBy(\"aws.account.id\",queuename):max:sort(value(max,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Time from email submitted to check started",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2964,
        "left": 0,
        "width": 912,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.durationFromRiskAssessmentQueuedToRiskAssessmentStartedByAccountIdCredentialTypeEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType",
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
          "enabled": true,
          "histogram": false
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
          "enabled": true,
          "histogram": false
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
          "enabled": true,
          "histogram": false
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
          "enabled": true,
          "histogram": false
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
        "resolution=null&(cloud.aws.authentication.durationFromRiskAssessmentQueuedToRiskAssessmentStartedByAccountIdCredentialTypeEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy():avg:sort(value(avg,descending)):limit(20)):limit(100):names,(cloud.aws.authentication.durationFromRiskAssessmentQueuedToRiskAssessmentStartedByAccountIdCredentialTypeEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy():percentile(90.0):sort(value(percentile(90.0),descending)):limit(20)):limit(100):names,(cloud.aws.authentication.durationFromRiskAssessmentQueuedToRiskAssessmentStartedByAccountIdCredentialTypeEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy():percentile(75.0):sort(value(percentile(75.0),descending)):limit(20)):limit(100):names,(cloud.aws.authentication.durationFromRiskAssessmentQueuedToRiskAssessmentStartedByAccountIdCredentialTypeEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy():percentile(10.0):sort(value(percentile(10.0),descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Total phone check duration",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1216,
        "left": 950,
        "width": 456,
        "height": 380
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
          "enabled": true,
          "histogram": false
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
          "enabled": true,
          "histogram": false
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
            "unitTransform": "ms",
            "valueFormat": "auto",
            "properties": {
              "color": "DEFAULT",
              "seriesType": "LINE",
              "alias": "Average"
            },
            "seriesOverrides": []
          },
          {
            "matcher": "A:",
            "unitTransform": "ms",
            "valueFormat": "auto",
            "properties": {
              "color": "DEFAULT",
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
        "resolution=null&(cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(status,\"200\")),or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy():avg:sort(value(avg,descending)):limit(20)):limit(100):names,(cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(status,\"200\")),or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy():max:sort(value(max,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Total email check duration",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1216,
        "left": 0,
        "width": 456,
        "height": 380
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
          "enabled": true,
          "histogram": false
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
          "enabled": true,
          "histogram": false
        }
      ],
      "visualConfig": {
        "type": "GRAPH_CHART",
        "global": {},
        "rules": [
          {
            "matcher": "A:",
            "unitTransform": "ms",
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
            "unitTransform": "ms",
            "valueFormat": "auto",
            "properties": {
              "color": "DEFAULT",
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
      "name": "Median",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1216,
        "left": 1406,
        "width": 456,
        "height": 190
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
          "enabled": true,
          "histogram": false
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
        "resolution=Inf&(cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(status,\"200\")),or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy():median:sort(value(median,descending)):limit(20)):limit(100):names",
        "resolution=null&(cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(status,\"200\")),or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy():median:sort(value(median,descending)):limit(20))"
      ]
    },
    {
      "name": "Minimum",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1406,
        "left": 1406,
        "width": 228,
        "height": 190
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
          "enabled": true,
          "histogram": false
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
        "resolution=Inf&(cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(status,\"200\")),or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy():min:sort(value(min,descending)):limit(20)):limit(100):names",
        "resolution=null&(cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(status,\"200\")),or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy():min:sort(value(min,descending)):limit(20))"
      ]
    },
    {
      "name": "Maximum",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1406,
        "left": 1634,
        "width": 228,
        "height": 190
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
          "enabled": true,
          "histogram": false
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
        "resolution=Inf&(cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(status,\"200\")),or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy():max:sort(value(max,descending)):limit(20)):limit(100):names",
        "resolution=null&(cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(status,\"200\")),or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy():max:sort(value(max,descending)):limit(20))"
      ]
    },
    {
      "name": "☎️ Decision outcome",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 1634,
        "left": 950,
        "width": 912,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false
    },
    {
      "name": "Completed checks",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2280,
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
          "spaceAggregation": "AUTO",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "emailcheckresultstatus",
            "environment",
            "servicetype",
            "aws.region",
            "journeytype",
            "aws.account.id",
            "servicename",
            "dt.source",
            "dt.entity.cloud:aws:account",
            "loggroup",
            "dt.entity.cloud:aws:region"
          ],
          "metricSelector": "cloud.aws.authentication.emailCheckDecisionMadeByAccountIdEmailCheckResultStatusEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):count",
          "rate": "NONE",
          "enabled": true,
          "histogram": false
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
        "resolution=Inf&(cloud.aws.authentication.emailCheckDecisionMadeByAccountIdEmailCheckResultStatusEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):count):limit(100):names",
        "resolution=null&(cloud.aws.authentication.emailCheckDecisionMadeByAccountIdEmailCheckResultStatusEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):count)"
      ]
    },
    {
      "name": "Phone check results",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1672,
        "left": 950,
        "width": 912,
        "height": 304
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
          "enabled": true,
          "histogram": false
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
              "seriesType": "STACKED_AREA"
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
        "resolution=null&(cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy(confidence,country,disposable,network_status,operator,type):sum:sort(value(sum,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1976,
        "left": 1558,
        "width": 304,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Decision Outcome",
      "queries": [
        {
          "id": "A",
          "spaceAggregation": "AUTO",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "confidence",
            "country",
            "disposable",
            "network_status",
            "operator",
            "type"
          ],
          "metricSelector": "cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy(confidence,country,disposable,network_status,operator,type):sum:sort(value(sum,descending)):limit(20)",
          "rate": "NONE",
          "enabled": true,
          "histogram": false
        }
      ],
      "visualConfig": {
        "type": "PIE_CHART",
        "global": {
          "hideLegend": true
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
        "resolution=Inf&(cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy(confidence,country,disposable,network_status,operator,type):sum:sort(value(sum,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Top list",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1976,
        "left": 950,
        "width": 608,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Top list",
      "queries": [
        {
          "id": "A",
          "spaceAggregation": "AUTO",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "confidence",
            "country",
            "disposable",
            "network_status",
            "operator",
            "type"
          ],
          "metricSelector": "cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy(confidence,country,disposable,network_status,operator,type):sum:sort(value(sum,descending)):limit(20)",
          "rate": "NONE",
          "enabled": true,
          "histogram": false
        }
      ],
      "visualConfig": {
        "type": "TOP_LIST",
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
        "resolution=Inf&(cloud.aws.authentication.phoneCheckResultByAccountIdLogGroupRegionServiceNameServiceTypeconfidencecountrydisposablenetwork_statusoperatortype:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy(confidence,country,disposable,network_status,operator,type):sum:sort(value(sum,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Top list",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1976,
        "left": 0,
        "width": 608,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Top list",
      "queries": [
        {
          "id": "A",
          "spaceAggregation": "AUTO",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "emailcheckresultstatus"
          ],
          "metricSelector": "cloud.aws.authentication.emailCheckDecisionMadeByAccountIdEmailCheckResultStatusEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy(emailcheckresultstatus):count:sort(value(avg,descending)):limit(20)\n",
          "rate": "NONE",
          "enabled": true,
          "histogram": false
        }
      ],
      "visualConfig": {
        "type": "TOP_LIST",
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
      "name": "Email check results",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1672,
        "left": 0,
        "width": 912,
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
              },
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
          "enabled": true,
          "histogram": false
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
              },
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
          "enabled": true,
          "histogram": false
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
              "seriesType": "STACKED_AREA",
              "alias": "ALLOW"
            },
            "seriesOverrides": []
          },
          {
            "matcher": "B:",
            "unitTransform": "auto",
            "valueFormat": "auto",
            "properties": {
              "color": "DEFAULT",
              "seriesType": "STACKED_AREA",
              "alias": "DENY"
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
        "resolution=null&(cloud.aws.authentication.emailCheckDecisionMadeByAccountIdEmailCheckResultStatusEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType:filter(and(or(eq(emailcheckresultstatus,ALLOW)),or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy():count:sort(value(avg,descending)):limit(20)):limit(100):names,(cloud.aws.authentication.emailCheckDecisionMadeByAccountIdEmailCheckResultStatusEnvironmentJourneyTypeLogGroupRegionServiceNameServiceType:filter(and(or(eq(emailcheckresultstatus,DENY)),or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy():count:sort(value(avg,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "📧 Other",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 2926,
        "left": 0,
        "width": 912,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false
    },
    {
      "name": "Number of messages received",
      "nameSize": "",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 456,
        "left": 950,
        "width": 456,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.sqs.numberOfMessagesReceivedByAccountIdQueueNameRegion",
          "spaceAggregation": "COUNT",
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
                "filter": "queuename",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${application_environment}-experian-phone-check-queue",
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
                    "value": "${authentication_account_id}",
                    "evaluator": "EQ"
                  }
                ]
              }
            ],
            "criteria": []
          },
          "limit": 20,
          "rate": "NONE",
          "enabled": true,
          "histogram": false
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
        "resolution=null&(cloud.aws.sqs.numberOfMessagesReceivedByAccountIdQueueNameRegion:filter(and(or(eq(queuename,${application_environment}-experian-phone-check-queue)),or(eq(\"aws.account.id\",\"${authentication_account_id}\")))):splitBy(\"aws.account.id\",queuename):count:sort(value(avg,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Number of messages in flight",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 456,
        "left": 1406,
        "width": 456,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.sqs.approximateNumberOfMessagesNotVisibleByAccountIdQueueNameRegion",
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
                "filter": "queuename",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${application_environment}-experian-phone-check-queue",
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
                    "value": "${authentication_account_id}",
                    "evaluator": "EQ"
                  }
                ]
              }
            ],
            "criteria": []
          },
          "limit": 20,
          "rate": "NONE",
          "enabled": true,
          "histogram": false
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
        "resolution=null&(cloud.aws.sqs.approximateNumberOfMessagesNotVisibleByAccountIdQueueNameRegion:filter(and(or(eq(queuename,${application_environment}-experian-phone-check-queue)),or(eq(\"aws.account.id\",\"${authentication_account_id}\")))):splitBy(\"aws.account.id\",queuename):sort(value(auto,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Number of messages received",
      "nameSize": "",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 456,
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
          "metric": "cloud.aws.sqs.numberOfMessagesReceivedByAccountIdQueueNameRegion",
          "spaceAggregation": "COUNT",
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
          "enabled": true,
          "histogram": false
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
        "resolution=null&(cloud.aws.sqs.numberOfMessagesReceivedByAccountIdQueueNameRegion:filter(and(or(eq(\"aws.account.id\",\"${api_account_id}\")),or(eq(queuename,${application_environment}-pending-email-check-queue)))):splitBy(\"aws.account.id\",queuename):count:sort(value(avg,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Number of messages in flight",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 456,
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
          "metric": "cloud.aws.sqs.approximateNumberOfMessagesNotVisibleByAccountIdQueueNameRegion",
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
          "enabled": true,
          "histogram": false
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
        "resolution=null&(cloud.aws.sqs.approximateNumberOfMessagesNotVisibleByAccountIdQueueNameRegion:filter(and(or(eq(\"aws.account.id\",\"${api_account_id}\")),or(eq(queuename,${application_environment}-pending-email-check-queue)))):splitBy(\"aws.account.id\",queuename):sort(value(auto,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Latency by response status",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 836,
        "left": 950,
        "width": 456,
        "height": 304
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
          "sortBy": "ASC",
          "sortByDimension": "status",
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
          "enabled": true,
          "histogram": false
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
        "resolution=null&(cloud.aws.authentication.experianRequestLatencyByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy(status):avg:names:sort(dimension(status,ascending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Response statuses",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 836,
        "left": 1406,
        "width": 456,
        "height": 304
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
          "sortBy": "ASC",
          "sortByDimension": "status",
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
          "enabled": true,
          "histogram": false
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
              "seriesType": "STACKED_AREA"
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
        "resolution=null&(cloud.aws.authentication.experianResponseReceivedByAccountIdLogGroupRegionServiceNameServiceTypestatusurl:filter(and(or(eq(\"aws.account.id\",\"${check_account_id}\")))):splitBy(status):sum:names:sort(dimension(status,ascending)):limit(20)):limit(100):names"
      ]
    }
  ]
}