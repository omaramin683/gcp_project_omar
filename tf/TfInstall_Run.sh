#!/bin/bash
set -e

cd ./tf/

echo "Installing all required commands/packages"

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

echo "Remove zip file"
#rm -f terraform_1.0.9_linux_amd64.zip

VERSION_INSTALLED="$(terraform -version)"
echo "Version installed: ${VERSION_INSTALLED}"

#echo "tf init---------"
#terraform init 
#echo "tf fmt---------"
#terraform fmt
#echo "tf plan---------"
#terraform plan
#echo "tf apply---------"
#terraform apply --auto-approve
