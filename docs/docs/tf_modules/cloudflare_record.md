## Module: cloudflare_record

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 4.37 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | ~> 4.37 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_record.domain_recorda](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudflare_record"></a> [cloudflare\_record](#input\_cloudflare\_record) | Cloudflare record configuration | <pre>map(object({<br/>    zone_id = string<br/>    name    = string<br/>    content = string<br/>    type    = string<br/>    ttl     = number<br/>    proxied = bool<br/>  }))</pre> | n/a | yes |

## Outputs

No outputs.
