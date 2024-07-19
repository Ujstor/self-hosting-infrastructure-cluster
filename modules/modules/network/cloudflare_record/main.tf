resource "cloudflare_record" "domain_recorda" {
  for_each = var.cloudflare_record

  zone_id = each.value.zone_id
  name    = each.value.name
  value   = each.value.value
  type    = each.value.type
  ttl     = each.value.ttl
  proxied = each.value.proxied
}
