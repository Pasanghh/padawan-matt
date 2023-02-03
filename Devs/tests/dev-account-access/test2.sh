#!/bin/bash
unset GOOGLE_APPLICATION_CREDENTIALS

gcloud auth login kat@hanscombe.consulting --no-launch-browser

gcloud config set project proud-breaker-324113

terraform init

terraform apply -auto-approve

if [ $? -eq 0 ]
then
  echo "The script ran ok"
  exit 0
else
  echo "The script failed" >&2
  exit 1
fi

