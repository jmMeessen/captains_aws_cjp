#!/usr/bin/env bash

cd ../terraform
pwd
if [ -d ".terraform" ]; then
    echo "Deleting .terraform directory"
    rm -rf .terraform
fi

if [ -f "terraform.tfstate" ]; then
    echo "Deleting the terraform state file and backup"
    rm terraform.tfstate*
fi

terraform init

cd -
