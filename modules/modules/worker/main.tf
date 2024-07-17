resource "hcloud_server" "coolify_worker" {
  for_each = var.worker_config

  name        = each.key
  image       = var.os_type
  server_type = each.value.server_type
  location    = each.value.location
  ssh_keys    = var.hcloud_ssh_key_id

  labels = {
    type = each.value.labels
  }

  public_net {
    ipv4_enabled = each.value.ipv4_enabled
    ipv6_enabled = each.value.ipv6_enabled
  }
}

resource "hcloud_server_network" "subnet_controler" {
  for_each = var.use_network ? var.worker_config : {}

  server_id = hcloud_server.coolify_worker[each.key].id
  subnet_id = each.value.subnet_id
  ip        = each.value.subnet_ip
}
