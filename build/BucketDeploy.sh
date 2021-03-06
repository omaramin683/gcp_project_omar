#!/bin/bash

set -e 

gcloud config set project terraform-training-318910

gcloud config set compute/zone europe-west1-b
gcloud services enable compute.googleapis.com cloudresourcemanager.googleapis.com

PROJECT_TF_STATE_BUCKET="remote_omarbucket_cicd_280199"

PROJECT="$(gcloud config get-value core/project)"

ZONE="$(gcloud config get-value compute/zone)"

gsutil ls -b gs://${PROJECT_TF_STATE_BUCKET} || gsutil mb -p ${PROJECT} -b on gs://${PROJECT_TF_STATE_BUCKET}

echo "$PROJECT_TF_STATE_BUCKET was created"