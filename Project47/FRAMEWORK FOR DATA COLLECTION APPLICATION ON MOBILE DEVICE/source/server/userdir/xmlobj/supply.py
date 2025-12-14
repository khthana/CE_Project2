

from EaseXML import *

#Framework generate module code

#Framework generated code
#XMLObject code for entity "staff" mapping with entity "Staff"

class staff(XMLObject):
	_name = 'staff'
	id = StringAttribute(optional=True)
	firstname = StringAttribute(optional=True)
	lastname = StringAttribute(optional=True)
	task = ListNode('task', optional=True)


#Framework generated code
#XMLObject code for entity "task" mapping with entity "Task"

class task(XMLObject):
	_name = 'task'
	id = StringAttribute(optional=True)
	finishedtime = StringAttribute(optional=True)
	supplieraddress = StringAttribute(optional=True)
	suppliername = StringAttribute(optional=True)
	item = ListNode('item', optional=True)


#Framework generated code
#XMLObject code for entity "item" mapping with entity "Item"

class item(XMLObject):
	_name = 'item'
	id = StringAttribute(optional=True)
	requiredquantity = StringAttribute(optional=True)
	receivedquantity = StringAttribute(optional=True)
	priceperunit = StringAttribute(optional=True)
	productname = StringAttribute(optional=True)




