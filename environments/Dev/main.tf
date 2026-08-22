module "Resource_Grp" {
  source             = "../../modules/resource-group"
  resource_grp_child = var.resource_grp_parent
}

module "Vnet" {
  depends_on = [module.Resource_Grp]
  source     = "../../modules/virtual-network"
  vnet_child = var.vnet_parent
}

module "subnet" {
  depends_on   = [module.Vnet]
  source       = "../../modules/subnet"
  subnet_child = var.subnet_parent
}

module "nic" {
  depends_on = [module.subnet]
  source     = "../../modules/Network_interface"
  nic_child  = var.nic_parent
}
module "Public_ip" {
  source          = "../../modules/Public IP"
  public_ip_child = var.public_ip_parent
}
  