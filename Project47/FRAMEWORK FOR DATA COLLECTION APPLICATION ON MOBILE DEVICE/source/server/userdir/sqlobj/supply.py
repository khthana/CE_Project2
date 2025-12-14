
from sqlobject.mysql import builder
from sqlobject import *

#make mxDateTime work
from sqlobject import col
if col.mxdatetime_available:
    col.default_datetime_implementation = col.MXDATETIME_IMPLEMENTATION

MySQLConnection = builder()
conn = MySQLConnection(host='localhost', db='supply', user='root', passwd='CL2a7537', debug=0)
__connection__ = conn

class Staff(SQLObject):
	_cacheValues = False
	_table = "staff"
	_idName = "staff_id"
	firstName = StringCol(dbName='first_name', default=None, )
	lastName = StringCol(dbName='last_name', default=None, )
	username = StringCol(dbName='username', default=None, )
	password = StringCol(dbName='password', default=None, )
	tasks = MultipleJoin('Task', joinColumn='staff_id', )

class Task(SQLObject):
	_cacheValues = False
	_table = "task"
	_idName = "task_id"
	assignedTime = DateTimeCol(dbName='assigned_time', default=None, )
	finishedTime = DateTimeCol(dbName='finished_time', default=None, )
	description = StringCol(dbName='description', default=None, )
	staff = ForeignKey('Staff', dbName='staff_id' ,default=None)
	supplier = ForeignKey('Supplier', dbName='supplier_id' ,default=None)
	items = MultipleJoin('Item', joinColumn='task_id', )

class Item(SQLObject):
	_cacheValues = False
	_table = "item"
	_idName = "item_id"
	requiredQuantity = IntCol(dbName='required_quantity', default=None, )
	receivedQuantity = IntCol(dbName='received_quantity', default=None, )
	ppu = FloatCol(dbName='ppu', default=None, )
	task = ForeignKey('Task', dbName='task_id' ,default=None)
	product = ForeignKey('Product', dbName='product_id' ,default=None)

class Product(SQLObject):
	_cacheValues = False
	_table = "product"
	_idName = "product_id"
	name = StringCol(dbName='name', default=None, )
	desc = StringCol(dbName='description', default=None, )
	items = MultipleJoin('Item', joinColumn='product_id', )
	suppliers = RelatedJoin('Supplier', intermediateTable='supply_product', otherColumn='supplier_id', )

class Supplier(SQLObject):
	_cacheValues = False
	_table = "supplier"
	_idName = "supplier_id"
	name = StringCol(dbName='name', default=None, )
	address = StringCol(dbName='address', default=None, )
	tasks = MultipleJoin('Task', joinColumn='supplier_id', )
	products = RelatedJoin('Product', intermediateTable='supply_product', otherColumn='product_id', )


def createTables():
	Staff.createTable()
	Task.createTable()
	Item.createTable()
	Product.createTable()
	Supplier.createTable()

def createTablesSQL():
	sql = ''
	sql += Staff.createTableSQL()
	sql += Task.createTableSQL()
	sql += Item.createTableSQL()
	sql += Product.createTableSQL()
	sql += Supplier.createTableSQL()
	return sql
	
def getUsernamePasswordDict():
	usernameResults = Staff.select()
	passwordResults = Staff.select()
	usernameResults = list(usernameResults)
	usernamePasswordDict = {}
	for username in usernameResults:
		usernamePasswordDict[username.username] = passwordResults[usernameResults.index(username)].password
	return usernamePasswordDict