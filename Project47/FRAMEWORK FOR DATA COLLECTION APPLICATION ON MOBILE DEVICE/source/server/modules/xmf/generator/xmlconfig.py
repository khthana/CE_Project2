from EaseXML import *

#XML-Relational Mapping
class Element(XMLObject):
    _name = 'element'    
    _nodesOrder = ['name', 'desc', 'entity', 'attributes', 'elements']
    desc = StringAttribute(optional=True)
    name = StringAttribute()
    entity = StringAttribute()
    attributes = ListNode('Attribute')
    elements = ListNode('Element', optional=True)

class XMLRoot(Element):
    _name = 'xmlroot'
    entity = StringAttribute()
    clientusername = StringAttribute()
    clientpassword = StringAttribute()
    
class Attribute(XMLObject):
    _name = 'attribute'
    _nodesOrder = ['name', 'property', 'desc']
    name = StringAttribute()
    property = StringAttribute()
    desc = StringAttribute(optional=True)
    
#ER declairation
class Model(XMLObject):
    _name = 'model'
    _nodesOrder = ['name', 'dbAdaptor', 'desc', 'host', 'user', 'password', 'database', 
                   'entities', 'xmlroot']
    name = StringAttribute()
    dbAdaptor = StringAttribute()
    desc = StringAttribute(optional=True)
    host = StringAttribute()
    user = StringAttribute()
    password = StringAttribute()
    database = StringAttribute()
    entities = ListNode('Entity')
    xmlroot = ItemNode('XMLRoot')
    
class Entity(XMLObject):
    _name = 'entity'
    _nodesOrder = ['name', 'tableName', 'desc', 'id', 'properties', 'foreignKeys',
                   'oneToManys', 'manyToManys']
    name = StringAttribute()
    desc = StringAttribute(optional=True)
    tableName = StringAttribute(optional=True)
    id = ItemNode('ID', optional=True)
    properties = ListNode('Property', optional=True)
    foreignKeys = ListNode('ForeignKey', optional=True)
    oneToManys = ListNode('OneToMany', optional=True)
    manyToManys = ListNode('ManyToMany', optional=True)
    
class ID(XMLObject):
    _name = 'id'
    _nodesOrder = ['columnName', 'desc']
    columnName = StringAttribute(optional=True)
    desc = StringAttribute(optional=True)

class Property(XMLObject):
    _name = 'property'
    _nodeOrder = ['name', 'columnName', 'type', 'required', 'alternateID', 'default',
                  'desc']
    name = StringAttribute()
    columnName = StringAttribute(optional=True)
    type = StringAttribute(optional=True) #can be Integer Float String DateTime
    required = StringAttribute(optional=True)
    alternateID = StringAttribute(optional=True)
    default=StringAttribute(optional=True)
    desc = StringAttribute(optional=True)
    
class ForeignKey(XMLObject):
    _name = 'foreignkey'
    _nodeOrder = ['name', 'columnName', 'refEntity']
    name = StringAttribute()
    refEntity = StringAttribute()
    columnName = StringAttribute(optional=True)

class OneToMany(XMLObject):
    _name = 'one-to-many'
    _nodeOrder = ['name', 'refEntity', 'joinColumn', 'desc']
    name = StringAttribute()
    refEntity = StringAttribute()
    joinColumn = StringAttribute(optional=True)
    desc = StringAttribute(optional=True)
    
class ManyToMany(XMLObject):
    _name = 'many-to-many'
    _nodeOrder = ['name', 'refEntity', 'otherColumn', 'intermediateTable', 'desc']
    name = StringAttribute()
    refEntity = StringAttribute()
    otherColumn = StringAttribute(optional=True)
    intermediateTable = StringAttribute(optional=True)
    desc = StringAttribute(optional=True)
    
#condition xml
class ConditionList(XMLObject):
    _name = 'conditions'
    conditions = ListNode('Condition')
    
class Condition(XMLObject):
    _name = 'condition'
    entityname = StringAttribute()
    condition = StringAttribute()
    
class ApplicationList(XMLObject):
    _name = 'applications'
    application = ListNode('Application')

class Application(XMLObject):
    _name = 'application'
    name = StringAttribute()
    
    