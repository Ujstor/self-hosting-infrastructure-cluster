resource "hcloud_network" "network" {
  name     = var.vpc_config.vpc_name
  ip_range = var.vpc_config.vpc_ip_range
}

resource "hcloud_network_subnet" "deployment_subnet" {
  for_each = var.subnet_config

  network_id   = hcloud_network.network.id
  type         = var.network_type
  network_zone = var.network_zone
  ip_range     = each.value.subnet_ip_range
}
