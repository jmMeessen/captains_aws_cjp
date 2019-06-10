#!/usr/bin/env bash

agent_docker_dns=$(terraform output -state=../terraform/terraform.tfstate Jmm_agent_docker_dns 2>&1)
open http://${agent_docker_dns}:8081
