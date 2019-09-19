#!/usr/bin/env bash

start=`date +%s`

export TF_STATE=../terraform/terraform.tfstate

. ./gather_IPs.sh 

ansible-playbook --inventory-file=/usr/local/bin/terraform-inventory -u ubuntu --key-file "~/.ssh/captains_aws_cjp" --vault-password-file .work-password ../deploy/playbook.yml

end=`date +%s`
echo Execution time was `expr $end - $start` seconds.