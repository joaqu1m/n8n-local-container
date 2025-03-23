#!/bin/bash

set -e

cd ./terraform

mv ./startup-modules.tf ./startup-modules.txt

terraform plan -out=./terraform-state/plan.tfplan
terraform apply -auto-approve ./terraform-state/plan.tfplan

mv ./startup-modules.txt ./startup-modules.tf
