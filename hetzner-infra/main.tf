locals {
  calculate_location = [for idx in range(var.instances_coolify_node) : var.location_list[idx % length(var.location_list)]]
}

resource "hcloud_server" "coolify_controler" {
  count       = var.instances_coolify_controler
  name        = "coolify-controler"
  image       = var.os_type
  server_type = var.server_type_coolify_controler
  location    = local.calculate_location[count.index]
  ssh_keys    = [hcloud_ssh_key.default.id]
  labels = {
    type = "coolify-controler"
  }

  provisioner "local-exec" {
    command = <<-EOT
     echo "${tls_private_key.ssh_key.private_key_pem}" > ~/.ssh/self_hosted_hetzner_key.pem &&
     echo "${tls_private_key.ssh_key.public_key_openssh}" > ~/.ssh/self_hosted_hetzner_key.pub &&
     chmod 600 ~/.ssh/hetzner_key.pem
   EOT
  
  }
  depends_on = [
    hcloud_network_subnet.deployment_subnet
  ]
}

resource "hcloud_server" "coolify_node" {
  count       = var.instances_coolify_node
  name        = "coolify-node-${count.index}"
  image       = var.os_type
  server_type = var.server_type_coolify_node
  location    = local.calculate_location[count.index]
  ssh_keys    = [hcloud_ssh_key.default.id]
  labels = {
    type = "coolify-node"
  }
  public_net {
    ipv4_enabled = var.public_net
    ipv6_enabled = var.public_net
  }

  depends_on = [
    hcloud_network_subnet.deployment_subnet
  ]
}

