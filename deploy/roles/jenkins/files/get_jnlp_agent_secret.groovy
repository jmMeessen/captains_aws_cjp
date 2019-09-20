#!groovy

secret=jenkins.model.Jenkins.getInstance().getComputer("test-agent").getJnlpMac()
println(secret)
