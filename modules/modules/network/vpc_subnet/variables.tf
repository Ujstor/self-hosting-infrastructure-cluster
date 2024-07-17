variable "vpc_config" {
  description = "VPC Configuration"
  type = object({
    vpc_name     = string
    vpc_ip_range = string
  })
}

variable "subnet_config" {
  description = "Subnet Configuration"
  type = map(object({
    subnet_ip_range = string
  }))
}

variable "network_type" {
  description = "Network Type"
  type        = string
}

variable "network_zone" {
  description = "Network Zone"
  type        = string
}

