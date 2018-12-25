#!/usr/bin/env bash

cjoc_ip=$(terraform output -state=../terraform/terraform.tfstate Jmm_cjoc_ip 2>&1)
if [ -z "$1" ]
then
    echo "Give the host directory as a parameter."
else
    scp -i ~/.ssh/captains_aws_cjp ubuntu@${cjoc_ip}:$1 ./
fi