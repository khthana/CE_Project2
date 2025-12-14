









from mx.DateTime import DateTimeFrom
from xmobile.data.userfunctions import *

class Exchanger(object):
    conditionDict = {}
    def __init__(self, conditionDict={}):
        self.conditionDict = conditionDict
        
    def select(self, conditionDict={}):
        self.conditionDict = conditionDict
        from sqlobj import supply as rpkg
        
        result = rpkg.Staff.select()
        
        execStr = 'if ' + self.conditionDict['Staff'] + ':\n                robject = Staff'
        
        for Staff in result:
            exec execStr

        xmlobj = self._relationalToXML(robject, self.conditionDict)
        return xmlobj
        
    def update(self, xmlobj):
    	from sqlobj import supply as rpkg
		
        robject = rpkg.Staff.select(rpkg.Staff.q.id == xmlobj.id)[0]
        self._xmlToRelational(xmlobj, robject)
		
        return self._relationalToXML(robject, self.conditionDict)

    def _relationalToXML(self, relObj, conditionDict):
        from xmlobj import supply as xpkg
        rStaff = relObj
        xstaff = xpkg.staff()
        xstaff.id = str(rStaff.id)
        xstaff.firstname = str(rStaff.firstName)
        xstaff.lastname = str(rStaff.lastName)
        for Task in rStaff.tasks:
            match = False
            try:
                execStr = 'if ' + self.conditionDict['Task'] + ': match = True'
                exec execStr
            except KeyError:
                match = True
            except AttributeError:
                match = False
            if match:
                xtask = xpkg.task()
                try:
                    if Task.id:
                        xtask.id = str(Task.id)
                except:
                    pass
                try:
                    if Task.finishedTime:
                        xtask.finishedtime = str(Task.finishedTime)
                except:
                    pass
                try:
                    if Task.supplier.address:
                        xtask.supplieraddress = str(Task.supplier.address)
                except:
                    pass
                try:
                    if Task.supplier.name:
                        xtask.suppliername = str(Task.supplier.name)
                except:
                    pass
                xstaff.task.append(xtask)
                rTask = Task
            if not match:
                continue

            for Item in rTask.items:
                match = False
                try:
                    execStr = 'if ' + self.conditionDict['Item'] + ': match = True'
                    exec execStr
                except KeyError:
                    match = True
                except AttributeError:
                    match = False
                if match:
                    xitem = xpkg.item()
                    try:
                        if Item.id:
                            xitem.id = str(Item.id)
                    except:
                        pass
                    try:
                        if Item.requiredQuantity:
                            xitem.requiredquantity = str(Item.requiredQuantity)
                    except:
                        pass
                    try:
                        if Item.receivedQuantity:
                            xitem.receivedquantity = str(Item.receivedQuantity)
                    except:
                        pass
                    try:
                        if Item.ppu:
                            xitem.priceperunit = str(Item.ppu)
                    except:
                        pass
                    try:
                        if Item.product.name:
                            xitem.productname = str(Item.product.name)
                    except:
                        pass
                    xtask.item.append(xitem)



        return xstaff

    def _xmlToRelational(self, xmlObj, relObj):
        from sqlobj import supply as rpkg
        xstaff = xmlObj
        rStaff = relObj
        for xtask in xstaff.task:
            if xtask.id:
                rTask = rpkg.Task.select(rpkg.Task.q.id == int(xtask.id))[0]
                if xtask.finishedtime:
                    rTask.finishedTime = DateTimeFrom(str(xtask.finishedtime))
                if xtask.supplieraddress:
                    rTask.supplier.address = xtask.supplieraddress
                if xtask.suppliername:
                    rTask.supplier.name = xtask.suppliername
            else:
                rTask = rpkg.Task()
                
                if xtask.finishedtime:
                    rTask.finishedTime = DateTimeFrom(str(xtask.finishedtime))
                if xtask.supplieraddress:
                    rTask.supplier.address = xtask.supplieraddress
                if xtask.suppliername:
                    rTask.supplier.name = xtask.suppliername
                rTask.staffID = rStaff.id

            for xitem in xtask.item:
                if xitem.id:
                    rItem = rpkg.Item.select(rpkg.Item.q.id == int(xitem.id))[0]
                    if xitem.requiredquantity:
                        rItem.requiredQuantity = int(xitem.requiredquantity)
                    if xitem.receivedquantity:
                        rItem.receivedQuantity = int(xitem.receivedquantity)
                    if xitem.priceperunit:
                        rItem.ppu = float(xitem.priceperunit)
                    if xitem.productname:
                        rItem.product.name = xitem.productname
                else:
                    rItem = rpkg.Item()
                    
                    if xitem.requiredquantity:
                        rItem.requiredQuantity = int(xitem.requiredquantity)
                    if xitem.receivedquantity:
                        rItem.receivedQuantity = int(xitem.receivedquantity)
                    if xitem.priceperunit:
                        rItem.ppu = float(xitem.priceperunit)
                    if xitem.productname:
                        rItem.product.name = xitem.productname
                    rItem.taskID = rTask.id




    