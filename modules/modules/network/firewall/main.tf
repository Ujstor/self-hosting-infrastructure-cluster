resource "hcloud_firewall" "default" {
  for_each = var.firewalls

  labels = each.value.labels

  name = each.value.name

  dynamic "rule" {
    for_each = each.value.rules
    content {
      destination_ips = lookup(rule.value, "destination_ips", [])
      direction       = rule.value.direction
      port            = rule.value.port
      protocol        = rule.value.protocol
      source_ips      = lookup(rule.value, "source_ips", ["0.0.0.0/0", "::/0"])
    }
  }
}
