output "server_ips" {
  value = {
    coolify_controler = {
      for idx, instance in hcloud_server.coolify_controler : instance.name => instance.ipv4_address
    },
    coolify_worker = {
      for idx, instance in hcloud_server.coolify_worker : instance.name => instance.ipv4_address
    },
  }
}

output "server_status" {
  value = {
    coolify_controler = {
      for instance in hcloud_server.coolify_controler : instance.name => instance.status
    },
    coolify_worker = {
      for instance in hcloud_server.coolify_worker : instance.name => instance.status
    },
  }
}

output "public_key" {
  value = tls_private_key.ssh_key.public_key_openssh
}