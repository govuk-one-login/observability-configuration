{
  "metadata": {
    "configurationVersions": [
      7
    ],
    "clusterVersion": "1.324.29.20250922-090614"
  },
  "dashboardMetadata": {
    "name": "DI Authentication - Notification Metrics (${application_environment})",
    "shared": true,
    "owner": "authentication-developers@digital.cabinet-office.gov.uk",
    "tags": [
      "authentication"
    ],
    "hasConsistentColors": false
  },
  "tiles": [
    {
      "name": "Email Delivery Failure Rate",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1482,
        "left": 0,
        "width": 570,
        "height": 266
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
          "splitBy": [],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "notifystatus",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "delivered",
                    "evaluator": "NE"
                  }
                ]
              },
              {
                "filter": "environment",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${application_environment}",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${account_id}",
                    "evaluator": "EQ"
                  }
                ]
              }
            ],
            "criteria": []
          },
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
      }
    },
    {
      "name": "Email Successful Delivery Rate by Type",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 874,
        "left": 0,
        "width": 950,
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
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${account_id}",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "notifystatus",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "delivered",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "environment",
                "filterType": "DIMENSION",
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
      }
    },
    {
      "name": "All SMS' Delivered",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2926,
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
          "metric": "cloud.aws.authentication.smsNotificationSentByAccountIdApplicationCountryEnvironmentIsTestLogGroupNotificationTypeRegionServiceNameServiceTypeSmsDestinationType",
          "spaceAggregation": "AUTO",
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
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${account_id}",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "environment",
                "filterType": "DIMENSION",
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
      }
    },
    {
      "name": "All SMS Delivery Failures by Type",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 4218,
        "left": 342,
        "width": 418,
        "height": 266
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Honeycomb",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsDestinationTypeSmsType",
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
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "delivered",
                    "evaluator": "NE"
                  }
                ]
              },
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${account_id}",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "environment",
                "filterType": "DIMENSION",
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
      }
    },
    {
      "name": "SMS' Delivered by Type",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2926,
        "left": 266,
        "width": 342,
        "height": 266
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Honeycomb",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsDestinationTypeSmsType",
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
                "filter": "environment",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${application_environment}",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "notifystatus",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "delivered",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${account_id}",
                    "evaluator": "EQ"
                  }
                ]
              }
            ],
            "criteria": []
          },
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
        "resolution": "1m",
        "foldTransformation": "TOTAL",
        "foldAggregation": "SUM"
      }
    },
    {
      "name": "Email Delivery Failure Count by Type",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1482,
        "left": 570,
        "width": 570,
        "height": 266
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Honeycomb",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.emailSentByAccountIdEmailNameEnvironmentLogGroupNotifyStatusRegionServiceNameServiceType",
          "spaceAggregation": "AUTO",
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
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${account_id}",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "notifystatus",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "delivered",
                    "evaluator": "NE"
                  }
                ]
              },
              {
                "filter": "environment",
                "filterType": "DIMENSION",
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
      }
    },
    {
      "name": "Email Successful Delivery Count by Type",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 874,
        "left": 950,
        "width": 950,
        "height": 342
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Honeycomb",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.emailSentByAccountIdEmailNameEnvironmentLogGroupNotifyStatusRegionServiceNameServiceType",
          "spaceAggregation": "AUTO",
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
                "filter": "environment",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${application_environment}",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "notifystatus",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "delivered",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${account_id}",
                    "evaluator": "EQ"
                  }
                ]
              }
            ],
            "criteria": []
          },
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
      }
    },
    {
      "name": "All SMS Successful Delivery Rate",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 3192,
        "left": 0,
        "width": 608,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.smsNotificationSentByAccountIdApplicationCountryEnvironmentIsTestLogGroupNotificationTypeRegionServiceNameServiceTypeSmsDestinationType",
          "spaceAggregation": "SUM",
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
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${account_id}",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "environment",
                "filterType": "DIMENSION",
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
        "resolution": "10m"
      }
    },
    {
      "name": "All SMS Delivery Failures",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 4218,
        "left": 0,
        "width": 342,
        "height": 266
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Single value",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsDestinationTypeSmsType",
          "spaceAggregation": "SUM",
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
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${application_environment}",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "notifystatus",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "delivered",
                    "evaluator": "NE"
                  }
                ]
              },
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${account_id}",
                    "evaluator": "EQ"
                  }
                ]
              }
            ],
            "criteria": []
          },
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
      }
    },
    {
      "name": "All SMS Delivery Failure Rate",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 4218,
        "left": 760,
        "width": 608,
        "height": 266
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsDestinationTypeSmsType",
          "spaceAggregation": "SUM",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "notifystatus"
          ],
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "environment",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${application_environment}",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "notifystatus",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "delivered",
                    "evaluator": "NE"
                  }
                ]
              },
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${account_id}",
                    "evaluator": "EQ"
                  }
                ]
              }
            ],
            "criteria": []
          },
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
        "resolution": "10m"
      }
    },
    {
      "name": "International SMS Delivery Success Statuses",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 3800,
        "left": 0,
        "width": 608,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Honeycomb",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsDestinationTypeSmsType",
          "spaceAggregation": "SUM",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "notifystatus"
          ],
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "environment",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${application_environment}",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "countrycode",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "44",
                    "evaluator": "NE"
                  }
                ]
              },
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${account_id}",
                    "evaluator": "EQ"
                  }
                ]
              }
            ],
            "criteria": []
          },
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
          "showLegend": false,
          "showLabels": true
        }
      },
      "queriesSettings": {
        "resolution": "",
        "foldTransformation": "TOTAL",
        "foldAggregation": "SUM"
      }
    },
    {
      "name": "Domestic SMS Delivery Success Statuses",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 3496,
        "left": 0,
        "width": 608,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Honeycomb",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsDestinationTypeSmsType",
          "spaceAggregation": "SUM",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "notifystatus"
          ],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "countrycode",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "44",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${account_id}",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "environment",
                "filterType": "DIMENSION",
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
      }
    },
    {
      "name": "International SMS Successful Delivery Rate",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 3800,
        "left": 608,
        "width": 608,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsDestinationTypeSmsType",
          "spaceAggregation": "SUM",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "notifystatus"
          ],
          "sortBy": "DESC",
          "sortByDimension": "notifystatus",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${account_id}",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "countrycode",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "44",
                    "evaluator": "NE"
                  }
                ]
              },
              {
                "filter": "environment",
                "filterType": "DIMENSION",
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
          "rate": "NONE",
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "STACKED_COLUMN",
        "global": {},
        "rules": [
          {
            "matcher": "A:",
            "unitTransform": "auto",
            "valueFormat": "auto",
            "properties": {
              "color": "DEFAULT",
              "seriesType": "STACKED_COLUMN"
            },
            "seriesOverrides": [
              {
                "name": "delivered",
                "color": "#7dc540"
              },
              {
                "name": "permanent-failure",
                "color": "#dc172a"
              },
              {
                "name": "temporary-failure",
                "color": "#ef651f"
              }
            ]
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
        "resolution": "10m"
      }
    },
    {
      "name": "Domestic SMS Successful Delivery Rate",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 3496,
        "left": 608,
        "width": 608,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsDestinationTypeSmsType",
          "spaceAggregation": "SUM",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "notifystatus"
          ],
          "sortByDimension": "notifystatus",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "countrycode",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "44",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${account_id}",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "environment",
                "filterType": "DIMENSION",
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
          "rate": "NONE",
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "STACKED_COLUMN",
        "global": {},
        "rules": [
          {
            "matcher": "A:",
            "unitTransform": "auto",
            "valueFormat": "auto",
            "properties": {
              "color": "DEFAULT",
              "seriesType": "STACKED_COLUMN"
            },
            "seriesOverrides": [
              {
                "name": "delivered",
                "color": "#7dc540"
              },
              {
                "name": "permanent-failure",
                "color": "#dc172a"
              },
              {
                "name": "temporary-failure",
                "color": "#fd8232"
              }
            ]
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
        "resolution": "10m"
      }
    },
    {
      "name": "SMS Successful Deliveries by Country Code and Template",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 3192,
        "left": 608,
        "width": 608,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsDestinationTypeSmsType",
          "spaceAggregation": "SUM",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "countrycode",
            "smstype"
          ],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "environment",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${application_environment}",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "notifystatus",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "delivered",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${account_id}",
                    "evaluator": "EQ"
                  }
                ]
              }
            ],
            "criteria": []
          },
          "rate": "NONE",
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "STACKED_COLUMN",
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
        "resolution": "10m"
      }
    },
    {
      "name": "All SMS Failures by Country Code and Template",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 4218,
        "left": 1368,
        "width": 608,
        "height": 266
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsDestinationTypeSmsType",
          "spaceAggregation": "SUM",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "countrycode",
            "smstype"
          ],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "environment",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${application_environment}",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${account_id}",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "notifystatus",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "delivered",
                    "evaluator": "NE"
                  }
                ]
              }
            ],
            "criteria": []
          },
          "rate": "NONE",
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "STACKED_COLUMN",
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
        "resolution": "10m"
      }
    },
    {
      "name": "Bulk Email Delivery by Status (will only display data when bulk email send in progress)",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1178,
        "left": 0,
        "width": 950,
        "height": 266
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Bulk email status",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.bulkEmailStatusByAccountIdEnvironmentLogGroupRegionServiceNameServiceTypeStatus",
          "spaceAggregation": "SUM",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "Status"
          ],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "environment",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${application_environment}",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "aws.account.id",
                "filterType": "DIMENSION",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${account_id}",
                    "evaluator": "EQ"
                  }
                ]
              }
            ],
            "criteria": []
          },
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
      }
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 1786,
        "left": 0,
        "width": 1140,
        "height": 190
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "## SMS\n\nNote that there are two types of SMS metric:\n- **\"Send\" metrics**: This data is recorded each time we send a request to Notify to deliver an SMS message.\n- **\"Delivery receipt\" metrics**: These are provided by Notify and are not guaranteed. For international SMS' we only receive confirmations for approximately two-thirds of messages messages Notify attempted to send.\n\nAlso note that \"delivery metric\" statistics can sometimes be higher than the \"send\" statistics due to a delay in delivery receipts being issued by Notify."
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 1748,
        "left": 0,
        "width": 1900,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "---"
    },
    {
      "name": "Domestic SMS Sent",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2014,
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
          "splitBy": [
            "application",
            "aws.account.id",
            "aws.region",
            "dt.entity.cloud:aws:account",
            "dt.entity.cloud:aws:region",
            "environment",
            "loggroup",
            "servicename",
            "servicetype"
          ],
          "metricSelector": "cloud.aws.authentication.domesticSmsSentByAccountIdApplicationEnvironmentLogGroupRegionServiceNameServiceType\n:filter(and(\n    eq(environment,${application_environment}),\n    eq(\"aws.account.id\",\"${account_id}\")\n))",
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
      }
    },
    {
      "name": "International SMS Sent",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2280,
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
          "splitBy": [
            "application",
            "aws.account.id",
            "aws.region",
            "dt.entity.cloud:aws:account",
            "dt.entity.cloud:aws:region",
            "environment",
            "loggroup",
            "servicename",
            "servicetype"
          ],
          "metricSelector": "cloud.aws.authentication.internationalSmsSentByAccountIdApplicationEnvironmentLogGroupRegionServiceNameServiceType\n:filter(and(\n    eq(environment,${application_environment}),\n    eq(\"aws.account.id\",\"${account_id}\")\n))",
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
      }
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 1976,
        "left": 0,
        "width": 2052,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "### SMS Send Metrics"
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 2546,
        "left": 418,
        "width": 266,
        "height": 266
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "**Note**\n\n\"SMS 'Auth -> Notify' Send Failures\" is a count for the failed requests to Notify and does not count the delivery failures experienced by Notify (see the section below for this).\n\nThe \"failed requests\" count should include any rate limiting that Notify imposes on us (e.g., if we've hit a daily limit). "
    },
    {
      "name": "SMS 'Auth -> Notify' Send Failures",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2546,
        "left": 0,
        "width": 418,
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
          "metricSelector": "cloud.aws.authentication.smsNotificationErrorByAccountIdApplicationCountryEnvironmentIsTestLogGroupNotificationHttpErrorNotificationTypeRegionServiceNameServiceType\n:filter(and(\n    eq(environment,${application_environment}),\n    eq(\"aws.account.id\",\"${account_id}\")\n))\n:sum\n:default(0,always)",
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
      }
    },
    {
      "name": "Domestic SMS Sent by type",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2014,
        "left": 266,
        "width": 380,
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
            "notificationtype"
          ],
          "metricSelector": "cloud.aws.authentication.smsNotificationSentByAccountIdApplicationCountryEnvironmentIsTestLogGroupNotificationTypeRegionServiceNameServiceTypeSmsDestinationType:filter(and(eq(environment,${application_environment}),eq(\"aws.account.id\",\"${account_id}\"),eq(\"smsdestinationtype\",\"DOMESTIC\"))):splitBy(notificationtype):sort(value(auto,descending)):limit(20)",
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
        "resolution": "1m",
        "foldTransformation": "TOTAL",
        "foldAggregation": "SUM"
      }
    },
    {
      "name": "International SMS Sent by type",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2280,
        "left": 266,
        "width": 380,
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
            "notificationtype"
          ],
          "metricSelector": "cloud.aws.authentication.smsNotificationSentByAccountIdApplicationCountryEnvironmentIsTestLogGroupNotificationTypeRegionServiceNameServiceTypeSmsDestinationType:filter(and(eq(environment,${application_environment}),eq(\"aws.account.id\",\"${account_id}\"),eq(\"smsdestinationtype\",\"INTERNATIONAL\"))):splitBy(notificationtype):sort(value(auto,descending)):limit(20)",
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
        "resolution": "1m",
        "foldTransformation": "TOTAL",
        "foldAggregation": "SUM"
      }
    },
    {
      "name": "Domestic SMS Successful Send Rate",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2014,
        "left": 646,
        "width": 570,
        "height": 266
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
          "metricSelector": "cloud.aws.authentication.domesticSmsSentByAccountIdApplicationEnvironmentLogGroupRegionServiceNameServiceType\n:filter(and(\n    eq(environment,${application_environment}),\n    eq(\"aws.account.id\",\"${account_id}\")\n))\n:splitBy()\n:sum\n:sort(value(sum,descending))\n:limit(20)",
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
        "resolution": "5m"
      }
    },
    {
      "name": "International SMS Successful Send Rate",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2280,
        "left": 646,
        "width": 570,
        "height": 266
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
          "metricSelector": "cloud.aws.authentication.internationalSmsSentByAccountIdApplicationEnvironmentLogGroupRegionServiceNameServiceType\n:filter(and(\n    eq(environment,${application_environment}),\n    eq(\"aws.account.id\",\"${account_id}\")\n))\n:splitBy()\n:sum\n:sort(value(sum,descending))\n:limit(20)",
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
        "resolution": "5m"
      }
    },
    {
      "name": "Domestic SMS Send Failure Rate",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2014,
        "left": 1216,
        "width": 570,
        "height": 266
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
            "notificationtype"
          ],
          "metricSelector": "cloud.aws.authentication.smsNotificationErrorByAccountIdApplicationCountryEnvironmentIsTestLogGroupNotificationHttpErrorNotificationTypeRegionServiceNameServiceTypeSmsDestinationType\n:filter(and(\n    eq(environment,${application_environment}),\n    eq(\"aws.account.id\",\"${account_id}\"),\n    eq(smsdestinationtype,\"DOMESTIC\"))\n)\n:splitBy(notificationtype)\n:sum\n:sort(value(sum,descending))\n:limit(20)",
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
        "resolution": "10m"
      }
    },
    {
      "name": "International SMS Send Failure Rate",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2280,
        "left": 1216,
        "width": 570,
        "height": 266
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
            "notificationtype"
          ],
          "metricSelector": "cloud.aws.authentication.smsNotificationErrorByAccountIdApplicationCountryEnvironmentIsTestLogGroupNotificationHttpErrorNotificationTypeRegionServiceNameServiceTypeSmsDestinationType\n:filter(and(\n    eq(environment,${application_environment}),\n    eq(\"aws.account.id\",\"${account_id}\"),\n    eq(smsdestinationtype,\"INTERNATIONAL\"))\n)\n:splitBy(notificationtype)\n:sum\n:sort(value(sum,descending))\n:limit(20)",
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
        "resolution": "10m"
      }
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 2014,
        "left": 1786,
        "width": 266,
        "height": 532
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "**Note**\n\nSend rate data may still be being ingested for the latest period and so may be incomplete - this may show as a sudden drop in the latest time bucket, this should recover.\n\n**Also note**\n\nThese are \"send\" metrics (see the main SMS description in the section above) and so there should typically be very few errors here (unless we hit a rate limit, or if Notify is experiencing issues). The majority of errors will occur during delivery (see the section below)."
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 2812,
        "left": 0,
        "width": 1216,
        "height": 76
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "### SMS Delivery Metrics\n\nIf you see a \"delivery\" count which is higher than the \"send\" count (above), this may be due to delays in delivery receipts being issued by Notify."
    },
    {
      "name": "Domestic SMS' Delivered",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2926,
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
          "metricSelector": "cloud.aws.authentication.smsNotificationSentByAccountIdApplicationCountryEnvironmentIsTestLogGroupNotificationTypeRegionServiceNameServiceTypeSmsDestinationType:filter(and(eq(environment,${application_environment}),eq(\"aws.account.id\",\"${account_id}\"),eq(\"smsdestinationtype\",\"DOMESTIC\"))):splitBy():sort(value(auto,descending)):limit(20)",
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
      }
    },
    {
      "name": "International SMS' Delivered",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2926,
        "left": 874,
        "width": 342,
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
          "metricSelector": "cloud.aws.authentication.smsNotificationSentByAccountIdApplicationCountryEnvironmentIsTestLogGroupNotificationTypeRegionServiceNameServiceTypeSmsDestinationType:filter(and(eq(environment,${application_environment}),eq(\"aws.account.id\",\"${account_id}\"),eq(\"smsdestinationtype\",\"INTERNATIONAL\"))):splitBy():sort(value(auto,descending)):limit(20)",
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
      }
    },
    {
      "name": "Domestic SMS Delivery Failures",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 4484,
        "left": 0,
        "width": 342,
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
          "metricSelector": "cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsDestinationTypeSmsType:filter(and(eq(environment,${application_environment}),eq(\"aws.account.id\",\"${account_id}\"),ne(notifystatus,delivered),eq(\"smsdestinationtype\",\"DOMESTIC\"))):splitBy():sum:sort(value(sum,descending)):limit(20)",
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
      }
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 2888,
        "left": 0,
        "width": 1216,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "**Successful SMS Deliveries**"
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 4142,
        "left": 0,
        "width": 1976,
        "height": 76
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "**Failed SMS Deliveries**\n\n[Scroll to the right to see more graphs.]"
    },
    {
      "name": "International SMS Delivery Failures",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 4750,
        "left": 0,
        "width": 342,
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
          "metricSelector": "cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsDestinationTypeSmsType:filter(and(eq(environment,${application_environment}),eq(\"aws.account.id\",\"${account_id}\"),ne(notifystatus,delivered),eq(\"smsdestinationtype\",\"INTERNATIONAL\"))):splitBy():sum:sort(value(sum,descending)):limit(20)",
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
      }
    },
    {
      "name": "Domestic SMS Delivery Failures by Type",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 4484,
        "left": 342,
        "width": 418,
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
          "metricSelector": "cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsDestinationTypeSmsType:filter(and(eq(environment,${application_environment}),ne(notifystatus,delivered),eq(\"aws.account.id\",\"${account_id}\"),eq(\"smsdestinationtype\",\"DOMESTIC\"))):splitBy(smstype):sort(value(auto,descending)):limit(20)",
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
      }
    },
    {
      "name": "International SMS Delivery Failures by Type",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 4750,
        "left": 342,
        "width": 418,
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
          "metricSelector": "cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsDestinationTypeSmsType:filter(and(eq(environment,${application_environment}),ne(notifystatus,delivered),eq(\"aws.account.id\",\"${account_id}\"),eq(\"smsdestinationtype\",\"INTERNATIONAL\"))):splitBy(smstype):sort(value(auto,descending)):limit(20)",
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
      }
    },
    {
      "name": "Domestic SMS Delivery Failure Rate",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 4484,
        "left": 760,
        "width": 608,
        "height": 266
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
            "notifystatus"
          ],
          "metricSelector": "cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsDestinationTypeSmsType:filter(and(eq(environment,${application_environment}),ne(notifystatus,delivered),eq(\"aws.account.id\",\"${account_id}\"),eq(\"smsdestinationtype\",\"DOMESTIC\"))):splitBy(notifystatus):sum:sort(value(sum,descending)):limit(20)",
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
        "resolution": "10m"
      }
    },
    {
      "name": "International SMS Delivery Failure Rate",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 4750,
        "left": 760,
        "width": 608,
        "height": 266
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
            "notifystatus"
          ],
          "metricSelector": "cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsDestinationTypeSmsType:filter(and(eq(environment,${application_environment}),ne(notifystatus,delivered),eq(\"aws.account.id\",\"${account_id}\"),eq(\"smsdestinationtype\",\"INTERNATIONAL\"))):splitBy(notifystatus):sum:sort(value(sum,descending)):limit(20)",
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
        "resolution": "10m"
      }
    },
    {
      "name": "Domestic SMS Failures by Template",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 4484,
        "left": 1368,
        "width": 608,
        "height": 266
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
            "smstype"
          ],
          "metricSelector": "cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsDestinationTypeSmsType:filter(and(eq(environment,${application_environment}),eq(\"aws.account.id\",\"${account_id}\"),ne(notifystatus,delivered),eq(\"smsdestinationtype\",\"DOMESTIC\"))):splitBy(smstype):sum:sort(value(sum,descending)):limit(20)",
          "rate": "NONE",
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "STACKED_COLUMN",
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
        "resolution": "10m"
      }
    },
    {
      "name": "International SMS Failures by Country Code and Template",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 4750,
        "left": 1368,
        "width": 608,
        "height": 266
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
            "countrycode",
            "smstype"
          ],
          "metricSelector": "cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsDestinationTypeSmsType:filter(and(eq(environment,${application_environment}),ne(notifystatus,delivered),eq(\"aws.account.id\",\"${account_id}\"),eq(\"smsdestinationtype\",\"INTERNATIONAL\"))):splitBy(countrycode,smstype):sum:sort(value(sum,descending)):limit(20)",
          "rate": "NONE",
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "STACKED_COLUMN",
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
        "resolution": "10m"
      }
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 0,
        "left": 0,
        "width": 950,
        "height": 190
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "## Emails\nNote that there are two types of email metric:\n- **\"Send\" metrics**: This data is recorded each time we send a request to Notify to deliver an email.\n- **\"Delivery receipt\" metrics**: These are provided by Notify and are not guaranteed."
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 190,
        "left": 0,
        "width": 1900,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "### Email Send Metrics"
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 798,
        "left": 0,
        "width": 1900,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "### Email Delivery Metrics"
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 836,
        "left": 0,
        "width": 1900,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "**Successful Email Deliveries**"
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 1444,
        "left": 0,
        "width": 1900,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "**Failed Email Deliveries**"
    },
    {
      "name": "Email Successful Send Count by Type",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 228,
        "left": 950,
        "width": 950,
        "height": 304
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
            "notificationtype"
          ],
          "metricSelector": "cloud.aws.authentication.emailNotificationSentByAccountIdApplicationEnvironmentIsTestLogGroupNotificationTypeRegionServiceNameServiceType:filter(and(eq(environment,${application_environment}),eq(\"aws.account.id\",\"${account_id}\"))):splitBy(notificationtype):sort(value(sum,descending)):limit(20)",
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
      }
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 532,
        "left": 1368,
        "width": 532,
        "height": 266
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "**Note**\n\n\"Email 'Auth -> Notify' Send Failures\" is a count for the failed requests to Notify and does not count any delivery failures experienced by Notify (see the section below for this).\n\n**Also note**\n\nThese are \"send\" metrics (see the main SMS description in the section above) and so there should typically be very few errors here (unless we hit a rate limit, or if Notify is experiencing issues). The majority of errors will occur during delivery (see the section below)."
    },
    {
      "name": "Email 'Auth -> Notify' Send Failures",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 532,
        "left": 950,
        "width": 418,
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
          "splitBy": [
            "application",
            "aws.account.id",
            "aws.region",
            "dt.entity.cloud:aws:account",
            "dt.entity.cloud:aws:region",
            "environment",
            "istest",
            "loggroup",
            "notificationhttperror",
            "notificationtype",
            "servicename",
            "servicetype"
          ],
          "metricSelector": "cloud.aws.authentication.emailNotificationErrorByAccountIdApplicationEnvironmentIsTestLogGroupNotificationHttpErrorNotificationTypeRegionServiceNameServiceType:filter(and(\n    eq(environment,${application_environment}),\n    eq(\"aws.account.id\",\"${account_id}\")\n))\n:sum\n:default(0,always)",
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
      }
    },
    {
      "name": "Email Send Failure Rate by Type",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 532,
        "left": 0,
        "width": 950,
        "height": 266
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
            "notificationtype"
          ],
          "metricSelector": "cloud.aws.authentication.emailNotificationErrorByAccountIdApplicationEnvironmentIsTestLogGroupNotificationHttpErrorNotificationTypeRegionServiceNameServiceType:filter(and(eq(environment,${application_environment}),eq(\"aws.account.id\",\"${account_id}\"))):splitBy(notificationtype):sum:sort(value(sum,descending)):limit(20)",
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
      }
    },
    {
      "name": "Email Successful Send Rate by Type",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 228,
        "left": 0,
        "width": 950,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.emailNotificationSentByAccountIdApplicationEnvironmentIsTestLogGroupNotificationTypeRegionServiceNameServiceType",
          "spaceAggregation": "SUM",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "notificationtype"
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
                    "value": "${account_id}",
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
      }
    },
    {
      "name": "International SMS Successful Deliveries by Country Code and Template",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 3800,
        "left": 1216,
        "width": 760,
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
            "countrycode",
            "smstype"
          ],
          "metricSelector": "cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsDestinationTypeSmsType:filter(and(eq(environment,${application_environment}),eq(notifystatus,delivered),eq(\"aws.account.id\",\"${account_id}\"),ne(countrycode,44))):splitBy(countrycode,smstype):sum:sort(value(sum,descending)):limit(20)",
          "rate": "NONE",
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "STACKED_COLUMN",
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
        "resolution": "10m"
      }
    },
    {
      "name": "Domestic SMS Successful Deliveries by Template",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 3496,
        "left": 1216,
        "width": 760,
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
            "smstype"
          ],
          "metricSelector": "cloud.aws.authentication.smsSentByAccountIdCountryCodeEnvironmentLogGroupNotifyStatusRegionServiceNameServiceTypeSmsDestinationTypeSmsType:filter(and(eq(environment,${application_environment}),eq(notifystatus,delivered),eq(\"aws.account.id\",\"${account_id}\"),eq(countrycode,44))):splitBy(smstype):sum:sort(value(sum,descending)):limit(20)",
          "rate": "NONE",
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "STACKED_COLUMN",
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
        "resolution": "10m"
      }
    }
  ]
}