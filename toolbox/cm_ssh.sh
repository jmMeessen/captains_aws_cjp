#!/usr/bin/env bash

cm_ip=$(terraform output -state=../terraform/terraform.tfstate Jmm_master_ip 2>&1)
ssh ${cm_ip} -l ubuntu -i ~/.ssh/captains_aws_cjp
