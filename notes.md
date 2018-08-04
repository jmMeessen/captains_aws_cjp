# Quick notes

## Assumptions
- Ansible is installed (use Brew)
- Terraform is installed (use Brew also)
- Install the Terraform inventory tool for Ansible with `brew install terraform-inventory` (see https://github.com/adammck/terraform-inventory)

## Pre-flight
- to configure the CB AWS environment with OPSCORE: `opscore iam refresh --account cloudbees-support --role infra-admin`

- to open the console on AWS:
  - `https://console.aws.amazon.com/iam/home?region=us-east-1#/users/jmeessen`
  - switch to `infa-admin @ cloudbees-support`

## initialize SSH (for Ansible and SSH direct connection)
- generate an SSH key with `ssh-keygen -t rsa -b 2048 -v` in the `~/.ssh` directory.
- copy the public key in the terraform directory so that it can be found in the scripts

## create environment
(all work is done from the Terraform sub directory)
- initialise Terraform working directory (if used the first time): `terraform init`
- Sanity check: verify with `terraform plan`
- Start the environment: `terraform apply`
  - the final step shows the IP and DNS names the machines that were created.
  - To show these values (or to load them in environment variables), use `terraform output`
- Deploy the application: `./run_ansible.sh`. 

## setting up the environment
- use the IP (or DNS name) in the browser
  - use port `8888` to connect to CJOC
  - use port `8080` to connect to Client Master
- retrieve the administrator key with `./cjoc_dispay_admin_token.sh` and use it to unlock the CJOC.
- for the license, just request a trial one.
- to connect via SSH
  - use `ssh <ip-address> -l ubuntu -i ~/.ssh/captains_aws_cjp`
  - to retrieve automatically the IPs, use either `./cjoc_ssh.sh` or `cm_ssh.sh`

## destroying the environment
- Pull the environement down: `terraform destroy`
- TODO: a command to supend the environment

## customizing these scripts
If somebody wants to reuse these scritps, one should look for keyword starting with "Jmm"/"jmm" or "captains" in
- instance names (main.tf)
- key names (key-pair.tf)
- security groups (security-groups.tf)
- Ansible target machine names (deploy/playbook.yml)
- in the output.tf and connection automation scripts (*.sh)

## Open question

Question: which openJdk should I install? the normal one or the headless