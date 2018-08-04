#!/usr/bin/env bash

cm_ip=$(terraform output Jmm_master_ip 2>&1)
ssh ${cm_ip} -l ubuntu -i ~/.ssh/captains_aws_cjp "sudo cat /var/lib/cloudbees-core-cm/secrets/initialAdminPassword"
