output "firewall_ids" {
  value = {
    for key, _ in var.firewalls :
    key => {
      id = hcloud_firewall.default[key].id
    }
  }
}
