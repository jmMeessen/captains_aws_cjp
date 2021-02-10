#!/usr/bin/env bash

if [ $# -lt 1 ]
then
        echo "Usage : $0 nodeName"
        exit
fi

case "$1" in

nexus)  
    terraform_name="Jmm_agent_docker_dns"
    used_port=":8081"
    ;;

cjoc)  
    terraform_name="Jmm_cjoc_dns"
    used_port=""
    ;;
 
cm)  
    terraform_name="Jmm_master_dns"
    used_port=""
    ;;
 
*) echo "nodeName $1 is not supported"
   echo "supported node names are: cjoc, cm, nexus"
   exit
   ;;
esac

echo "Starting HTTP session on $1"
#echo "$terraform_name"

node_dns=$(terraform output -raw -state=../terraform/terraform.tfstate $terraform_name 2>&1)
#echo "${node_dns}${used_port}"
open http://${node_dns}${used_port} 

