

from EaseXML import *

#Framework generate module code

#Framework generated code
#XMLObject code for entity "worker" mapping with entity "Worker"

class worker(XMLObject):
	_name = 'worker'
	id = StringAttribute(optional=True)
	firstname = StringAttribute(optional=True)
	lastname = StringAttribute(optional=True)
	servicepoint = ListNode('servicepoint', optional=True)


#Framework generated code
#XMLObject code for entity "servicepoint" mapping with entity "ServicePoint"

class servicepoint(XMLObject):
	_name = 'servicepoint'
	id = StringAttribute(optional=True)
	customerfirstname = StringAttribute(optional=True)
	customerlastname = StringAttribute(optional=True)
	customeraddress = StringAttribute(optional=True)
	assignedtime = StringAttribute(optional=True)
	finishedtime = StringAttribute(optional=True)
	description = StringAttribute(optional=True)
	comment = StringAttribute(optional=True)
	price = StringAttribute(optional=True)
	job = ListNode('job', optional=True)


#Framework generated code
#XMLObject code for entity "job" mapping with entity "Job"

class job(XMLObject):
	_name = 'job'
	id = StringAttribute(optional=True)
	comment = StringAttribute(optional=True)
	usedequipment = ListNode('usedequipment', optional=True)


#Framework generated code
#XMLObject code for entity "usedequipment" mapping with entity "UsedEquipment"

class usedequipment(XMLObject):
	_name = 'usedequipment'
	id = StringAttribute(optional=True)
	name = StringAttribute(optional=True)
	quantity = StringAttribute(optional=True)





