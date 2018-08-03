#!/usr/bin/env bash

ansible-playbook --inventory-file=/usr/local/bin/terraform-inventory  -u ubuntu --key-file "~/.ssh/captains_aws_cjp" ../deploy/playbook.yml
