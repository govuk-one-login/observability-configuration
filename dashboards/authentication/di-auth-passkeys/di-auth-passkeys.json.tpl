{
  "metadata": {
    "configurationVersions": [
      7
    ],
    "clusterVersion": "1.342.54.20260714-113419"
  },
  "dashboardMetadata": {
    "name": "Authentication - Passkeys (${application_environment})",
    "shared": true,
    "owner": "authentication-developers@digital.cabinet-office.gov.uk",
    "tags": [
      "authentication",
      "passkeys"
    ],
    "popularity": 7,
    "tilesNameSize": "medium",
    "hasConsistentColors": false
  },
  "tiles": [
    {
      "name": "Passkey Creation",
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
      "name": "Sign In with Passkey",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 570,
        "left": 0,
        "width": 608,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false
    },
    {
      "name": "Started Passkey Creation",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 190,
        "left": 0,
        "width": 304,
        "height": 380
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.amcAuthorisationRequestedByAMCJourneyTypeAccountIdEnvironmentLogGroupRegionServiceNameServiceType",
          "spaceAggregation": "COUNT",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "amcjourneytype",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "PASSKEY_CREATE",
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
        "resolution=Inf&(cloud.aws.authentication.amcAuthorisationRequestedByAMCJourneyTypeAccountIdEnvironmentLogGroupRegionServiceNameServiceType:filter(and(or(eq(amcjourneytype,PASSKEY_CREATE)),or(eq(environment,${application_environment})))):splitBy():count:sort(value(avg,descending)):limit(20)):limit(100):names",
        "resolution=null&(cloud.aws.authentication.amcAuthorisationRequestedByAMCJourneyTypeAccountIdEnvironmentLogGroupRegionServiceNameServiceType:filter(and(or(eq(amcjourneytype,PASSKEY_CREATE)),or(eq(environment,${application_environment})))):splitBy():count:sort(value(avg,descending)):limit(20))"
      ]
    },
    {
      "name": "Passkey Creation Success",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 190,
        "left": 304,
        "width": 304,
        "height": 190
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.amcAuthorisationReceivedByAMCAuthorisationOverallSuccessAMCScopeAccountIdEnvironmentLogGroupRegionServiceNameServiceType",
          "spaceAggregation": "COUNT",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "sortBy": "DESC",
          "sortByDimension": "",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "amcauthorisationoverallsuccess",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "true",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "amcscope",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "passkey-create",
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
        "resolution=Inf&(cloud.aws.authentication.amcAuthorisationReceivedByAMCAuthorisationOverallSuccessAMCScopeAccountIdEnvironmentLogGroupRegionServiceNameServiceType:filter(and(or(eq(amcscope,passkey-create)),or(eq(environment,${application_environment})),or(eq(amcauthorisationoverallsuccess,true)))):splitBy():count:sort(value(avg,descending)):limit(20)):limit(100):names",
        "resolution=null&(cloud.aws.authentication.amcAuthorisationReceivedByAMCAuthorisationOverallSuccessAMCScopeAccountIdEnvironmentLogGroupRegionServiceNameServiceType:filter(and(or(eq(amcscope,passkey-create)),or(eq(environment,${application_environment})),or(eq(amcauthorisationoverallsuccess,true)))):splitBy():count:sort(value(avg,descending)):limit(20))"
      ]
    },
    {
      "name": "Sign In With Passkey Prompts",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 608,
        "left": 0,
        "width": 304,
        "height": 190
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.passkeyAuthenticationRequestedByAccountIdEnvironmentLogGroupRegionServiceNameServiceType",
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
        "resolution=Inf&(cloud.aws.authentication.passkeyAuthenticationRequestedByAccountIdEnvironmentLogGroupRegionServiceNameServiceType:filter(and(or(eq(environment,${application_environment})))):splitBy():count:sort(value(avg,descending)):limit(20)):limit(100):names",
        "resolution=null&(cloud.aws.authentication.passkeyAuthenticationRequestedByAccountIdEnvironmentLogGroupRegionServiceNameServiceType:filter(and(or(eq(environment,${application_environment})))):splitBy():count:sort(value(avg,descending)):limit(20))"
      ]
    },
    {
      "name": "Passkeys Sign In Success",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 608,
        "left": 304,
        "width": 304,
        "height": 190
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.passkeyVerificationSuccessfulByAccountIdEnvironmentLogGroupRegionServiceNameServiceType",
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
        "resolution=Inf&(cloud.aws.authentication.passkeyVerificationSuccessfulByAccountIdEnvironmentLogGroupRegionServiceNameServiceType:filter(and(or(eq(environment,${application_environment})))):splitBy():count:sort(value(avg,descending)):limit(20)):limit(100):names",
        "resolution=null&(cloud.aws.authentication.passkeyVerificationSuccessfulByAccountIdEnvironmentLogGroupRegionServiceNameServiceType:filter(and(or(eq(environment,${application_environment})))):splitBy():count:sort(value(avg,descending)):limit(20))"
      ]
    },
    {
      "name": "Passkey Create Errors",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 1026,
        "left": 0,
        "width": 608,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false
    },
    {
      "name": "AMC failure getting authorisation",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1064,
        "left": 0,
        "width": 342,
        "height": 190
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.amcFailureGettingAuthorisationByAccountIdEnvironmentFailureReasonLogGroupRegionServiceNameServiceType",
          "spaceAggregation": "SUM",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "failurereason"
          ],
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
        "resolution=Inf&(cloud.aws.authentication.amcFailureGettingAuthorisationByAccountIdEnvironmentFailureReasonLogGroupRegionServiceNameServiceType:filter(and(or(eq(environment,${application_environment})))):splitBy(failurereason):sum:sort(value(sum,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 38,
        "left": 0,
        "width": 912,
        "height": 152
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "'Started Passkey Creation' tracks what happens before handoff to AMC.\n\n'Passkey Creation Success' and 'Passkey Creation Failed' show what happens when returning from AMC.\n\nIf a user abandons the journey by closing their browser when in the passkey create journey in AMC then there will not be a success or failure status tracked.  This explains why adding success and failed together does not equal the numbers starting passkey creation."
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 190,
        "left": 912,
        "width": 266,
        "height": 190
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "Updated hourly so not always up to date"
    },
    {
      "name": "Passkey Deletions",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 798,
        "left": 0,
        "width": 608,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false
    },
    {
      "name": "Deletion Successful",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 836,
        "left": 0,
        "width": 304,
        "height": 190
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.passkeyDeletionSuccessfulByAccountIdEnvironmentLogGroupRegionServiceNameServiceType",
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
        "resolution=Inf&(cloud.aws.authentication.passkeyDeletionSuccessfulByAccountIdEnvironmentLogGroupRegionServiceNameServiceType:filter(and(or(eq(environment,${application_environment})))):splitBy():count:sort(value(avg,descending)):limit(20)):limit(100):names",
        "resolution=null&(cloud.aws.authentication.passkeyDeletionSuccessfulByAccountIdEnvironmentLogGroupRegionServiceNameServiceType:filter(and(or(eq(environment,${application_environment})))):splitBy():count:sort(value(avg,descending)):limit(20))"
      ]
    },
    {
      "name": "Deletion Failed",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 836,
        "left": 304,
        "width": 304,
        "height": 190
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Started Passkey Creation",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.passkeyDeletionFailedByAccountIdEnvironmentFailureReasonLogGroupRegionServiceNameServiceType",
          "spaceAggregation": "COUNT",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "failurereason"
          ],
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
        "resolution=Inf&(cloud.aws.authentication.passkeyDeletionFailedByAccountIdEnvironmentFailureReasonLogGroupRegionServiceNameServiceType:filter(and(or(eq(environment,${application_environment})))):splitBy(failurereason):count:sort(value(avg,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 608,
        "left": 608,
        "width": 532,
        "height": 190
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "Fewer people may sign in with a passkey than there are prompts because people can skip signing in with a passkey and go back to using a password and mfa.\n  \nSo the difference between these two numbers does not necessarily indicate a problem with passkey sign in.\n\nOn the backend we have no visibility of what the user is doing with the passkey popup on the device, so cannot report on failures to authenticate."
    },
    {
      "name": "Passkey Creation Failed",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 380,
        "left": 304,
        "width": 304,
        "height": 190
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.amcAuthorisationReceivedByAMCAuthorisationOverallSuccessAMCScopeAccountIdEnvironmentFailureReasonLogGroupRegionServiceNameServiceType",
          "spaceAggregation": "COUNT",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "failurereason"
          ],
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
                "filter": "amcscope",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "passkey-create",
                    "evaluator": "EQ"
                  }
                ]
              },
              {
                "filter": "amcauthorisationoverallsuccess",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "false",
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
        "resolution=Inf&(cloud.aws.authentication.amcAuthorisationReceivedByAMCAuthorisationOverallSuccessAMCScopeAccountIdEnvironmentFailureReasonLogGroupRegionServiceNameServiceType:filter(and(or(eq(amcscope,passkey-create)),or(eq(amcauthorisationoverallsuccess,false)),or(eq(environment,${application_environment})))):splitBy(failurereason):count:sort(value(avg,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Total Number of Passkeys",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 190,
        "left": 608,
        "width": 304,
        "height": 190
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.authentication.numberOfPasskeysByAccountIdLogGroupRegionServiceNameServiceType",
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
                "filterOperator": "OR",
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
          "limit": 20,
          "rate": "NONE",
          "enabled": true,
          "histogram": false
        }
      ],
      "visualConfig": {
        "type": "GRAPH_CHART",
        "global": {
          "hideLegend": true
        },
        "rules": [
          {
            "matcher": "A:",
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
        "resolution=null&(cloud.aws.authentication.numberOfPasskeysByAccountIdLogGroupRegionServiceNameServiceType:filter(and(or(eq(\"aws.account.id\",\"${account_id}\")))):splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
      ]
    }
  ]
}