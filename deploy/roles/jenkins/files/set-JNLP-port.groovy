#!groovy

import jenkins.model.*

def instance=jenkins.model.Jenkins.instance

instance.setSlaveAgentPort(50000)
instance.save()
