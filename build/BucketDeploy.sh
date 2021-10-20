#!/bin/bash

set -e 

PROJECT_ID="omar-cicd-280199"

gcloud config set project $PROJECT_ID

gcloud config set compute/zone europe-west1-b
gcloud services enable compute.googleapis.com cloudresourcemanager.googleapis.com

PROJECT_TF_STATE_BUCKET="remote_omarbucket_cicd_280199"

PROJECT_ID="$(gcloud config get-value core/project)"

ZONE="$(gcloud config get-value compute/zone)"

gsutil ls -b gs://${PROJECT_TF_STATE_BUCKET} || gsutil mb -p ${PROJECT} -b on gs://${PROJECT_TF_STATE_BUCKET}

export PROJECT_ID
echo $PROJECT_ID