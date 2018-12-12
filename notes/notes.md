# Quick notes

## Assumptions
- Ansible is installed (use Brew)
- Terraform is installed (use Brew also)
- Install the Terraform inventory tool for Ansible with `brew install terraform-inventory` (see https://github.com/adammck/terraform-inventory)
- The IPtable maninpulation Ansible role is needed to do the port forwarding. Install it with `ansible-galaxy install geerlingguy.firewall`

## Pre-flight
- to configure the CB AWS environment with OPSCORE: `opscore iam refresh --account cloudbees-support --role infra-admin`

- to open the console on AWS:
  - `https://console.aws.amazon.com/iam/home?region=us-east-1#/users/jmeessen`
  - switch to `infa-admin @ cloudbees-support`

## Initialize SSH (for Ansible and SSH direct connection)
- generate an SSH key with `ssh-keygen -t rsa -b 2048 -v -f ~/.ssh/captains_aws_cjp`.
- copy the public key in the terraform directory so that it can be found in the scripts

**Note** : Automation tools mentioned hereafter are located in the `toolbox` directory

## Create environment (first time)
- initialise Terraform working directory (if used the first time): `terraform init` while in the terraform directory
- Sanity check: verify with `terraform plan`
- Start the environment: `terraform apply` or with `toolbox\start_infra.sh`
  - the final step shows the IP and DNS names the machines that were created.
  - To show these values (or to load them in environment variables), use `terraform output`
- Deploy the application: `toolbox/run_ansible.sh`. 

## Setting up the environment
- use the IP (or DNS name) in the browser. Note that both CJOC and CM are "listening" on the default HTTP port (via an IPtable redirection). You can also use `toolbox\cjoc_http.sh` or `toolbox\cm_http.sh`.
- retrieve the administrator key with `toolbox/cjoc_dispay_admin_token.sh` and use it to unlock the CJOC.
- for the license, just request a trial one.
- to connect via SSH
  - use `ssh <ip-address> -l ubuntu -i ~/.ssh/captains_aws_cjp`
  - to retrieve automatically the IPs, use either `toolbox/cjoc_ssh.sh` or `toolbox/cm_ssh.sh`

## Destroying the environment
- Pull the environement down: `toolbox/stop_infra.sh` that will perform a `terraform destroy` or, without the validation prompt, `terraform destroy -auto-approve`
- TODO: a command to supend the environment

## Customizing these scripts
If somebody wants to reuse these scritps, one should look for keyword starting with "Jmm"/"jmm" or "captains" in
- instance names (main.tf)
- key names (key-pair.tf)
- security groups (security-groups.tf)
- Ansible target machine names (deploy/playbook.yml)
- in the output.tf and connection automation scripts (*.sh)

## Open question

Question: which openJdk should I install? the normal one or the headless
