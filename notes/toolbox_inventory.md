# Commented inventory of the Toolbox

## Main Commands

* `start_infra.sh`
  * with `update_aws_token.sh`
    * updates OPSCORE if new version is available
    * refresh MFA identification if required
    * impersonate work IAM account
  * runs the Terraform scripts to create or update the infrastructure
  * retrieves the DNS names and IPs with `update_ssh_known-host.sh` to update the `~/.ssh/known_hosts`. (`gather_IPs.sh` loads DNS and IPs from Terraform)

* `run_ansible.sh` 
  * performs the configuration of the platform. `playbook.yml` is the entry playbook.

* `stop_infra.sh` 
  * tears down the AWS infrastructure.
    * the known-hosts is cleaned with `remove_ssh_known-host.sh`

## Helper commands

* CJOC
  * `cjoc_http.sh`: opens the CJOC in the browser
  * `cjoc_ssh.sh`: opens an SSH session on the CJOC machine
  * `cjoc_scp.sh`: executes a file copy
  * `cjoc_display_admin_token.sh`: displays the CJOC Admin Token (useful only when using the wizard)
* Client Master
  * `cm_http.sh`: opens the Client Master in the browser
  * `cm_ssh.sh`: opens an SSH session on the Client Master machine
  * `cm_scp.sh`: executes a file copy
  * `cm_display_admin_token.sh`: displays the Client Master Admin Token (useful only when using the wizard)


## Test commands

* `run_CLI_test.sh`
* `run_test.sh`


