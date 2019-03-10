#!/usr/bin/env bash

export TF_STATE=../terraform/terraform.tfstate

ansible-playbook --inventory-file=/usr/local/bin/terraform-inventory --ask-vault-pass -u ubuntu --key-file "~/.ssh/captains_aws_cjp" ../deploy/test.yml
