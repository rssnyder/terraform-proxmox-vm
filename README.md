# terraform-proxmox-vm

opinionated terraform module for provisioning vms in my homelab

with this i should be able to provision a new vm in as little config nessesary, only specifying the node to run on and source img

```terraform
module "test" {
  source = "../../terraform-proxmox-vm"

  node_name = "poweredge"
  iso_id = proxmox_virtual_environment_download_file.debian_trixie.id
}
```

[main usage here](https://github.com/rssnyder/isengard/blob/master/infra/vms.tf)
