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

## Nexus auto configuration

* objective: add a M2 repository proxy in Nexus
* https://help.sonatype.com/repomanager3/rest-and-integration-api
* https://github.com/sonatype-nexus-community/nexus-scripting-examples
* https://stackoverflow.com/questions/41450338/trying-to-use-rest-api-to-create-repositories-in-sonatype-nexus

example:

```
curl -X POST -u admin:admin123 --header 'Content-Type: application/json' \
    http://127.0.0.1:8081/service/rest/v1/script \
    -d '{"name":"npm","type":"groovy","content":"repository.createNpmHosted('\''npm-internal'\'');repository.createNpmProxy('\''npmjs-org'\'','\''https://registry.npmjs.org'\'');repository.createNpmGroup('\''npm-all'\'',['\''npmjs-org'\'','\''npm-internal'\''])"}'
curl -X POST -u admin:admin123 --header "Content-Type: text/plain" 'http://127.0.0.1:8081/service/rest/v1/script/npm/run'
```

  if (repository.repositoryManager.exists("jenkins")) {
   repository.repositoryManager.delete(internalName)
  }

```
curl -X POST -u admin:admin123 --header 'Content-Type: application/json' \
    http://127.0.0.1:8081/service/rest/v1/script \
    -d '{"name":"jenkins_a","type":"groovy","content":"repository.createMavenProxy('\''jenkins'\'','\''https://repo.cloudbees.com/content/repositories/dev-connect/'\'')"}'
curl -X POST -u admin:admin123 --header "Content-Type: text/plain" 'http://127.0.0.1:8081/service/rest/v1/script/jenkins/run'
```

```
curl -X PUT -u admin:admin123 --header 'Content-Type: application/json' \
    http://127.0.0.1:8081/service/rest/v1/script \
    -d '{"name":"jenkins_b","type":"groovy","content":"repository.createMavenProxy('\''jenkins'\'','\''https://repo.cloudbees.com/content/repositories/dev-connect/'\'')"}'
curl -X POST -u admin:admin123 --header "Content-Type: text/plain" 'http://127.0.0.1:8081/service/rest/v1/script/jenkins_b/run'
```


