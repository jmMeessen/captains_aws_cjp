import hudson.model.User
import jenkins.security.ApiTokenProperty
import java.util.logging.Logger

String scriptName = "generateToken.groovy"
Logger logger = Logger.getLogger(scriptName)
logger.info("Starting ${scriptName}")

def userName = 'Jenkins_cfg'
def jenkinsTokenName = 'defaultCfgToken'

def tokenFileName = 'secrets/' + jenkinsTokenName
def env = System.getenv()
def jenkins_home = env['JENKINS_HOME']

def user = User.get(userName, false)
def apiTokenProperty = user.getProperty(ApiTokenProperty.class)
def tokens = apiTokenProperty.tokenStore.getTokenListSortedByName().findAll {it.name==jenkinsTokenName}

if(tokens.size() != 0) {
    logger.info("Token exists. Revoking any with this name and recreating to ensure we have a valid value stored in the secret.")
    tokens.each {
        apiTokenProperty.tokenStore.revokeToken(it.getUuid())
    }
}

def result = apiTokenProperty.tokenStore.generateNewToken(jenkinsTokenName).plainValue
user.save()

File file = new File(jenkins_home + "/" + tokenFileName)
file.write userName + ":" + result + "\n"
