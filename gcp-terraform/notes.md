# Notes of my terraform experiments

## Good to know

* https://console.cloud.google.com/ to connect to the console
* to remove a previous entry in the ssh know host `ssh-keygen -R 34.76.126.12`
* the user defined on the host is specified in the terraform file when loading the key (set to Ansible). To connect, use `ssh 34.76.126.12 -l ansible -i ~/.ssh/captains_aws_cjp`

## interesting links from Joost

* @Jmm I've written some TF for the Openshift cluster on GCP. I think it is fairly complete and does what you want, as I required ssh access to install openshift.
https://joostvdg.github.io/openshift/rhos311-gcp-medium/. Code is here: https://github.com/joostvdg/jenkins-examples/tree/master/jx/openshift/311-2

