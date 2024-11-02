## Module: firewall

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
| [hcloud_firewall.default](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/firewall) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firewalls"></a> [firewalls](#input\_firewalls) | A map of firewalls to create | <pre>map(object({<br/>    name   = string<br/>    labels = optional(map(string), {})<br/>    rules = list(object({<br/>      direction       = string<br/>      protocol       = string<br/>      port          = string<br/>      source_ips     = optional(list(string))<br/>      destination_ips = optional(list(string))<br/>      description    = optional(string)<br/>    }))<br/>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firewall_ids"></a> [firewall\_ids](#output\_firewall\_ids) | n/a |
| <a name="output_firewall_ids_list"></a> [firewall\_ids\_list](#output\_firewall\_ids\_list) | n/a |

![purple-divider](https://user-images.githubusercontent.com/7065401/52071927-c1cd7100-2562-11e9-908a-dde91ba14e59.png)
