
resource "google_compute_instance" "squid-ubuntu-2004-2-vm" {
  name                      = "squid-ubuntu-2004-2-vm"
  zone                      = var.zone-1
  machine_type              = "f1-micro"
  allow_stopping_for_update = true
  project                   = var.host-project
  tags                      = ["gateway-deployment","ingress-iap"]

  boot_disk {
    initialize_params {
      image = "${var.vm_image}"
    }
  }

  network_interface {
    #  network        = google_compute_network.vpc_network_nat.id
     subnetwork     = google_compute_subnetwork.subnet_service_us-nat.id
     network_ip     = "10.1.40.2"
  }
  network_interface {
      # network       = google_compute_network.shared_vpc_network.id
      subnetwork    = google_compute_subnetwork.subnet_service_us.id
      network_ip    = "10.1.30.2"
  }
}



# Commands to run on the squid proxy
#    36  sudo apt-get update - this updates the list of packages available so that we are able to call for the desired net-tools
#    37  sudo apt-get install net-tools - this installs net-tools which allows us to use netstat to see where network traffic is occuring
#    38  sudo netstat -anp -this will list the outputs of netstat and show relevant ports 