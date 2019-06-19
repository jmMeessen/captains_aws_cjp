# Plugin catalog Kata

## Mission

Your mission Dan/Jim, should you choose to accept it, is to **setup a plugin catalog and demonstrate how it works.** 

As always, should you be caught or killed, the Secretary will disavow any knowledge of your actions. This file will self-destruct in ten seconds. Good luck.

## Pre-requisite

* a working CJOC, client or managed Master and a Nexus server. (note: my setup is ECE2 based and the Nexus is runing as Docker container).

## Assigment

* On the Nexus server, add a proxy repository on https://repo.cloudbees.com/content/repositories/dev-connect/ (it agregates CloudBees and Jenkins ressources)

* verify that the tier-3 plugin "beer" is not available

* Create a plugin catalog file witch specifies the beer plugin 1.1

* load the catalog on the CJOC and push it to the master

* install the Beer plugin 1.1

* change the catalog to require beer plugin 1.2

* observe the warning

* configure a second plugin `build-time-blame (1.2.0)`(this one has dependency: `timestamper (1.9)`)



----
* Nexus
  * start nexus on docker agent by stating the compose file in `/home/nexus`
  * configure nexus by stating the UI with `nexus_http.sh`. Default username/password is `admin` and `admin123`
  * choose wheel to make the admin menu show. Choose `repositories` and then create repository. Choose the `maven2 (proxy)` receipe. Call it `Jenkins`, pointing to https://repo.cloudbees.com/content/repositories/dev-connect/
* Load on CJOC with `$JENKINS_CLI plugin-catalog --put <plugin_catalog.json`
* push it to the master (and checking the syntax) with `$JENKINS_CLI plugin-catalog --master CM-1 --push my-plugin-catalog`

* https://hub.docker.com/r/sonatype/nexus3/
* https://go.cloudbees.com/docs/solutions/use-cases/managing-cloudbees-core-plugins-in-a-secured-environment/
* https://go.cloudbees.com/docs/cloudbees-core/operations-center-admin-guide/managing-masters/#configuring-plugin-catalogs

## Error when executing plugin catalog commands in SSH.
ubuntu@ip-172-31-69-102:~$ $JENKINS_CLI plugin-catalog --put <plugin_catalog.json
{"id":"my-plugin-catalog","message":"Catalog updated correctly","status":"SUCCESS"}org.apache.sshd.common.SshException: flush(ChannelOutputStream[ChannelSession[id=0, recipient=0]-ServerSessionImpl[Jenkins_cfg@/127.0.0.1:53446]] SSH_MSG_CHANNEL_DATA) length=0 - stream is already closed
	at org.apache.sshd.common.channel.ChannelOutputStream.flush(ChannelOutputStream.java:169)
	at org.jenkinsci.main.modules.sshd.AsynchronousCommand$1.run(AsynchronousCommand.java:114)
	at java.lang.Thread.run(Thread.java:748)

## Use cases
* User has an existing master and want to enable Plugin Catalog
* User has new system and wants to add a new plugin
* User needs to upgrade a plugin (security update)

## Question / FAQ
* Plugin version range ?
* How to retrieve the Maven coordinates of a tier three plugin ?
* how to list the plugins distributed with the envelope?

## Todo
* check the Tier status of
    * beer plugin
    * chucknoris plugin
    * build-time-blame
