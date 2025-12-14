from xmf import config
from xmf.generator import xmlconfig
from EaseXML import XMLObject
import Pyro.core

class Connector(object):
  def __init__(self):
    pass
  
  def select(self, exchangerName, conditionDict={}):
    execStr = 'from xchobj import ' + exchangerName + ' as dataexchanger'
    exec execStr
    
    exchanger = dataexchanger.Exchanger()
    print 'before condict=',conditionDict
    conditionDict = self._constructConditionDict(exchangerName, conditionDict)
    print 'after condict=',conditionDict
    xmlResult = exchanger.select(conditionDict)
    print "Select Result :"
    print xmlResult.toXml()
    return xmlResult.toXml(prettyPrint=False)
  
  def update(self, exchangerName, xmlContent, conditionDict={}):
    execStr = 'from xchobj import ' + exchangerName + ' as dataexchanger'
    exec execStr
    reload(dataexchanger)
    execStr = 'from xmlobj import ' + exchangerName + ' as xmlobject'
    exec execStr
    reload(xmlobject)
    
    xmlObj = XMLObject.instanceFromXml(xmlContent)
    exchanger = dataexchanger.Exchanger()
    exchanger.conditionDict = self._constructConditionDict(exchangerName, conditionDict)
    print "Modified XML :"
    print xmlObj.toXml()
    newXmlObj = exchanger.update(xmlObj)
    print "Return XML :", 
    print newXmlObj.toXml()
    return newXmlObj.toXml(prettyPrint=False)
  
  def _constructConditionDict(self, exchangerName, conditionDict={}):
    f = file(config.conditionXmlDirectory + exchangerName + '.xml')
    conditionXML = xmlconfig.ConditionList.fromXml(f.read())
    f.close()
    for condition in conditionXML.conditions:
      conditionDict[str(condition.entityname)] = str(condition.condition)
    
    return conditionDict

  def testConnection(self):
    print 'Connection OK'
    return 'Connection OK'
  
class RemoteConnector(Pyro.core.SynchronizedObjBase, Connector):
  def __init__(self):
    Pyro.core.SynchronizedObjBase.__init__(self)
    Connector.__init__(self)
  