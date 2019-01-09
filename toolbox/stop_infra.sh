#!/usr/bin/env bash
set -e

./update_aws_token.sh

./remove_ssh_known-host.sh

cd ../terraform
terraform destroy -auto-approve
cd - 