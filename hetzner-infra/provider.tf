terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = ">=1.36.0"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}
