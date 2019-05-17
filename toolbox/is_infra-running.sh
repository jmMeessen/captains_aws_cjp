#!/usr/bin/env bash
#set -e

./update_aws_token.sh

aws --region us-east-1 --profile cloudbees-ps  ec2 describe-instances --filters "Name=tag:Owner,Values=Jmm" --output table --query "Reservations[*].Instances[*].{Name:Tags[?Key==\`Name\`] | [0].Value,State:State.Name}"