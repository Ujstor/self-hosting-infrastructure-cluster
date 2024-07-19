variable "firewalls" {
  description = "A map of firewalls to create"
  type = map(object({
    labels = map(string)
    name   = string
    rules = list(object({
      destination_ips = optional(list(string), [])
      direction       = string
      port            = string
      protocol        = string
      source_ips      = optional(list(string), ["0.0.0.0/0", "::/0"])
    }))
  }))
}

