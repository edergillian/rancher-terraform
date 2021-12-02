data "rancher2_cloud_credential" "vcenter" {
  name = var.vcenter_cloud_credential
}

resource "rancher2_node_template" "teste-master-ssd" {
  name                = var.node_template_name
  cloud_credential_id = data.rancher2_cloud_credential.vcenter.id
  description         = "Testando terraform para provisionar recursos"
  vsphere_config {
    creation_type     = "template"
    datacenter        = format("/%s", var.vcenter_datacenter)
    datastore         = var.vcenter_datastore != "" ? format("/%s/datastore/%s", var.vcenter_datacenter, var.vcenter_datastore) : ""
    datastore_cluster = var.vcenter_datastore_cluster != "" ? format("/%s/datastore/%s", var.vcenter_datacenter, var.vcenter_datastore_cluster) : ""
    disk_size         = var.vcenter_disk_size
    folder            = format("/%s/vm/%s", var.vcenter_datacenter, var.vcenter_folder)
    memory_size       = var.vcenter_memory
    network           = [format("/%s/network/%s", var.vcenter_datacenter, var.vcenter_network)]
    cloud_config      = file("${path.module}/cloud-config.yaml")
    clone_from        = format("/%s/vm/%s", var.vcenter_datacenter, var.vcenter_template)
    cfgparam          = ["disk.enableUUID=TRUE"]
  }
}
