# since these variables are re-used - a locals block makes this more maintainable

locals {
  backend_address_pool_name      = "appgw-backend-pool"
  frontend_port_name             = "appgw-frontend-port"
  frontend_ip_configuration_name = "appgw-frontend-ip-config"
  http_setting_name              = "appgw-http-setting"
  listener_name                  = "appgw-listener"
  request_routing_rule_name      = "appgw-request-routing-rule"

}


# locals {
#   backend_address_pool_name      = "${azurerm_virtual_network.example.name}-beap"
#   frontend_port_name             = "${azurerm_virtual_network.example.name}-feport"
#   frontend_ip_configuration_name = "${azurerm_virtual_network.example.name}-feip"
#   http_setting_name              = "${azurerm_virtual_network.example.name}-be-htst"
#   listener_name                  = "${azurerm_virtual_network.example.name}-httplstn"
#   request_routing_rule_name      = "${azurerm_virtual_network.example.name}-rqrt"
#   redirect_configuration_name    = "${azurerm_virtual_network.example.name}-rdrcfg"     # optional hai ye
# }
