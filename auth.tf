# resource "rancher2_auth_config_activedirectory" "ad" {
#   service_account_username = var.ldap_svc_acc
#   service_account_password = var.ldap_svc_pw
#   servers                  = var.ldap_servers
#   test_password            = var.ldap_svc_pw
#   user_search_base         = var.ldap_user_search_base
#   test_username            = var.ldap_svc_acc
#   group_search_base        = var.ldap_group_search_base
#   user_login_attribute     = "sAMAccountName"
#   user_name_attribute      = "name"
#   user_search_attribute    = "sAMAccountName|sn|givenName"
#   group_object_class       = "group"
#   group_name_attribute     = "name"
#   group_search_attribute   = "sAMAccountName"
# }
