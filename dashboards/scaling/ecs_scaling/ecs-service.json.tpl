{
  "metadata": {
    "configurationVersions": [
      7
    ],
    "clusterVersion": "1.294.55.20240625-121801"
  },
  "dashboardMetadata": {
    "name": "FE Scaling Analysis for ${service_name}",
    "shared": true,
    "owner": "andrew.loughran@digital.cabinet-office.gov.uk",
    "tags": [
      "Capacity",
      "Scaling"
    ],
    "popularity": 1,
    "hasConsistentColors": false
  },
  "tiles": [
    {
      "name": "API Requests / ECS Usage",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 190,
        "left": 38,
        "width": 874,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "B",
          "spaceAggregation": "AUTO",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "apiid"
          ],
          "metricSelector": "cloud.aws.apigateway.countByAccountIdApiIdRegion:filter(and(or(eq(apiid,${apigwid})))):splitBy(apiid):count:sort(value(avg,descending)):limit(20)",
          "rate": "NONE",
          "enabled": true
        },
        {
          "id": "A",
          "spaceAggregation": "AUTO",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "metricSelector": "cloud.aws.ecs.cpuUtilizationByAccountIdClusterNameRegionServiceName:filter(and(or(eq(servicename,${service_name})))):splitBy():sort(value(auto,descending)):limit(20)",
          "rate": "NONE",
          "enabled": true
        },
        {
          "id": "C",
          "spaceAggregation": "AUTO",
          "timeAggregation": "DEFAULT",
          "splitBy": [],
          "metricSelector": "cloud.aws.ecs.memoryUtilizationByAccountIdClusterNameRegionServiceName:filter(and(or(eq(servicename,${service_name})))):splitBy():sort(value(auto,descending)):limit(20)",
          "rate": "NONE",
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "GRAPH_CHART",
        "global": {},
        "rules": [
          {
            "matcher": "B:",
            "unitTransform": "auto",
            "valueFormat": "auto",
            "properties": {
              "color": "ROYALBLUE",
              "seriesType": "LINE",
              "alias": "Requests"
            },
            "seriesOverrides": []
          },
          {
            "matcher": "A:",
            "unitTransform": "auto",
            "valueFormat": "auto",
            "properties": {
              "color": "ORANGE",
              "seriesType": "LINE"
            },
            "seriesOverrides": []
          },
          {
            "matcher": "C:",
            "unitTransform": "auto",
            "valueFormat": "auto",
            "properties": {
              "color": "ORANGE",
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
              "position": "RIGHT",
              "queryIds": [
                "A",
                "C"
              ],
              "defaultAxis": true
            },
            {
              "displayName": "",
              "visible": true,
              "min": "AUTO",
              "max": "AUTO",
              "position": "LEFT",
              "queryIds": [
                "B"
              ],
              "defaultAxis": true
            }
          ]
        },
        "heatmapSettings": {
          "yAxis": "VALUE",
          "showLabels": false
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
                "value": 0,
                "color": "#7dc540"
              },
              {
                "value": 60,
                "color": "#f5d30f"
              },
              {
                "value": 80,
                "color": "#dc172a"
              }
            ],
            "queryId": "",
            "visible": false
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
        "resolution=null&(cloud.aws.apigateway.countByAccountIdApiIdRegion:filter(and(or(eq(apiid,${apigwid})))):splitBy(apiid):count:sort(value(avg,descending)):limit(20)):limit(100):names,(cloud.aws.ecs.cpuUtilizationByAccountIdClusterNameRegionServiceName:filter(and(or(eq(servicename,${service_name})))):splitBy():sort(value(auto,descending)):limit(20)):limit(100):names,(cloud.aws.ecs.memoryUtilizationByAccountIdClusterNameRegionServiceName:filter(and(or(eq(servicename,${service_name})))):splitBy():sort(value(auto,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Scaling Behaviours",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 494,
        "left": 38,
        "width": 836,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "cloud.aws.ecs.containerinsights.desiredTaskCountByAccountIdClusterNameRegionServiceName",
          "spaceAggregation": "AUTO",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "servicename"
          ],
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "servicename",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${service_name}",
                    "evaluator": "EQ"
                  }
                ]
              }
            ],
            "criteria": []
          },
          "rate": "NONE",
          "enabled": true
        },
        {
          "id": "B",
          "metric": "cloud.aws.ecs.containerinsights.runningTaskCountByAccountIdClusterNameRegionServiceName",
          "spaceAggregation": "AUTO",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "servicename"
          ],
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "servicename",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${service_name}",
                    "evaluator": "EQ"
                  }
                ]
              }
            ],
            "criteria": []
          },
          "rate": "NONE",
          "enabled": true
        },
        {
          "id": "C",
          "metric": "cloud.aws.ecs.containerinsights.pendingTaskCountByAccountIdClusterNameRegionServiceName",
          "spaceAggregation": "AUTO",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "servicename"
          ],
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "servicename",
                "filterType": "DIMENSION",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "${service_name}",
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
          },
          {
            "matcher": "B:",
            "properties": {
              "color": "DEFAULT"
            },
            "seriesOverrides": []
          },
          {
            "matcher": "C:",
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
        "resolution=null&(cloud.aws.ecs.containerinsights.desiredTaskCountByAccountIdClusterNameRegionServiceName:filter(and(or(eq(servicename,${service_name})))):splitBy(servicename):sort(value(auto,descending)):limit(20)):limit(100):names,(cloud.aws.ecs.containerinsights.runningTaskCountByAccountIdClusterNameRegionServiceName:filter(and(or(eq(servicename,${service_name})))):splitBy(servicename):sort(value(auto,descending)):limit(20)):limit(100):names,(cloud.aws.ecs.containerinsights.pendingTaskCountByAccountIdClusterNameRegionServiceName:filter(and(or(eq(servicename,${service_name})))):splitBy(servicename):sort(value(auto,descending)):limit(20)):limit(100):names"
      ]
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 190,
        "left": 912,
        "width": 380,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "## ECS Demand & Load\n\nThe diagram on the left shows requests going into the API Gateway for the service, and the relative CPU and Memory Utilisation across all tasks executing against this service.\n\nRequests uses the left axis.\n\nUtilisation uses the right axis."
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 494,
        "left": 874,
        "width": 418,
        "height": 304
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "## TaskInformation\n\nThe diagram on the left shows the DesiredTaskCount, which is the the metric that is targetted by the Autoscaling group.  RunningTaskCount shows how many Tasks are now running.  As their scaling is rate limited (both up and down), the desiredCount may be significantly above or below the running count.\n\nPendingTaskCount is triggered when we have a new deployment (new containers are deployed adjacent to existing containers before the traffic switches).  It will also be there if a scale-out policy sets the desired count significantly higher, and there's a time delay caused by the rate limiting before ECS can scale to that volume."
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 38,
        "left": 38,
        "width": 1254,
        "height": 152
      },
      "tileFilter": {},
      "isAutoRefreshDisabled": false,
      "markdown": "## ContainerService\n\nThis page is hardcoded against a Service called ContainerService.\n\nSee the IaC repo for how to configure this Dashboard for your specific service."
    }
  ]
}