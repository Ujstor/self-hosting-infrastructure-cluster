resource "hcloud_server" "coolify_controler" {
  for_each = var.controler_config

  name        = each.key
  image       = var.os_type
  server_type = each.value.server_type
  location    = each.value.location
  ssh_keys    = var.hcloud_ssh_key_id
  labels = {
    type = each.value.labels
  }
}
