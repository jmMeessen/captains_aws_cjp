# Disabling the installation wizard

When configuring Jenkins automatically, it is sometimes desired not to execute the setup wizard. The [documentation](https://wiki.jenkins.io/display/JENKINS/Features+controlled+by+system+properties) mentions that the property `jenkins.install.runSetupWizard` should be positioned to `false`.

To work with the flag, the system must be restarted before the groovy scripts are executed.

This doesn't work
- https://github.com/geerlingguy/ansible-role-jenkins/issues/181
- https://github.com/jenkinsci/docker/issues/310
- (code of the init https://github.com/cloudbees/nirvana-jenkins/blob/19ec736d167ad636e95f9ab6aec3688caca0e4ac/core/src/main/java/jenkins/install/InstallState.java)

https://cloudbees.zendesk.com/agent/tickets/60220

https://github.com/geerlingguy/ansible-role-jenkins/blob/master/templates/basic-security.groovy.j2