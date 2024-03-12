locals {
  available_ip_deploymet = [for num in range(2, 254) : cidrhost(hcloud_network_subnet.deployment_subnet.ip_range, num)]
}

resource "hcloud_network" "network" {
  name     = "network"
  ip_range = "10.0.0.0/16"
}

resource "hcloud_network_subnet" "deployment_subnet" {
  network_id   = hcloud_network.network.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.0.1.0/24"
}

resource "hcloud_server_network" "subnet_controler" {
  count     = var.instances_coolify_controler
  server_id = hcloud_server.coolify_controler[count.index].id
  subnet_id = hcloud_network_subnet.deployment_subnet.id
  ip        = local.available_ip_deploymet[count.index + var.instances_coolify_node]
}

resource "hcloud_server_network" "subnet_node" {
  count     = var.instances_coolify_node
  server_id = hcloud_server.coolify_node[count.index].id
  subnet_id = hcloud_network_subnet.deployment_subnet.id
  ip        = local.available_ip_deploymet[count.index]
}