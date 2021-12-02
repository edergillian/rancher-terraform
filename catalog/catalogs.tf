resource "rancher2_catalog" "global-catalogs" {
  scope   = "global"
  version = "helm_v3"
  name    = var.catalog_name
  url     = var.catalog_url
}
