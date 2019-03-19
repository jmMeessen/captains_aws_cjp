# Overview

This describes the flow of the various roles and gives an idea of the configuration process.

## General role
* As the AWS Ubuntu images don't have Python 2 installed, ensure that python 2.7 is installed
* We check that the Ansible communication works now (using an Ansible Ping)
* We now gather the Ansible facts (had to be disabled so that we could setup Ansible)
* We perform a general sysem update via APT-GET update
* We install OpenJdk 8 (JRE) via APT
* We configure VIM's background to dark
* We include `ìptables-tasks.yml` to setup the IP Tables
  * Install the `iptables` package
  * Flush existing firewall rules
  * Allow all loopback traffic
  * Allow port ping traffic
  * Allow port 22/SSH traffic
  * Allow port 80/HTTP traffic
  * Allow port 443/HTTPS traffic
  * Allow port 50000 traffic
  * Allow port 10200 traffic
  * Commented out: drop any traffic without rule
  * Install `netfilter-persistent` && `iptables-persistent` packages

## Jenkins role
* Include the node specific (CJOC or Master) variables. The node type is defined in the calling playbook
* We copy the initial configuration before first startup when handling the CJOC configuration. It is important so that the noWizard parameter works properly.
* We get the DNS name of the CJOC endpoint from the Terraform configuration
* "get DNS name for the CM endpoint "
* Copy and update the initial configuration before first startup (Master)
* Add the {{ option_friendly_name }} APT Key
* Add the {{ option_friendly_name }} package repository
* Install {{ option_friendly_name }}
* create the init.groovy.d directory
* Prepare everything to load the license on CJOC
  * "initialize the instance ID with a known value"
  * Load encrypted license key and certificate from disk
  * Update the licence loading groovy and copy it to the target directory
* Load initial user creation and security settings
  *  Load encrypted default admin password
  *  Update the initialize groovy and copy it to the target directory
  *  "get DNS name for {{ terraform_dns_reference }} "
  *  "Update the set URL groovy ({{ full_dns_name.stdout }}) and copy it to the target directory"
  *  "Copy the JNLP port setting init groovy script"
  *  "Create init script to configure the SSHD port"
  *  "Generate Jenkins CfgMgt SSH key"
  *  Get the Jenkins CfgMgt SSH public key.
  *  "Create init script to create the special Jenkins CfgMgr user"
* restart the {{ package_name }} service 
* redirect the traffic from 80 to {{ used_port }} with IPtables
* "wait for the port {{ used_port }} to be available"
* wait for jenkins to be up
* register the Jenkins SSH server public key in the known_hosts file
* Create a CLI command varialble on remote (for debug purposes)
* copy jenkins-cli .jar to cfgMgt directory
* (create command line)
* "create \"{{ jenkins_cfgmgt_script_dir }}\" to store the script executed by these scripts"
* Install default plugins
* create the Client Master
  * copy creation groovy script to the target server
  * Execute Client Master creation script
  * Output of Script execution


## JCasC role
*  "Include the '{{ jenkins_node_type }}' installation specific variables" 
*  Download latest JenkinsConfigAsCode plugin
*  Download latest JenkinsConfigAsCode support plugin
*  Add the path to the configuration file (.profile)
*  create directory to store the confifuration
*  copy the configuration file
*  restart the Jenkins service


