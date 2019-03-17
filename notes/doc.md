# Overview

## General role
* ensure python 2.7 is installed
* Trying if the Ansible communication works now (using a Ping)
* Gathering facts
* (Install COWSAY)
* (let the cow say hello)
* Update the system
* Install OpenJdk 8 (JRE)
* set VIMs background to dark by default
* Setup up the IP Tables
  * Install the `iptables` package
  * Flush existing firewall rules
  * Firewall rule - allow all loopback traffic
  * Firewall rule - allow port ping traffic
  * Firewall rule - allow port 22/SSH traffic
  * Firewall rule - allow port 80/HTTP traffic
  * Firewall rule - allow port 443/HTTPS traffic
  * Firewall rule - allow port 50000 traffic
  * Firewall rule - allow port 10200 traffic
  * (Firewall rule - drop any traffic without rule
  * Install `netfilter-persistent` && `iptables-persistent` packages

## Jenkins role
* "Include the '{{ jenkins_node_type }}' installation specific variables" 
* Copy the initial configuration before first startup (CJOC)
* "get DNS name for the CJOC endpoint "
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


