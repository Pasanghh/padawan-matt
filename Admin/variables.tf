variable "backend-project" {
  default = "dynamic-house-320309"
}

variable "host-project" {
    type=string
    default="host-project-323315"
}

variable "dev-project" {
    type=string
    default="proud-breaker-324113"
}

variable "region-1" {
  default = "us-central1"
}

variable "region-2" {
  default ="europe-west1"
}

variable "org_id" {
    type=string
    default="842713046109"
}

variable "zone-1" {
  default ="us-central1-a"
}

variable "zone-2" {
  default ="europe-west1-a"
}

variable "vm_image" {
  default = "ubuntu-os-cloud/ubuntu-2004-lts"
}

variable network_name {
  default = "shared-vpc-27677"
}

variable "subnet-us" {
  default = "subnet-service-us"
}

variable "subnet-eu" {
  default = "subnet-service-eu"
}

variable "vpc-nat" {
  default ="vpc-network-nat"
}

variable "subnet-us-nat" {
  default ="vpc-network-nat-subnet"
}
# variable "billing_account" {
#     type = string
#     default = "0143EE-70928C-DB27EB"
# }

# variable "bucket_name" {
#     type= string
#     default="bucket_backend"
# }

# variable "bucket_location" {
#     type=string
#     default="US"
# }
