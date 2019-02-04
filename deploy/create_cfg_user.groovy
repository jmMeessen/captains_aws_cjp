#!groovy

import jenkins.model.*
import hudson.security.*
import jenkins.install.InstallState
import hudson.security.csrf.DefaultCrumbIssuer
import jenkins.model.Jenkins
import jenkins.model.JenkinsLocationConfiguration
import org.kohsuke.stapler.StaplerProxy
import jenkins.CLI
import jenkins.security.s2m.AdminWhitelistRule

def instance = Jenkins.getInstance()
def hudsonRealm = new HudsonPrivateSecurityRealm(false)
// I fear that following command will not scale
def users = hudsonRealm.getAllUsers()
users_s = users.collect { it.toString() }

// Create the Jenkins Configurator account if it doesn't already exist.
if ("jenkins_cfg" in users_s) {
    println "Jenkins Configuration user already exists - ssh public key"

    def user = hudson.model.User.get('jenkins_cfg');
    def password = hudson.security.HudsonPrivateSecurityRealm.Details.fromPlainPassword('{{ jenkins_default_admin_password }}')
    user.addProperty(password)
    user.save()
}
else {
    println "--> creating local admin user"

    hudsonRealm.createAccount('jenkins_cfg', '{{ jenkins_default_admin_password }}')
    instance.setSecurityRealm(hudsonRealm)

    // def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
    // instance.setAuthorizationStrategy(strategy)
    instance.save()
}