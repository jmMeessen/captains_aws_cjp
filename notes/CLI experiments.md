# SSH CLI experiments

These are notes taken during experimentation about the Ansible Jenkins CLI tooling. The objective is to be able to issue CLI commands to configure Jenkins from an Ansible script.

## Preparing the system

**Assumption:** the AWS security group allow to access port `10200` that will be used to issue the CLI commands via SSH. This is performed via the Terraform scripts for CJOC and Master.

## enabling the SSH CLI
- in both CJOC and CM `manage jenkins` -> `configure global security`, configure the "SSH server" by configuring a fixed port (`10200`).
- create a user (we are using very simple authentication) and add the public SSH key.
  - choose `manage jenkins` ->  `manage users`
  - in the left menu bar, choose `create user` and fill in the details. It is a good idea to make the password very complicated as it will be used with the SSH key.
  - once done, edit the user (cog symbol ) and add the public key (ex `~/.ssh/id_rsa.pub`). Avoid using the same as the key used to control the EC2 instances.
- use `ssh -l jmm -i ~/.ssh/id_rsa -p 10200 [machine_name] help`

