from Cheetah.Template import Template
from xmf import config

class XMLObjectsTemplate(Template):
  def __init__(self, root):
    f = file(config.xmlObjectTemplateFile)
    templateStr = f.read()
    f.close()
    Template.__init__(self, templateStr)
    self.root = root

class XCHObjectTemplate(Template):
  def __init__(self, model, root):
    f = file(config.xchObjectTemplateFile)
    templateStr = f.read()
    f.close()
    Template.__init__(self, templateStr)
    self.root = root
    self.model = model

class SQLObjectsTemplate(Template):
  def __init__(self, model):
    f = file(config.sqlObjectTemplateFile)
    templateStr = f.read()
    f.close()
    Template.__init__(self, templateStr)
    self.model = model
    
class UPSObjectTemplate(Template):
  def __init__(self, model):
    f = file(config.upsObjectTemplateFile)
    templateStr = f.read()
    f.close()
    Template.__init__(self, templateStr)
    self.model = model
  