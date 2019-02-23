# Random notes while Work is in progress

- should limit the access to the port 5000 to only the machines in the cluster

## Manual CJOC and Client Master configuration

## Configuration as code.

https://updates.jenkins.io/latest/configuration-as-code.hpi

/var/lib/cloudbees-core-oc/plugins 
https://stackoverflow.com/questions/10625259/how-to-set-environment-variables-in-jenkins

* enable github authentication
* connect master programatically
* automate via CLI

https://stackoverflow.com/questions/17716242/creating-user-in-jenkins-via-api
https://wiki.jenkins.io/display/JENKINS/Groovy+Hook+Script
* Create init.groovy.d directory and put scripts there

Ansible delegation and run once : https://docs.ansible.com/ansible/2.6/user_guide/playbooks_delegation.html

https://stackoverflow.com/questions/44004727/how-to-run-local-command-via-ansible-playbook


## listing versions avilable in the Debian repository

* `sudo apt-get update`
* `sudo apt-cache policy cloudbees-core-oc`
* install specific version `sudo apt-get install cloudbees-core-oc=2.138.2.2`

## enabling SSH
* ssh -l jmm -i ~/.ssh/id_rsa -p 10200 ec2-54-164-201-94.compute-1.amazonaws.com help

## Localhost CLI
java -jar jenkins-cli.jar -s http://localhost:8888  -auth admin:someAdminPass help

## retrieving files
- cp  -i ~/.ssh/captains_aws_cjp ubuntu@18.205.114.45:/var/lib/cloudbees-core-oc/license.xml ./

instance ID: 47c95c6b933f2b3e9f9cfaf56d3c9e0c

# Allow graphs etc. to work even when an X server is present
JAVA_ARGS='-Djava.awt.headless=true \
-Djenkins.install.runSetupWizard=false \
-Dcb.BeekeeperProp.autoInstallIncremental=true \
-DMASTER_ENDPOINT="http://ec2-34-238-157-171.compute-1.amazonaws.com" \
-DMASTER_OPERATIONSCENTER_ENDPOINT="http://ec2-100-26-186-80.compute-1.amazonaws.com" \
-DMASTER_INDEX="1" -DMASTER_NAME="CM-1" -DMASTER_GRANT_ID="1-CM-1"'



