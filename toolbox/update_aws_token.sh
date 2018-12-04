#!/usr/bin/env bash
set -e

opscore update
opscore iam refresh --account cloudbees-ps --role infra-admin
