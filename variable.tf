variable "dynamic_dashboards" {
  description = "Map of dashboards with their respective pages and widgets"
  type = map(object({
    name        = string
    description = string
    pages       = map(object({
      name    = string
      widgets = map(object({
        type     = string
        title    = string
        row      = number
        column   = number
        # limit    = number
        settings = map(any)
      }))
    }))
  }))
}