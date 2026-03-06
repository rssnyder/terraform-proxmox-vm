resource "unifi_dns_record" "this" {
  name   = "${local.dns_name}.${var.domain}"
  type   = "A"
  record = proxmox_virtual_environment_vm.this.ipv4_addresses[1][0]
}

resource "unifi_dns_record" "ttyd" {
  name   = "${local.dns_name}.ttyd.${var.domain}"
  type   = "A"
  record = proxmox_virtual_environment_vm.this.ipv4_addresses[1][0]
}
