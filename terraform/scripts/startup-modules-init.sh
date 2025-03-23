#!/bin/bash

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

cd ./terraform

mv ./modules.tf ./modules.txt

terraform init
terraform apply -auto-approve

mv ./modules.txt ./modules.tf
