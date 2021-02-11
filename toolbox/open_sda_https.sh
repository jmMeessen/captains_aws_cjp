#!/usr/bin/env bash


terraform_name="Jmm_SDA_dns"


echo "Starting HTTPS session on SDA"
#echo "$terraform_name"

node_dns=$(terraform output -raw -state=../terraform/terraform.tfstate $terraform_name 2>&1)
#echo "${node_dns}${used_port}"
open -a firefox -g "https://${node_dns}" 

