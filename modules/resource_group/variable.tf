variable "rgs" {
    type = map(object({
    azurerm_resource_group = string
    location = string
    }))
  
}