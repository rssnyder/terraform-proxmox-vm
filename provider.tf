terraform {
  required_providers {
    pihole = {
      source = "ryanwholey/pihole"
    }
    proxmox = {
      source = "bpg/proxmox"
    }
    unifi = {
      source  = "filipowm/unifi"
    }
  }
}
