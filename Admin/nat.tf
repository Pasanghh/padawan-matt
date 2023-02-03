# Creating router for US subnet
resource "google_compute_router" "nat-router-us-central1" {
  name    = "nat-router-us-central1"
  region  = "${var.region-1}"
  network = google_compute_network.vpc_network_nat.id
  project = var.host-project
}

# Creating router nat for US
resource "google_compute_router_nat" "nat-config1" {
  name                               = "nat-config1"
  router                             = "${google_compute_router.nat-router-us-central1.name}"
  region                             = "${var.region-1}"
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                             = google_compute_subnetwork.subnet_service_us-nat.name
    source_ip_ranges_to_nat          = ["ALL_IP_RANGES"]
  }
  project                            = var.host-project
}

# # Creating router for EU subnet
# resource "google_compute_router" "nat-router-europe-west1" {
#   name    = "nat-router-europe-west1"
#   region  = "${var.region-2}"
#   network = google_compute_network.vpc_network_nat.id
#   project = var.host-project
# }



# # Creating router nat for EU
# resource "google_compute_router_nat" "nat-config2" {
#   name                               = "nat-config2"
#   router                             = "${google_compute_router.nat-router-europe-west1.name}"
#   region                             = "${var.region-2}"
#   nat_ip_allocate_option             = "AUTO_ONLY"
#   source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
#   project                            = var.host-project 
# }