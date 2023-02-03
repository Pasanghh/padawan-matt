
# Creating network for sole connction to nat
resource "google_compute_network" "vpc_network_nat" {
  name    = var.vpc-nat
  project = var.host-project
  auto_create_subnetworks = false
}

# Creating subnet that the nat will use 
resource "google_compute_subnetwork" "subnet_service_us-nat" {
  name          = var.subnet-us-nat
  project       = google_compute_network.vpc_network_nat.project
  ip_cidr_range = "10.1.40.0/24"
  region        = var.region-1
  network       = google_compute_network.vpc_network_nat.id
}

# Creating subnet for developer access
resource "google_compute_subnetwork" "subnet_service_us" {
  name          = var.subnet-us
  project       = google_compute_network.shared_vpc_network.project
  ip_cidr_range = "10.1.30.0/24"
  region        = var.region-1
  network       = google_compute_network.shared_vpc_network.id
}

# Creating subnet for developer access
resource "google_compute_subnetwork" "subnet_service_eu" {
  name          = var.subnet-eu
  project       = google_compute_network.shared_vpc_network.project
  ip_cidr_range = "10.1.20.0/24"
  region        = var.region-2
  network       = google_compute_network.shared_vpc_network.id
}

# Creating shared VPC
resource "google_compute_network" "shared_vpc_network" {
  name                    = var.network_name
  project                 = var.host-project
  auto_create_subnetworks = false
}

# Assigning shared VPC HOST project
resource "google_compute_shared_vpc_host_project" "host" {
  project = google_compute_network.shared_vpc_network.project
}

# Assigning shared VPC Service project
resource "google_compute_shared_vpc_service_project" "service1" {
  host_project    = google_compute_shared_vpc_host_project.host.project
  service_project = var.dev-project
}



# # Storage bucket for tfstate
# resource "google_storage_bucket" "default" {
# name                        = var.bucket_name
# location                    = var.bucket_location
# uniform_bucket_level_access = true
# force_destroy = true
# }

# # Create billing dependency
# data "google_billing_account" "acct" {             
#   # display_name = "My Billing Account"
#   # open         = true
#   billing_account = "0143EE-70928C-DB27EB"
# }

# # Creating projects for shared VPC
# resource "google_project" "host_project" {
#   name       = var.host_id
#   project_id = "host-project-28738"
#   # org_id = var.org_id
#   folder_id  = google_folder.folder.name

#   billing_account = data.google_billing_account.acct.id
# }

# resource "google_project" "service_project" {
#   name       = var.service_project
#   project_id = "service-project-37864"
#   # org_id = var.org_id
#   folder_id  = google_folder.folder.name

#   billing_account = data.google_billing_account.acct.id
# }



# # Creating folder for host and service projects
# resource "google_folder" "folder" {
#   display_name = "folder"
#   parent       = "organizations/${var.org_id}"
# }