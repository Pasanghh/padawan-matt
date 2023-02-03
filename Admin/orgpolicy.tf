#Organisation policy for External IP
resource "google_organization_policy" "External_IP_policy" {
  org_id     = var.org_id
  constraint = "constraints/compute.vmExternalIpAccess"

  list_policy {
    deny {
      all = true
    }
  }
}

#Organisation policy for JSON key creation on host for service account identity with terraform 
resource "google_organization_policy" "JSON_key_policy" {
  org_id     = var.org_id
  constraint = "constraints/iam.disableServiceAccountKeyCreation"

 boolean_policy {
    enforced = false
  }
}

#Organisation policy for cloud Nat creation in the serivce project
resource "google_project_organization_policy" "Cloud_NAT_policy" {
  project     = var.dev-project
  constraint = "constraints/compute.restrictCloudNATUsage"

  
  list_policy {
    deny {
      all = true
    }
  }
}

#Organisation policy for IPV6 use on the pdev project level
resource "google_project_organization_policy" "IPV6_policy" {
  project     = var.dev-project
  constraint = "constraints/compute.disableAllIpv6"

  boolean_policy {
    enforced = true
  }
}

#Organisational policy in the project level to restrict project removal
resource "google_folder_organization_policy" "SVPC_project_removal" {
  folder     = "folders/843252652360"
  constraint = "constraints/compute.restrictXpnProjectLienRemoval"

  boolean_policy {
    enforced = true
  }
}

#organisational policy to restrict the creation of External LBs
resource "google_project_organization_policy" "LB_type_policy" {
  project     = var.dev-project
  constraint  = "constraints/compute.restrictLoadBalancerCreationForTypes"

  list_policy {
    deny {
      values = [
     "EXTERNAL_NETWORK_TCP_UDP",
     "EXTERNAL_TCP_PROXY",
     "EXTERNAL_SSL_PROXY",
     "EXTERNAL_HTTP_HTTPS",
      ]
    }
  }
}

#Organisational policy to restrict creation of internet end points
resource "google_project_organization_policy" "Internet-end-points" {
  project    = var.dev-project
  constraint = "constraints/compute.disableInternetNetworkEndpointGroup"

  boolean_policy {
    enforced =true
  }
}
