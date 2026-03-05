resource "pihole_dns_record" "this" {
  domain = "${local.dns_name}.${var.domain}"
  ip     = proxmox_virtual_environment_vm.this.ipv4_addresses[1][0]
}

resource "unifi_dns_record" "this" {
  name   = "${local.dns_name}.${var.domain}"
  type   = "A"
  record = proxmox_virtual_environment_vm.this.ipv4_addresses[1][0]
}

resource "pihole_dns_record" "ttyd" {
  domain = "${local.dns_name}.ttyd.${var.domain}"
  ip     = proxmox_virtual_environment_vm.this.ipv4_addresses[1][0]
}
