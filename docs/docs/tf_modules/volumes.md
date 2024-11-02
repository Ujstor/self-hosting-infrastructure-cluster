## Module: volumes

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
| [hcloud_volume.vol](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/volume) | resource |
| [hcloud_volume_attachment.vol_attachment](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/volume_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_volume_config"></a> [volume\_config](#input\_volume\_config) | Volume configuration | <pre>map(object({<br/>    size = number<br/>    location = string<br/>    server_id = string<br/>  }))</pre> | n/a | yes |
| <a name="input_volume_format"></a> [volume\_format](#input\_volume\_format) | Format volume after creation (xfs or ext4) | `string` | `"xfs"` | no |

## Outputs

No outputs.
