import jenkins.*
import jenkins.model.*
import hudson.*
import hudson.model.*
import hudson.plugins.*

def j = Jenkins.instance
def rootDir = j.pluginManager.rootDir

println "Running Jenkins ${j.version}"
println "Plugins for this version"
println ""

j.pluginManager.plugins.each {
  plugin ->
    def lastModified = getLastModified(rootDir, plugin.getShortName())

    println ("  ${plugin.getDisplayName()} (${plugin.getShortName()}): ${plugin.getVersion()} since ${lastModified}")
}

return

def getLastModified(rootDir, pluginName) {
    def pluginFile = new File(pluginName + ".jpi", rootDir)
    return new Date(pluginFile.lastModified()).format('yyyy/MM/dd HH:mm:ss')
}