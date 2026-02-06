variable "vnets" {
    type = map(object({
      vnet_name           = string
  location            = string
  resource_group_name = string
  cidr = list(string)

 subnets = map(object({
     subnet_name      = string
    cidr = list(string)



    }))
  
}))
}



