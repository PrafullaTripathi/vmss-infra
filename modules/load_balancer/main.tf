resource "azurerm_lb" "lb" {
  for_each            = var.lbs
  name                = each.value.lb_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "frontend_ip_configuration" {
    for_each = each.value.frontend_ip_configurations
    content {
      name                 = frontend_ip_configuration.value.frontend_ip_configuration_name
      public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
    }
  }
}

resource "azurerm_lb_backend_address_pool" "lbpool" {
  for_each        = var.lbs
  loadbalancer_id = azurerm_lb.lb[each.key].id
  name            = each.value.lb-bckend-pool_name
}

resource "azurerm_lb_probe" "lbprobe" {
  for_each        = var.lbs
  loadbalancer_id = azurerm_lb.lb[each.key].id
  name            = each.value.lb-probe_name
  port            = each.value.lb-probe_port
}


resource "azurerm_lb_rule" "lbrule" {
  for_each                       = var.lbs
  loadbalancer_id                = azurerm_lb.lb[each.key].id
  name                           = each.value.lb-rule_name
  protocol                       = each.value.protocol_name
  frontend_port                  = each.value.frontend_port
  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
}
