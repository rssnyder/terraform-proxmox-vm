resource "proxmox_virtual_environment_file" "user_data_cloud_config" {
  content_type = "snippets"
  datastore_id = var.snippet_datastore_id
  node_name    = local.node_name

  source_raw {
    data = templatefile("${path.module}/cloud-config.yaml", {
      NAME       = local.name
      USERNAME   = var.username
      PUBLIC_KEY = trimspace(var.public_key)
      PACKAGES = yamlencode(concat(
        ["qemu-guest-agent"],
        var.default_packages ? ["gcc", "git", "zsh", "tmux"] : [],
        var.ttyd_password != null ? ["curl", "nano"] : [],
        var.node_exporter_enabled ? ["prometheus-node-exporter"] : [],
        var.packages
      ))
      TTYD_ENABLED  = var.ttyd_password != null
      TTYD_PASSWORD = var.ttyd_password
      TTYD_PORT     = var.ttyd_port
    })

    file_name = "${local.name}-user-data-cloud-config.yaml"
  }

  lifecycle {
    ignore_changes = [source_raw[0].data]
  }
}

resource "proxmox_virtual_environment_vm" "this" {
  node_name = local.node_name
  name      = local.name
  tags      = concat(["terraform"], var.tags)

  disk {
    datastore_id = var.datastore_id
    import_from  = local.iso_id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = var.size_gb
  }

  scsi_hardware = var.scsi_hardware

  initialization {
    datastore_id = var.snippet_datastore_id

    ip_config {
      ipv4 {
        address = var.ip_address != null ? var.ip_address : "dhcp"
        gateway = var.ip_address != null ? var.gateway : null
      }
    }

    user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id
  }

  dynamic "usb" {
    for_each = var.usb
    content {
      host = usb.value.host
      usb3 = usb.value.usb3
    }

  }

  cpu {
    cores = var.cpu
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = var.memory
  }

  network_device {
    bridge = "vmbr0"
  }

  agent {
    enabled = true
  }

  protection = var.pet

  lifecycle {
    ignore_changes = [disk[0].import_from, initialization[0].user_data_file_id, started]
  }
}

locals {
  ips = [
    for ip in flatten(proxmox_virtual_environment_vm.this.ipv4_addresses) :
    ip if startswith(ip, "192.168.2.")
  ]
}
