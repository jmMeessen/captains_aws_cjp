#!/usr/bin/env bash
set -e

. ./gather_IPs.sh 

ssh-keygen -R ${cjoc_dns}
ssh-keygen -R ${cjoc_ip}

ssh-keygen -R ${cm_dns}
ssh-keygen -R ${cm_ip}

ssh-keygen -R ${agent1_dns}
ssh-keygen -R ${agent1_ip}

ssh-keygen -R ${agent_docker_dns}
ssh-keygen -R ${agent_docker_ip}