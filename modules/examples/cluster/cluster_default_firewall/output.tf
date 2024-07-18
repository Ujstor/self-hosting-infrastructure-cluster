output "controller_status" {
  value = module.cluster.controller_status
}

output "worker_status" {
  value = module.cluster.worker_status
}

output "controler_ip" {
  value = data.terraform_remote_state.cluster.outputs.controller_status.controler-1.ip
}
