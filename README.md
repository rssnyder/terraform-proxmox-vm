# terraform-proxmox-vm

opinionated terraform module for provisioning vms in my homelab

```terraform
module "test" {
  source = "github.com/rssnyder/terraform-proxmox-vm"
}
```

customization is avalible but sane defaults are provided to get me a machine asap for testing

[main usage here](https://github.com/rssnyder/isengard/blob/master/infra/vms.tf)

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | 0.93.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.7.2 |
| <a name="provider_unifi"></a> [unifi](#provider\_unifi) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [proxmox_virtual_environment_file.user_data_cloud_config](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_file) | resource |
| [proxmox_virtual_environment_vm.this](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_vm) | resource |
| [random_integer.node](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer) | resource |
| [random_pet.vm_name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |
| [unifi_dns_record.this](https://registry.terraform.io/providers/filipowm/unifi/latest/docs/resources/dns_record) | resource |
| [unifi_dns_record.ttyd](https://registry.terraform.io/providers/filipowm/unifi/latest/docs/resources/dns_record) | resource |
| [proxmox_virtual_environment_nodes.this](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/data-sources/virtual_environment_nodes) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cpu"></a> [cpu](#input\_cpu) | cores | `number` | `1` | no |
| <a name="input_datastore_id"></a> [datastore\_id](#input\_datastore\_id) | datastore for root vm disk | `string` | `"data"` | no |
| <a name="input_default_image_url"></a> [default\_image\_url](#input\_default\_image\_url) | cloud image to download for vm | `string` | `"https://cloud.debian.org/images/cloud/trixie/latest/debian-13-genericcloud-amd64.qcow2"` | no |
| <a name="input_default_packages"></a> [default\_packages](#input\_default\_packages) | include default packages: (gcc git zsh) | `bool` | `true` | no |
| <a name="input_dns_name"></a> [dns\_name](#input\_dns\_name) | local dns name | `string` | `null` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | domain for local dns entry | `string` | `"r.ss"` | no |
| <a name="input_gateway"></a> [gateway](#input\_gateway) | gateway for static ip | `string` | `"192.168.2.1"` | no |
| <a name="input_ip_address"></a> [ip\_address](#input\_ip\_address) | static ip address in CIDR notation (e.g. 192.168.1.100/24), uses DHCP if not set | `string` | `null` | no |
| <a name="input_iso_id"></a> [iso\_id](#input\_iso\_id) | source iso to use for vm | `string` | `null` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | mb | `number` | `512` | no |
| <a name="input_node_name"></a> [node\_name](#input\_node\_name) | name of the node to place the vm on | `string` | `null` | no |
| <a name="input_packages"></a> [packages](#input\_packages) | additional packages to install | `list(string)` | `[]` | no |
| <a name="input_pet"></a> [pet](#input\_pet) | prevent destroy | `bool` | `false` | no |
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | public key for ssh access | `string` | `"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC0eYIj1qScmuGmXxYgu54r7s99s5chsjqFwZ/Vwamu5HLb0AmcgCdDaUkHX7YpGTcbafVTHJXVx/V8JKzu2jiztoXZy52JbIpYbkZNgo+aLwB9Sj3XZXFEjarG+P6/iqNNMPIGhLvGOH61keyYoA8cUOhcBUODZWMssK8L2mQxcTNATzC5mv67H6IDiowcFnRV3CKe2VvsVdOLjAjJzQ1xBUpVENyIFohyV+7kmFI5dODct6UdhHjYfW9YA1qlQYfV+S8vU20jcmXcHF+M6x4i1D6kDb5Ig8/5B/Ym1dHFIjcFnBezF2CIT5tsUc4vqfY0DtdVqt9rHFS/swiNZl3GaG4pMF5ooG4RIkb16oFTwBhsEHMzjzG+Pqaqt8UAHC7MXbY6fQxUts8SZUSal7ydoMw3mOKFCtOog517PkqgGUJt2UNsur0R204Vgxlqx3xTkYbW7VKdglr4MrLjglCM1bT6+cnrP+h2FiWAlXpMXmS4ymsWlrkucmyX0hmLWAk= riley@hurley"` | no |
| <a name="input_size_gb"></a> [size\_gb](#input\_size\_gb) | disk size in gb | `number` | `8` | no |
| <a name="input_snippet_datastore_id"></a> [snippet\_datastore\_id](#input\_snippet\_datastore\_id) | datastore to use for snippet files | `string` | `"zira-red"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | tags | `list(string)` | `[]` | no |
| <a name="input_ttyd_password"></a> [ttyd\_password](#input\_ttyd\_password) | password for ttyd web terminal (enables ttyd when set) | `string` | `null` | no |
| <a name="input_ttyd_port"></a> [ttyd\_port](#input\_ttyd\_port) | port for ttyd web terminal | `number` | `7681` | no |
| <a name="input_usb"></a> [usb](#input\_usb) | n/a | <pre>list(object({<br/>    host = string<br/>    usb3 = bool<br/>  }))</pre> | `null` | no |
| <a name="input_username"></a> [username](#input\_username) | admin username | `string` | `"riley"` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | name of the vm | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ipv4_address"></a> [ipv4\_address](#output\_ipv4\_address) | n/a |
