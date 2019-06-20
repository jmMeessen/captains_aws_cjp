Jenkins.instance.pluginManager.plugins.each{
  plugin -> 
    println ("\"${plugin.getShortName()}\":{\n    \"groupId\": \"org.jenkins-ci.plugins\",\n     \"version\" : \"${plugin.getVersion()}\" \n},")
}
return()


               "beer": {
                    "groupId": "org.jenkins-ci.plugins",
                    "version" : "1.2"
                },
  