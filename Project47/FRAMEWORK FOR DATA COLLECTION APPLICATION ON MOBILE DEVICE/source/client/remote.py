import Pyro.core
import config
import authentication

class Remote(object):
    def __init__(self):
        self.initRemoteObj()

    def initRemoteObj(self):
        URL = "PYROLOC://" + config.serverAddress + "/" + config.remoteObjectName
        self.remoteObj = Pyro.core.getProxyForURI(URL)
        self.remoteObj._setNewConnectionValidator(authentication.createUserLoginConnValidator())
        print "Remote Object ", self.remoteObj, " Initialize"
    
    def setIdentification(self, exchangerName, username, password):
        ident = (exchangerName + ',' + str(username), str(password))
        self.remoteObj._setIdentification(ident)
        print "Set ", ident, " as Identification"
        
        #test Identification
        print self.remoteObj.testConnection()
        
    def testConnection(self):
        return self.remoteObj.testConnection()
    
    

