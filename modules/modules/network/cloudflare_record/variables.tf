variable "cloudflare_record" {
  description = "Cloudflare record configuration"
  type = map(object({
    zone_id = string
    name    = string
    value   = string
    type    = string
    ttl     = number
    proxied = bool
  }))
}
