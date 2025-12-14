from elementtree import ElementTree, SimpleXMLTreeBuilder
import elementtree
import StringIO
import ui
import remote
import config
import sys

class XMLForm(object):
  def __init__(self):
    self.remote = remote.Remote()
    #self.dataEle = self.createElementTree(config.dataFileLocation)
    self.xmlFormEleTree = self.createElementTree(config.xmlFormLocation)
    try:
      self.lookupEleTree = self.createElementTree(config.lookupFileLocation)
    except:
      pass

  def showLoginPage(self):
    self.loginPage = ui.LoginPage(self)
    self.loginPage.showWindow()
    
  def showMainPage(self):
    #create data Element Tree
    xmlContent = self.remote.remoteObj.select(config.dataExchangerName, self.conditionDict)
    
    tb = SimpleXMLTreeBuilder.TreeBuilder()
    tb.feed(xmlContent)
    e = tb.close()
    self.dataElementTree = ElementTree.ElementTree(e)
    self.dataRoot = self.dataElementTree.getroot()
    
    try:
      self.lookupEleTree
      self.mainPage = ui.MainPage(self.xmlFormEleTree.getroot(), self.dataRoot, \
                             self.dataElementTree, self.lookupEleTree.getroot(), self)
    except:
      self.mainPage = ui.MainPage(self.xmlFormEleTree.getroot(), self.dataRoot, \
                             self.dataElementTree, None, self)
    ui.switchWindow(self.loginPage, self.mainPage)
    
  def update(self):
    self.dataElementTree._setroot(self.dataRoot)
    #print 'old xml = ',self.dataElementTree.write(sys.stdout, encoding="utf-8")
    #print 'Old xml = ', ElementTree.dump(self.dataElementTree)
    #print 'self.dataElementTree.write(sys.stdout)'
    #self.dataElementTree.write(sys.stdout)
    #print 'out = StringIO.StringIO()'
    out = StringIO.StringIO()
    #print 'self.dataElementTree.write(out)'
    self.dataElementTree.write(out)
    #print 'xmlContent = out.getvalue()'
    xmlContent = out.getvalue()
    #print xmlContent
    #xmlContent = ElementTree.dump(self.dataRoot)
    print xmlContent
    
    newXmlContent = self.remote.remoteObj.update(config.dataExchangerName, xmlContent, self.conditionDict)
    #construct new data element tree
    tb = SimpleXMLTreeBuilder.TreeBuilder()
    tb.feed(newXmlContent)
    ele = tb.close()
    self.dataElementTree = ElementTree.ElementTree(ele)
    #print 'new xml = ',newXmlContent
    
  def setUsernamePassword(self, username, password):
    self.remote.setIdentification(config.dataExchangerName, username, password)
    #construct Condition Dict
    self.conditionDict = {}
    formRoot = self.xmlFormEleTree.getroot()
    passwdEntity, passwdProperty = formRoot.attrib['password'].split('.')
    userEntity, userProperty = formRoot.attrib['username'].split('.')
    conditionContent = formRoot.attrib['username'] + "=='" + username + "' and " + \
                     formRoot.attrib['password'] + "=='" + password + "'"
    print conditionContent
    self.conditionDict[str(passwdEntity)] = conditionContent
    print conditionContent
    
    
  def createElementTree(self, fileName):
    f = file(fileName)
    tb = SimpleXMLTreeBuilder.TreeBuilder()
    tb.feed(f.read())
    e = tb.close()
    return ElementTree.ElementTree(e)
  
def main():
  xmlForm = XMLForm()
  xmlForm.showLoginPage()

if __name__ == "__main__":
  main()