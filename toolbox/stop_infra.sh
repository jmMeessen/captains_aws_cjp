#!/usr/bin/env bash
set -e

./update_aws_token.sh

cd ../terraform
terraform destroy -auto-approve
cd - 