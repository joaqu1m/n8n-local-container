#!/bin/bash

# Parar execução em caso de erro
set -e

rm -rf ~/.aws/
mkdir ~/.aws/

cat <<EOL > ~/.aws/config
[default]
region = us-east-1
output = json
EOL

echo "Insert Credentials"
cat > ~/.aws/credentials

cd ./terraform/startup

# Inicializar Terraform
terraform init
terraform apply -auto-approve
