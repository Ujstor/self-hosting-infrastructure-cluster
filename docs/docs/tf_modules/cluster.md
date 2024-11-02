## Module: cluster

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 4.37 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | ~> 1.47 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 4.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_firewall"></a> [firewall](#module\_firewall) | ../network/firewall | n/a |
| <a name="module_server"></a> [server](#module\_server) | ../server/ | n/a |
| <a name="module_ssh_key"></a> [ssh\_key](#module\_ssh\_key) | ../ssh_key/ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firewall_config"></a> [firewall\_config](#input\_firewall\_config) | A map of firewalls to create | <pre>map(object({<br/>    name   = string<br/>    labels = optional(map(string), {})<br/>    rules = list(object({<br/>      direction       = string<br/>      protocol       = string<br/>      port          = string<br/>      source_ips     = optional(list(string))<br/>      destination_ips = optional(list(string))<br/>      description    = optional(string)<br/>    }))<br/>  }))</pre> | `{}` | no |
| <a name="input_server_config"></a> [server\_config](#input\_server\_config) | Configuration for servers | <pre>map(object({<br/>    location     = string<br/>    server_type  = string<br/>    labels       = string<br/>    ipv4_enabled = optional(bool)<br/>    ipv6_enabled = optional(bool)<br/>    subnet_id    = string<br/>    subnet_ip    = string<br/>    firewall_ids = optional(list(string))<br/>  }))</pre> | n/a | yes |
| <a name="input_ssh_key_name"></a> [ssh\_key\_name](#input\_ssh\_key\_name) | Name of the SSH key | `string` | `"cluster_hetzner_key"` | no |
| <a name="input_ssh_key_path"></a> [ssh\_key\_path](#input\_ssh\_key\_path) | Path to the SSH key | `string` | `"~/.ssh"` | no |
| <a name="input_use_network"></a> [use\_network](#input\_use\_network) | Flag to use network | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_server_status"></a> [server\_status](#output\_server\_status) | n/a |
