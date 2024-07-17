variable "controler_config" {
  description = "Config for each created controler server"
  type = map(object({
    location    = string
    server_type = string
    labels      = string
    subnet_id   = optional(string)
    subnet_ip   = optional(string)


  }))
}

variable "os_type" {
  description = "OS image to use for the server"
  type        = string
  default     = "debian-12"
}

variable "hcloud_ssh_key_id" {
  description = "ID of the SSH key created and used for Hetzner cloud and serves"
  type        = list(string)
}

variable "use_network" {
  description = "Use VPC and subnets"
  type        = bool
  default     = false
}
