# Quick notes

## Assumptions
- Ansible is installed (use Brew)
- Terraform is installed (use Brew also)
- Install the Terraform inventory tool for Ansible with `brew install terraform-inventory` (see https://github.com/adammck/terraform-inventory)
- The IPtable maninpulation Ansible role is needed to do the port forwarding. Install it with `ansible-galaxy install geerlingguy.firewall`
- Several files are encrypted with Ansible Vault (so that they can be pushed safely to a source repository). The toolbox scripts used to start the installation rely on a file `toolbox\.work-password` (ignored by Git) that contains the Ansible Vault password. To reuse this installation, you need to re-encrypt these files with an other password. Use `ansible-vault edit` to edit or `ansible-vault encrypt` to encrypt.

## Pre-flight
- to configure the CB AWS environment with OPSCORE: `opscore iam refresh --account cloudbees-ps --role infra-admin`

- to open the console on AWS:
  - `https://console.aws.amazon.com/iam/home?region=us-east-1#/users/jmeessen`
  - switch to `infra-admin @ cloudbees-ps`

## Initialize SSH (for Ansible and SSH direct connection)
- generate an SSH key with `ssh-keygen -t rsa -b 2048 -v -f ~/.ssh/captains_aws_cjp`.
- copy the public key in the terraform directory so that it can be found in the scripts

**Note** : Automation tools mentioned hereafter are located in the `toolbox` directory.

## Create environment (first time)
- initialise Terraform working directory (if used the first time): `terraform init` while in the terraform directory
- Sanity check: verify with `terraform plan`
- Start the environment: `terraform apply` or with `toolbox/start_infra.sh`
  - the final step shows the IP and DNS names the machines that were created.
  - To show these values (or to load them in environment variables), use `terraform output`
- Deploy the application: `toolbox/run_ansible.sh`. 

## Setting up the environment
- use the IP (or DNS name) in the browser. Note that both CJOC and CM are "listening" on the default HTTP port (via an IPtable redirection). You can also use `toolbox\cjoc_http.sh` or `toolbox\cm_http.sh`.
- retrieve the administrator key with `toolbox/cjoc_dispay_admin_token.sh` and copy it.
- start a browser session the CJOC with `toolbox/cjoc_http.sh`.
- use the admin key just copied to unlock the CJOC.
- for the license, just request a trial one.
- install the default plugins
- don't create a special user, just choose `Continue as Admin`. The Admin password is the adminitstrator key used to unlock the system.
- accept the default jenkins URL
- **NOTE:** to connect via SSH
  - use `ssh <ip-address> -l ubuntu -i ~/.ssh/captains_aws_cjp`
  - to retrieve automatically the IPs, use either `toolbox/cjoc_ssh.sh` or `toolbox/cm_ssh.sh`

## Setting up the Client Master
- retrieve the Client Master's admin key with `toolbox/cm_dispay_admin_token.sh`  and copy it.
- start a browser session the CJOC with `toolbox/cm_http.sh`.
- use the admin key just copied to unlock the CM.
- when prompted for the license, choose `join a [CJOC] master` to get the license from the CJOC. It will display a dialogue to enter the connection informations.
- switch to the CJOC browser window, choose `new item`, give a name to the new Client Master (ex "test_master"), select `Client Master` and click on `OK`.
- accept the default settings and create the master.
- to connect the master,
  - paste the CM's URL in the `push configuration field`. The browser switches to the CM where you confirm that you want to register the master with the CJOC. Et voilà!
  - alternatively, copy the `connection information` and switch to the initial client master window and paste the information there.
- install the suggested plugins.
- don't create a special user, just choose `Continue as Admin`. The Admin password is the adminitstrator key used to unlock the system.

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
