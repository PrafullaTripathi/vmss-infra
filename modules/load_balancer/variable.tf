variable "lbs" {
type = map(object({
  lb_name = string
  location            = string
  resource_group_name = string
  pip_name = string
  lb-bckend-pool_name = string
  lb-probe_name = string
  lb-probe_port = number
  lb-rule_name = string
  protocol_name = string
  frontend_port = number
  backend_port = number
  frontend_ip_configuration_name = string


frontend_ip_configurations = map(object({
    frontend_ip_configuration_name = string

    }))
}))
}

     