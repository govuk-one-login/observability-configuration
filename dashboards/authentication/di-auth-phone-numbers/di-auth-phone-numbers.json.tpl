{
  "metadata": {
    "configurationVersions": [
      7
    ],
    "clusterVersion": "1.332.56.20260219-200703"
  },
  "dashboardMetadata": {
    "name": "DI Authentication - Phone Number Aggregate Statistics (${application_environment})",
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
        "top": 1406,
        "left": 0,
        "width": 1216,
        "height": 228
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "## \"Un-migrated\" Phone Number Data (At End of Selected Timeframe)\n\nThis section shows a single daily snapshot of the phone number analysis data, which updates every day at 3:00 AM.\n\nThe country code distribution is also available through [this Splunk query](https://gds.splunkcloud.com/en-GB/app/gds-050-digital-Identity/search?earliest=%40d&latest=now&q=search%20index%3D%22gds_di_${application_environment}%22%20source%3D%22*%3A%2Faws%2Flambda%2F${application_environment}-mfa-method-analysis-lambda%3A*%22%20message%3D%22MFA%20Method%20Analysis%20Response%3A*%22%0A%7C%20stats%20count%2C%20first(message)%20as%20message%0A%7C%20eval%20is_error%3Dif(count%3D%3D1%2C%200%2C%201)%0A%7C%20eval%20message%3Dif(is_error%3D%3D0%2C%20message%2C%20%22phoneDestinationCounts%3D%7B%7D%22)%20%0A%7C%20rex%20field%3Dmessage%20%22phoneDestinationCounts%3D%5C%7B(%3F%3Cmappings%3E%5B%5E%5C%7D%5D*)%5C%7D%22%0A%7C%20eval%20mappings%3Dif(mappings%3D%3D%22%22%2C%20%22N%2FA%3DN%2FA%22%2C%20mappings)%0A%7C%20makemv%20delim%3D%22%2C%22%20mappings%0A%7C%20mvexpand%20mappings%0A%7C%20rex%20field%3Dmappings%20%22(%3F%3CCountryCode%3E%5B%5E%3D%5D%2B)%3D(%3F%3CCount%3E.*)%22%0A%7C%20eval%20CountryCode%3Dif(is_error%3D%3D1%2C%20%22ERROR%3A%20Expected%201%20result%2C%20found%20%22%20.%20count%20.%20%22%2C%20you%20may%20need%20to%20isolate%20to%20one%20invocation%20by%20changing%20the%20time%20range%20filter.%22%2C%20trim(CountryCode))%0A%7C%20eval%20Count%3Dif(is_error%3D%3D1%2C%20%22N%2FA%22%2C%20trim(Count))%0A%7C%20table%20CountryCode%2C%20Count%0A%7C%20sort%200%20-%20Count%2C%20%2B%20CountryCode&display.page.search.mode=verbose&dispatch.sample_ratio=1&workload_pool=&display.page.search.tab=statistics&display.general.type=statistics&display.statistics.percentagesRow=0&sid=1771592749.101801_EF514FC9-3E4E-4E40-A55A-64CE41D26AAF) (easier to copy).\n\n**NOTE 1: The tiles in this section show the last available update within the date range you selected in the top right.** For example, If you filter to look at \"Yesterday,\" you will see yesterday's 3 AM numbers, not today's. If you select a whole week, you will only see the numbers from the final day of that week.\n\nNOTE 2: This data only includes \"un-migrated\" accounts, so these figures will likely be under counting slightly."
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 0,
        "left": 0,
        "width": 1216,
        "height": 228
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "## Daily Trends Overview\n\nNew data will be available after ~03:00 AM each day.\n\nHow to use this section:\n\n* Adjust your view: Use the date filter in the top right corner of the page to zoom in on specific days or weeks.\n* Data start date: Please note that **data is only available through Dynatrace for February 21st 2026 onwards**. Selecting dates prior to this will result in no data being displayed."
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 1368,
        "left": 0,
        "width": 1216,
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
        "top": 1938,
        "left": 0,
        "width": 646,
        "height": 38
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "[The country code distribution below is also available through [this Splunk query](https://gds.splunkcloud.com/en-GB/app/gds-050-digital-Identity/search?earliest=%40d&latest=now&q=search%20index%3D%22gds_di_${application_environment}%22%20source%3D%22*%3A%2Faws%2Flambda%2F${application_environment}-mfa-method-analysis-lambda%3A*%22%20message%3D%22MFA%20Method%20Analysis%20Response%3A*%22%0A%7C%20stats%20count%2C%20first(message)%20as%20message%0A%7C%20eval%20is_error%3Dif(count%3D%3D1%2C%200%2C%201)%0A%7C%20eval%20message%3Dif(is_error%3D%3D0%2C%20message%2C%20%22phoneDestinationCounts%3D%7B%7D%22)%20%0A%7C%20rex%20field%3Dmessage%20%22phoneDestinationCounts%3D%5C%7B(%3F%3Cmappings%3E%5B%5E%5C%7D%5D*)%5C%7D%22%0A%7C%20eval%20mappings%3Dif(mappings%3D%3D%22%22%2C%20%22N%2FA%3DN%2FA%22%2C%20mappings)%0A%7C%20makemv%20delim%3D%22%2C%22%20mappings%0A%7C%20mvexpand%20mappings%0A%7C%20rex%20field%3Dmappings%20%22(%3F%3CCountryCode%3E%5B%5E%3D%5D%2B)%3D(%3F%3CCount%3E.*)%22%0A%7C%20eval%20CountryCode%3Dif(is_error%3D%3D1%2C%20%22ERROR%3A%20Expected%201%20result%2C%20found%20%22%20.%20count%20.%20%22%2C%20you%20may%20need%20to%20isolate%20to%20one%20invocation%20by%20changing%20the%20time%20range%20filter.%22%2C%20trim(CountryCode))%0A%7C%20eval%20Count%3Dif(is_error%3D%3D1%2C%20%22N%2FA%22%2C%20trim(Count))%0A%7C%20table%20CountryCode%2C%20Count%0A%7C%20sort%200%20-%20Count%2C%20%2B%20CountryCode&display.page.search.mode=verbose&dispatch.sample_ratio=1&workload_pool=&display.page.search.tab=statistics&display.general.type=statistics&display.statistics.percentagesRow=0&sid=1771592749.101801_EF514FC9-3E4E-4E40-A55A-64CE41D26AAF) (easier to copy).]"
    },
    {
      "name": "International Country Code Split Over Time (Top 100)",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 608,
        "left": 0,
        "width": 1216,
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
          "metricSelector": "cloud.aws.authentication.phoneDestinationCountByAccountIdCountryCodeEnvironmentLogGroupRegionServiceNameServiceType\n:filter(and(eq(\"aws.account.id\",\"${account_id}\"),eq(\"environment\",\"${application_environment}\"),ne(countrycode,44),ne(countrycode,\"UNKNOWN\")))\n:splitBy(countrycode)\n:sort(value(sum,descending))\n:limit(100)\n:sort(value(sum,ascending))",
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
              "seriesType": "STACKED_COLUMN"
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
      "name": "Total Number Count Over Time (Including Domestic)",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 988,
        "left": 0,
        "width": 1216,
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
          "metricSelector": "cloud.aws.authentication.phoneDestinationCountByAccountIdCountryCodeEnvironmentLogGroupRegionServiceNameServiceType\n:filter(eq(\"aws.account.id\",\"${account_id}\"),eq(\"environment\",\"${application_environment}\"))\n:splitBy()\n:sum",
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
            "unitTransform": "none",
            "valueFormat": "auto",
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
              "min": "15200000",
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
      "name": "Total (Un-migrated)",
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
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "spaceAggregation": "AUTO",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "metricSelector": "cloud.aws.authentication.phoneDestinationCountByAccountIdCountryCodeEnvironmentLogGroupRegionServiceNameServiceType\n:filter(eq(\"aws.account.id\",\"${account_id}\"),eq(\"environment\",\"${application_environment}\"))\n:splitBy(countrycode)\n:last\n:splitBy()\n:sum",
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
        "resolution": ""
      }
    },
    {
      "name": "Domestic/UK (Un-migrated)",
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
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "spaceAggregation": "AUTO",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "aws.account.id",
            "aws.region",
            "countrycode",
            "dt.entity.cloud:aws:account",
            "dt.entity.cloud:aws:region",
            "dt.source",
            "environment",
            "loggroup",
            "servicename",
            "servicetype"
          ],
          "metricSelector": "cloud.aws.authentication.phoneDestinationCountByAccountIdCountryCodeEnvironmentLogGroupRegionServiceNameServiceType\n:filter(and(eq(\"aws.account.id\",\"${account_id}\"),eq(\"environment\",\"${application_environment}\"),eq(countrycode,44)))\n:last",
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
      "name": "International (Un-migrated)",
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
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "spaceAggregation": "AUTO",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "metricSelector": "cloud.aws.authentication.phoneDestinationCountByAccountIdCountryCodeEnvironmentLogGroupRegionServiceNameServiceType\n:filter(and(eq(\"aws.account.id\",\"${account_id}\"),eq(\"environment\",\"${application_environment}\"),ne(countrycode, 44),ne(countrycode,\"UNKNOWN\")))\n:splitBy(countrycode)\n:last\n:splitBy()\n:sum",
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
      "name": "Unknown Country",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1634,
        "left": 912,
        "width": 304,
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
            "countrycode",
            "dt.entity.cloud:aws:account",
            "dt.entity.cloud:aws:region",
            "dt.source",
            "environment",
            "loggroup",
            "servicename",
            "servicetype"
          ],
          "metricSelector": "cloud.aws.authentication.phoneDestinationCountByAccountIdCountryCodeEnvironmentLogGroupRegionServiceNameServiceType\n:filter(and(eq(\"aws.account.id\",\"${account_id}\"),eq(\"environment\",\"${application_environment}\"),eq(countrycode,\"UNKNOWN\")))\n:last",
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
      "name": "Latest Country Code Distributions",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1976,
        "left": 0,
        "width": 646,
        "height": 2736
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
          "metricSelector": "cloud.aws.authentication.phoneDestinationCountByAccountIdCountryCodeEnvironmentLogGroupRegionServiceNameServiceType\n:filter(eq(\"aws.account.id\",\"${account_id}\"),eq(\"environment\",\"${application_environment}\"))\n:splitBy(countrycode)\n:last\n:sort(value(auto,descending))",
          "rate": "NONE",
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "TABLE",
        "global": {},
        "rules": [
          {
            "matcher": "A:",
            "unitTransform": "none",
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
      "name": "Latest Country Code Split (Top 100, excluding Domestic)",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 2318,
        "left": 646,
        "width": 570,
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
          "metricSelector": "cloud.aws.authentication.phoneDestinationCountByAccountIdCountryCodeEnvironmentLogGroupRegionServiceNameServiceType\n:filter(and(eq(\"aws.account.id\",\"${account_id}\"),eq(\"environment\",\"${application_environment}\"),ne(countrycode,44)))\n:splitBy(countrycode)\n:last\n:sort(value(sum,descending))\n:limit(50)",
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
      "name": "Latest Country Code Split (Top 100, including Domestic)",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1938,
        "left": 646,
        "width": 570,
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
          "metricSelector": "cloud.aws.authentication.phoneDestinationCountByAccountIdCountryCodeEnvironmentLogGroupRegionServiceNameServiceType\n:filter(eq(\"aws.account.id\",\"${account_id}\"),eq(\"environment\",\"${application_environment}\"))\n:splitBy(countrycode)\n:last\n:sort(value(sum,descending))\n:limit(50)",
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
      "name": "Total Number Count Over Time (Excluding Domestic)",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 228,
        "left": 0,
        "width": 1216,
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
          "metricSelector": "cloud.aws.authentication.phoneDestinationCountByAccountIdCountryCodeEnvironmentLogGroupRegionServiceNameServiceType\n:filter(and(eq(\"aws.account.id\",\"${account_id}\"),eq(\"environment\",\"${application_environment}\"),ne(countrycode, 44)))\n:splitBy()\n:sum",
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
    }
  ]
}