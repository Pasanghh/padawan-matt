#!/bin/bash

unset GOOGLE_APPLICATION_CREDENTIALS
#This will apply all of the resources on GCP
cd /Users/e-pgsa/Documents/project1/admin
terraform init 
terraform apply -auto-approve

sleep 10

cd /Users/e-pgsa/Documents/project1/admin/Pipeline
./squidstartup.sh


# acl good_url dstdomain .facebook.com
# http_access allow goodurl
# http_access deny all