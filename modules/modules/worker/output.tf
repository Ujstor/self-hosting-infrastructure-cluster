output "worker_info" {
  value = {
    for key, _ in var.worker_config :
    key => {
      ip     = hcloud_server.coolify_worker[key].ipv4_address
      status = hcloud_server.coolify_worker[key].status
    }
  }
}
