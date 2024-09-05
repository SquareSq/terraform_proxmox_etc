terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "~> 2.9" #Ипользовал Tofu(поэтому версия провайдера 2.9, а не 3) вместо Terraform т.к. есть проблемы использования в РФ
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://192.168.88.5:8006/api2/json"
  pm_user    = "root@pam"
  pm_password = "123456"
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "gateway" {
  name        = "gate"
  vmid        = "300"
  target_node = "prox"
  clone       = "pfs"
  
  os_type = "cloud-init"
  cores   = 2
  memory  = 2048
  scsihw  = "virtio-scsi-pci"
  
  ciuser  = "gat"
  cipassword = "1234"

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag = 101
  }

  disk {
    size = "10G"
    type = "scsi"
    storage = "local-lvm"
  }
}

resource "proxmox_vm_qemu" "nginx" {
  name        = "nginx"
  vmid        = "301"
  target_node = "prox"
  clone       = "108"
  
  os_type = "cloud-init"
  cores   = 2
  memory  = 2048
  scsihw  = "virtio-scsi-pci"

  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag = "101"
  }

  disk {
    size = "20G"
    type = "scsi"
    storage = "local-lvm"
  }
}

resource "proxmox_vm_qemu" "wordpress1" {
  name        = "wordpress1"
  vmid        = "302"
  target_node = "prox"
  clone       = "wp1"
   
  os_type = "cloud-init" 
  cores   = 2
  memory  = 2048
  scsihw  = "virtio-scsi-pci"

  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag = "101"
  }

  disk {
    size = "20G"
    type = "scsi"
    storage = "local-lvm"
  }
}

resource "proxmox_vm_qemu" "wordpress2" {
  name        = "wordpress2"
  vmid        = "303"
  target_node = "prox"
  clone       = "wp2"
   
  os_type = "cloud-init" 
  cores   = 2
  memory  = 2048
  scsihw  = "virtio-scsi-pci"

  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag = "101"
  }

  disk {
    size = "20G"
    type = "scsi"
    storage = "local-lvm"
  }
}
