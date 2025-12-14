from Pyro.protocol import DefaultConnValidator
import Pyro.constants
import sha

class UserStore(object):
  def __init__(self):
    pass
    
  def getPassword(self, exchangerName, username):
    execStr = "from upsobj import " + exchangerName + " as userdb"
    exec execStr
    ups = userdb.UserPasswordStore()
    return ups.getPassword(username)
    
class UserLoginConnValidator(DefaultConnValidator):
  def __init__(self, userStore):
    #self.userDict = userdict
    self.userStore = userStore
  
  def _digest(self, s):
    return sha.sha(s).digest()
  
  def acceptIdentification(self, daemon, connection, token, challenge):
    print 'token = ', token
    login, password = token.split(':', 1)
    exchangerName, username = login.split(',',1)
    #realpass = userDict['login'] #must be change to something that retrieve form db
    realpass = self.userStore.getPassword(exchangerName, username)
    # Check if the username/password is valid.
    if realpass and self._digest(self._digest(realpass)+challenge) == password:
      print "ALLOWED", login
      #connection.authenticated=login  # store for later reference by Pyro object
      return(1,0)
    print "DENIED",login
    return (0,Pyro.constants.DENIED_SECURITY)
  
  def createAuthToken(self, authid, challenge, peeraddr, URI, daemon):
    return "%s:%s" % (authid[0], self._digest(authid[1]+challenge))
  
  def mungeIdent(self, ident):
    # ident is tuple (login, password), the client sets this.
    return (ident[0], self._digest(ident[1]))
  
def createUserLoginConnValidator():
  return UserLoginConnValidator(UserStore())
