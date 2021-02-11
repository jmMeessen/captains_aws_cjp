# SDA demo/evaluation setup

## Infrastructure setup
* run the automated infra setup (terraform) with `./start_infra.sh`


## CBCI preparation
* location of OC war file: /usr/share/cloudbees-core-oc/cloudbees-core-oc.war

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
* connect to the SDA server with `./open_sda_https.sh sda`. It opens the site with Firefox, which works with selfsigned certificates.
* Authentify using the default password.
* The first screen shows that there is no license loaded. Click on the `there is no license` link and load the test license. You can find a [this test license](https://github.com/electric-cloud/nimbus-licenses/blob/b572e28d79a6def8b4cdcdbb5d4d283ecc49fe4a/CloudBees_Inc-SDA-20201214-standard.xml)
* change the default password


# Install DevOpsInsight server

* connect to the SDA EC2 instance with `./open_ssh.sh sda`
* Check that you have enough memory with `free --giga`. You should have at least 15 Gb of free memory.
* Download the SDA (latest) bits: `wget https://downloads.cloudbees.com/cloudbees-cd/Release_10.1_internal/Linux/CloudBeesFlowDevOpsInsightServer-x64-10.1.0.145386`
* Make the package executable with `chmod +x CloudBeesFlowDevOpsInsightServer-x64-10.1.0.145386`
* execute start the command line installation: `sudo ./CloudBeesFlowDevOpsInsightServer-x64-10.1.0.145386`

````
ubuntu@ip-172-31-90-169:~$ sudo ./CloudBeesFlowDevOpsInsightServer-x64-10.1.0.145386
Logging to "/tmp/ijtmp_A6ED2529-6690-BA02-4864-16FC30878C93/installer-EFlowReportServ.log"

Installing temporary...
Copyright (c) 2006-2021, CloudBees, Inc. All rights reserved.

This will install CloudBees Software Delivery Automation Analytics on your computer.  Continue? [n/Y] y


Specify the install directory (for binaries) [/opt/electriccloud/electriccommander]


Specify the data directory (for data files, configurations and logs) [/opt/electriccloud/electriccommander]


Specify the user the services will run as [ubuntu]


Specify the group the services will run as [ubuntu]


Choose the port which will be used by Elasticsearch [9200]


Choose the port which will be used by the Elasticsearch service for communication between nodes within the Elasticsearch cluster [9300]


Choose the port which will be used by Logstash [9500]


Choose the port which will be used by the Logstash service for the Logstash monitoring APIs [9600]


Do you want to specify additional Elasticsearch cluster mode settings? [y/N] n


Installer will automatically create a user with user name "reportuser" to connect to Elasticsearch.
Specify a password for this user []

Confirm password []

Do you want to provide the certificate file containing a CA-signed certificate for the CloudBees Software Delivery Automation Analytics server, any intermediate CA certificates and a private key [y/N] n


Specify the directory for data stored by Elasticsearch if the Elasticsearch data should be stored in a different location than the CloudBees Software Delivery Automation Analytics server data directory
[/opt/electriccloud/electriccommander/data/reporting/elasticsearch]


Do you want to specify the remote CloudBees Software Delivery Automation server
which will be configured to interact with the services being installed? [n/Y] y


Specify the host[:port] of the remote CloudBees Software Delivery Automation server [] ec2-35-173-234-3.compute-1.amazonaws.com:8443


Specify the user name with which to login to "ec2-35-173-234-3.compute-1.amazonaws.com:8443" [admin]


Specify the password for "admin" on "ec2-35-173-234-3.compute-1.amazonaws.com:8443" []

The CloudBees Software Delivery Automation Analytics server will be configured on CloudBees Software Delivery Automation server version 10.1.0.145386 on ec2-35-173-234-3.compute-1.amazonaws.com:8443

Installing CloudBees Software Delivery Automation Analytics...
Installing elasticsearch...
Installing logstash...
Installing jre-64...
Copied log file to "/opt/electriccloud/electriccommander/logs/reporting"
Installation complete.
````
