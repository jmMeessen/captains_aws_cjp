To use the JENKINS CLI

Load the variable with 

 . ./load_CLI_command.sh

To execute a CLI command

 $JENKINS_CLI help

 Note:
 To run the http version of the CLI, use

 JENKINS_CLI="java -jar jenkins-cli.jar -s http://localhost:8888 -auth admin:110a5f2f08e7246018b5fc17fa9f903b70"
 