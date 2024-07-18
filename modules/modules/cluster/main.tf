module "ssh_key" {
  source       = "../ssh_key/"
  ssh_key_name = var.ssh_key_name
  ssh_key_path = var.ssh_key_path
}

module "controller" {
  source            = "../controler/"
  controler_config  = var.controller_config
  hcloud_ssh_key_id = [module.ssh_key.hcloud_ssh_key_id]
  use_network       = var.use_network
  depends_on        = [module.ssh_key]
}

module "workers" {
  source            = "../worker/"
  worker_config     = var.worker_config
  hcloud_ssh_key_id = [module.ssh_key.hcloud_ssh_key_id]
  use_network       = var.use_network
  depends_on        = [module.ssh_key]
}
