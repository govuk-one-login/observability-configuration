{
  "metadata": {
    "configurationVersions": [
      7
    ],
    "clusterVersion": "1.305.80.20241211-154135"
  },
  "dashboardMetadata": {
    "name": "DI Authentication - Notify Metrics (${application_environment})",
    "shared": true,
    "owner": "becka.lelew@digital.cabinet-office.gov.uk",
    "tags": [
      "authentication"
    ],
    "hasConsistentColors": false
  },
  "tiles": [
    {
      "name": "Rate of email failures",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 722,
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
          "spaceAggregation": "AUTO",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "metricSelector": "cloud.aws.authentication.emailSentByAccountIdEmailNameEnvironmentLogGroupNotifyStatusRegionServiceNameServiceType:filter(and(or(not(eq(notifystatus,delivered))))):splitBy():sort(value(auto,descending)):sum\n",
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
            "valueFormat": "0",
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
              "min": "0",
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
          "connectNulls": true
        },
        "honeycombSettings": {
          "showHive": true,
          "showLegend": true,
          "showLabels": false
        }
      },
      "queriesSettings": {
        "resolution": "10m"
      },
      "metricExpressions": [
        "resolution=10m&(cloud.aws.authentication.emailSentByAccountIdEmailNameEnvironmentLogGroupNotifyStatusRegionServiceNameServiceType:filter(and(or(not(eq(notifystatus,delivered))))):splitBy():sort(value(auto,descending)):sum):limit(100):names"
      ]
    },
    {
      "name": "Rate of emails delivered by email type",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 722,
        "left": 570,
        "width": 570,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.emailSentByAccountIdEmailNameEnvironmentLogGroupNotifyStatusRegionServiceNameServiceType",
          "spaceAggregation": "SUM",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "emailname"
          ],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "notifystatus",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "delivered",
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
          "connectNulls": true
        },
        "honeycombSettings": {
          "showHive": true,
          "showLegend": true,
          "showLabels": false
        }
      },
      "queriesSettings": {
        "resolution": "1m"
      },
      "metricExpressions": [
        "resolution=1m&(cloud.aws.authentication.emailSentByAccountIdEmailNameEnvironmentLogGroupNotifyStatusRegionServiceNameServiceType:filter(and(or(eq(notifystatus,delivered)))):splitBy(emailname):sum:sort(value(sum,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "All SMS delivered",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1064,
        "left": 0,
        "width": 266,
        "height": 266
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
          "metricSelector": "cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsType:filter(eq(notifystatus,delivered)):splitBy()",
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
          "showTrend": false,
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
        "resolution": "1h",
        "foldTransformation": "TOTAL",
        "foldAggregation": "SUM"
      },
      "metricExpressions": [
        "resolution=1h&(cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsType:filter(eq(notifystatus,delivered)):splitBy()):limit(100):names:fold(sum)"
      ]
    },
    {
      "name": "All SMS failures",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1064,
        "left": 608,
        "width": 266,
        "height": 266
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
          "metricSelector": "cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsType:filter(eq(notifystatus,\"permanent-failure\")):splitBy()",
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
          "showTrend": false,
          "showSparkLine": false,
          "linkTileColorToThreshold": false
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
        "resolution": "1h",
        "foldTransformation": "TOTAL",
        "foldAggregation": "SUM"
      },
      "metricExpressions": [
        "resolution=1h&(cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsType:filter(eq(notifystatus,permanent-failure)):splitBy()):limit(100):names:fold(sum)"
      ]
    },
    {
      "name": "SMS failures by type",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1064,
        "left": 874,
        "width": 266,
        "height": 266
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Honeycomb",
      "queries": [
        {
          "id": "A",
          "spaceAggregation": "AUTO",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "smstype"
          ],
          "metricSelector": "cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsType:filter(not(eq(notifystatus,delivered))):splitBy(smstype):sort(value(auto,descending))",
          "rate": "NONE",
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "HONEYCOMB",
        "global": {},
        "rules": [
          {
            "matcher": "A:",
            "unitTransform": "auto",
            "valueFormat": "auto",
            "properties": {
              "color": "RED",
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
          "showLegend": false,
          "showLabels": true
        }
      },
      "queriesSettings": {
        "resolution": "",
        "foldTransformation": "TOTAL",
        "foldAggregation": "SUM"
      },
      "metricExpressions": [
        "resolution=null&(cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsType:filter(not(eq(notifystatus,delivered))):splitBy(smstype):sort(value(auto,descending))):names:fold(sum)"
      ]
    },
    {
      "name": "SMS delivered by type",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1064,
        "left": 266,
        "width": 266,
        "height": 266
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Honeycomb",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsType",
          "spaceAggregation": "AUTO",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "smstype"
          ],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "notifystatus",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "delivered",
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
        "type": "HONEYCOMB",
        "global": {},
        "rules": [
          {
            "matcher": "A:",
            "unitTransform": "auto",
            "valueFormat": "auto",
            "properties": {
              "color": "GREEN",
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
          "showLegend": false,
          "showLabels": true
        }
      },
      "queriesSettings": {
        "resolution": "",
        "foldTransformation": "TOTAL",
        "foldAggregation": "SUM"
      },
      "metricExpressions": [
        "resolution=null&(cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsType:filter(and(or(eq(notifystatus,delivered)))):splitBy(smstype):sort(value(auto,descending)):limit(20)):names:fold(sum)"
      ]
    },
    {
      "name": "Email failure count by email type",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 38,
        "left": 114,
        "width": 874,
        "height": 342
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Honeycomb",
      "queries": [
        {
          "id": "A",
          "spaceAggregation": "AUTO",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "emailname"
          ],
          "metricSelector": "cloud.aws.authentication.emailSentByAccountIdEmailNameEnvironmentLogGroupNotifyStatusRegionServiceNameServiceType:filter(not(eq(notifystatus,delivered))):splitBy(emailname)",
          "rate": "NONE",
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "HONEYCOMB",
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
          "showLegend": false,
          "showLabels": true
        }
      },
      "queriesSettings": {
        "resolution": "1h",
        "foldTransformation": "TOTAL",
        "foldAggregation": "SUM"
      },
      "metricExpressions": [
        "resolution=1h&(cloud.aws.authentication.emailSentByAccountIdEmailNameEnvironmentLogGroupNotifyStatusRegionServiceNameServiceType:filter(not(eq(notifystatus,delivered))):splitBy(emailname)):names:fold(sum)"
      ]
    },
    {
      "name": "Emails delivered count by email type",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 380,
        "left": 114,
        "width": 874,
        "height": 342
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Honeycomb",
      "queries": [
        {
          "id": "A",
          "spaceAggregation": "AUTO",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "emailname"
          ],
          "metricSelector": "cloud.aws.authentication.emailSentByAccountIdEmailNameEnvironmentLogGroupNotifyStatusRegionServiceNameServiceType:filter(eq(notifystatus,delivered)):splitBy(emailname)",
          "rate": "NONE",
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "HONEYCOMB",
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
          "showLegend": false,
          "showLabels": true
        }
      },
      "queriesSettings": {
        "resolution": "1h",
        "foldTransformation": "TOTAL",
        "foldAggregation": "SUM"
      },
      "metricExpressions": [
        "resolution=1h&(cloud.aws.authentication.emailSentByAccountIdEmailNameEnvironmentLogGroupNotifyStatusRegionServiceNameServiceType:filter(eq(notifystatus,delivered)):splitBy(emailname)):names:fold(sum)"
      ]
    }
  ]
}