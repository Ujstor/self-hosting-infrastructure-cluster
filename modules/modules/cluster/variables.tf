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
