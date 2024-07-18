variable "ssh_key_name" {
  description = "Name of the SSH key"
  type        = string
  default     = "self_hosted_hetzner_key"
}

variable "ssh_key_path" {
  description = "Path to the SSH key"
  type        = string
  default     = "~/.ssh"
}

variable "controller_config" {
  description = "Configuration for controllers"
  type = map(object({
    location     = string
    server_type  = string
    labels       = string
    subnet_id    = string
    subnet_ip    = string
    firewall_ids = optional(list(string))
  }))
}

variable "worker_config" {
  description = "Configuration for workers"
  type = map(object({
    location     = string
    server_type  = string
    labels       = string
    ipv4_enabled = optional(bool)
    ipv6_enabled = optional(bool)
    subnet_id    = string
    subnet_ip    = string
    firewall_ids = optional(list(string))
  }))
}

variable "use_network" {
  description = "Flag to use network"
  type        = bool
  default     = true
}

variable "cloudflare_record" {
  description = "Cloudflare record configuration"
  type = map(object({
    zone_id = optional(string)
    name    = optional(string)
    value   = optional(string)
    type    = optional(string)
    ttl     = optional(number)
    proxied = optional(bool)
  }))
  default = {}
}

variable "firewall_config" {
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
  default = {
    default_firewall = {
      labels = {
        type = "firewall-default"
      }
      name = "default-firewall"
      rules = [
        {
          direction = "in"
          port      = "22"
          protocol  = "tcp"
        },
        {
          direction = "in"
          port      = "80"
          protocol  = "tcp"
        },
        {
          destination_ips = ["0.0.0.0/0"]
          direction       = "out"
          port            = "80"
          protocol        = "tcp"
        },
        {
          direction = "in"
          port      = "443"
          protocol  = "tcp"
        },
        {
          destination_ips = ["0.0.0.0/0"]
          direction       = "out"
          port            = "443"
          protocol        = "tcp"
        },
        {
          direction = "in"
          port      = "6001"
          protocol  = "tcp"
        },
        {
          destination_ips = ["0.0.0.0/0"]
          direction       = "out"
          port            = "6001"
          protocol        = "tcp"
        },
        {
          direction = "in"
          port      = "8000"
          protocol  = "tcp"
        }
      ]
    }
  }
}

