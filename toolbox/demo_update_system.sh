#!/usr/bin/env bash

export TF_STATE=../terraform/terraform.tfstate

ansible-playbook --inventory-file=/usr/local/bin/terraform-inventory  -u ubuntu --key-file "~/.ssh/captains_aws_cjp" ../deploy/os_update_demo.yml
