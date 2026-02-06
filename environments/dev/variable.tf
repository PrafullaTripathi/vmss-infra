variable "rgs" {
  type = map(object({
    azurerm_resource_group = string
    location               = string
  }))

}
variable "vnets" {
  type = map(object({
    vnet_name           = string
    location            = string
    resource_group_name = string
    cidr                = list(string)

    subnets = map(object({
      subnet_name = string
      cidr        = list(string)

    }))
  }))
}

variable "pips" {
  type = map(object({

    pip_name            = string
    resource_group_name = string
    location            = string
    allocation_method   = string
  }))
}

variable "lbs" {
  type = map(object({
    lb_name                        = string
    location                       = string
    resource_group_name            = string
    pip_name                       = string
    lb-bckend-pool_name            = string
    lb-probe_name                  = string
    lb-probe_port                  = number
    lb-rule_name                   = string
    protocol_name                  = string
    frontend_port                  = number
    backend_port                   = number
    frontend_ip_configuration_name = string


    frontend_ip_configurations = map(object({
      frontend_ip_configuration_name = string

    }))
  }))
}

variable "appgws" {
  type = map(object({
    appgw_name          = string
    resource_group_name = string
    location            = string
    subnet_name         = string
    vnet_name           = string
    pip_name            = string

    skus = map(object({

      sku_name = string
      tier     = string
      capacity = number
    }))
  }))
}


variable "bastions" {
  type = map(object({

    bastion_name        = string
    location            = string
    resource_group_name = string

    vnet_name   = string
    subnet_name = string
    pip_name    = string

    ip_configurations = map(object({
      ip_configuration_name = string

    }))
  }))

}

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