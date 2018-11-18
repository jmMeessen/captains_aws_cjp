#!/usr/bin/env bash

cjoc_dns=$(terraform output -state=../terraform/terraform.tfstate Jmm_cjoc_dns 2>&1)
open http://${cjoc_dns} 