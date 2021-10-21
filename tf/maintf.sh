#!/bin/bash
set -e

apt-get install gedit

echo "tf init---------"
terraform init 
echo "tf fmt---------"
terraform fmt
echo "tf plan---------"
terraform plan
echo "tf apply---------"
terraform apply