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

