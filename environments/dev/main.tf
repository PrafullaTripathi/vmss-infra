module "rgmodule" {
  source = "../../modules/resource_group"
  rgs    = var.rgs
}

module "vnetmodule" {
  source     = "../../modules/virtual_network"
  depends_on = [module.rgmodule]
  vnets      = var.vnets
}

module "pipmodule" {
  source     = "../../modules/public_ip"
  depends_on = [module.rgmodule]
  pips       = var.pips
}

module "lbmodule" {
  source     = "../../modules/load_balancer"
  depends_on = [module.rgmodule, module.pipmodule]
  lbs        = var.lbs

}

module "appgwmodule" {
  source     = "../../modules/application_gateway"
  depends_on = [module.rgmodule, module.vnetmodule, module.pipmodule]
  appgws     = var.appgws
}

module "bastionmodule" {
  source     = "../../modules/bastion"
  depends_on = [module.rgmodule, module.vnetmodule, module.pipmodule]
  bastions   = var.bastions

}

module "vmssmodule" {
  source     = "../../modules/vmss"
  depends_on = [module.rgmodule, module.vnetmodule,]
  vmsss      = var.vmsss

}

