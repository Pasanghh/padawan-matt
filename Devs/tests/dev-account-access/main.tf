terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

data "google_compute_subnetwork" "subnet" {
  name    = var.subnet-us
  project = var.host-project
  region  = var.region-1
}

# Creating Dev VM from dev account
resource "google_compute_instance" "vm2" {
  name         = "dev-vm"
  machine_type = "e2-medium"
  zone         = var.zone-1
  project      = var.dev-project

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
      subnetwork = data.google_compute_subnetwork.subnet.self_link
  }
}
