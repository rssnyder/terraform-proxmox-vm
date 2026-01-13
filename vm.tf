resource "proxmox_virtual_environment_file" "user_data_cloud_config" {
  content_type = "snippets"
  datastore_id = var.snippet_datastore_id
  node_name    = local.node_name

  source_raw {
    data = templatefile("${path.module}/cloud-config.yaml", {
      NAME       = local.name
      PUBLIC_KEY = trimspace(var.public_key)
      PACKAGES   = yamlencode(concat(["qemu-guest-agent"], var.packages))
    })

    file_name = "${local.name}-user-data-cloud-config.yaml"
  }
}

resource "proxmox_virtual_environment_download_file" "default" {
  count               = var.iso_id == null ? 1 : 0
  content_type        = "import"
  datastore_id        = var.snippet_datastore_id
  node_name           = local.node_name
  url                 = var.default_image_url
  overwrite_unmanaged = true
}

resource "proxmox_virtual_environment_vm" "this" {
  node_name = local.node_name
  name      = local.name
  tags      = concat(["terraform"], var.tags)

  disk {
    datastore_id = var.datastore_id
    import_from  = var.iso_id == null ? proxmox_virtual_environment_download_file.default[0].id : var.iso_id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = var.size_gb
  }

  initialization {
    datastore_id = var.snippet_datastore_id

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id
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
}