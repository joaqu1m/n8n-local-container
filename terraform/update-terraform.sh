#!/bin/bash

# Parar execução em caso de erro
set -e

cd ./terraform

# Verificar as mudanças antes de aplicar
terraform plan

# Aplicar as mudanças
terraform apply -auto-approve
