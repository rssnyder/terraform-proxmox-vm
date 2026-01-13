locals {
  name      = var.vm_name != null ? var.vm_name : random_pet.vm_name.id
  node_name = var.node_name != null ? var.node_name : data.proxmox_virtual_environment_nodes.this.names[random_integer.node.result]
}

resource "random_pet" "vm_name" {}

data "proxmox_virtual_environment_nodes" "this" {}

resource "random_integer" "node" {
  min = 0
  max = length(data.proxmox_virtual_environment_nodes.this.names) - 1
}
