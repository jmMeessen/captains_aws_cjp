#!/usr/bin/env bash

start=`date +%s`

export TF_STATE=../terraform/terraform.tfstate

. ./gather_IPs.sh 

ansible-playbook --inventory-file=/usr/local/bin/terraform-inventory -u ubuntu --key-file "~/.ssh/captains_aws_cjp" --vault-password-file .work-password ../deploy/playbook.yml

end=`date +%s`
nbr_secs=`expr $end - $start`
nbr_min=`bc <<<"scale=1; $nbr_secs / 60"`
echo Execution time was ${nbr_min} minutes.