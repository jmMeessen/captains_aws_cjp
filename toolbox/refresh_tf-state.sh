#!/usr/bin/env bash
set -e

cd ../terraform
terraform state pull > terraform.tfstate
cd -