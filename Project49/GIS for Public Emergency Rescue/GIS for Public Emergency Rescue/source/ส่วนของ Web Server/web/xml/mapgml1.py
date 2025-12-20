#!/usr/bin/env python
# -*- coding: cp874 -*-

import sys,time
from Numeric import *
import osr,ogr
from mod_python import apache

import pg

### The follow variables are Constanct must use in Program ### 
wkbXDR = ogr.wkbXDR
wkbNDR = ogr.wkbNDR
wkb25Bit = ogr.wkb25Bit
wkbUnknown = ogr.wkbUnknown
wkbPoint = ogr.wkbPoint
wkbLineString = ogr.wkbLineString
wkbPolygon = ogr.wkbPolygon
wkbMultiPoint = ogr.wkbMultiPoint
wkbMultiLineString = ogr.wkbMultiLineString
wkbMultiPolygon = ogr.wkbMultiPolygon
wkbGeometryCollection = ogr.wkbGeometryCollection
wkbNone = ogr.wkbNone
wkbLinearRing = ogr.wkbLinearRing
wkbPoint25D = ogr.wkbPoint25D
wkbLineString25D = ogr.wkbLineString25D
wkbPolygon25D = ogr.wkbPolygon25D
wkbMultiPoint25D = ogr.wkbMultiPoint25D
wkbMultiLineString25D = ogr.wkbMultiLineString25D
wkbMultiPolygon25D = ogr.wkbMultiPolygon25D
wkbGeometryCollection25D = ogr.wkbGeometryCollection25D

#----------------------------------------------------------------------
# Function tagMainRoad() 
# Parameter : layer. 
# Return : string Tag XML.
#----------------------------------------------------------------------
def tagAmphoe50(layer = None) :
    
    xmlTag = """"""
    points = ""

    if not (layer) :
        return ""

    layer.ResetReading()    
    feature = layer.GetNextFeature()
    objNumber = 0;
    while feature :        
        
        geometry = feature.GetGeometryRef()
        if geometry :            
            geometryType = geometry.GetGeometryType() & (~wkb25Bit)

            if geometryType == wkbPolygon :
                for i in range(0, geometry.GetGeometryCount()):
                    subGeometry = geometry.GetGeometryRef(i)
                    numberPoint = subGeometry.GetPointCount()
                    placeName = feature.GetFieldAsString(5).decode('cp874').encode('utf8')
                    #placeName = "test" + placeName
                    #area = feature.GetFieldAsString(feature.GetFieldIndex("area"))
                    if numberPoint > 0 :                        
                        for j in range(0, numberPoint) :
                            points = points+str(subGeometry.GetX(j))+","+str(subGeometry.GetY(j)*(-1))+" "
                        xmlTag = xmlTag+'<amphoe id="amphoe' +str(objNumber)+ '" points="'+points+'"> '+'<name>'+placeName+'</name></amphoe>' 
                        points = "" 
                        
            elif geometryType == wkbMultiPolygon :
                for i in range(0, geometry.GetGeometryCount()) :
                    eachPolygon = geometry.GetGeometryRef(i)
                    for j in range(0, eachPolygon.GetGeometryCount()) :
                        subGeometry = eachPolygon.GetGeometryRef(j)
                        numberPoint = subGeometry.GetPointCount()
                        if numberPoint > 0 :                            
                            for k in range(0, numberPoint) :
                                points = points+str(subGeometry.GetX(k))+","+str(subGeometry.GetY(k)*(-1))+" "
                            tagSVG = tagSVG+polygonTag+'"'+points+'"/> '+"""
                        <set attributeType='XML' attributeName='fill' to='red' begin='mouseover' end='mouseout'/></polygon>""" 
                            points = ""                              
        feature.Destroy()
        feature = layer.GetNextFeature()
        objNumber = objNumber + 1
    return xmlTag

def amphoe50( req ) :
    
    mapSVG = ""
    dataSource = ogr.Open("pg:host=localhost dbname=virtualbkk_db user=ictuser password=mflv[")

    sqlStatement = "select * from polyamphoe"
    #layer = dataSource.ExecuteSQL(sqlStatement)
    layer = dataSource.GetLayerByName("polyamphoe")
    if layer :
       tag = tagAmphoe50(layer)
    else :
       tag = "None"

    dataSource.Destroy()
    req.content_type = "text/xml" 
    req.cache_control = "no-cache" 
    req.encoding='cp874'
    req.write( '<?xml version="1.0"?> \n<amphoes>'+tag+'</amphoes>')
    return
#----------------------------------------------------------------------
# Function tagRiver1()
# Parameter : layer.
# Return : String Tag XML.
#----------------------------------------------------------------------
def tagRiver1(layer = None) :
    
    xmlTag = """"""
    points = ""

    if not (layer) :
        return ""

    layer.ResetReading()    
    feature = layer.GetNextFeature()
    objNumber = 0;
    while feature :        
        
        geometry = feature.GetGeometryRef()
        if geometry :            
            geometryType = geometry.GetGeometryType() & (~wkb25Bit)

            if geometryType == wkbPolygon :
                for i in range(0, geometry.GetGeometryCount()):
                    subGeometry = geometry.GetGeometryRef(i)
                    numberPoint = subGeometry.GetPointCount()
                    #placeName = feature.GetFieldAsString(5).decode('cp874').encode('utf8')
                    #placeName = "test" + placeName
                    #area = feature.GetFieldAsString(feature.GetFieldIndex("area"))
                    if numberPoint > 0 :                        
                        for j in range(0, numberPoint) :
                            points = points+str(subGeometry.GetX(j))+","+str(subGeometry.GetY(j)*(-1))+" "
                        xmlTag = xmlTag+'<river id="river' +str(objNumber)+ '" points="'+points+'"/>'#+'<name>'+placeName+'</name></amphoe>' 
                        points = "" 
                        
            elif geometryType == wkbMultiPolygon :
                for i in range(0, geometry.GetGeometryCount()) :
                    eachPolygon = geometry.GetGeometryRef(i)
                    for j in range(0, eachPolygon.GetGeometryCount()) :
                        subGeometry = eachPolygon.GetGeometryRef(j)
                        numberPoint = subGeometry.GetPointCount()
                        if numberPoint > 0 :                            
                            for k in range(0, numberPoint) :
                                points = points+str(subGeometry.GetX(k))+","+str(subGeometry.GetY(k)*(-1))+" "
                            xmlTag = xmlTag+'<river id="river' +str(objNumber)+ '" points="'+points+'"/>'                      
                            points = ""                              
        feature.Destroy()
        feature = layer.GetNextFeature()
        objNumber = objNumber + 1
    return xmlTag

def river1( req ) :
    
    mapSVG = ""
    dataSource = ogr.Open("pg:host=localhost dbname=virtualbkk_db user=ictuser password=mflv[")

    #sqlStatement = "select * from polyamphoe"
    #layer = dataSource.ExecuteSQL(sqlStatement)
    layer = dataSource.GetLayerByName("river1")
    if layer :
       tag = tagRiver1(layer)
    else :
       tag = "None"

    dataSource.Destroy()
    req.content_type = "text/xml" 
    req.cache_control = "no-cache" 
    req.encoding='cp874'
    req.write( '<?xml version="1.0"?><river1>'+tag+'</river1>')
    return
#----------------------------------------------------------------------
# Function tagMainRoad() 
# Parameter : layer. 
# Return : string Tag XML.
#----------------------------------------------------------------------
def tagMainRoad(layer = None) :
    
    xmlTag = """"""
    points = ""

    if not (layer) :
        return ""

    layer.ResetReading()    
    feature = layer.GetNextFeature()
    objNumber = 0;
    while feature :        
        
        geometry = feature.GetGeometryRef()
        if geometry :            
            geometryType = geometry.GetGeometryType() & (~wkb25Bit)

            if geometryType == wkbLineString :
                numberPoint = geometry.GetPointCount()
                if numberPoint > 0 :
                    for i in range(0, numberPoint) :
                        points = points+str(geometry.GetX(i))+","+str(geometry.GetY(i)*(-1))+" "
                    xmlTag = xmlTag+"<road><line points="+'"'+points+'"/>'
                    points = ""
                    rname = feature.GetFieldAsString(8).decode('cp874').encode('utf8')
                    rlength = feature.GetFieldAsString(4).decode('cp874').encode('utf8')
                    xmlTag = xmlTag + "<name>" + rname + "</name>"
                    xmlTag = xmlTag + "<length>" + rlength + "</length></road>"               
                    
            elif geometryType == wkbMultiLineString :
                for i in range(0, geometry.GetGeometryCount()) :
                    subGeometry = geometry.GetGeometryRef(i)
                    numberPoint = subGeometry.GetPointCount()
                    if numberPoint > 0 :                        
                        for j in range(0, numberPoint) :
                            points = points+str(subGeometry.GetX(j))+","+str(subGeometry.GetY(j)*(-1))+" "
                        xmlTag = xmlTag+"<line points="+'"'+points+'"/>'
                        points = ""                       
                        rname = feature.GetFieldAsString(8).decode('cp874').encode('utf8')
                        rlength = feature.GetFieldAsString(4).decode('cp874').encode('utf8')
                        xmlTag = xmlTag + "<name>" + rname + "</name>"
                        xmlTag = xmlTag + "<length>" + rlength + "</length></road>"               
                             
        feature.Destroy()
        feature = layer.GetNextFeature()
        objNumber = objNumber + 1
    return xmlTag

def mainroad( req ) :
    
    mapSVG = ""
    dataSource = ogr.Open("PG:host=localhost dbname=virtualbkk_db user=ictuser password=mflv[")

    sqlStatement = "select * from mainroad"
    #layer = dataSource.ExecuteSQL(sqlStatement)
    layer = dataSource.GetLayerByName("mainroad")
    tag = tagMainRoad(layer)

    dataSource.Destroy()
    req.content_type = "text/xml" 
    req.headers_out.add("Expires", "Mon, 26 Jul 1997 05:00:00 GMT")
    req.headers_out.add("Last-Modified", time.strftime('%a, %d %b %Y %H:%M:%S') + " GMT")
    req.headers_out.add("Cache-Control", "no-cache, must-revalidate")
    req.headers_out.add("Pragma", "no-cache")
    return """<?xml version="1.0"?>
            <mainroad>
            """+tag+"""
            </mainroad>"""

#----------------------------------------------------------------------
# Function tagPlace() 
# Parameter : layer. 
# Return : string Tag XML.
#----------------------------------------------------------------------
def tagPlace(layer = None) :
    
    xmlTag = """"""
    points = ""

    if not (layer) :
        return ""

    layer.ResetReading()    
    feature = layer.GetNextFeature()
    objNumber = 0;
    while feature :        
        
        geometry = feature.GetGeometryRef()
        if geometry :            
            geometryType = geometry.GetGeometryType() & (~wkb25Bit)
            
            if geometryType == wkbPoint :
                numberPoint = geometry.GetPointCount()
                if numberPoint > 0 : 
                    xmlTag = xmlTag + '<place><point pointx="'+str(geometry.GetX(0))+'" pointy="'+str(geometry.GetY(0)*(-1))+'"/>'
                    hname = feature.GetFieldAsString(feature.GetFieldIndex('name')).decode('cp874').encode('utf8')
                    xmlTag = xmlTag + "<name>" + hname + "</name></place>"

            elif geometryType == wkbMultiPoint :
                for i in range(0, geometry.GetGeometryCount()):
                    subGeometry = geometry.GetGeometryRef(i)
                    numberPoint = subGeometry.GetPointCount()
                    if numberPoint > 0 :                        
                        xmlTag = xmlTag + '<place><point pointx="'+str(geometry.GetX(0))+'" pointy="'+str(geometry.GetY(0)*(-1))+'"/>'
                        hname = feature.GetFieldAsString(feature.GetFieldIndex('name')).decode('cp874').encode('utf8')
                        xmlTag = xmlTag + "<name>" + hname + "</name></place>"
                  
        feature.Destroy()
        feature = layer.GetNextFeature()
        objNumber = objNumber + 1
    return xmlTag

def place( req, typePlace ) :
    
    mapSVG = ""
    dataSource = ogr.Open("PG:host=localhost dbname=virtualbkk_db user=ictuser password=mflv[")
    
    if typePlace == "hospital" :
        #sqlStatement = "select * from hospitalall"
	layer = dataSource.GetLayerByName("hospitalall")
    elif typePlace == "school" :
        #sqlStatement = "select * from school"
	layer = dataSource.GetLayerByName("sqschool")
    elif typePlace == "hospitalbkk" :
        #sqlStatement = "select * from hospitalbkk"
	layer = dataSource.GetLayerByName("hospitalbkk")
    elif typePlace == "policestation" :
        layer = dataSource.GetLayerByName("policestation")
    elif typePlace == "hospitalstation" :
        layer = dataSource.GetLayerByName("sthospital")   
    elif typePlace == "house" :
	layer = dataSource.GetLayerByName("alonehouse")        
    elif typePlace == "ghouse" :
        layer = dataSource.GetLayerByName("grouphouse")
    elif typePlace == "subdepartment" :
        layer = dataSource.GetLayerByName("subdepartment")
    elif typePlace == "market" :
        layer = dataSource.GetLayerByName("market")
    elif typePlace == "trainstation" :
        layer = dataSource.GetLayerByName("trainstation")
    elif typePlace == "office" :
        sqlStatement = "select * from bkk where level=25 and name like 'สำนักงาน%'"
    elif typePlace == "univer" :
        layer = dataSource.GetLayerByName("univers")
    elif typePlace == "grm" :
        sqlStatement = "select * from bkk where level=25 and name like 'กรม%'"
    elif typePlace == "grong" :
        sqlStatement = "select * from bkk where level=25 and name like 'กอง%'"
    elif typePlace == "muslim" :
        sqlStatement = "select * from bkk where level=25 and name like 'มัสยิ%'"
    elif typePlace == "temple" :
        sqlStatement = "select * from bkk where level=25 and name like 'วัด%'"
    elif typePlace == "firestation" :
        layer = dataSource.GetLayerByName("firestation")
    elif typePlace == "college" :
        sqlStatement = "select * from bkk where level=25 and name like 'วิทยาลัย%'"
    elif typePlace == "prapa" :
        sqlStatement = "select * from bkk where level=25 and name like 'การประปา%'"
    elif typePlace == "switch" :
        sqlStatement = "select * from bkk where level=25 and name like 'ชุมสาย%'"
    elif typePlace == "thpost" :
        sqlStatement = "select * from bkk where level=25 and name like 'ปทจ.%'"
    else :
        layer = dataSource.GetLayerByName("hospitalbkk")

    #layer = dataSource.ExecuteSQL(sqlStatement)
    tag = tagPlace(layer)

    dataSource.Destroy()
    req.content_type = "text/xml" 
    #req.cache_control = "no-cache" 
    req.headers_out.add("Expires", "Mon, 26 Jul 1997 05:00:00 GMT")
    req.headers_out.add("Last-Modified", time.strftime('%a, %d %b %Y %H:%M:%S') + " GMT")
    req.headers_out.add("Cache-Control", "no-cache, must-revalidate")
    req.headers_out.add("Pragma", "no-cache")

    return """<?xml version="1.0"?>
            <places>
            """+tag+"""
            </places>"""

#==================================================================================
#==================================================================================
def getMainRoad1234(layer = None) :
   
    tagxml = ""
    points = ""

    if not (layer) :
        return ""

    layer.ResetReading()    
    feature = layer.GetNextFeature()
    objNumber = 0;
    while feature :        
        line = [] 
        geometry = feature.GetGeometryRef()
        if geometry :            
            geometryType = geometry.GetGeometryType() & (~wkb25Bit)
            
            if geometryType == wkbLineString :
                numberPoint = geometry.GetPointCount()
                if numberPoint > 0 :
                    for i in range(0, numberPoint) :
                        points = points+str(geometry.GetX(i))+","+str(geometry.GetY(i)*(-1))+" "
                    tagxml = tagxml+'<road id="r'+str(objNumber)+'" type="linestring" points="'+points+'"/>'
                    points = ""                    
                    
            elif geometryType == wkbMultiLineString :
                for i in range(0, geometry.GetGeometryCount()) :
                    subGeometry = geometry.GetGeometryRef(i)
                    numberPoint = subGeometry.GetPointCount()
                    if numberPoint > 0 :                        
                        for j in range(0, numberPoint) :
                            points = points+str(subGeometry.GetX(j))+","+str(subGeometry.GetY(j)*(-1))+" "
                        tagxml = tagxml+'<road id="r'+str(objNumber)+'" type="linestring" points="'+points+'"/>'
                        points = ""                       
                        
            elif geometryType == wkbPolygon :
                for i in range(0, geometry.GetGeometryCount()):
                    subGeometry = geometry.GetGeometryRef(i)
                    numberPoint = subGeometry.GetPointCount()
                    placeName = feature.GetFieldAsString(feature.GetFieldIndex("name"))
                    area = feature.GetFieldAsString(feature.GetFieldIndex("area"))
                    if numberPoint > 0 :                        
                        for j in range(0, numberPoint) :
                            points = points+str(subGeometry.GetX(j))+","+str(subGeometry.GetY(j)*(-1))+" "
                        tagxml = tagxml+'<road id="r'+str(objNumber)+'" type="polygon" points="'+points+'"/>'
                        points = "" 
                        
            elif geometryType == wkbMultiPolygon :
                for i in range(0, geometry.GetGeometryCount()) :
                    eachPolygon = geometry.GetGeometryRef(i)
                    for j in range(0, eachPolygon.GetGeometryCount()) :
                        subGeometry = eachPolygon.GetGeometryRef(j)
                        numberPoint = subGeometry.GetPointCount()
                        if numberPoint > 0 :                            
                            for k in range(0, numberPoint) :
                                points = points+str(subGeometry.GetX(k))+","+str(subGeometry.GetY(k)*(-1))+" "
                            tagxml = tagxml+'<road id="r'+str(objNumber)+'" type="polygon" points="'+points+'"/>'
                            points = ""
	else :
	   tagxml = str(objNumber)                             
        feature.Destroy()
        feature = layer.GetNextFeature()
        objNumber = objNumber + 1
    return tagxml

def roadsmain(req):    
    
    dataSource = ogr.Open("PG:host=localhost dbname=test user=postgres password=root")
    
    sqlStatement = "select * from bkk where level=30"
    layer = dataSource.ExecuteSQL(sqlStatement)
    tag = getMainRoad1234(layer)

    dataSource.Destroy()
    req.content_type = "text/xml" 
    #req.cache_control = "no-cache" 
    req.headers_out.add("Expires", "Mon, 26 Jul 1997 05:00:00 GMT")
    req.headers_out.add("Last-Modified", time.strftime('%a, %d %b %Y %H:%M:%S') + " GMT")
    req.headers_out.add("Cache-Control", "no-cache, must-revalidate")
    req.headers_out.add("Pragma", "no-cache")

    return """<?xml version="1.0"?>
            <roads>
            """+tag+"""
            </roads>"""

def subroad(req):    
    
    dataSource = ogr.Open("PG:host=localhost dbname=virtualbkk_db user=ictuser password=mflv[")
    
    sqlStatement = "select * from mapbkk where level=31"
    #layer = dataSource.ExecuteSQL(sqlStatement)
    layer = dataSource.GetLayerByName("subroad")
    tag = getMainRoad1234(layer)
    if tag == '' :
       tag = "Null"
    dataSource.Destroy()
    req.content_type = "text/xml" 
    #req.cache_control = "no-cache" 
    req.headers_out.add("Expires", "Mon, 26 Jul 1997 05:00:00 GMT")
    req.headers_out.add("Last-Modified", time.strftime('%a, %d %b %Y %H:%M:%S') + " GMT")
    req.headers_out.add("Cache-Control", "no-cache, must-revalidate")
    req.headers_out.add("Pragma", "no-cache")

    return """<?xml version="1.0"?>
            <roads>
            """+tag+"""
            </roads>"""

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

def amata(layer = None) :
    
    tagxml = ""
    points = ""

    if not (layer) :
        return ""

    layer.ResetReading()    
    feature = layer.GetNextFeature()
    objNumber = 0;
    while feature :        
        line = [] 
        geometry = feature.GetGeometryRef()
        if geometry :            
            geometryType = geometry.GetGeometryType() & (~wkb25Bit)
            
            if geometryType == wkbPoint :
                numberPoint = geometry.GetPointCount()
                if numberPoint > 0 : 
                    tagxml = tagxml + '<amata type="point" points="'+str(geometry.GetX(0))+','+str(geometry.GetY(0))+'"/>'
                    points = ""
#                    hname = feature.GetFieldAsString(feature.GetFieldIndex('text'))                    
#                    xmlTag = xmlTag + "<name>" + unicode(hname,'TIS-620') + "</name></amata>"

            elif geometryType == wkbMultiPoint :
                for i in range(0, geometry.GetGeometryCount()):
                    subGeometry = geometry.GetGeometryRef(i)
                    numberPoint = subGeometry.GetPointCount()
                    if numberPoint > 0 :                        
                        tagxml = tagxml + '<amata type="point" points="'+str(geometry.GetX(0))+','+str(geometry.GetY(0))+'">'
                        points = ""
#                        hname = feature.GetFieldAsString(feature.GetFieldIndex('text'))
#                        xmlTag = xmlTag + "<name>" + unicode(hname,'TIS-620') + "</name></amata>"

            elif geometryType == wkbLineString :
                numberPoint = geometry.GetPointCount()
                if numberPoint > 0 :
                    for i in range(0, numberPoint) :
                        points = points+str(geometry.GetX(i))+","+str(geometry.GetY(i))+" "
                    tagxml = tagxml+'<amata type="linestring" points="'+points+'"/>'
                    points = ""                    
                    
            elif geometryType == wkbMultiLineString :
                for i in range(0, geometry.GetGeometryCount()) :
                    subGeometry = geometry.GetGeometryRef(i)
                    numberPoint = subGeometry.GetPointCount()
                    if numberPoint > 0 :                        
                        for j in range(0, numberPoint) :
                            points = points+str(subGeometry.GetX(j))+","+str(subGeometry.GetY(j))+" "
                        tagxml = tagxml+'<amata type="linestring" points="'+points+'"/>'
                        points = ""                       
                        
            elif geometryType == wkbPolygon :
                for i in range(0, geometry.GetGeometryCount()):
                    subGeometry = geometry.GetGeometryRef(i)
                    numberPoint = subGeometry.GetPointCount()
                    placeName = feature.GetFieldAsString(feature.GetFieldIndex("name"))
                    area = feature.GetFieldAsString(feature.GetFieldIndex("area"))
                    if numberPoint > 0 :                        
                        for j in range(0, numberPoint) :
                            points = points+str(subGeometry.GetX(j))+","+str(subGeometry.GetY(j))+" "
                        tagxml = tagxml+'<amata type="polygon" points="'+points+'"/>'
                        points = "" 
                        
            elif geometryType == wkbMultiPolygon :
                for i in range(0, geometry.GetGeometryCount()) :
                    eachPolygon = geometry.GetGeometryRef(i)
                    for j in range(0, eachPolygon.GetGeometryCount()) :
                        subGeometry = eachPolygon.GetGeometryRef(j)
                        numberPoint = subGeometry.GetPointCount()
                        if numberPoint > 0 :                            
                            for k in range(0, numberPoint) :
                                points = points+str(subGeometry.GetX(k))+","+str(subGeometry.GetY(k))+" "
                            tagxml = tagxml+'<amata type="polygon" points="'+points+'"/>'
                            points = ""                             
        feature.Destroy()
        feature = layer.GetNextFeature()
        objNumber = objNumber + 1
    return tagxml

def amatacity(req, layers="l1"):    
    
    dataSource = ogr.Open("PG:host=localhost dbname=test user=postgres password=root")
    tag = ""
    if layers == "l1" :
        sqlStatement = "select * from layer_01"
    elif layers == "l2" :    
        sqlStatement = "select * from layer_02"
    elif layers == "l3" :    
        sqlStatement = "select * from layer_03"
    elif layers == "l4" :    
        sqlStatement = "select * from layer_04"
    elif layers == "l5" :    
        sqlStatement = "select * from layer_05"
    elif layers == "l6" :    
        sqlStatement = "select * from layer_06"
    elif layers == "l7" :    
        sqlStatement = "select * from layer_07"
    elif layers == "l8" :    
        sqlStatement = "select * from layer_08"
    elif layers == "l9" :    
        sqlStatement = "select * from layer_09"
    elif layers == "l10" :    
        sqlStatement = "select * from layer_10"
    elif layers == "l11" :    
        sqlStatement = "select * from layer_11"
    elif layers == "l12" :    
        sqlStatement = "select * from layer_12"
    elif layers == "l13" :    
        sqlStatement = "select * from layer_13"
    elif layers == "l14" :    
        sqlStatement = "select * from layer_14"
    elif layers == "l15" :    
        sqlStatement = "select * from layer_15"
    elif layers == "l16" :    
        sqlStatement = "select * from layer_16"
    elif layers == "l17" :    
        sqlStatement = "select * from layer_17"
    elif layers == "l18" :    
        sqlStatement = "select * from layer_18"
    elif layers == "l19" :    
        sqlStatement = "select * from layer_19"
    elif layers == "l20" :    
        sqlStatement = "select * from layer_20"
    elif layers == "l21" :    
        sqlStatement = "select * from layer_21"
    elif layers == "l22" :    
        sqlStatement = "select * from layer_22"
    elif layers == "l23" :    
        sqlStatement = "select * from layer_23"
    elif layers == "l24" :    
        sqlStatement = "select * from layer_24"
    elif layers == "l25" :    
        sqlStatement = "select * from layer_25"
    elif layers == "l26" :
        sqlStatement = "select * from layer_26"
    elif layers == "l27" :    
        sqlStatement = "select * from layer_27"
    elif layers == "l28" :    
        sqlStatement = "select * from layer_28"
    elif layers == "l29" :    
        sqlStatement = "select * from layer_29"
    elif layers == "l30" :    
        sqlStatement = "select * from layer_30"
    elif layers == "l31" :    
        sqlStatement = "select * from layer_31"
    elif layers == "l32" :    
        sqlStatement = "select * from layer_32"
    elif layers == "l33" :    
        sqlStatement = "select * from layer_33"
    elif layers == "l34" :    
        sqlStatement = "select * from layer_34"
    elif layers == "l35" :    
        sqlStatement = "select * from layer_35"
    elif layers == "l36" :    
        sqlStatement = "select * from layer_36"
    elif layers == "l37" :    
        sqlStatement = "select * from layer_37"
    elif layers == "l38" :    
        sqlStatement = "select * from layer_38"
    elif layers == "l39" :    
        sqlStatement = "select * from layer_39"
    elif layers == "l40" :    
        sqlStatement = "select * from layer_40"
    elif layers == "l41" :    
        sqlStatement = "select * from layer_41"
    elif layers == "l42" :    
        sqlStatement = "select * from layer_42"
    elif layers == "l43" :    
        sqlStatement = "select * from layer_43"
    elif layers == "l44" :    
        sqlStatement = "select * from layer_44"
    elif layers == "l45" :    
        sqlStatement = "select * from layer_45"
    elif layers == "l46" :    
        sqlStatement = "select * from layer_46"
    elif layers == "l47" :    
        sqlStatement = "select * from layer_47"
    elif layers == "l48" :    
        sqlStatement = "select * from layer_48"
    elif layers == "l49" :    
        sqlStatement = "select * from layer_49"
    elif layers == "l50" :    
        sqlStatement = "select * from layer_50"
    else :        
        sqlStatement = "select * from layer_01"
    
    layer = dataSource.ExecuteSQL(sqlStatement)
    tag = amata(layer)

    dataSource.Destroy()
    req.content_type = "text/xml" 
    req.cache_control = "no-cache" 
    return """<?xml version="1.0"?>
            <amatacity>
            """+tag+"""
            </amatacity>"""
