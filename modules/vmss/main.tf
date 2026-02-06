resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
    for_each =  var.vmsss
  name                = each.value.vmss_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = each.value.sku
  instances           = each.value.instances
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password
disable_password_authentication = each.value.disable_password_authentication

#   admin_ssh_key {
#     username   = "adminuser"
#     public_key = local.first_public_key
#   }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "nic"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = data.azurerm_subnet.subnet[each.key].id
    }
  }
}