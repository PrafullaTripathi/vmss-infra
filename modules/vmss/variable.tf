variable "vmsss" {
  type = map(object({

    vmss_name                       = string
    resource_group_name             = string
    location                        = string
    sku                             = string
    instances                       = number
    admin_username                  = string
    admin_password                  = string
    disable_password_authentication = bool
    subnet_name                     = string
    vnet_name                       = string

  }))

}
