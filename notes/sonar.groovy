import hudson.model.*
import jenkins.model.*
import hudson.plugins.sonar.SonarGlobalConfiguration
import hudson.plugins.sonar.*
import hudson.plugins.sonar.model.TriggersConfig
import hudson.tools.*

def inst = Jenkins.getInstance()

println "--> Configuring SonarQube"

SonarGlobalConfiguration global = Hudson.instance.getDescriptorByType(SonarGlobalConfiguration.class)

def sonar_inst = new SonarInstallation(
    "SonarQ",                        // name
    "http://localhost:9000",         // serverUrl
    "yy",                            // serverAuthenticationToken
    "",                              // mojoVersion
    "",                              // additionalProperties
    new TriggersConfig(),            // triggers
    ""                               // additionalAnalysisProperties
)

// Only add Sonar if it does not exist - do not overwrite existing config
def sonar_installations = sonar_conf.getInstallations()
def sonar_inst_exists = false
sonar_installations.each {
    installation = (SonarInstallation) it
    if (sonar_inst.getName() == installation.getName()) {
        sonar_inst_exists = true
        println("Found existing installation: " + installation.getName())
    }
}

if (!sonar_inst_exists) {
    sonar_installations += sonar_inst
    sonar_conf.setInstallations((SonarInstallation[]) sonar_installations)
    sonar_conf.save()
}