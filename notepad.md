# Random notes while Work is in progress

- should limit the access to the port 5000 to only the machines in the cluster
- during the CM registration process, there are connection that need to happen to the standart URL. For ease of use, will change the port to use the default port 80.

the only way to use port 80 is to setup IPTABLES to redirect calls to 80 to port 8888
see https://wiki.jenkins.io/display/JENKINS/Running+Jenkins+on+Port+80+or+443+using+iptables