#!/usr/bin/env bash

if [ $# -lt 1 ]
then
        echo "Usage : $0 nodeName"
        exit
fi

case "$1" in

agent_docker)  
    terraform_name="Jmm_agent_docker_ip"
    ;;

agent1)  
    terraform_name="Jmm_agent1_ip"
    ;;
 
cjoc)  
    terraform_name="Jmm_cjoc_ip"
    ;;
 
cm)  
    terraform_name="Jmm_master_ip"
    ;;
 
sda)  
    terraform_name="Jmm_SDA_ip"
    ;;


*) echo "nodeName $1 is not supported"
   echo "supported node names are: cjoc, cm, agent_docker, agent1"
   exit
   ;;
esac

echo "Starting SSH on $1"
echo "$terraform_name"

node_ip=$(terraform output -raw -state=../terraform/terraform.tfstate $terraform_name 2>&1)
echo "$node_ip"
ssh ${node_ip} -l ubuntu -i ~/.ssh/captains_aws_cjp
