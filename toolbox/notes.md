* location of OC war file: /usr/share/cloudbees-core-oc/cloudbees-core-oc.war

`````
ubuntu@ip-172-31-39-99:~$ sudo ./CloudBeesFlow-x64-10.1.0.145386
Logging to "/tmp/ijtmp_AF1AB110-7AED-2AE3-A2FF-EC9C4CEDEB4B/installer.log"

Copyright (c) 2006-2021, CloudBees, Inc. All rights reserved.

This will install CloudBees Software Delivery Automation on your computer.  Continue? [n/Y] y


Specify the type of setup you would like to perform: expressServer, expressAgent, SDA or advanced. [expressServer] SDA

Warning: In the future, you may need to allocate up to 2801.0 MB of additional space in "/opt/electriccloud/electriccommander".

Install a built-in database? [n/Y] Y

CloudBees Software Delivery Automation server has the ability to send information about its use, which helps to make CloudBees Software Delivery Automation better and more intuitive. Telemetry collects
anonymized aggregated information and does not collect any identifying information like user names.

For privacy reasons, you can turn off the ability to send telemetry data to CloudBees.

Send usage data [n/Y] y


Specify the install directory (for program files and binaries). [/opt/cloudbees/sda]


Specify the data directory (for configuration files and logs). [/opt/cloudbees/sda]

Warning: In the future, you may need to allocate up to 2719.0 MB of additional space in "/opt/cloudbees/sda".

Specify the user the server, web, and/or repository will run as. [ubuntu]


Specify the group the server, web, and/or repository will run as. [ubuntu]


Use the same service account for the agent (not recommended for production systems)? [y/N] y

Installing CloudBees Software Delivery Automation...
Installing agent...
Installing server...
Installing tools...
Installing web...
Installing database...
Installing jre-64...
Copied log file(s) to "/opt/cloudbees/sda/logs"
CloudBees Software Delivery Automation 10.1.0.145386 was successfully installed!
Installer log file: /opt/cloudbees/sda/logs/installer.log.
`````


````
ubuntu@ip-172-31-39-99:~$ sudo ./CloudBeesFlowDevOpsInsightServer-x64-10.1.0.145386
Logging to "/tmp/ijtmp_5E0DC0B0-1746-6B34-57C8-9F57C92BDD44/installer-EFlowReportServ.log"

Installing temporary...
Copyright (c) 2006-2021, CloudBees, Inc. All rights reserved.

This will install CloudBees Software Delivery Automation Analytics on your computer.  Continue? [n/Y] y

Memory requirements are not met, the system has only 213 megabytes of free physical memory.

Please use "--elasticsearchMemoryMB" and "--logstashInitMemoryMB" command line options to change memory requirements.
````
