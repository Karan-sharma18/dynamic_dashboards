dynamic_dashboards = {
  "dashboard_1" = {
    name        = "dynamic dash"
    description = "dynamic dash"
    pages = {
      "page_1" = {
        name = "first page"
        widgets = {
          "widget_1" = {
            type   = "billboard"
            title  = "total transaction"
            row    = 1
            column = 1
            settings = {
              query      = "FROM Transaction SELECT count(*) AS 'total transactions'"
              account_id = 4438268
            }
          }

          "widget_2" = {
            type   = "line"
            title  = "Average transaction duration and the request per minute, by application"
            row    = 2
            column = 1
            settings = {
              query      = "FROM Transaction select max(duration) as 'max duration' where httpResponseCode = '504' timeseries"
              account_id = 4438268
            }
          }
          "widget_3" = {
            type   = "bar"
            title  = "error rate"
            row    = 2
            column = 2
            settings = {
              query      = "SELECT percentage(count(*), WHERE `error` IS true) AS ErrorRate FROM Transaction"
              account_id = 4438268
            }
          }
        }
      }
      "page_2" = {
        name = "second page"
        widgets = {
          "widget_4" = {
            type   = "billboard"
            title  = "process count"
            row    = 7
            column = 8
            settings = {
              query      = "SELECT count(*) FROM ProcessSample WHERE entityName = 'DESKTOP-DBGEEJK' FACET processDisplayName"
              account_id = 4438268
            }
          }
          "widget_5" = {
            type   = "bullet"
            title  = "throughput"
            row    = 1
            column = 2
            settings = {
              query      = "SELECT count(*) AS Throughput FROM Transaction"
              account_id = 4438268
              limit      = 5
            }
          }
          # "widget_6" = {
          #   type   = "area"
          #   title  = "apm transaction duration"
          #   row    = 2
          #   column = 1
          #   settings = {
          #     query      = "SELECT average(`apm.key.transaction.duration`) FROM Metric WHERE `entity.guid` IN ('NDQzODI2OHxBUE18QVBQTElDQVRJT058NTQyMTE2Mzk1') FACET `entity.guid`"
          #     account_id = 4438268
          #   }
          # }
          "widget_7" = {
            type   = "table"
            title  = "cpu idle percentage"
            row    = 2
            column = 2
            settings = {
              query      = "SELECT count(*) FROM ProcessSample WHERE entityName = 'DESKTOP-DBGEEJK' FACET processDisplayName"
              account_id = 4438268
            }
          }
          "widget_8" = {
            type   = "area"
            title  = "Overall CPU % Statistics"
            row    = 4
            column = 6
            settings = {
              query      = "SELECT average(cpuSystemPercent), average(cpuUserPercent), average(cpuIdlePercent), average(cpuIOWaitPercent) FROM SystemSample WHERE hostname = 'DESKTOP-DBGEEJK' SINCE 6 months ago TIMESERIES UNTIL now"
              account_id = 4438268
            }
          }
          "widget_9" = {
            type   = "pie"
            title  = "application performance trends"
            row    = 4
            column = 6
            settings = {
              query      = "SELECT average(`duration`) AS AvgResponseTime FROM Transaction SINCE 7 days ago COMPARE WITH 7 days ago"
              account_id = 4438268
            }
          }
        }
      }
    }
  }
}





