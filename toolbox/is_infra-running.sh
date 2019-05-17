#!/usr/bin/env bash
#set -e

./update_aws_token.sh

#aws --region us-east-1 --profile cloudbees-ps  ec2 describe-instances --filters Name=tag:Owner,Values=Jmm --output text --query "Reservations[].Instances[].[InstanceId]"
#aws --region us-east-1 --profile cloudbees-ps  ec2 describe-instances --filters Name=tag:Owner,Values=Jmm --output text --query "Reservations[].Instances[].Tags[?Key==\`Name\`].Value[]"
#aws --region us-east-1 --profile cloudbees-ps  ec2 describe-instances --filters "Name=tag:Owner,Values=Jmm" --output text --query "Reservations[].Instances[].State.[Name]"
#aws --region us-east-1 --profile cloudbees-ps  ec2 describe-instances --filters "Name=tag:Owner,Values=Jmm" --output text --query "Reservations[*].Instances[*].[InstanceId, State.Name]"
aws --region us-east-1 --profile cloudbees-ps  ec2 describe-instances --filters "Name=tag:Owner,Values=Jmm" --output text --query "Reservations[*].Instances[*].[InstanceID, State.Name, Tags[?Key==\`Name\`].Value[]]"