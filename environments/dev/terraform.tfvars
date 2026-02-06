rgs = {
  "rg1" = {
    azurerm_resource_group = "todo-rg"
    location               = "Norway East"
  }
}

vnets = {
  vnet1 = {
    vnet_name           = "todo-vnet"
    location            = "Norway East"
    resource_group_name = "todo-rg"
    cidr                = ["10.0.0.0/16"]


    subnets = {
      subnet1 = {
        subnet_name = "frontend-subnet"
        cidr        = ["10.0.1.0/24"]
      }
      subnet2 = {
        subnet_name = "feappgw"
        cidr        = ["10.0.2.0/24"]

      }
      subnet3 = {
        subnet_name = "AzureBastionSubnet"
        cidr        = ["10.0.3.0/24"]
      }

      subnet4 = {
        subnet_name = "vmss-subnet"
        cidr        = ["10.0.4.0/24"]
      }

  } }
}


pips = {
  pip1 = {

    pip_name            = "lb-pip"
    resource_group_name = "todo-rg"
    location            = "Norway East"
    allocation_method   = "Static"
  }
  pip2 = {

    pip_name            = "feappgw-pip"
    resource_group_name = "todo-rg"
    location            = "Norway East"
    allocation_method   = "Static"
  }
  pip3 = {

    pip_name            = "azurebastion-pip"
    resource_group_name = "todo-rg"
    location            = "Norway East"
    allocation_method   = "Static"
  }
}


lbs = {
  lb1 = {

    lb_name                        = "todo-lb"
    location                       = "Norway East"
    resource_group_name            = "todo-rg"
    pip_name                       = "lb-pip"
    lb-bckend-pool_name            = "lb-backend-pool"
    lb-probe_name                  = "lb-probe"
    lb-probe_port                  = 80
    lb-rule_name                   = "lb-rule"
    protocol_name                  = "Tcp"
    frontend_port                  = 3389
    backend_port                   = 3389
    frontend_ip_configuration_name = "todo-lb-frontend-ip"



    frontend_ip_configurations = {
      fip = {
        frontend_ip_configuration_name = "todo-lb-frontend-ip"
  } } }
}

appgws = {
  appgw1 = {

    appgw_name          = "feappgw"
    resource_group_name = "todo-rg"
    location            = "Norway East"
    subnet_name         = "feappgw"
    vnet_name           = "todo-vnet"
    pip_name            = "feappgw-pip"

    skus = {
      sku1 = {

        sku_name = "Standard_v2"
        tier     = "Standard_v2"
        capacity = 2
    } }
} }

bastions = {
  bastion1 = {

    bastion_name        = "todo-bastion"
    location            = "Norway East"
    resource_group_name = "todo-rg"

    vnet_name   = "todo-vnet"
    subnet_name = "AzureBastionSubnet"
    pip_name    = "azurebastion-pip"

    ip_configurations = {
      ip_configuration1 = {
        ip_configuration_name = "congiguration"

    } }
  }
}

vmsss = {
  "vmsss1" = {
    vmss_name                       = "todo-vmss"
    resource_group_name             = "todo-rg"
    location                        = "Norway East"
    sku                             = "Standard_D2s_v3"
    instances                       = 2
    admin_username                  = "Nemuadmin"
    admin_password                  = "Nemuadmin@1234"
    disable_password_authentication = false
    subnet_name                     = "vmss-subnet"
    vnet_name                       = "todo-vnet"

  }
}