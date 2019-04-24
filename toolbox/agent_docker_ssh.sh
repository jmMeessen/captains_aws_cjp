#!/usr/bin/env bash

agent_docker_ip=$(terraform output -state=../terraform/terraform.tfstate Jmm_agent_docker_ip 2>&1)
ssh ${agent_docker_ip} -l ubuntu -i ~/.ssh/captains_aws_cjp
