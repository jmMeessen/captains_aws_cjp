#!groovy

// Imports
import com.cloudbees.opscenter.server.model.ClientMaster
import com.cloudbees.opscenter.server.model.ConnectedMaster
import com.cloudbees.opscenter.server.model.OperationsCenter
import com.cloudbees.opscenter.server.properties.ConnectedMasterLicenseServerProperty
import jenkins.model.Jenkins
import java.util.logging.Logger

Logger logger = Logger.getLogger("configure-client-master.groovy")

// Input parameters
def clientMasterName = "CM-1"
def clientMasterLicenseStrategy = new ConnectedMasterLicenseServerProperty.FloatingExecutorsStrategy() // or  ConnectedMasterLicenseServerProperty.NoLicensingStrategy();

logger.info("-----> Adding Client Master  <-----")

// Compute some values based on the input parameters
int clientMasterId = Jenkins.instance.getAllItems(ClientMaster.class).size() + 1
String clientMasterGrantId = clientMasterId + '-' + clientMasterName 


Jenkins jenkins = Jenkins.instance

if (jenkins.getItem(clientMasterName)==null){
	// Create Client Master Declaration
	ClientMaster cm = OperationsCenter.instance.createClientMaster(clientMasterName)

	//Set Client Master properties
	cm.setId(clientMasterId)
	cm.setIdName(ConnectedMaster.createIdName(clientMasterId, clientMasterName))
	cm.setGrantId(clientMasterGrantId)
	cm.getProperties().replace(new ConnectedMasterLicenseServerProperty(clientMasterLicenseStrategy))
	cm.save()

	if (OperationsCenter.instance.getConnectedMasterByName(cm.idName)!=null){
    	println "Created ClientMaster '${cm.name}' known as '${cm.idName}'"
    	println "-DMASTER_INDEX=${cm.id}'"
    	println "-DMASTER_NAME=${cm.name}'"
    	println "-DMASTER_GRANT_ID=${cm.grantId}'"

		logger.info("-----> Succesfully created ClientMaster " + cm.name + " known as '${cm.idName}'")
	} else {
    	println "[ERROR:]" + clientMasterName + "has not been created in CJOC"
		logger.error("-----> [ERROR:]" + clientMasterName + "has not been created in CJOC")
	}
} else {
  println "[WARNING] " + clientMasterName + " already exists in CJOC"
  logger.warning("-----> [WARNING] " + clientMasterName + " already exists in CJOC")
}
