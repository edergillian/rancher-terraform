terraform {
  required_providers {
    rancher2 = {
      source  = "rancher/rancher2"
      version = "1.20.0"
    }
  }
}

provider "rancher2" {
  api_url    = "https://<RANCHER_DOMAIN>"
  access_key = var.rancher2_access_key
  secret_key = var.rancher2_secret_key
}

# module "node_template" {
#   source                    = "./node_template"
#   for_each                  = { for node_template in var.node_templates : node_template.node_template_name => node_template }
#   node_template_name        = each.value.node_template_name
#   vcenter_datacenter        = each.value.vcenter_datacenter
#   vcenter_datastore         = try(each.value.vcenter_datastore, "")
#   vcenter_datastore_cluster = try(each.value.vcenter_datastore_cluster, "")
#   vcenter_disk_size         = each.value.vcenter_disk_size
#   vcenter_folder            = each.value.vcenter_folder
#   vcenter_memory            = each.value.vcenter_memory
#   vcenter_network           = each.value.vcenter_network
#   vcenter_template          = each.value.vcenter_template
#   vcenter_cloud_credential  = each.value.vcenter_cloud_credential
# }

# module "catalog" {
#   source       = "./catalog"
#   for_each     = { for catalog in var.catalogs : catalog.name => catalog }
#   catalog_name = each.value.name
#   catalog_url  = each.value.url
# }

module "cluster" {
  source                       = "./cluster"
  for_each                     = { for cluster in var.clusters : cluster.name => cluster }
  cluster_name                 = each.value.name
  cluster_worker_pool_nodes    = try(each.value.worker_pool_nodes, 1)
  cluster_master_pool_nodes    = try(each.value.master_pool_nodes, 1)
  cluster_worker_pool_template = each.value.worker_pool_template
  cluster_master_pool_template = each.value.master_pool_template
}
