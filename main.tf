module "dashboard" {
  source = "./modules/dashboards"
  dashboards = var.dynamic_dashboards
}