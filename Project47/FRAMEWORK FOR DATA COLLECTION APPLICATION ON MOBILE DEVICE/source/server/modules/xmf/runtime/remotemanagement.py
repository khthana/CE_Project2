from xmf.generator import templates
from xmf.generator import xmlconfig
from xmf import config
import Pyro.core
import os

class Management(object):
  def __init__(self):
    pass
  
  def addDataExchanger(self, xmlModelContent, conditionXMLContent):
    print 'begin add data exchanger'
    model = xmlconfig.Model.fromXml(xmlModelContent)
    #generate SQLObject
    sqlTemplate = templates.SQLObjectsTemplate(model)
    
    #generate XMLObject
    root = model.xmlroot
    xmlTemplate = templates.XMLObjectsTemplate(root)
    
    #generate XCHObject
    xchTemplate = templates.XCHObjectTemplate(model, root)
    
    #generate UPSObject
    upsTemplate = templates.UPSObjectTemplate(model)
    
    outputFileName = model.name + '.py'
    self._writeTemplateToFile(sqlTemplate, config.sqlObjectDirectory + outputFileName)
    self._writeTemplateToFile(xmlTemplate, config.xmlObjectDirectory + outputFileName)
    self._writeTemplateToFile(xchTemplate, config.xchObjectDirectory + outputFileName)
    self._writeTemplateToFile(upsTemplate, config.upsObjectDirectory + outputFileName)
    
    self.changeRetrieveCondition(model.name, conditionXMLContent)
    print 'finish add data exchanger'
  
  def removeDataExchanger(self, dataExchangerName):
    try:
      os.remove(config.sqlObjectDirectory + dataExchangerName + '.py')
      os.remove(config.sqlObjectDirectory + dataExchangerName + '.pyc')
      os.remove(config.xmlObjectDirectory + dataExchangerName + '.py')
      os.remove(config.xmlObjectDirectory + dataExchangerName + '.pyc')
      os.remove(config.xchObjectDirectory + dataExchangerName + '.py')
      os.remove(config.xchObjectDirectory + dataExchangerName + '.pyc')
      os.remove(config.conditionXmlDirectory + dataExchangerName + '.xml')
    except OSError:
      print "Some file may not be removed"
    print dataExchangerName + " have been remove"
  
  def changeRetrieveCondition(self, dataExchangerName, conditionXMLContent):
    #TODO Check for valid dataExchangerName and Validate XML Content
    #conditionXML = xmlconfig.ConditionList.fromXml(conditionXMLContent)
    #conditionDict = self._constructConditionDict(conditionXML)
    f = file(config.conditionXmlDirectory + dataExchangerName + '.xml', 'w')
    f.write(conditionXMLContent)
    f.close()
    
  def testConnection(self):
    print 'Connection OK'
    return 'Connection OK'
  
  def _writeTemplateToFile(self, template, fileName):
    f = file(fileName, 'w')
    f.write(template.__str__())
    f.close()
    print 'write to file ' + fileName + ' complete'
    
class RemoteManagement(Pyro.core.SynchronizedObjBase, Management):
  def __init__(self):
    Pyro.core.SynchronizedObjBase.__init__(self)
    Management.__init__(self)
  