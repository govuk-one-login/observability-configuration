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
    "hasConsistentColors": false,
    "tags": [
      "authentication"
    ]
  },
  "tiles": [
    {
      "name": "Rate of email failures",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 38,
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
    }
  ]
}