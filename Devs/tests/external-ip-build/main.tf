terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

# resource "google_compute_network" "net" {
#   name    = "my-network"
#   project = var.dev-project
# }

# resource "google_compute_subnetwork" "subnet" {
#   name          = "my-subnetwork"
#   network       = google_compute_network.net.id
#   ip_cidr_range = "10.0.0.0/16"
#   region        = "us-central1"
# }

# resource "google_compute_router" "router" {
#   name    = "my-router"
#   region  = google_compute_subnetwork.subnet.region
#   network = google_compute_network.net.id

#   bgp {
#     asn = 64514
#   }
# }

# resource "google_compute_router_nat" "nat" {
#   name                               = "my-router-nat"
#   router                             = google_compute_router.router.name
#   region                             = google_compute_router.router.region
#   nat_ip_allocate_option             = "AUTO_ONLY"
#   source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

#   log_config {
#     enable = true
#     filter = "ERRORS_ONLY"
#   }
# }

data "google_compute_subnetwork" "subnet" {
  name    = var.subnet-us
  project = var.host-project
  region  = var.region-1
}

# Creating Dev VM from dev account
resource "google_compute_instance" "dev-vm-test" {
  name         = "dev-vm-test"
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
      access_config {
      }
  }
}