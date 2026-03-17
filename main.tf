locals {
  name      = var.vm_name != null ? var.vm_name : random_pet.vm_name.id
  dns_name  = var.dns_name != null ? var.dns_name : local.name
  node_name = var.node_name != null ? var.node_name : data.proxmox_virtual_environment_nodes.this.names[random_integer.node.result]
  iso_id    = var.iso_id != null ? var.iso_id : "${var.snippet_datastore_id}:import/debian-13-genericcloud-amd64.qcow2"
}

resource "random_pet" "vm_name" {}

data "proxmox_virtual_environment_nodes" "this" {}

resource "random_integer" "node" {
  min = 0
  max = length(data.proxmox_virtual_environment_nodes.this.names) - 1
}
