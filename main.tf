locals {
  name = var.vm_name != null ? var.vm_name : random_pet.vm_name.id
}

resource "random_pet" "vm_name" {}
