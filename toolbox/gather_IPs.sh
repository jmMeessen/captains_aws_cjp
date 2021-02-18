#!/usr/bin/env bash
set -e

cd ../terraform
export cjoc_dns=$(terraform output -raw -state=../terraform/terraform.tfstate Jmm_cjoc_dns 2>&1)
export cjoc_ip=$(terraform output -raw -state=../terraform/terraform.tfstate Jmm_cjoc_ip 2>&1)

export cm_dns=$(terraform output -raw -state=../terraform/terraform.tfstate Jmm_master_dns 2>&1)
export cm_ip=$(terraform output -raw -state=../terraform/terraform.tfstate Jmm_master_ip 2>&1)

export agent1_dns=$(terraform output -raw -state=../terraform/terraform.tfstate Jmm_agent1_dns 2>&1)
export agent1_ip=$(terraform output -raw -state=../terraform/terraform.tfstate Jmm_agent1_ip 2>&1)

export agent2_dns=$(terraform output -raw -state=../terraform/terraform.tfstate Jmm_agent2_dns 2>&1)
export agent2_ip=$(terraform output -raw -state=../terraform/terraform.tfstate Jmm_agent2_ip 2>&1)

export agent3_dns=$(terraform output -raw -state=../terraform/terraform.tfstate Jmm_agent3_dns 2>&1)
export agent3_ip=$(terraform output  -raw-state=../terraform/terraform.tfstate Jmm_agent3_ip 2>&1)

export agent4_dns=$(terraform output -raw -state=../terraform/terraform.tfstate Jmm_agent4_dns 2>&1)
export agent4_ip=$(terraform output  -raw -state=../terraform/terraform.tfstate Jmm_agent4_ip 2>&1)

export agent_docker_dns=$(terraform output -raw -state=../terraform/terraform.tfstate Jmm_agent_docker_dns 2>&1)
export agent_docker_ip=$(terraform output -raw -state=../terraform/terraform.tfstate Jmm_agent_docker_ip 2>&1)
cd -