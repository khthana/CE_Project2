









from mx.DateTime import DateTimeFrom
from xmobile.data.userfunctions import *

class Exchanger(object):
    conditionDict = {}
    def __init__(self, conditionDict={}):
        self.conditionDict = conditionDict
        
    def select(self, conditionDict={}):
        self.conditionDict = conditionDict
        from sqlobj import ubcservice as rpkg
        
        result = rpkg.Worker.select()
        
        execStr = 'if ' + self.conditionDict['Worker'] + ':\n                robject = Worker'
        
        for Worker in result:
            exec execStr

        xmlobj = self._relationalToXML(robject, self.conditionDict)
        return xmlobj
        
    def update(self, xmlobj):
    	from sqlobj import ubcservice as rpkg
		
        robject = rpkg.Worker.select(rpkg.Worker.q.id == xmlobj.id)[0]
        self._xmlToRelational(xmlobj, robject)
		
        return self._relationalToXML(robject, self.conditionDict)

    def _relationalToXML(self, relObj, conditionDict):
        from xmlobj import ubcservice as xpkg
        rWorker = relObj
        xworker = xpkg.worker()
        xworker.id = str(rWorker.id)
        xworker.firstname = str(rWorker.firstName)
        xworker.lastname = str(rWorker.lastName)
        for ServicePoint in rWorker.servicepoints:
            match = False
            try:
                execStr = 'if ' + self.conditionDict['ServicePoint'] + ': match = True'
                exec execStr
            except KeyError:
                match = True
            except AttributeError:
                match = False
            if match:
                xservicepoint = xpkg.servicepoint()
                try:
                    if ServicePoint.id:
                        xservicepoint.id = str(ServicePoint.id)
                except:
                    pass
                try:
                    if ServicePoint.customer.firstName:
                        xservicepoint.customerfirstname = str(ServicePoint.customer.firstName)
                except:
                    pass
                try:
                    if ServicePoint.customer.lastName:
                        xservicepoint.customerlastname = str(ServicePoint.customer.lastName)
                except:
                    pass
                try:
                    if ServicePoint.customer.address:
                        xservicepoint.customeraddress = str(ServicePoint.customer.address)
                except:
                    pass
                try:
                    if ServicePoint.assignedTime:
                        xservicepoint.assignedtime = str(ServicePoint.assignedTime)
                except:
                    pass
                try:
                    if ServicePoint.finishedTime:
                        xservicepoint.finishedtime = str(ServicePoint.finishedTime)
                except:
                    pass
                try:
                    if ServicePoint.description:
                        xservicepoint.description = str(ServicePoint.description)
                except:
                    pass
                try:
                    if ServicePoint.comment:
                        xservicepoint.comment = str(ServicePoint.comment)
                except:
                    pass
                try:
                    if ServicePoint.price:
                        xservicepoint.price = str(ServicePoint.price)
                except:
                    pass
                xworker.servicepoint.append(xservicepoint)
                rServicePoint = ServicePoint
            if not match:
                continue

            for Job in rServicePoint.jobs:
                match = False
                try:
                    execStr = 'if ' + self.conditionDict['Job'] + ': match = True'
                    exec execStr
                except KeyError:
                    match = True
                except AttributeError:
                    match = False
                if match:
                    xjob = xpkg.job()
                    try:
                        if Job.id:
                            xjob.id = str(Job.id)
                    except:
                        pass
                    try:
                        if Job.comment:
                            xjob.comment = str(Job.comment)
                    except:
                        pass
                    xservicepoint.job.append(xjob)
                    rJob = Job
                if not match:
                    continue

                for UsedEquipment in rJob.usedEquipments:
                    match = False
                    try:
                        execStr = 'if ' + self.conditionDict['UsedEquipment'] + ': match = True'
                        exec execStr
                    except KeyError:
                        match = True
                    except AttributeError:
                        match = False
                    if match:
                        xusedequipment = xpkg.usedequipment()
                        try:
                            if UsedEquipment.id:
                                xusedequipment.id = str(UsedEquipment.id)
                        except:
                            pass
                        try:
                            if UsedEquipment.name:
                                xusedequipment.name = str(UsedEquipment.name)
                        except:
                            pass
                        try:
                            if UsedEquipment.quantity:
                                xusedequipment.quantity = str(UsedEquipment.quantity)
                        except:
                            pass
                        xjob.usedequipment.append(xusedequipment)




        return xworker

    def _xmlToRelational(self, xmlObj, relObj):
        from sqlobj import ubcservice as rpkg
        xworker = xmlObj
        rWorker = relObj
        for xservicepoint in xworker.servicepoint:
            if xservicepoint.id:
                rServicePoint = rpkg.ServicePoint.select(rpkg.ServicePoint.q.id == int(xservicepoint.id))[0]
                if xservicepoint.customerfirstname:
                    rServicePoint.customer.firstName = xservicepoint.customerfirstname
                if xservicepoint.customerlastname:
                    rServicePoint.customer.lastName = xservicepoint.customerlastname
                if xservicepoint.customeraddress:
                    rServicePoint.customer.address = xservicepoint.customeraddress
                if xservicepoint.assignedtime:
                    rServicePoint.assignedTime = DateTimeFrom(str(xservicepoint.assignedtime))
                if xservicepoint.finishedtime:
                    rServicePoint.finishedTime = DateTimeFrom(str(xservicepoint.finishedtime))
                if xservicepoint.description:
                    rServicePoint.description = xservicepoint.description
                if xservicepoint.comment:
                    rServicePoint.comment = xservicepoint.comment
                if xservicepoint.price:
                    rServicePoint.price = float(xservicepoint.price)
            else:
                rServicePoint = rpkg.ServicePoint()
                
                if xservicepoint.customerfirstname:
                    rServicePoint.customer.firstName = xservicepoint.customerfirstname
                if xservicepoint.customerlastname:
                    rServicePoint.customer.lastName = xservicepoint.customerlastname
                if xservicepoint.customeraddress:
                    rServicePoint.customer.address = xservicepoint.customeraddress
                if xservicepoint.assignedtime:
                    rServicePoint.assignedTime = DateTimeFrom(str(xservicepoint.assignedtime))
                if xservicepoint.finishedtime:
                    rServicePoint.finishedTime = DateTimeFrom(str(xservicepoint.finishedtime))
                if xservicepoint.description:
                    rServicePoint.description = xservicepoint.description
                if xservicepoint.comment:
                    rServicePoint.comment = xservicepoint.comment
                if xservicepoint.price:
                    rServicePoint.price = float(xservicepoint.price)
                rServicePoint.workerID = rWorker.id

            for xjob in xservicepoint.job:
                if xjob.id:
                    rJob = rpkg.Job.select(rpkg.Job.q.id == int(xjob.id))[0]
                    if xjob.comment:
                        rJob.comment = xjob.comment
                else:
                    rJob = rpkg.Job()
                    
                    if xjob.comment:
                        rJob.comment = xjob.comment
                    rJob.servicePointID = rServicePoint.id

                for xusedequipment in xjob.usedequipment:
                    if xusedequipment.id:
                        rUsedEquipment = rpkg.UsedEquipment.select(rpkg.UsedEquipment.q.id == int(xusedequipment.id))[0]
                        if xusedequipment.name:
                            rUsedEquipment.name = xusedequipment.name
                        if xusedequipment.quantity:
                            rUsedEquipment.quantity = int(xusedequipment.quantity)
                    else:
                        rUsedEquipment = rpkg.UsedEquipment()
                        
                        if xusedequipment.name:
                            rUsedEquipment.name = xusedequipment.name
                        if xusedequipment.quantity:
                            rUsedEquipment.quantity = int(xusedequipment.quantity)
                        rUsedEquipment.jobID = rJob.id





    