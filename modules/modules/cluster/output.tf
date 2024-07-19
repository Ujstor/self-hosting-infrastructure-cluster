output "controller_status" {
  value = module.controller.controler_info
}

output "worker_status" {
  value = module.workers.worker_info
}

