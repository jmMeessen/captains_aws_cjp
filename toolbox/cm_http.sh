#!/usr/bin/env bash

cm_dns=$(terraform output -state=../terraform/terraform.tfstate Jmm_master_dns 2>&1)
open http://${cm_dns} 
