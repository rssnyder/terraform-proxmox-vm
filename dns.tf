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

resource "unifi_dns_record" "prometheus_srv" {
  count = var.node_exporter_enabled ? 1 : 0

  name     = "_prometheus._tcp.${var.domain}"
  type     = "SRV"
  record   = "${local.dns_name}.${var.domain}"
  port     = 9100
  priority = 1
  weight   = 0
}
