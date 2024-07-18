output "controler_ips" {
  value = {
    coolify_controler = {
      for idx, instance in hcloud_server.coolify_controler : instance.name => instance.ipv4_address
    },
  }
}

output "controler_status" {
  value = {
    coolify_controler = {
      for instance in hcloud_server.coolify_controler : instance.name => instance.status
    },
  }
}


output "controler_info" {
  value = {
    for key, _ in var.controler_config :
    key => {
      ip     = hcloud_server.coolify_controler[key].ipv4_address
      status = hcloud_server.coolify_controler[key].status
    }
  }
}
