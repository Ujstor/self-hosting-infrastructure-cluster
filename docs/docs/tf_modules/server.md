## Module: server

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | ~> 1.47 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | ~> 1.47 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [hcloud_server.server](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server) | resource |
| [hcloud_server_network.subnet_controler](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firewall_ids"></a> [firewall\_ids](#input\_firewall\_ids) | Firewall IDs to pass to the server | `list(string)` | `null` | no |
| <a name="input_hcloud_ssh_key_id"></a> [hcloud\_ssh\_key\_id](#input\_hcloud\_ssh\_key\_id) | ID of the SSH key created and used for Hetzner cloud and serves | `list(string)` | n/a | yes |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | OS image to use for the server | `string` | `"debian-12"` | no |
| <a name="input_server_config"></a> [server\_config](#input\_server\_config) | Config for each created server | <pre>map(object({<br/>    location     = string<br/>    server_type  = string<br/>    labels       = optional(string)<br/>    ipv4_enabled = optional(bool)<br/>    ipv6_enabled = optional(bool)<br/>    subnet_id    = optional(string)<br/>    subnet_ip    = optional(string)<br/>    firewall_ids = optional(list(string))<br/>  }))</pre> | n/a | yes |
| <a name="input_use_network"></a> [use\_network](#input\_use\_network) | Use VPC and subnets | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_server_info"></a> [server\_info](#output\_server\_info) | n/a |
