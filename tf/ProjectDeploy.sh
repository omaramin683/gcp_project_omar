#!/bin/bash
set -e

cd ./tf/

#create a project and save it to a variable 
RANDOM_NUM=${RANDOM}
export NEW_PROJECT="omar-cicd-${RANDOM_NUM}"

#check if a project called omar-cicd-'random number' exisits in padawan dir
FILTER_PROJ="$(gcloud projects list --filter 'parent.id=342980323094 AND parent.type=folder AND name:omar-cicd-*')"
echo "$FILTER_PROJ already exisits"
FILTER_PROJ > project.txt

#if this does not exisit then the following code is to create a project
if [ -z "$FILTER_PROJ" ]; then
    gcloud projects create ${NEW_PROJECT} --folder=342980323094
    gcloud config set project ${NEW_PROJECT}
    gcloud config set compute/zone europe-west1-b
    gcloud services enable cloudbilling.googleapis.com
    gcloud alpha billing projects link ${NEW_PROJECT} --billing-account 01A2F5-73127B-50AE5B
    gcloud services enable compute.googleapis.com cloudresourcemanager.googleapis.com
    exit 0
[ else gcloud config set project ${FILTER_PROJ}; ]
export FILTER_PROJ
FILTER_PROJ > project.txt
echo "$FILTER_PROJ was created"


fi

exit 0