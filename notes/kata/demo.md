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

* Note: to avoid the annoying SSH bug when performing plugin catalog operations
    * create an alternative version of the JENKINS_CLI environement
    * generate a token to the admin user
    * update the confifuration script accordingly

## Demo
* Show topology picture
* sever the Internet link for the Client master
    * change the ports in the security group
* prove that the master can't download plugins from the internet. 
    * Install the Build Time Blame plugin
* Configure the Nexus
    * NOTE: the latest version of NEXUS runs the wizard and doesn't have a default password. To retrieve it, use `docker-compose exec nexus cat /nexus-data/admin.password`
    * create proxy MAVEN2 repository named `Jenkins` and pointing to `https://repo.cloudbees.com/content/repositories/dev-connect/`
* install plugin catalog (show the plugin catalog definition)
    * Load the symbols: `. ./load_CLI_command.sh`
    * Load on CJOC with `$JENKINS_CLI plugin-catalog --put <plugin_catalog.json`
    * push it to the master (and checking the syntax) with `$JENKINS_CLI plugin-catalog --master CM-1 --push my-plugin-catalog`
* show that the version availalble for the "Built time blame" plugin is the 1.1.2
* install the plugin. explain the dependency download
* change the plugin catalog definition to 1.2.0 and push new catalog
* there should be a warning that the new version must be installed 

## Demo Cluster Operation
* reference https://support.cloudbees.com/hc/en-us/articles/209430507-How-to-push-plugins-to-a-new-client-Master-added-to-a-JOC-
* on CJOC, create a Cluster Operation (ex: `pushPluginToMaster`) from the `New Item` menue.
* Choose "Operations" on "masters". The source is "From Operations Center Root" for a plain vanilla job.
* in "steps", choose "install plugin". Note that the ID and the version are parameterized.
* Go to the top of the job definition to add the input of the needed parameter, via the "this project is parameterized" option. The parameters are `JENKINS_PLUGIN_ID` and `JENKINS_PLUGIN_VERSION`.
* then just run the job.