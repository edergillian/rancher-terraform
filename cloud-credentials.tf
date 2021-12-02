# resource "rancher2_cloud_credential" "vcenter" {
#   name        = "vcenter"
#   description = "vCenter Cloud Credentials"
#   vsphere_credential_config {
#     password     = var.vcenter_pw
#     username     = var.vcenter_user
#     vcenter      = var.vcenter_host
#     vcenter_port = var.vcenter_port
#   }
# }
