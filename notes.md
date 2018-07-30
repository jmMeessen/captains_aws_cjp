# Quick notes

## Pre-flight
- to configure the CB AWS environment with OPSCORE: `opscore iam refresh --account cloudbees-support --role infra-admin`

- to open the console on AWS:
  - `https://console.aws.amazon.com/iam/home?region=us-east-1#/users/jmeessen`
  - switch to `infa-admin @ cloudbees-support`

## create environemen
- initialise Terraform working directory (if used the first time): `terraform init`
- Sanity check: verify with `terraform plan`
- Start the environment: `terraform apply`
- Pull the environement down: `terraform destroy`

## initialize SSH and connect
- generate an SSH key with `ssh-keygen -t rsa -b 2048 -v` in the `~/.ssh` directory.
- copy the public key in the terraform directory so that it can be found in the scripts
- connect to the server with `ssh <ip-address> -l ubuntu -i ~/.ssh/captains_aws_cjp`

## experiment with Ansible
- install inventory system `brew install terraform-inventory` (see https://github.com/adammck/terraform-inventory)

- `ansible-playbook --inventory-file=/usr/local/bin/terraform-inventory -e 'host_key_checking=False' --key-file "~/.ssh/captains_aws_cjp" deploy/playbook.yml`

ansible-playbook --inventory-file=/usr/local/bin/terraform-inventory -e 'host_key_checking=False' -u ubuntu --key-file "~/.ssh/captains_aws_cjp" deploy/playbook.yml

problem with running apt-get on Ubuntu with ansible
