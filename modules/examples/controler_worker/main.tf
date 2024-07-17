module "ssh_key_test" {
  source = "../../modules/ssh_key/"

  ssh_key_name = "coolify_cluster_hetzner_key"
  ssh_key_path = ".ssh" #create dir before appling tf config if you use custom paths for ssh keys
}

module "controler_test" {
  source = "../../modules/controler/"

  controler_config = {
    controler-1 = {
      location    = "fsn1"
      server_type = "cx22"
      labels      = "controler"
    }
  }

  hcloud_ssh_key_id = [module.ssh_key_test.hcloud_ssh_key_id]

  depends_on = [module.ssh_key_test]
}

module "workers_test" {
  source = "../../modules/worker/"

  worker_config = {
    worker-1 = {
      location     = "fsn1"
      server_type  = "cx22"
      labels       = "worker"
      ipv4_enabled = true
      ipv6_enabled = false
    }
    worker-2 = {
      location     = "nbg1"
      server_type  = "cx22"
      labels       = "worker"
      ipv4_enabled = true
      ipv6_enabled = false
    }
    worker-3 = {
      location     = "hel1"
      server_type  = "cx22"
      labels       = "worker"
      ipv4_enabled = true
      ipv6_enabled = false
    }
  }

  os_type = "ubuntu-22.04"

  hcloud_ssh_key_id = [module.ssh_key_test.hcloud_ssh_key_id]

  depends_on = [module.ssh_key_test]
}
