# SSH CLI experiments

These are notes taken during experimentation about the Ansible Jenkins CLI tooling. The objective is to be able to issue CLI commands to configure Jenkins from an Ansible script.

## Preparing the system

**Assumption:** the AWS security group allow to access port `10200` that will be used to issue the CLI commands via SSH. This is performed via the Terraform scripts for CJOC and Master.

- in both CJOC and CM `manage jenkins` -> `configure global security`, configure the "SSH server" by configuring a fixed port (`10200`).