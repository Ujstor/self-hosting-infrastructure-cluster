resource "hcloud_server" "coolify_controler" {
  for_each = var.controler_config

  name         = each.key
  image        = var.os_type
  server_type  = each.value.server_type
  location     = each.value.location
  ssh_keys     = var.hcloud_ssh_key_id
  firewall_ids = var.firewall_ids

  labels = {
    type = each.value.labels
  }
}

resource "hcloud_server_network" "subnet_controler" {
  for_each = var.use_network ? var.controler_config : {}

  server_id = hcloud_server.coolify_controler[each.key].id
  subnet_id = each.value.subnet_id
  ip        = each.value.subnet_ip
}
