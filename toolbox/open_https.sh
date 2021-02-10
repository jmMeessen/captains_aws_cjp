#!/usr/bin/env bash

if [ $# -lt 1 ]
then
        echo "Usage : $0 nodeName"
        exit
fi

case "$1" in

sda)  
    terraform_name="Jmm_SDA_dns"
    used_port=""
    ;;
 
*) echo "nodeName $1 is not supported"
   echo "supported node names are: sda"
   exit
   ;;
esac

echo "Starting HTTP session on $1"
#echo "$terraform_name"

node_dns=$(terraform output -raw -state=../terraform/terraform.tfstate $terraform_name 2>&1)
#echo "${node_dns}${used_port}"
open https://${node_dns}${used_port} 

