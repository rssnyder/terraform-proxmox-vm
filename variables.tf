variable "snippet_datastore_id" {
  type        = string
  description = "datastore to use for snippet files"
  default     = "baelor"
}

variable "node_name" {
  type        = string
  description = "name of the node to place the vm on"
  default     = null
}

variable "dns_name" {
  type        = string
  description = "local dns name"
  default     = null
}

variable "vm_name" {
  type        = string
  description = "name of the vm"
  default     = null
}

variable "packages" {
  type        = list(string)
  description = "additional packages to install"
  default     = []
}

variable "default_packages" {
  type        = bool
  description = "include default packages: (gcc git zsh)"
  default     = true
}

variable "username" {
  type        = string
  description = "admin username"
  default     = "riley"
}

variable "public_key" {
  type        = string
  description = "public key for ssh access"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC0eYIj1qScmuGmXxYgu54r7s99s5chsjqFwZ/Vwamu5HLb0AmcgCdDaUkHX7YpGTcbafVTHJXVx/V8JKzu2jiztoXZy52JbIpYbkZNgo+aLwB9Sj3XZXFEjarG+P6/iqNNMPIGhLvGOH61keyYoA8cUOhcBUODZWMssK8L2mQxcTNATzC5mv67H6IDiowcFnRV3CKe2VvsVdOLjAjJzQ1xBUpVENyIFohyV+7kmFI5dODct6UdhHjYfW9YA1qlQYfV+S8vU20jcmXcHF+M6x4i1D6kDb5Ig8/5B/Ym1dHFIjcFnBezF2CIT5tsUc4vqfY0DtdVqt9rHFS/swiNZl3GaG4pMF5ooG4RIkb16oFTwBhsEHMzjzG+Pqaqt8UAHC7MXbY6fQxUts8SZUSal7ydoMw3mOKFCtOog517PkqgGUJt2UNsur0R204Vgxlqx3xTkYbW7VKdglr4MrLjglCM1bT6+cnrP+h2FiWAlXpMXmS4ymsWlrkucmyX0hmLWAk= riley@hurley"
}

variable "size_gb" {
  type        = number
  description = "disk size in gb"
  default     = 8
}

variable "cpu" {
  type        = number
  description = "cores"
  default     = 1
}

variable "memory" {
  type        = number
  description = "mb"
  default     = 512
}

variable "iso_id" {
  type        = string
  description = "source iso to use for vm"
  default     = null
}

variable "tags" {
  type        = list(string)
  description = "tags"
  default     = []
}

variable "domain" {
  type        = string
  description = "domain for local dns entry"
  default     = "r.ss"
}

variable "datastore_id" {
  type        = string
  description = "datastore for root vm disk"
  default     = "data"
}

variable "default_image_url" {
  type        = string
  description = "cloud image to download for vm"
  default     = "https://cloud.debian.org/images/cloud/trixie/latest/debian-13-genericcloud-amd64.qcow2"
}

variable "pet" {
  type        = bool
  description = "prevent destroy"
  default     = false
}

variable "ttyd_password" {
  type        = string
  description = "password for ttyd web terminal (enables ttyd when set)"
  default     = null
  sensitive   = true
}

variable "ttyd_port" {
  type        = number
  description = "port for ttyd web terminal"
  default     = 7681
}

variable "ip_address" {
  type        = string
  description = "static ip address in CIDR notation (e.g. 192.168.1.100/24), uses DHCP if not set"
  default     = null
}

variable "gateway" {
  type        = string
  description = "gateway for static ip"
  default     = "192.168.2.1"
}

variable "usb" {
  type = list(object({
    host = string
    usb3 = bool
  }))
  default = []
}

variable "node_exporter_enabled" {
  type        = bool
  description = "create SRV record for prometheus node exporter discovery"
  default     = true
}

variable "node_exporter_port" {
  type        = number
  description = "port for prometheus node exporter"
  default     = 9100
}
