#!/usr/bin/env bash

agent1_ip=$(terraform output -state=../terraform/terraform.tfstate Jmm_agent1_ip 2>&1)
ssh ${agent1_ip} -l ubuntu -i ~/.ssh/captains_aws_cjp
