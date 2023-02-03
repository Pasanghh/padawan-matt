#!/bin/bash

export GOOGLE_APPLICATION_CREDENTIALS="/Users/e-pgsa/Desktop/proud-breaker-324113-4565108503c6.json"

gcloud config set project proud-breaker-324113

terraform init -auto-approve

terraform apply -auto-approve

if [ $? -eq 0 ]
then
  echo "The script ran ok"
  exit 0
else
  echo "The script failed" >&2
  exit 1
fi


