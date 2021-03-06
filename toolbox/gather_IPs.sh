#!/usr/bin/env bash
set -e

cd ../terraform
export cjoc_dns=$(terraform output -state=../terraform/terraform.tfstate Jmm_cjoc_dns 2>&1)
export cjoc_ip=$(terraform output -state=../terraform/terraform.tfstate Jmm_cjoc_ip 2>&1)

export cm_dns=$(terraform output -state=../terraform/terraform.tfstate Jmm_master_dns 2>&1)
export cm_ip=$(terraform output -state=../terraform/terraform.tfstate Jmm_master_ip 2>&1)

export agent1_dns=$(terraform output -state=../terraform/terraform.tfstate Jmm_agent1_dns 2>&1)
export agent1_ip=$(terraform output -state=../terraform/terraform.tfstate Jmm_agent1_ip 2>&1)

export agent_docker_dns=$(terraform output -state=../terraform/terraform.tfstate Jmm_agent_docker_dns 2>&1)
export agent_docker_ip=$(terraform output -state=../terraform/terraform.tfstate Jmm_agent_docker_ip 2>&1)
cd -