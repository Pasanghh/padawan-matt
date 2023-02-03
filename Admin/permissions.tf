
#Permissions for DEVS & Admins on Dev-project
resource "google_project_iam_policy" "service-iam-dev" {
  project = var.dev-project
  policy_data = "${data.google_iam_policy.admin_service.policy_data}"
}

#Permissions on the SERVICE Project 
data "google_iam_policy" "admin_service" {
  binding {
    role = "roles/compute.admin"
    members = [
        "user:admin@hanscombe.enterprises",
        "user:admin@hanscombe.consulting",
    ]
  }
  binding {
    role = "roles/resourcemanager.projectIamAdmin"
    members = [
        "user:admin@hanscombe.enterprises",
        "user:admin@hanscombe.consulting",
    ]
  }
  binding {
    role = "roles/compute.instanceAdmin.v1"
    members = [
        "user:admin@hanscombe.enterprises",
        "user:admin@hanscombe.consulting",
        "serviceAccount:resource-developer@proud-breaker-324113.iam.gserviceaccount.com",
    ]
  }
  binding {
    role = "roles/compute.viewer"
    members = [
       "user:kat@hanscombe.consulting",
    ]
  }
  binding {
    role = "roles/compute.osLogin"
    members = [
      "serviceAccount:resource-developer@proud-breaker-324113.iam.gserviceaccount.com",
      "user:admin@hanscombe.consulting",
    ]
  }
  binding {
    role = "roles/iam.serviceAccountUser"
    members = [
       "serviceAccount:resource-developer@proud-breaker-324113.iam.gserviceaccount.com",
    ] 
  }
  binding {
    role = "roles/iam.serviceAccountKeyAdmin"
    members = [
       "user:admin@hanscombe.consulting",
       "user:admin@hanscombe.enterprises",
    ]
  }
  binding {
    role = "roles/stackdriver.accounts.editor"
    members = [
       "user:kat@hanscombe.consulting",
    ]
  }
}

# Permissions for Dev & Admin on Host Project
resource "google_project_iam_policy" "host-iam-dev" {
  project = var.host-project
  policy_data = "${data.google_iam_policy.admin_host.policy_data}"
}
# Permissions on the HOST Project
data "google_iam_policy" "admin_host" {
  binding {
    role = "roles/compute.networkUser"
    members = [
        "user:admin@hanscombe.enterprises",
        "user:admin@hanscombe.consulting",
    ]
  }
  binding {
    role = "roles/compute.instanceAdmin.v1"
    members = [
        "user:admin@hanscombe.enterprises",
        "user:admin@hanscombe.consulting",
    ]
  }
  binding {
    role = "roles/iam.serviceAccountUser"
    members = [
        "user:admin@hanscombe.enterprises",
        "user:admin@hanscombe.consulting",
    ]
  }
  binding {
    role = "roles/oauthconfig.viewer"
    members = [
        "user:admin@hanscombe.enterprises",
        "user:admin@hanscombe.consulting",
    ]
  }
  binding {
    role = "roles/stackdriver.accounts.editor"
    members = [
        "user:admin@hanscombe.enterprises",
        "user:admin@hanscombe.consulting",
    ]
  }
  binding {
    role = "roles/deploymentmanager.editor"
    members = [
        "user:admin@hanscombe.enterprises",
        "user:admin@hanscombe.consulting",
    ]
  }
  binding {
    role = "roles/compute.securityAdmin"
    members = [
        "user:admin@hanscombe.enterprises",
        "user:admin@hanscombe.consulting",
    ]
  }
  binding {
    role = "roles/iam.serviceAccountKeyAdmin"
    members = [
        "user:admin@hanscombe.consulting",
    ]
  }
}

#Permissions to manage IAP for DEV project instances
resource "google_iap_tunnel_instance_iam_binding" "binding-service" {
  project  = var.dev-project
  zone     = var.zone-1
  role     = "roles/iap.tunnelResourceAccessor"
  instance = google_compute_instance.vm.name
  members   = [
    # "user:kat@hanscombe.consulting",
    "user:admin@hanscombe.consulting",
    "user:admin@hanscombe.enterprises",
    "serviceAccount:resource-developer@proud-breaker-324113.iam.gserviceaccount.com",
  ]
}

#Permissions to manage IAP for Host project instances 
resource "google_iap_tunnel_instance_iam_binding" "binding-host-test" {
  project  = var.host-project
  zone     = var.zone-1
  role     = "roles/iap.tunnelResourceAccessor"
  instance = google_compute_instance.squid-ubuntu-2004-2-vm.name
  members   = [
    "user:admin@hanscombe.consulting",
    "user:admin@hanscombe.enterprises",
  ]
}

#Permission for service account that devs will have access to on shared VPC
data "google_iam_policy" "sharedVPC" {
  binding {
    role = "roles/compute.networkUser"
    members = [
     "serviceAccount:resource-developer@proud-breaker-324113.iam.gserviceaccount.com",
     "user:admin@hanscombe.consulting",
    ]
  }
}

resource "google_compute_subnetwork_iam_policy" "policy" {
  project = google_compute_subnetwork.subnet_service_us.project
  region = google_compute_subnetwork.subnet_service_us.region
  subnetwork = google_compute_subnetwork.subnet_service_us.id
  policy_data = data.google_iam_policy.sharedVPC.policy_data
}

#Permissions to manage IAP for DEV project instances
resource "google_iap_tunnel_instance_iam_binding" "binding-service-sam" {
  project  = var.dev-project
  zone     = var.zone-1
  role     = "roles/iap.tunnelResourceAccessor"
  instance = "poopsang"
  members   = [
    # "user:kat@hanscombe.consulting",
    "user:admin@hanscombe.consulting",
    "user:admin@hanscombe.enterprises",
    "serviceAccount:resource-developer@proud-breaker-324113.iam.gserviceaccount.com",
  ]
}

#Permissions to manage IAP for DEV project instances
resource "google_iap_tunnel_instance_iam_binding" "binding-service-fashal" {
  project  = var.dev-project
  zone     = var.zone-1
  role     = "roles/iap.tunnelResourceAccessor"
  instance = "jefarterina"
  members   = [
    # "user:kat@hanscombe.consulting",
    "user:admin@hanscombe.consulting",
    "user:admin@hanscombe.enterprises",
    "serviceAccount:resource-developer@proud-breaker-324113.iam.gserviceaccount.com",
  ]
}

#Permissions to manage IAP for DEV project instances
resource "google_iap_tunnel_instance_iam_binding" "binding-service-ssss" {
  project  = var.dev-project
  zone     = var.zone-1
  role     = "roles/iap.tunnelResourceAccessor"
  instance = "poopfart"
  members   = [
    # "user:kat@hanscombe.consulting",
    "user:admin@hanscombe.consulting",
    "user:admin@hanscombe.enterprises",
    "serviceAccount:resource-developer@proud-breaker-324113.iam.gserviceaccount.com",
  ]
}