import Pyro.core
from xmf.runtime import remotemanagement
from xmf.runtime import remoteconnector
from xmf.runtime import authentication
from xmf.generator import xmlconfig
from xmf import config

def main():
  
  management = remotemanagement.RemoteManagement()
  connector = remoteconnector.RemoteConnector()
    
  Pyro.core.initServer()
  daemon = Pyro.core.Daemon()
  authenticator = authentication.createUserLoginConnValidator()
  daemon.setNewConnectionValidator(authenticator)
  
  #try setting connection validator
  
  manageuri = daemon.connectPersistent(management, "management")
  remoteuri = daemon.connectPersistent(connector, "connector")
  
  print daemon
  print "URI for management is " + str(manageuri)
  print "URI for connector is " + str(remoteuri)
  
  daemon.requestLoop()

if __name__ == "__main__":
  main()