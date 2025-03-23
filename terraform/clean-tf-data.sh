#!/bin/bash

set -e

cd ./terraform

rm -rf terraform-state
rm -f .terraform.lock.hcl
rm -rf .terraform

cd ./startup

rm -rf terraform-state
rm -f .terraform.lock.hcl
rm -rf .terraform
