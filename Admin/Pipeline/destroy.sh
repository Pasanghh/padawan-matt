#!/bin/bash

cd /Users/e-pgsa/documents/project1/admin

unset GOOGLE_APPLICATION_CREDENTIALS

terraform destroy 

gcloud compute shared-vpc associated-projects remove proud-breaker-324113 --host-project host-project-323315

terraform destroy -auto-approve