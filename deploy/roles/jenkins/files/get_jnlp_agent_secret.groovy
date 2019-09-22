#!groovy
import jenkins.model.*

secret=jenkins.model.Jenkins.getInstance().getComputer("jnlp-agent").getJnlpMac()
println(secret)
