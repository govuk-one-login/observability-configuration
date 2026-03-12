{
  "metadata": {
    "configurationVersions": [
      7
    ],
    "clusterVersion": "1.333.57.20260305-233338"
  },
  "dashboardMetadata": {
    "name": "DI Authentication - International Phone Number Aggregate Statistics (${application_environment})",
    "shared": true,
    "owner": "authentication-developers@digital.cabinet-office.gov.uk",
    "hasConsistentColors": false
  },
  "tiles": [
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 0,
        "left": 0,
        "width": 1520,
        "height": 228
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "## International Numbers Overview\n\nNew data will be available after ~03:00 AM each day.\n\nNote that this data will undercount slightly as \"migrated\" numbers aren't counted in this section. \"Migrated\" refers to how we store an accounts MFA methods and does not mean accounts/users that have completed the forced MFA reset journey.\n\nHow to use this section:\n\n* Adjust your view: Use the date filter in the top right corner of the page to zoom in on specific days or weeks.\n* Data start date: Please note that **data is only available through Dynatrace for February 21st 2026 onwards**. Selecting dates prior to this will result in no data being displayed."
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 988,
        "left": 0,
        "width": 1520,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "-----"
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 1026,
        "left": 0,
        "width": 1520,
        "height": 228
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "## International Numbers - Forced MFA Reset Overview\n\nThis section shows MFA reset journey count statistics.\n\n* **Initiated** - User has entered a valid email, password, and MFA OTP and their account has been identified as requiring MFA reset.\n* **Completed** - User has completed the MFA reset journey and has entered a valid MFA OTP for their new MFA method and this has replaced all of their prior MFA methods."
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 4940,
        "left": 0,
        "width": 1520,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "-----"
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 1254,
        "left": 0,
        "width": 1520,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "### Initiated"
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 1672,
        "left": 0,
        "width": 1520,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "### Completed"
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 2090,
        "left": 0,
        "width": 1520,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "### New MFA Method Type"
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 2128,
        "left": 0,
        "width": 1520,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "The new MFA method type once a user has completed a **forced** MFA reset. Types are SMS or Auth App."
    },
    {
      "name": "New MFA Method: SMS",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2546,
        "left": 0,
        "width": 380,
        "height": 380
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
            "environment",
            "servicetype",
            "mfamethodtype",
            "aws.region",
            "mfaresettype",
            "aws.account.id",
            "servicename",
            "dt.source",
            "dt.entity.cloud:aws:account",
            "loggroup",
            "dt.entity.cloud:aws:region"
          ],
          "metricSelector": "cloud.aws.authentication.forcedMfaResetCompletedByAccountIdEnvironmentLogGroupMfaMethodTypeMfaResetTypeRegionServiceNameServiceType\n:filter(and(eq(\"aws.account.id\",\"${account_id}\"),eq(\"environment\",\"${application_environment}\"),eq(\"mfaresettype\", \"FORCED_INTERNATIONAL_NUMBERS\"),eq(\"mfamethodtype\",\"SMS\")))\n:sum\n:default(0, always)",
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
            "unitTransform": "auto",
            "valueFormat": "auto",
            "properties": {
              "color": "DEFAULT",
              "seriesType": "LINE",
              "alias": "Count"
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
        "resolution": ""
      }
    },
    {
      "name": "New MFA Method: Auth App",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2546,
        "left": 380,
        "width": 380,
        "height": 380
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
            "environment",
            "servicetype",
            "mfamethodtype",
            "aws.region",
            "mfaresettype",
            "aws.account.id",
            "servicename",
            "dt.source",
            "dt.entity.cloud:aws:account",
            "loggroup",
            "dt.entity.cloud:aws:region"
          ],
          "metricSelector": "cloud.aws.authentication.forcedMfaResetCompletedByAccountIdEnvironmentLogGroupMfaMethodTypeMfaResetTypeRegionServiceNameServiceType\n:filter(and(eq(\"aws.account.id\",\"${account_id}\"),eq(\"environment\",\"${application_environment}\"),eq(\"mfaresettype\", \"FORCED_INTERNATIONAL_NUMBERS\"),eq(\"mfamethodtype\",\"AUTH_APP\")))\n:sum\n:default(0, always)",
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
            "unitTransform": "auto",
            "valueFormat": "auto",
            "properties": {
              "color": "DEFAULT",
              "seriesType": "LINE",
              "alias": "Count"
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
        "resolution": ""
      }
    },
    {
      "name": "Un-migrated International Number Count Over Time (Updates Daily)",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 228,
        "left": 0,
        "width": 1520,
        "height": 380
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
          "metricSelector": "cloud.aws.authentication.phoneDestinationCountByAccountIdCountryCodeEnvironmentLogGroupRegionServiceNameServiceType\n:filter(and(eq(\"aws.account.id\",\"${old_account_id}\"),eq(\"environment\",\"${application_environment}\"),ne(countrycode, 44)))\n:splitBy()\n:sum",
          "rate": "NONE",
          "enabled": true
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
          "connectNulls": true
        },
        "honeycombSettings": {
          "showHive": true,
          "showLegend": true,
          "showLabels": false
        }
      },
      "queriesSettings": {
        "resolution": "1d"
      }
    },
    {
      "name": "Un-migrated International Number Count",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 608,
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
          "spaceAggregation": "AUTO",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "metricSelector": "cloud.aws.authentication.phoneDestinationCountByAccountIdCountryCodeEnvironmentLogGroupRegionServiceNameServiceType\n:filter(and(eq(\"aws.account.id\",\"${old_account_id}\"),eq(\"environment\",\"${application_environment}\"),ne(countrycode, 44),ne(countrycode,\"UNKNOWN\")))\n:splitBy(countrycode)\n:last\n:splitBy()\n:sum",
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
            "unitTransform": "none",
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
          "showTrend": false,
          "showSparkLine": false,
          "linkTileColorToThreshold": false
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
            "A:countrycode.name"
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
      }
    },
    {
      "name": "Unknown Country Code Number Count",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 608,
        "left": 456,
        "width": 456,
        "height": 380
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
            "environment",
            "servicetype",
            "aws.region",
            "countrycode",
            "aws.account.id",
            "servicename",
            "dt.source",
            "dt.entity.cloud:aws:account",
            "loggroup",
            "dt.entity.cloud:aws:region"
          ],
          "metricSelector": "cloud.aws.authentication.phoneDestinationCountByAccountIdCountryCodeEnvironmentLogGroupRegionServiceNameServiceType\n:filter(and(eq(\"aws.account.id\",\"${old_account_id}\"),eq(\"environment\",\"${application_environment}\"),eq(countrycode,\"UNKNOWN\")))\n:last",
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
            "A:countrycode.name"
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
      }
    },
    {
      "name": "Latest International Country Code Split (Top 100)",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 608,
        "left": 912,
        "width": 608,
        "height": 380
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
            "countrycode"
          ],
          "metricSelector": "cloud.aws.authentication.phoneDestinationCountByAccountIdCountryCodeEnvironmentLogGroupRegionServiceNameServiceType\n:filter(and(eq(\"aws.account.id\",\"${old_account_id}\"),eq(\"environment\",\"${application_environment}\"),ne(countrycode,44)))\n:splitBy(countrycode)\n:last\n:sort(value(sum,descending))\n:limit(50)",
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
      }
    },
    {
      "name": "Forced MFA Reset Completed",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1710,
        "left": 0,
        "width": 380,
        "height": 380
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
          "metricSelector": "cloud.aws.authentication.forcedMfaResetCompletedByAccountIdEnvironmentLogGroupMfaMethodTypeMfaResetTypeRegionServiceNameServiceType\n:filter(and(eq(\"aws.account.id\",\"${account_id}\"),eq(\"environment\",\"${application_environment}\"),eq(\"mfaresettype\", \"FORCED_INTERNATIONAL_NUMBERS\")))\n:splitBy()\n:sum\n:default(0, always)",
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
            "unitTransform": "auto",
            "valueFormat": "auto",
            "properties": {
              "color": "DEFAULT",
              "seriesType": "LINE",
              "alias": "Count"
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
        "resolution": ""
      }
    },
    {
      "name": "Forced MFA Reset Initiated",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1292,
        "left": 0,
        "width": 380,
        "height": 380
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
          "metricSelector": "cloud.aws.authentication.forcedMfaResetInitiatedByAccountIdEnvironmentLogGroupMfaResetTypeRegionServiceNameServiceType\n:filter(and(eq(\"aws.account.id\",\"${account_id}\"),eq(\"environment\",\"${application_environment}\"),eq(\"mfaresettype\", \"FORCED_INTERNATIONAL_NUMBERS\")))\n:splitBy()\n:sum\n:default(0, always)",
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
            "unitTransform": "auto",
            "valueFormat": "auto",
            "properties": {
              "color": "DEFAULT",
              "seriesType": "LINE",
              "alias": "Count"
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
        "resolution": ""
      }
    },
    {
      "name": "Forced MFA Reset Initiated",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1292,
        "left": 380,
        "width": 1140,
        "height": 380
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
          "metricSelector": "cloud.aws.authentication.forcedMfaResetInitiatedByAccountIdEnvironmentLogGroupMfaResetTypeRegionServiceNameServiceType\n:filter(and(eq(\"aws.account.id\",\"${account_id}\"),eq(\"environment\",\"${application_environment}\"),eq(\"mfaresettype\", \"FORCED_INTERNATIONAL_NUMBERS\")))\n:splitBy()\n:sum",
          "rate": "NONE",
          "enabled": true
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
            "unitTransform": "auto",
            "valueFormat": "none",
            "properties": {
              "color": "DEFAULT",
              "seriesType": "LINE",
              "alias": "Count"
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
        "resolution": ""
      }
    },
    {
      "name": "Forced MFA Reset Completed",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1710,
        "left": 380,
        "width": 1140,
        "height": 380
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
          "metricSelector": "cloud.aws.authentication.forcedMfaResetCompletedByAccountIdEnvironmentLogGroupMfaMethodTypeMfaResetTypeRegionServiceNameServiceType\n:filter(and(eq(\"aws.account.id\",\"${account_id}\"),eq(\"environment\",\"${application_environment}\"),eq(\"mfaresettype\", \"FORCED_INTERNATIONAL_NUMBERS\")))\n:splitBy()\n:sum",
          "rate": "NONE",
          "enabled": true
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
            "unitTransform": "auto",
            "valueFormat": "auto",
            "properties": {
              "color": "DEFAULT",
              "seriesType": "LINE",
              "alias": "Count"
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
        "resolution": ""
      }
    },
    {
      "name": "New MFA Method Types Over Time",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2166,
        "left": 0,
        "width": 1140,
        "height": 380
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
            "mfamethodtype"
          ],
          "metricSelector": "cloud.aws.authentication.forcedMfaResetCompletedByAccountIdEnvironmentLogGroupMfaMethodTypeMfaResetTypeRegionServiceNameServiceType\n:filter(and(eq(\"aws.account.id\",\"${account_id}\"),eq(\"environment\",\"${application_environment}\"),eq(\"mfaresettype\", \"FORCED_INTERNATIONAL_NUMBERS\")))\n:splitBy(\"mfamethodtype\")\n:sum",
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
            "unitTransform": "auto",
            "valueFormat": "auto",
            "properties": {
              "color": "DEFAULT",
              "seriesType": "LINE",
              "alias": "Count"
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
        "resolution": ""
      }
    }
  ]
}