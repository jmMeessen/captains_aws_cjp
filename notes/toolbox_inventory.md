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

* Starting SSH or HTTP sessions
  * `open_ssh.sh` opens a SSH session to CJOC, Client Master, Agent1 and Agent_docker node.
  * `open_http.sh` opens an HTTP session to CJOC, Client Master and Nexus.

* CJOC
  * `cjoc_scp.sh`: executes a file copy
  * `cjoc_display_admin_token.sh`: displays the CJOC Admin Token (useful only when using the wizard)
* Client Master
  * `cm_scp.sh`: executes a file copy
  * `cm_display_admin_token.sh`: displays the Client Master Admin Token (useful only when using the wizard)


## Test commands

* `run_CLI_test.sh`
* `run_test.sh`


