#!/bin/bash

set -e

cd ./terraform

terraform plan

terraform apply -auto-approve
