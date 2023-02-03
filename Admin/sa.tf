# Service accounts for IAP tunneling
resource "google_service_account" "IAP_service_account" {
  account_id   = "iap-tunneling"
  display_name = "IAP service Account"
  project      = var.host-project
}

resource "google_service_account" "resource-developer" {
  account_id   = "resource-developer"
  display_name = "resource-developer"
  project      = var.dev-project
}


# resource "google_service_account_iam_member" "dev-service-account-iam" {
#   service_account_id = google_service_account.IAP_service_account.name
#   role               = "roles/iam.serviceAccountUser"
#   member             = "user:kat@hanscombe.consulting"
# }

