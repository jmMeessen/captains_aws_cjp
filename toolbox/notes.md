# SDA demo/evaluation setup

## Infrastructure setup
* run the automated infra setup (terraform) with `./start_infra.sh`


## CBCI preparation
* location of OC war file: /usr/share/cloudbees-core-oc/cloudbees-core-oc.war

## Install SDA server
* connect to the SDA EC2 instance with `./open_ssh.sh sda`
* Check that you have enough memory with `free --giga`. You should have at least 15 Gb of free memory.
* Download the SDA (latest) bits: `wget https://downloads.cloudbees.com/cloudbees-cd/Release_10.1_internal/Linux/CloudBeesFlow-x64-10.1.0.145386`
* Make the package executable with `chmod +x CloudBeesFlow-x64-10.1.0.145386`
* execute start the command line installation: `sudo CloudBeesFlow-x64-10.1.0.145386`
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
* connect to the SDA server with `./open_https.sh sda`. FIXME: should open the site in Firefox as it is a selfsigned  certificate.
* Authentify using the default password.
* The first screen shows that there is no license loaded. Click on the `there is no license` link and load the test license. You can find a [this test license](https://github.com/electric-cloud/nimbus-licenses/blob/b572e28d79a6def8b4cdcdbb5d4d283ecc49fe4a/CloudBees_Inc-SDA-20201214-standard.xml)


# Install DevOpsInsight server

* connect to the SDA EC2 instance with `./open_ssh.sh sda`
* Check that you have enough memory with `free --giga`. You should have at least 15 Gb of free memory.
* Download the SDA (latest) bits: `wget https://downloads.cloudbees.com/cloudbees-cd/Release_10.1_internal/Linux/CloudBeesFlowDevOpsInsightServer-x64-10.1.0.145386`
* Make the package executable with `chmod +x CloudBeesFlowDevOpsInsightServer-x64-10.1.0.145386`
* execute start the command line installation: `sudo CloudBeesFlowDevOpsInsightServer-x64-10.1.0.145386`

````
ubuntu@ip-172-31-39-99:~$ sudo ./CloudBeesFlowDevOpsInsightServer-x64-10.1.0.145386
Logging to "/tmp/ijtmp_5E0DC0B0-1746-6B34-57C8-9F57C92BDD44/installer-EFlowReportServ.log"

Installing temporary...
Copyright (c) 2006-2021, CloudBees, Inc. All rights reserved.

This will install CloudBees Software Delivery Automation Analytics on your computer.  Continue? [n/Y] y

Memory requirements are not met, the system has only 213 megabytes of free physical memory.

Please use "--elasticsearchMemoryMB" and "--logstashInitMemoryMB" command line options to change memory requirements.
````
