#!/usr/bin/env bash
set -e

./update_aws_token.sh

cd ../terraform
terraform apply -auto-approve
cd -

./update_ssh_known-host.sh