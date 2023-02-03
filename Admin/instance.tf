
resource "google_compute_instance" "vm" {
  name         = "test"
  machine_type = "e2-medium"
  zone         = var.zone-1
  project      = var.dev-project

  boot_disk {
    initialize_params {
      image = "${var.vm_image}"
    }
  }

  network_interface {
      # network  = google_compute_network.shared_vpc_network.id
      subnetwork = google_compute_subnetwork.subnet_service_us.id
      network_ip = "10.1.30.3"
  }
  tags = ["ingress-iap"]
  
  metadata = {
     osLogin = "enable"
  }
  
}
