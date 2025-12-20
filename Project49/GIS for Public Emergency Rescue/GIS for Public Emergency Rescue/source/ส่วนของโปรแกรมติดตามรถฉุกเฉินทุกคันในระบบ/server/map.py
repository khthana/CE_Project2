#!C:/Python23/python.exe
# -*- coding: CP874 -*-

from gdal import *




class MapData:
    def __init__(self, filename, srs=None):
        pass
    
    def GetSRS(self):
        pass

    def SetSRS(self, srs):
        pass
    
    def setTranform(self, srs):
        pass
    



def Read_MapDGN(filenames, level=[]):
    """
    This function reads a DGN format file
    """
    #import dgn
    segments = []
    if filenames:
        
        for filename in filenames:
            file = ogr.Open(filename)
            #layer = file.GetLayerByName("elements")
            layer = file.ExecuteSQL( "select * from elements where level=30 or level=31" )


            #print  layer.GetFeatureCount()
            #for i in xrange(0, 900):
            feature = layer.GetNextFeature()
            while feature:
            #for i in xrange(0, layer.GetFeatureCount()):
                #feature = layer.GetFeature(i)
                #dir(feature)
                #if feature.GetFieldAsInteger(1) in level:
                geo = feature.GetGeometryRef()
                #print geo.GetGeometryName()
                if geo:
                    #print geo.GetGeometryName()
                    #style =  style_string(feature.GetStyleString())
                    style = { 'c': color_template[feature.GetField(3)], 'w':feature.GetField(4) }
                    segments.append( [GetSegment(geo),style] )
                    #segments += seg
                feature = layer.GetNextFeature()
    #print segments
    return segments
    #else:
    #    return []



Class 