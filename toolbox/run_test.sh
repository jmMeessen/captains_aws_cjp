#!/usr/bin/env bash

# export TF_STATE=../terraform/terraform.tfstate
# We are forced to tweak the process in such a way because of the terraform-inventory plugin
# bug forcing to use TF_STATE=./

. ./gather_IPs.sh 

cd ../terraform
TF_STATE=./ansible-playbook --inventory-file=/usr/local/bin/terraform-inventory -u ubuntu --key-file "~/.ssh/captains_aws_cjp" --vault-password-file .work-password ../deploy/test.yml
cd -