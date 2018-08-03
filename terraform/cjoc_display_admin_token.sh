#!/usr/bin/env bash

cjoc_ip=$(terraform output Jmm_cjoc_ip 2>&1)
ssh ${cjoc_ip} -l ubuntu -i ~/.ssh/captains_aws_cjp "sudo cat /var/lib/cloudbees-core-oc/secrets/initialAdminPassword"
