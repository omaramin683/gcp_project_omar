#!/bin/bash
set -e

cd ./tf/

#create a project and save it to a variable 
RANDOM_NUM=${RANDOM}
export NEW_PROJECT="omar-cicd-${RANDOM_NUM}"

#check if a project called omar-cicd-'random number' exisits in padawan dir
FILTER_PROJ="$(gcloud projects list --filter 'parent.id=263138525915 AND parent.type=folder AND name:omar-cicd-*')"
export FILTER_PROJ

echo "$FILTER_PROJ already exisits"


#if this does not exisit then the following code is to create a project
if [ -z "$FILTER_PROJ" ]; then
    gcloud projects create ${NEW_PROJECT} --folder=263138525915
    gcloud config set project ${NEW_PROJECT}
    gcloud config set compute/zone europe-west1-b
    gcloud services enable cloudbilling.googleapis.com
    gcloud alpha billing projects link ${NEW_PROJECT} --billing-account 01A2F5-73127B-50AE5B
    gcloud services enable compute.googleapis.com cloudresourcemanager.googleapis.com
    apt-get update -y 

    apt-get upgrade -y 

    apt-get install unzip -y 

    apt-get install wget -y

    echo "Getting Terraform package from Hashicorp"
    wget https://releases.hashicorp.com/terraform/0.13.1/terraform_0.13.1_linux_amd64.zip

    rm -rf terraform/

    echo "Unzipping Terraform package"
    unzip -o terraform_0.13.1_linux_amd64.zip

    echo "Move Terraform folder to user/bin directory"
    mv terraform /usr/local/bin/ 
    terraform init
    terraform plan -out activator-plan -var="project=$FILTER_PROJ" #-var-file=./tf/variables.tf
    terraform apply --auto-approve activator-plan
    exit 0
[ else gcloud config set project ${FILTER_PROJ}; ]
export FILTER_PROJ
echo "$FILTER_PROJ was created"


fi

exit 0
