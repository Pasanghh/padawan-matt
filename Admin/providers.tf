terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  project = var.backend-project
  region  = var.region-1
}

terraform {
  backend "gcs" {
      bucket    = "bucket_backend"
      prefix    = "terraform/state"
  }
}