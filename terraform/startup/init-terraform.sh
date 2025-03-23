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

cd ./terraform/startup

terraform init
terraform apply -auto-approve
