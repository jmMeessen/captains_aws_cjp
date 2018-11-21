#!/usr/bin/env bash

# Get the CJOC IP and full name from the terragorm dynamic configuration
cjoc_ip=$(terraform output -state=../../terraform/terraform.tfstate Jmm_cjoc_ip 2>&1)
cjoc_dns=$(terraform output -state=../../terraform/terraform.tfstate Jmm_cjoc_dns 2>&1)
echo $cjoc_dns

# get the initial pass via SSH and load it in an environment variable
token=$(ssh ${cjoc_ip} -l ubuntu -i ~/.ssh/captains_aws_cjp "sudo cat /var/lib/cloudbees-core-oc/secrets/initialAdminPassword")
echo $token

#todo download only if not present
curl -O http://${cjoc_dns}/jnlpJars/jenkins-cli.jar


CLI_command="java -jar jenkins-cli.jar -s http://${cjoc_dns} -auth admin:${token}"

${CLI_command} -http groovy user-creation.groovy jmeessen testPassword testEmail@testEmail.com