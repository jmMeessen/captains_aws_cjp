# SDA demo/evaluation setup

## Documentation
* https://github.com/cloudbees/sda-chart/blob/main/internal.md
* 

## Infrastructure setup
* run the automated infra setup (terraform) with `./start_infra.sh`


## CBCI preparation
* Install traditional environment with `./run_ansible.sh`
* ssh to the OC with `./open_ssh.sh cjoc`
   * copy the new war with `wget http://media.meessen-web.org/data/cloudbees-core-oc-sda.war`
   * copy it to the target directory:`sudo cp cloudbees-core-oc-sda.war /usr/share/cloudbees-core-oc/`
   * stop the oc service with `sudo service cloudbees-core-oc stop`
   * check the status with `sudo service cloudbees-core-oc status` 
   * create a backup copy of the original war: `sudo cp /usr/share/cloudbees-core-oc/cloudbees-core-oc.war /usr/share/cloudbees-core-oc/cloudbees-core-oc-ori.war`
   * Copy the SDA version `sudo cp /usr/share/cloudbees-core-oc/cloudbees-core-oc-sda.war /usr/share/cloudbees-core-oc/cloudbees-core-oc.war`
   * restart the CJOC service with `sudo service cloudbees-core-oc start`
* ssh to MC with `./open_ssh.sh cm`
   * get the new SDA war with `wget http://media.meessen-web.org/data/cloudbees-core-cm-sda.war`
   * copy it to the target directory with `sudo cp cloudbees-core-cm-sda.war /usr/share/cloudbees-core-cm/`
   * stop the service with `sudo service cloudbees-core-cm stop`
   * create a backup of the original war `sudo cp /usr/share/cloudbees-core-cm/cloudbees-core-cm.war /usr/share/cloudbees-core-cm/cloudbees-core-cm-ori.war`
   * install the SDA war `sudo cp /usr/share/cloudbees-core-cm/cloudbees-core-cm-sda.war /usr/share/cloudbees-core-cm/cloudbees-core-cm.war`
   * restart the service `sudo service cloudbees-core-cm start`
* connect to CJOC (`./open_http.sh cjoc`) and make sure that the SDA related plugins are installed (should be preloaded).
   * if you need to install them, don't forget to refresh the plugin list
   * plugins that need to be present (FIXME: check this)
      * CloudBees Platform Common Plugin
      * CloudBees Unified UI Plugin
* connect to CM (`./open_http.sh cm`).
   * update plugin list
   * Install plugin `CloudBees Unified Data Plugin`. This will install `CloudBees Unified UI Plugin` as a dependency.


## Install SDA server
* connect to the SDA EC2 instance with `./open_ssh.sh sda`
* Download the SDA (latest) bits: `wget https://downloads.cloudbees.com/cloudbees-cd/Release_10.1_internal/Linux/CloudBeesFlow-x64-10.1.0.145386`
* Make the package executable with `chmod +x CloudBeesFlow-x64-10.1.0.145386`
* execute start the command line installation: `sudo ./CloudBeesFlow-x64-10.1.0.145386`
* Answer the following prompts:
   * "This will install CloudBees Software Delivery Automation on your computer.  Continue? [n/Y]": answer `y` or enter
   * "Specify the type of setup you would like to perform: expressServer, expressAgent, SDA or advanced. [expressServer]": answer `SDA`
   * "Install a built-in database? [n/Y]": answer `Y` or enter
   * "Send usage data [n/Y]": answer `y`
   * "Specify the install directory (for program files and binaries). [/opt/cloudbees/sda]": take default with enter
   * "Specify the data directory (for configuration files and logs). [/opt/cloudbees/sda]": take the default with enter
   * "Specify the user the server, web, and/or repository will run as. [ubuntu]": pressing enter will take the current user.
   * "Specify the group the server, web, and/or repository will run as. [ubuntu]": pressing enter will take the current user.
   * "Use the same service account for the agent (not recommended for production systems)? [y/N]": make sure to use `y`
   * The installation log can be viewed at "/opt/cloudbees/sda/logs/installer.log"
* FIXME: create automated install with silent mode: https://docs.cloudbees.com/docs/cloudbees-cd/latest/install-trad/sumethod
* connect to the SDA server with `./open_sda_https.sh`. It opens the site with Firefox, which works with selfsigned certificates.
* Authentify using the default password.
* The first screen shows that there is no license loaded. Click on the `there is no license` link and load the test license. You can find a [this test license](https://github.com/electric-cloud/nimbus-licenses/blob/b572e28d79a6def8b4cdcdbb5d4d283ecc49fe4a/CloudBees_Inc-SDA-20201214-standard.xml)
* change the default password


## Install DevOpsInsight server

* connect to the SDA EC2 instance with `./open_ssh.sh sda`
* Check that you have enough memory with `free --giga`. You should have at least 15 Gb of free memory.
* Download the SDA (latest) bits: `wget https://downloads.cloudbees.com/cloudbees-cd/Release_10.1_internal/Linux/CloudBeesFlowDevOpsInsightServer-x64-10.1.0.145386`
* Make the package executable with `chmod +x CloudBeesFlowDevOpsInsightServer-x64-10.1.0.145386`
* execute start the command line installation: `sudo ./CloudBeesFlowDevOpsInsightServer-x64-10.1.0.145386`
* answer the following prompts:
   * "This will install CloudBees Software Delivery Automation Analytics on your computer.  Continue? [n/Y]": answer "y" or enter
   * "Specify the install directory (for binaries) [/opt/electriccloud/electriccommander]": choose default with enter
   * "Specify the data directory (for data files, configurations and logs) [/opt/electriccloud/electriccommander]": choose default with enter
   * "Specify the user the services will run as [ubuntu]": choose default with enter
   * "Specify the group the services will run as [ubuntu]": choose default with enter
   * "Choose the port which will be used by Elasticsearch [9200]": choose default with enter
   * "Choose the port which will be used by the Elasticsearch service for communication between nodes within the Elasticsearch cluster [9300]": choose default with enter
   * "Choose the port which will be used by Logstash [9500]": choose default with enter
   * "Choose the port which will be used by the Logstash service for the Logstash monitoring APIs [9600]": choose default with enter
   * "Do you want to specify additional Elasticsearch cluster mode settings? [y/N]": choose default with enter
   * "Installer will automatically create a user with user name "reportuser" to connect to Elasticsearch. Specify a password for this user []": enter new password
   * "Confirm password []": repeat the new password
   * "Do you want to provide the certificate file containing a CA-signed certificate for the CloudBees Software Delivery Automation Analytics server, any intermediate CA certificates and a private key [y/N]": choose default with enter
   * "Specify the directory for data stored by Elasticsearch if the Elasticsearch data should be stored in a different location than the CloudBees Software Delivery Automation Analytics server data directory [/opt/electriccloud/electriccommander/data/reporting/elasticsearch]": choose default with enter
   * "Do you want to specify the remote CloudBees Software Delivery Automation server which will be configured to interact with the services being installed? [n/Y]": choose default with enter
   * "Specify the host[:port] of the remote CloudBees Software Delivery Automation server []": _ec2-35-173-234-3.compute-1.amazonaws.com_:8443
   * "Specify the user name with which to login to "ec2-35-173-234-3.compute-1.amazonaws.com:8443" [admin]": choose default with enter
   * "Specify the password for "admin" on "ec2-35-173-234-3.compute-1.amazonaws.com:8443" []": enter the (changed) password


## Configure SDA Server

* open and log into SDA server with `./open_sda_https.sh`. It opens the site with Firefox, which works with selfsigned certificates.
* navigate to the SDA configuration through the administration menu (via the "hamburger"). Choose the "CI Configuration"
* create a new CI configuration by clicking on "New" and chosing "Create New CI Configuration".
   * give it a name and description
   * choose the "CBCI Operation center" radio button
   * define the CJOC Server URL (and specify if it is the defaut CBCI OC)
   * Enter Username and password. You can test the connection

## Configure CJOC

* Connect to CJOC with connect to CJOC (`./open_http.sh cjoc`)
* enter "Manage Jenkins" menu and select "Configure System"
* navigate to the "Connection to CLoudBees Software Delivery Automation" section
   * copy the URL of the SDA server into the first field
   * as we have an all-in-one SDA server with selfsigned certificates, paste the same URL in the "Send analytics event to this URL" and select the "Suppress SSL checks" tickbox.
   * FIXME: why do I keep having an error message `Failing response from https://ec2-35-173-234-3.compute-1.amazonaws.com/rest/v1.0/ciEvents: 403` in that configuration screen

## Should work now

* with this setup, you should start seing at least the plugin usage results in the SDA server.
* To force the plugin scanning, execute:
   ```
   analyzerWork = PeriodicWork.all().get(com.cloudbees.jenkins.plugins.pluginusage.v2.AnalyzerWork.class)
   analyzerWork.doRun()
   ```