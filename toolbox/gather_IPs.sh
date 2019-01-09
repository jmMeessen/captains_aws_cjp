#!/usr/bin/env bash
set -e

export cjoc_dns=$(terraform output -state=../terraform/terraform.tfstate Jmm_cjoc_dns 2>&1)
export cjoc_ip=$(terraform output -state=../terraform/terraform.tfstate Jmm_cjoc_ip 2>&1)

export cm_dns=$(terraform output -state=../terraform/terraform.tfstate Jmm_master_dns 2>&1)
export cm_ip=$(terraform output -state=../terraform/terraform.tfstate Jmm_master_ip 2>&1)