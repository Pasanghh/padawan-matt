#Creating a firewall that allows ingress from IAP to Shared VPC
resource "google_compute_firewall" "allow-ingress-from-iap-host" {
  project     = var.host-project
  name        = "allow-ingress-from-iap-host"
  network     = google_compute_network.shared_vpc_network.id
  description = "Creates firewall access for iap"
  source_ranges = ["35.235.240.0/20"]
  allow {
    protocol  = "tcp"
    ports     = ["22","3389"]
  }
  target_tags = ["ingress-iap"]
}

#Creating Firewall for port 3128 SQUID to Shared VPC
resource "google_compute_firewall" "allow-port-squid-dev" {
  project     = var.host-project
  name        = "allow-port-squid-dev"
  network     = google_compute_network.shared_vpc_network.id
  description = "Creates firewall access for squid"
  source_ranges = ["0.0.0.0/0"]
  allow {
    protocol  = "tcp"
    ports     = ["3128"]
  }
}

#Creating Firewall for port 3128 SQUID
resource "google_compute_firewall" "allow-http-https-dev" {
  project     = var.host-project
  name        = "allow-http-https-dev"
  network     = google_compute_network.shared_vpc_network.id
  description = "http/https"
  source_ranges = ["0.0.0.0/0"]
  allow {
    protocol  = "tcp"
    ports     = ["80","443"]
  }
}

#Creating a firewall that allows ingress from IAP to NAT VPC
resource "google_compute_firewall" "allow-ingress-from-iap-host-vpc" {
  project     = var.host-project
  name        = "allow-ingress-from-iap-host-vpc"
  network     = google_compute_network.vpc_network_nat.id
  description = "Creates firewall access for iap"
  source_ranges = ["35.235.240.0/20"]
  allow {
    protocol  = "tcp"
    ports     = ["22","3389"]
  }
}

#Creating Firewall for port 3128 SQUID NAT VPC
resource "google_compute_firewall" "allow-port-squid" {
  project     = var.host-project
  name        = "allow-port-squid"
  network     = google_compute_network.vpc_network_nat.id
  description = "Creates firewall access for squid"
  source_ranges = ["0.0.0.0/0"]
  allow {
    protocol  = "tcp"
    ports     = ["3128"]
  }
  target_tags = ["gateway-deployment"]
}

#Creating Firewall for port 3128 SQUID
resource "google_compute_firewall" "allow-http-https" {
  project     = var.host-project
  name        = "allow-http-https"
  network     = google_compute_network.vpc_network_nat.id
  description = "http/https"
  source_ranges = ["0.0.0.0/0"]
  allow {
    protocol  = "tcp"
    ports     = ["80","443"]
  }
}