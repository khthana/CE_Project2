
from sqlobject.mysql import builder
from sqlobject import *

#make mxDateTime work
from sqlobject import col
if col.mxdatetime_available:
    col.default_datetime_implementation = col.MXDATETIME_IMPLEMENTATION

MySQLConnection = builder()
conn = MySQLConnection(host='localhost', db='ubc', user='root', passwd='CL2a7537', debug=0)
__connection__ = conn

class Worker(SQLObject):
	_cacheValues = False
	_table = "worker"
	_idName = "worker_id"
	firstName = StringCol(dbName='first_name', default=None, )
	lastName = StringCol(dbName='last_name', default=None, )
	username = StringCol(dbName='username', default=None, )
	password = StringCol(dbName='password', default=None, )
	servicepoints = MultipleJoin('ServicePoint', joinColumn='worker_id', )

class ServicePoint(SQLObject):
	_cacheValues = False
	_table = "servicepoint"
	_idName = "servicepoint_id"
	assignedTime = DateTimeCol(dbName='assigned_time', default=None, )
	finishedTime = DateTimeCol(dbName='finished_time', default=None, )
	description = StringCol(dbName='description', default=None, )
	comment = StringCol(dbName='comment', default=None, )
	price = FloatCol(dbName='price', default=None, )
	worker = ForeignKey('Worker', dbName='worker_id' ,default=None)
	customer = ForeignKey('Customer', dbName='customer_id' ,default=None)
	jobs = MultipleJoin('Job', joinColumn='servicepoint_id', )

class Job(SQLObject):
	_cacheValues = False
	_table = "job"
	_idName = "job_id"
	comment = StringCol(dbName='comment', default=None, )
	servicePoint = ForeignKey('ServicePoint', dbName='servicepoint_id' ,default=None)
	usedEquipments = MultipleJoin('UsedEquipment', joinColumn='job_id', )

class UsedEquipment(SQLObject):
	_cacheValues = False
	_idName = "used_equipment_id"
	name = StringCol(dbName='name', default=None, )
	quantity = IntCol(dbName='quantity', default=None, )
	job = ForeignKey('Job', dbName='job_id' ,default=None)

class Customer(SQLObject):
	_cacheValues = False
	_table = "customer"
	_idName = "customer_id"
	firstName = StringCol(dbName='first_name', default=None, )
	lastName = StringCol(dbName='last_name', default=None, )
	address = StringCol(dbName='address', default=None, )
	servicePoint = MultipleJoin('ServicePoint', joinColumn='customer_id', )


def createTables():
	Worker.createTable()
	ServicePoint.createTable()
	Job.createTable()
	UsedEquipment.createTable()
	Customer.createTable()

def createTablesSQL():
	sql = ''
	sql += Worker.createTableSQL()
	sql += ServicePoint.createTableSQL()
	sql += Job.createTableSQL()
	sql += UsedEquipment.createTableSQL()
	sql += Customer.createTableSQL()
	return sql
	
def getUsernamePasswordDict():
	usernameResults = Worker.select()
	passwordResults = Worker.select()
	usernameResults = list(usernameResults)
	usernamePasswordDict = {}
	for username in usernameResults:
		usernamePasswordDict[username.username] = passwordResults[usernameResults.index(username)].password
	return usernamePasswordDict