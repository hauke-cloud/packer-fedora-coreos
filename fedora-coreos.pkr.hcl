packer {
  required_version = ">= 1.5.1"
  required_plugins {
    external = {
      version = ">= 0.0.2"
      source  = "github.com/joomcode/external"
    }
    hcloud = {
      version = "~> 1"
      source  = "github.com/hashicorp/hcloud"
    }
  }
}

variable "hcloud_token" {
  type      = string
  sensitive = true
}

variable "hcloud_location" {
  type    = string
  default = "nbg1"
}

variable "build_identifier" {
  type    = string
}

variable "instance_type" {
  type    = string
  default = "cx22"
}

variable "instance_image" {
  type    = string
  default = "fedora-40"
}

variable "coreos_url" {
  type    = string
  default = "https://github.com/hauke-cloud/fedora-coreos-images/releases/download/latest/latest-metal-x86_64.raw.xz"
}

variable "github_branch" {
  type    = string
  default = "dev"
}

variable "version" {
  type    = string
  default = "dev"
}

locals {
  image        = "coreos-${var.github_branch}"
  build_labels = {
    "image"                = "${local.image}"
    "os-flavor"            = "coreos"
    "packer.io/build.id"   = "${uuidv4()}"
    "packer.io/build.time" = "{{timestamp}}"
    "packer.io/version"    = "{{packer_version}}"
    "branch"               = var.github_branch
    "version"              = var.version
  }
}

# Generate Ignition config from Butane file
data "external-raw" "ignition_config" {
  program = ["butane", "-d", "${path.root}/src/fedora-coreos", "--strict", "${path.root}/src/fedora-coreos/chain.bu"]
}

source "hcloud" "x86_64" {
  image        = var.instance_image
  rescue       = "linux64"
  ssh_username = "root"
  ssh_keys_labels = {
    build = var.build_identifier
  }

  snapshot_labels = local.build_labels
  snapshot_name   = "${local.image}"

  token    = var.hcloud_token
  location = var.hcloud_location
  server_type = var.instance_type
  server_labels = {
    build = var.build_identifier
  }
}

build {
  sources = ["source.hcloud.x86_64"]

  provisioner "shell" {
    inline = [
      "set -x",
      # Install CoreOS
      "curl -sL \"${var.coreos_url}\" | xz -d | dd of=/dev/sda",
      # Mount the /boot partition
      "mount /dev/sda3 /mnt",
      "mkdir -p /mnt/ignition"
    ]
  }
  provisioner "file" {
    content     = data.external-raw.ignition_config.result
    destination = "/mnt/ignition/config.ign"
  }
  provisioner "shell" {
    inline = [
      "set -x",
      "umount /mnt",
      "sync",
      "echo Installation complete",
    ]
  }
}
