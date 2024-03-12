variable "hcloud_token" {
  type        = string
  description = "Hetzner Cloud API token"
  sensitive   = true
  default     = "<API_TOKEN>"
}

variable "location_list" {
  type        = list(string)
  description = "List of locations to cycle through"
  default     = ["fsn1", "nbg1", "hel1"]
}

variable "instances_coolify_controler" {
  type        = string
  description = "Number of instances to create"
  default     = "1"
}

variable "server_type_coolify_controler" {
  type        = string
  description = "Server type to use for deployment controler worker"
  default     = "cx11"
}

variable "server_type_coolify_worker" {
  type        = string
  description = "Server type to use for deployment"
  default     = "cx21"
}

variable "instances_coolify_worker" {
  type        = string
  description = "Number of instances to create"
  default     = "2"
}

variable "os_type" {
  type        = string
  description = "OS image to use for the server"
  default     = "ubuntu-20.04"
}

variable "public_net" {
  type        = bool
  description = "Public network enabled or desabled for all servers besides master_worker and backup"
  default     = true
}
