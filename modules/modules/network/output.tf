output "subnet_id" {
  value = {
    for key, _ in var.subnet_config :
    key => {
      subnet_id = hcloud_network_subnet.deployment_subnet[key].id
    }
  }
}
