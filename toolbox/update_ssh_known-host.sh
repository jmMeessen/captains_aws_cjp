#!/usr/bin/env bash
set -e

. ./gather_IPs.sh 

ssh-keyscan -t rsa,dsa ${cjoc_dns} >> ~/.ssh/known_hosts
ssh-keyscan -t rsa,dsa ${cjoc_ip} >> ~/.ssh/known_hosts

ssh-keyscan -t rsa,dsa ${cm_dns} >> ~/.ssh/known_hosts
ssh-keyscan -t rsa,dsa ${cm_ip} >> ~/.ssh/known_hosts

ssh-keyscan -t rsa,dsa ${agent1_dns} >> ~/.ssh/known_hosts
ssh-keyscan -t rsa,dsa ${agent1_ip} >> ~/.ssh/known_hosts

ssh-keyscan -t rsa,dsa ${agent_docker_dns} >> ~/.ssh/known_hosts
ssh-keyscan -t rsa,dsa ${agent_docker_ip} >> ~/.ssh/known_hosts