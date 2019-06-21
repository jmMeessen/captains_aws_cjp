# Demo scenario

## Setup
* install everything (`start_infra.sh` and `run_ansible`)
* start nexus session and start session on it
    * SSH to server (with `./agent_docker_ssh.sh`)
    * `sudo su`
    * start docker compose (in `/home/nexus`) with the `./nexus_start.sh` script
    * close SSH session
* Start an HTTP session on (and login)
    * CJOC (`./cjoc_http.sh`)
    * CM (`./cm_http.sh`)
    * Nexus (`./nexus_http.sh`)
* Start SSH session on CJOC (`./cjoc_ssh.sh`)
* open an AWS console session

## Demo
* sever the Internet link for the Client master
    * change the ports in the security group
* prove that the master can't download plugins from the internet. 
    * Install the Build Time Blame plugin
* Configure the Nexus
    * create proxy MAVEN2 repository named `Jenkins` and pointing to `https://repo.cloudbees.com/content/repositories/dev-connect/`
* install plugin catalog (show the plugin catalog definition)
    * Load the symbols: `. ./load_CLI_command.sh`
    * Load on CJOC with `$JENKINS_CLI plugin-catalog --put <plugin_catalog.json`
    * push it to the master (and checking the syntax) with `$JENKINS_CLI plugin-catalog --master CM-1 --push my-plugin-catalog`
* show that the version availalble for the "Built time blame" plugin is the 1.1.2
* install the plugin. explain the dependency download
* change the plugin catalog definition to 1.2.0 and push new catalog
* there should be a warning that the new version must be installed 