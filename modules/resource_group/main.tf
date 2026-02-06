resource "azurerm_resource_group" "rg" {
    for_each = var.rgs
    name     = each.value.azurerm_resource_group
    location = each.value.location
    
  
}