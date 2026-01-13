resource "pihole_dns_record" "this" {
  domain = "${local.name}.${var.domain}"
  ip     = proxmox_virtual_environment_vm.this.ipv4_addresses[1][0]
}