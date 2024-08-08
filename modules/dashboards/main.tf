resource "newrelic_one_dashboard" "dashboard" {
  for_each = var.dashboards

  name        = each.value.name
  description = each.value.description

  dynamic "page" {
    for_each = each.value.pages
    content {
      name = page.value.name

      # Explicitly define each widget type
      dynamic "widget_area" {
        # 1st logic
        for_each = { for k, v in page.value.widgets : k => v if v.type == "area" }
        # 2nd logic
        # for_each = {for widget in page.value.widgets : widget.title => widget if widget.type == "area"}
        content {
          title = widget_area.value.title
          row   = widget_area.value.row
          column = widget_area.value.column

          nrql_query {
            query      = widget_area.value.settings.query
            account_id = widget_area.value.settings.account_id
          }
        }
      }

      dynamic "widget_bar" {
        for_each = { for k, v in page.value.widgets : k => v if v.type == "bar" }
        content {
          title = widget_bar.value.title
          row   = widget_bar.value.row
          column = widget_bar.value.column

          nrql_query {
            query      = widget_bar.value.settings.query
            account_id = widget_bar.value.settings.account_id
          }
        }
      }

      dynamic "widget_billboard" {
        for_each = { for k, v in page.value.widgets : k => v if v.type == "billboard" }
        content {
          title = widget_billboard.value.title
          row   = widget_billboard.value.row
          column = widget_billboard.value.column

          nrql_query {
            query      = widget_billboard.value.settings.query
            account_id = widget_billboard.value.settings.account_id
          }
        }
      }

      dynamic "widget_bullet" {
        for_each = { for k, v in page.value.widgets : k => v if v.type == "bullet" }
        content {
          title = widget_bullet.value.title
          row   = widget_bullet.value.row
          column = widget_bullet.value.column
          limit = widget_bullet.value.settings.limit

          nrql_query {
            query      = widget_bullet.value.settings.query
            account_id = widget_bullet.value.settings.account_id
          }
        }
      }


      dynamic "widget_line" {
        for_each = { for k, v in page.value.widgets : k => v if v.type == "line" }
        content {
          title = widget_line.value.title
          row   = widget_line.value.row
          column = widget_line.value.column

          nrql_query {
            query      = widget_line.value.settings.query
            account_id = widget_line.value.settings.account_id
          }
        }
      }


      dynamic "widget_table" {
        for_each = { for k, v in page.value.widgets : k => v if v.type == "table" }
        content {
          title = widget_table.value.title
          row   = widget_table.value.row
          column = widget_table.value.column

          nrql_query {
            query      = widget_table.value.settings.query
            account_id = widget_table.value.settings.account_id
          }
        }
      }
            dynamic "widget_pie" {
        for_each = { for k, v in page.value.widgets : k => v if v.type == "pie" }
        content {
          title = widget_pie.value.title
          row   = widget_pie.value.row
          column = widget_pie.value.column

          nrql_query {
            query      = widget_pie.value.settings.query
            account_id = widget_pie.value.settings.account_id
          }
        }
      }
            dynamic "widget_json" {
        for_each = { for k, v in page.value.widgets : k => v if v.type == "json" }
        content {
          title = widget_json.value.title
          row   = widget_json.value.row
          column = widget_json.value.column

          nrql_query {
            query      = widget_json.value.settings.query
            account_id = widget_json.value.settings.account_id
          }
        }
      }
      
      dynamic "widget_log_table" {
        for_each = { for k, v in page.value.widgets : k => v if v.type == "log_table" }
        content {
          title = widget_log_table.value.title
          row   = widget_log_table.value.row
          column = widget_log_table.value.column

          nrql_query {
            query      = widget_log_table.value.settings.query
            account_id = widget_log_table.value.settings.account_id
          }
        }
      }
    }
  }
}