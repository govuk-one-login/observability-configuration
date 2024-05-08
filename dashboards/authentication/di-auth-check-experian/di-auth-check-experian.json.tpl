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
      "name": "SQS message counts",
      "nameSize": "",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 0,
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
        "top": 0,
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
        "top": 304,
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
        "top": 304,
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
    }
  ]
}