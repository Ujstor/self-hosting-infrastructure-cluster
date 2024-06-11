terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = ">=1.36.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">=4.0.5"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

