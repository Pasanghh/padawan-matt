#!/bin/bash
cd /Users/e-pgsa/documents/project1/admin

unset GOOGLE_APPLICATION_CREDENTIALS

terraform init 
terraform apply -auto-approve