#!/bin/bash

set -e

cd ./terraform

mv ./startup-modules.tf ./startup-modules.txt

terraform init
terraform apply -auto-approve

mv ./startup-modules.txt ./startup-modules.tf
