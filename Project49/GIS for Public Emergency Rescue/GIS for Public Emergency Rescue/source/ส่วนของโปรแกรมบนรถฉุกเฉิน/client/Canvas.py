#!/usr/bin/env python2.3
# -*- coding: CP874 -*-


try:
    from Numeric import array,asarray,Float,cos, sin, pi,sum,minimum,maximum,Int32,zeros, ones, concatenate, sqrt, argmin, power, absolute, matrixmultiply, transpose, sometrue, fromstring
except ImportError:
    try:
        from numarray import array, asarray, Float, cos, sin, pi, sum, minimum, maximum, Int32, zeros, concatenate, matrixmultiply, transpose, sometrue, fromstring
    except ImportError:
        raise ImportError("I could not import either Numeric or numarray")

#from time import clock, sleep

import types
import os        
from bisect import insort
#from struct import unpack
from math import atan, radians, degrees
import wx
import thread

try:
    from gdal import ogr
except ImportError:
    try:
        import ogr
    except:
        raise ImportError("I could not import OGR")

#import psyco
#psyco.background()

from FloatCanvas import *



def BBCheck(BB1, BB2):
    """

    BBCheck(BB1, BB2) returns True is the Bounding boxes intesect, False otherwise

    """

    if ( (BB1[1,0] > BB2[0,0]) and (BB1[0,0] < BB2[1,0]) and
         (BB1[1,1] > BB2[0,1]) and (BB1[0,1] < BB2[1,1]) ):
        return True
    else:
        return False


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

class ProcessDlg(wx.Dialog):
    def __init__(
            self, parent, title,
            ):

        pre = wx.PreDialog()
        #pre.SetExtraStyle(wx.FRAME_EX_CONTEXTHELP)
        pre.Create(parent, -1, title, size= (400, 400))
        self.PostCreate(pre)

        sizer = wx.BoxSizer(wx.VERTICAL) 

        #box  = wx.BoxSizer(wx.HORIZONTAL) 

        txt = wx.StaticText( self, -1, "Please wait......" )
        self.txt = txt
        
        self.gauge = wx.Gauge(
                    self, -1, 100, (110, 95), (250, 25), 
                    wx.GA_HORIZONTAL|wx.GA_SMOOTH
                    )

        sizer.Add(txt, 0, wx.ALIGN_CENTER_VERTICAL|wx.ALL, 5)
        sizer.Add(self.gauge, 0, wx.ALIGN_CENTER_VERTICAL|wx.ALL, 5)
        
        self.SetSizer(sizer)
        sizer.Fit(self)

    def SetText(self, txt):
        #self.txt.SetValue(txt)
        txt = wx.StaticText( self, -1, txt )

    def SetValue(self, value):
        self.gauge.SetValue(value)

def _GetPoints(wkb, order=0):
    points = fromstring(wkb, 'd')
    if order == 0: points = points.byteswapped()
    return points

class GeometryCollection:
    
    def __init__(self, transform=None):

        self.geomlist = {}
        self.geomlist[wkbPoint] = []
        self.geomlist[wkbLineString] = []
        self.geomlist[wkbPolygon] = []
        self.geomlist[wkbMultiPoint] = []
        self.geomlist[wkbMultiLineString] = []
        self.geomlist[wkbMultiPolygon] = []
        self.geomlist[wkbGeometryCollection] = []
        #self.geomlist[wkbNone] = []
        #self.geomlist[wkbLinearRing] = []
        
        self.fieldname = None


        self.transform = transform
        self.CalcBoundingBox()
        self._Canvas =None
        self.value = 0
        self.maxvalue = 1
    
    def CalcBoundingBox(self):
        bbpoint = [ b for (w,b,f) in self.geomlist[wkbPoint]]
        bbline = [ b for (w,b) in self.geomlist[wkbLineString]]
        #bbpoly = [ b for (w,b) in self.geomlist[wkbPolygon]]
        bbpoly = []
        bb = asarray(bbpoint + bbline + bbpoly)
        #bb.shape = (-1,2)
        try:
            self.BoundingBox = array([minimum.reduce(bb[:,0]), maximum.reduce(bb[:,1])],Float )
        except:
            self.BoundingBox = None

        #if self._Canvas:
        #    self._Canvas.BoundingBoxDirty = True

    def Open(self, filename, sql="", region = 'NULL', dialect = "", showgauge= False, parent=None ):

        ds = ogr.Open(filename)
        # If can't open file ,return None
        if ds is None:
            return None

        self.value = 0
        self.maxvalue = 1

        


        if sql:
            dlg = ProcessDlg(parent, "Read geometry")
            def Run():
                #dlg.SetText("Please wait...... file opening(1 of 2)")
                layer = ds.ExecuteSQL(sql, region, dialect)
                
                #dlg.SetText("Please wait...... data reading(2 of 2)")
                self.ReadGeometryFromLayer(layer, dlg.SetValue)
                dlg.Close()

            #print self.maxvalue
            thread.start_new_thread(Run, ())
            #self.ReadGeometryFromLayer(layer)
            dlg.CenterOnScreen()
            dlg.ShowModal()
        else:
            
            #dlg = ProcessDlg(parent, "Read geometry")
            for index in range(0, ds.GetLayerCount()):
                self.ReadGeometryFromLayer(ds.GetLayer(index))

        self.CalcBoundingBox()
        #print len(self.geomlist[wkbPoint]), len(self.geomlist[wkbLineString]), len(self.geomlist[wkbPolygon])

    #def GetValue(self,):
    #    if self.value == self.maxvalue:
    #        return -1
    #    else:
    #        return int((float(self.value)/ self.maxvalue)*100)

    def ReadGeometryFromLayer(self, layer, update_fnc=None):
        
        if layer is None:
            return None
        
        try:
            bblayer = array(layer.GetExtent(), Float)
            bblayer.shape = (2,2)
        except:
            return 

        geomlist = self.geomlist

        pointappend = self.geomlist[wkbPoint].append
        lineappend = self.geomlist[wkbLineString].append
        polyappend = self.geomlist[wkbPolygon].append
        
        #fieldlist = self.fieldlist
        trans = self.transform
        #WkbToPDT = self.WkbToPDT
        
        _NextFeature = layer.GetNextFeature
        feature = _NextFeature()
        
        value = 0
        maxvalue = layer.GetFeatureCount()
        #print maxvalue
        if self.fieldname is None:
            self.fieldname = [feature.GetFieldDefnRef(i).GetName() for i in range(0, feature.GetFieldCount())]

        while feature:
            value += 1
            if update_fnc:
                update_fnc(int((float(value)/maxvalue)*100))

            geom = feature.GetGeometryRef()
            field = [feature.GetField(i) for i in range(0, feature.GetFieldCount())]
            if geom:
                geomtype = geom.GetGeometryType() & (~wkb25Bit)
                #if trans:
                #    geom.Transform(trans)
                
                #if wkbtype:
                if geomtype == wkbPoint:
                    p_num = geom.GetPointCount()
                    if p_num > 0:
                        points = array([[geom.GetX(0),geom.GetY(0)]], Float)
                        bb = concatenate((points, points)) #array([points[0], points[0]], Float)
                        #if BBCheck( bblayer, bb): 
                        pointappend((points, bb, field))

                elif geomtype == wkbMultiPoint:
                    for j in range(0, geom.GetGeometryCount()):
                        geo = geom.GetGeometryRef(j)
                        p_num = geo.GetPointCount()
                        if p_num > 0:
                            points = array([[geo.GetX(0),geo.GetY(0)]],Float)
                            bb = concatenate((points, points)) #array([points[0], points[0]], Float)
                            #if BBCheck( bblayer, bb): 
                            pointappend((points, bb, field))
            
                elif geomtype == wkbLineString:
                    p_num = geom.GetPointCount()
                    if p_num > 0:
                        points = array([[geom.GetX(i),geom.GetY(i)] for i in range(0,p_num)], Float)
                        bb = array([minimum.reduce(points), maximum.reduce(points)],Float )
                        #if BBCheck( bblayer, bb): 
                        lineappend((points, bb))

                elif geomtype == wkbMultiLineString:         
      
                    for j in range(0, geom.GetGeometryCount()):
                        geo = geom.GetGeometryRef(j)
                        p_num = geo.GetPointCount()
                        if p_num > 0:
                            points = array([[geo.GetX(i),geo.GetY(i)] for i in range(0,p_num)], Float)
                            bb = array([minimum.reduce(points), maximum.reduce(points)],Float )
                            #if BBCheck( bblayer, bb): 
                            lineappend((points, bb))

                elif geomtype == wkbPolygon:
                    for j in range(0, geom.GetGeometryCount()):
                        geo = geom.GetGeometryRef(j)
                        p_num = geo.GetPointCount()
                        if p_num > 0:
                            points = array([[geo.GetX(i),geo.GetY(i)] for i in range(0,p_num)], Float)
                            bb = array([minimum.reduce(points), maximum.reduce(points)],Float )
                            #if BBCheck( bblayer, bb): 
                            polyappend((points, bb))

                elif geomtype == wkbMultiPolygon:
                    for k in range(0, geom.GetGeometryCount()):
                        pgeo = geom.GetGeometryRef(k)
                        for j in range(0, pgeo.GetGeometryCount()):
                            geo = pgeo.GetGeometryRef(j)
                            p_num = geo.GetPointCount()
                            if p_num > 0:
                                points = array([[geo.GetX(i),geo.GetY(i)] for i in range(0,p_num)], Float)
                                bb = array([minimum.reduce(points), maximum.reduce(points)],Float )
                                #if BBCheck( bblayer, bb): 
                                polyappend((points, bb))
                else:
                    print geomtype
            #if 0:
            #if len(geomlist[wkbPolygon]) > 40:
            #    feature = None
            #else:
            feature = _NextFeature()

        #print len(self.geomlist[wkbPoint]),
        #print len(self.geomlist[wkbLineString]),
        #print len(self.geomlist[wkbPolygon])
        #pass
    

class LineDraw(DrawObject):

    def __init__(self,
                 LineColor = "Black",
                 LineStyle = "Solid",
                 LineWidth    = 1):
        
        DrawObject.__init__(self, False)
        self.LineColor = LineColor
        self.LineStyle = LineStyle
        self.LineWidth = LineWidth

        self.SetPen(LineColor,LineStyle,LineWidth)
        #self.HitLineWidth = max(LineWidth,self.MinHitLineWidth)
           
    def _Draw(self, Lines, dc, WorldToPixel, ScaleWorldToPixel, BBCheck):
        #print "%d Lines Draw:%s:%s:%d"%(len(Lines),self.LineColor,self.LineStyle,self.LineWidth)
        dc.SetPen(self.Pen)
        for Line, BB in Lines: 
            if BBCheck(BB):
            #try:
            #print WorldToPixel(Line)
            #print BB, BBCheck(BB)
            #if BBCheck(BB):
                #print Line
                dc.DrawLines(WorldToPixel(Line))
            
            #except:
            #    print Line

class PolygonDraw(DrawObject):

    def __init__(self,
                 LineColor = "Black",
                 LineStyle = "Solid",
                 LineWidth    = 1,
                 FillColor    = None,
                 FillStyle    = "Solid"):
        
        DrawObject.__init__(self, False)
        #ListObj.__init__(self, Polygons)

        self.LineColor = LineColor
        self.LineStyle = LineStyle
        self.LineWidth = LineWidth
        self.FillColor = FillColor
        self.FillStyle = FillStyle

        #self.HitLineWidth = max(LineWidth,self.MinHitLineWidth)

        self.SetPen(LineColor,LineStyle,LineWidth)
        self.SetBrush(FillColor,FillStyle)
    
    def _Draw(self, Polygons, dc, WorldToPixel, ScaleWorldToPixel, BBCheck):
        dc.SetPen(self.Pen)
        dc.SetBrush(self.Brush)
        dc.SetBackgroundMode(wx.TRANSPARENT)
        for Polygon, BB in Polygons:
            if BBCheck(BB):
                #print Polygon
                dc.DrawPolygon(WorldToPixel(Polygon))

class TextDraw:    

    def __init__(self, fid, font, Color="#282828", BackgroundColor=None):
        self.fid = fid
        self.Font = font
        self.Color = Color
        self.BackgroundColor = BackgroundColor

    def SetIndex(self, index=-1):
        self.fid = index

    def _Draw(self, PointList, dc, WorldToPixel, ScaleWorldToPixel, BBCheck):
        dc.SetFont(self.Font)
        dc.SetTextForeground(self.Color)
        if self.BackgroundColor:
           dc.SetBackgroundMode(wx.SOLID)
           dc.SetTextBackground(self.BackgroundColor)
        else:
           dc.SetBackgroundMode(wx.TRANSPARENT)

        #self.SetDC(dc)
        #ShiftFun = self.ShiftFun
        fid = self.fid
        for xy, BB, field in PointList:
            if BBCheck(BB):
                Text = str(field[fid])
                XY = WorldToPixel(xy)[0]
                #print XY, Text
                #(TextWidth, TextHeight) = dc.GetTextExtent(Text)
                #XY = ShiftFun(XY[0], XY[1], TextWidth, TextHeight)
                dc.DrawTextPoint(Text, XY)

 
       

###############################################################################
###############################################################################
###############################################################################


class LayerDraw(GeometryCollection,DrawObject):
    
    def __init__(self, id, LineStyle, PolygonStyle, TextStyle, Visible=True):
        GeometryCollection.__init__(self)
        DrawObject.__init__(self, False)
        self.id = id
        #self.Visible = not Visible
        self.SetVisible(Visible)
        self.LineStyle = LineStyle
        self.PolygonStyle = PolygonStyle
        self.TextStyle = TextStyle

    def __cmp__(self, Obj):
        return (self.id - Obj.id)

###    def MakeNewBuffer(self, size):
###        self._Buffer = wx.EmptyBitmap(*size)
###        dc = wx.MemoryDC()
###        dc.SelectObject(self._Buffer)
###        dc.Clear()

    
    def SetVisible(self, visible=True):
        
        if self._Canvas:
            if visible and (not self.Visible):
                self._Canvas._List.remove(self)
                insort( self._Canvas._DrawList, self )
                self._Canvas._BackgroundDirty = True
                self._Canvas.BoundingBoxDirty = True
            elif (not visible) and self.Visible:
                self._Canvas._List.append(self)
                self._Canvas._DrawList.remove(self)
                self._Canvas._BackgroundDirty = True
                self._Canvas.BoundingBoxDirty = True
        self.Visible = visible

    def _Draw(self, dc, WorldToPixel, ScaleWorldToPixel, BBCheck):
        
        if self.LineStyle:
            self.LineStyle._Draw(self.geomlist[wkbLineString], dc, WorldToPixel, ScaleWorldToPixel, BBCheck)
        if self.PolygonStyle:
            self.PolygonStyle._Draw(self.geomlist[wkbPolygon], dc, WorldToPixel, ScaleWorldToPixel, BBCheck)
        if self.TextStyle:
            self.TextStyle._Draw(self.geomlist[wkbPoint], dc, WorldToPixel, ScaleWorldToPixel, BBCheck)
    
###############################################################################
###############################################################################
###############################################################################

class TrackDraw:
    
    def __init__(self, LineStyle=None, Points= None, InForeground=True):
        if LineStyle is None:
            LineStyle = LineDraw()
        self.LineStyle = LineStyle
        if Points is None:
            self.Points = None
        else:
            self.Points = array(Points, Float)
        #print self.Points
        #self.BoundingBox = None
        self.InForeground = InForeground
        self.CalcBoundingBox()
        
        self.pointStatus = 0
        self.cartype = ''
        
        self.p_green = wx.Image( "picture/icon/p_green.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.f_green = wx.Image( "picture/icon/f_green.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.h_green = wx.Image( "picture/icon/h_green.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        
        self.p_general = wx.Image( "picture/icon/p_general.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.f_general = wx.Image( "picture/icon/f_general.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.h_general = wx.Image( "picture/icon/h_general.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()

        self.p_red = wx.Image( "picture/icon/p_red.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.f_red = wx.Image( "picture/icon/f_red.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.h_red = wx.Image( "picture/icon/h_red.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()

        self.p_yellow = wx.Image( "picture/icon/p_yellow.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.f_yellow = wx.Image( "picture/icon/f_yellow.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.h_yellow = wx.Image( "picture/icon/h_yellow.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        
    def CalcBoundingBox(self):
        
        if self.Points is None:
            self.BoundingBox = None
            return

        upperleft = minimum.reduce(self.Points)
        lowerright = maximum.reduce(self.Points)
        self.BoundingBox = array((upperleft, lowerright), Float)
        
        #self.BoundingBox = array(((min(self.Points[:,0]),
        #                           min(self.Points[:,1]) ),
        #                          (max(self.Points[:,0]),
        #                           max(self.Points[:,1]) ) ), Float )
        if self._Canvas:
            self._Canvas.BoundingBoxDirty = True
    def SetStatus( self, status ):
        self.pointStatus = status
        
    def SetType( self, type ):
        self.cartype = type
            
    def AddPoint(self, Point):
        """ Point is (x,y) """
        
        if self.Points is None:
            self.Points = array( [Point], Float) 
        else:
            self.Points = concatenate( ( self.Points, array( [Point], Float) ) )
        #print len(self.Points)
        self.CalcBoundingBox()
        if self._Canvas:
            self._Canvas.Draw()

    def _Draw(self, dc, WorldToPixel, ScaleWorldToPixel, BBCheck):
        
        #print self.Points

        if self.BoundingBox is not None:
            #print "test", self.BoundingBox, self._Canvas.BoundingBox
##            self.LineStyle._Draw([[self.Points, self.BoundingBox]], 
##                                dc, WorldToPixel, ScaleWorldToPixel, BBCheck)
            dc.SetPen( wx.Pen( "BLACK", 1 ) )
            if self.pointStatus == 0:
                dc.SetBrush( wx.Brush( "GREEN" ) )
            elif self.pointStatus == 1:
                dc.SetBrush( wx.Brush( "YELLOW" ) )
            elif self.pointStatus == 3:
                dc.SetBrush( wx.Brush( "magenta" ) )
            else:
                dc.SetBrush( wx.Brush( "RED" ) )
                        
            XY = WorldToPixel( self.Points[-1] )
            #dc.DrawCircle( XY[0], XY[1], 5 )
            ct = self.cartype
            cs = str(self.pointStatus)
            if cs == '0' and ct == '00000001':
                dc.DrawBitmap(self.h_general,XY[0]-25, XY[1]-25)
            elif cs == '14' and ct == '00000001':
                dc.DrawBitmap(self.h_green,XY[0]-25, XY[1]-25)
            elif cs == '1' and ct == '00000001':
                dc.DrawBitmap(self.h_yellow,XY[0]-25, XY[1]-25)
            elif cs == '2' and ct == '00000001':
                dc.DrawBitmap(self.h_red,XY[0]-25, XY[1]-25)
            elif cs == '0' and ct == '00000002':
                dc.DrawBitmap(self.p_general,XY[0]-25, XY[1]-25)
            elif cs == '00000004' and ct == '00000002':
                dc.DrawBitmap(self.p_green,XY[0]-25, XY[1]-25)
            elif cs == '1' and ct == '00000002':
                dc.DrawBitmap(self.p_yellow,XY[0]-25, XY[1]-25)
            elif cs == '2' and ct == '00000002':
                dc.DrawBitmap(self.p_red,XY[0]-25, XY[1]-25)
            elif cs == '0' and ct == '00000003':
                dc.DrawBitmap(self.f_general,XY[0]-25, XY[1]-25)
            elif cs == '00000004' and ct == '00000003':
                dc.DrawBitmap(self.f_green,XY[0]-25, XY[1]-25)
            elif cs == '1' and ct == '00000003':
                dc.DrawBitmap(self.f_yellow,XY[0]-25, XY[1]-25)
            elif cs == '2' and ct == '00000003':
                dc.DrawBitmap(self.f_red,XY[0]-25, XY[1]-25)

            #dc.DrawCircle( XY[0]+100, XY[1]+100, 20 )
            #radius = int(round(2/2))
##            XY = WorldToPixel(self.Points[-1])
##            dc.DrawCircle(XY[0], XY[1], 5)

class RequestPoint(TrackDraw):
    def __init__( self, LineStyle=None, Points= None, InForeground=True):
        TrackDraw.__init__( self )
        self.requester = wx.Image( "picture/request.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
    
    def _Draw(self, dc, WorldToPixel, ScaleWorldToPixel, BBCheck):
        
        #print self.Points

        if self.BoundingBox is not None:
            #print "test", self.BoundingBox, self._Canvas.BoundingBox
            #self.LineStyle._Draw([[self.Points, self.BoundingBox]], 
            #                    dc, WorldToPixel, ScaleWorldToPixel, BBCheck)
            if self.pointStatus == 0 :
                dc.Clear
                self.pointStatus = 10
            elif self.pointStatus == 10:
                dc.Clear
                self.pointStatus = 1
            elif self.pointStatus == 1:
                pass
            else :
                #radius = int(round(2/2))            
                dc.SetPen( wx.Pen("BLACK",1) )
                dc.SetBrush( wx.Brush("BLUE") )
                    
                XY = WorldToPixel(self.Points[-1])
                dc.DrawBitmap(self.requester,XY[0], XY[1])
##            dc.DrawCircle(XY[0], XY[1], 6)


###############################################################################
###############################################################################
###############################################################################

#class VehicleObject(DrawObject, PointsObjectMixin):
#
#    def __init__( self, id, img, xy, z = 0):
#
#        DrawObject.__init__(self, True)
#        self.id = id
#            
#        self.SetPoints(xy)
#        self.SetZ(z)
#        self.headDegree = 0
#        
#        self._RotateBitmap( img )
#
#    def _RotateBitmap(self, img):
#
#        W = img.GetWidth()/2
#        H = img.GetHeight()/2
#        
#        self._bmp = []
#        Append = self._bmp.append
#
#        for i in range(0,360):
#            bmp = img.Rotate( radians(i), (W,H) ).ConvertToBitmap()
#            W2 = bmp.GetWidth()/2
#            H2 = bmp.GetHeight()/2
#            Append((bmp, W2, H2))
#
#        #self._bmp = [ img.Rotate( radians(i), W, H).ConvertToBitmap() for i in range(0,360)]
#
#    def SetZ(self, z):
#        self.z = z
#
#    def SetPosition(self, xy, z=0 ):
#                
#        oldpos = self.Points
#        
#        dy = xy[1]-oldpos[1]
#        dx = xy[0]-oldpos[0]
#        
#        try:
#            deg = degrees(atan(dy/dx))
#            if dx < 0.0: deg += 180.0
#        except ZeroDivisionError:
#            if dy > 0.0:
#                deg = 90.0
#            else:
#                deg = -90.0
#        deg -= 90.0
#            
#        self.headDegree = deg
#        self.SetPoints(xy)
#        self.SetZ(z)
#
#        self._RotateBitmap()
#        if self._Canvas:
#            self._Canvas.Draw()
#        
#    #def _Draw(self, dc , WorldToPixel, ScaleWorldToPixel = None, HTdc=None):
#    def _Draw(self, dc, WorldToPixel, ScaleWorldToPixel, BBCheck):
#
#        #try:
#        if BBCheck(self.BoundingBox):
#            
#            bmp, w, h = self._bmp[self.headDegree%360]
#            #try:
#             
#            dc.DrawBitmap(  bmp,
#                            int(self.Points[0][0]-w), 
#                            int(self.Points[0][1]-h),
#                            True )
#            #except:
#            #    print self.Points, self.headDegree, len(self._bmp), bmp
#            #memDC.SelectObject(wxNullBitmap)
###############################################################################
###############################################################################
###############################################################################

class MapCanvas( FloatCanvas ):

    def __init__(self, parent, id = -1,
                 size = wx.DefaultSize,
                 BackgroundColor = "WHITE",
                 ):
        
        self._List = []
        self._ForeList= []
        self._DrawBusy = False

        FloatCanvas.__init__(self, parent, id, size, None, None, BackgroundColor)
        def OnEnter(event):
            self.SetFocus()
        wx.EVT_ENTER_WINDOW(self, OnEnter ) 


    def Draw(self, Force=False):
        """
        """
 
        if self.PanelSize < (1,1): # it's possible for this to get called before being properly initialized.
            return
        
        if self._DrawBusy:
            return
        cur = self.GetCursor() 
        self.SetCursor(wx.StockCursor(wx.CURSOR_WAIT))

        self._DrawBusy = True
        #print "start drawing"

        ScreenDC =  wx.ClientDC(self)
        ViewPortWorld = ( self.PixelToWorld((0,0)),
                          self.PixelToWorld(self.PanelSize) )
        ViewPortBB = array( ( minimum.reduce(ViewPortWorld),
                              maximum.reduce(ViewPortWorld) ) )

        BBCheck = lambda x: self._BBCheck( x, ViewPortBB)

        dc = wx.BufferedDC(ScreenDC, self._Buffer)
        #dc.SetBackground(self.BackgroundBrush)
        if self._BackgroundDirty or Force:
            
            dc.SetBackground(self.BackgroundBrush)
            dc.Clear()           
            #self._DrawLayer(dc, BBCheck)
            self._DrawObjList(self._DrawList, dc, BBCheck)
            self._BackgroundDirty = False

        if self._ForeDrawList:
            
            if self._ForegroundBuffer is None:
                self._ForegroundBuffer = wx.EmptyBitmap(self.PanelSize[0],
                                                        self.PanelSize[1])

            dc.SelectObject(wx.NullBitmap)
            dc = wx.MemoryDC() ## I got some strange errors (linewidths wrong) if I didn't make a new DC here
            dc.SelectObject(self._ForegroundBuffer)
            dc.DrawBitmap(self._Buffer,0,0)
            #self._DrawForeground(dc, BBCheck)
            self._DrawObjList( self._ForeDrawList, dc, BBCheck)

        ScreenDC.Blit(0, 0, self.PanelSize[0], self.PanelSize[1], dc, 0, 0)
        ### If the canvas is in the middle of a zoom or move, the Rubber Band box needs to be re-drawn
        ### This seeems out of place, but it works.
        if self.PrevRBBox:
            ScreenDC.SetPen(wx.Pen('WHITE', 2,wx.SHORT_DASH))
            ScreenDC.SetBrush(wx.TRANSPARENT_BRUSH)
            ScreenDC.SetLogicalFunction(wx.XOR)
            ScreenDC.DrawRectanglePointSize(*self.PrevRBBox)
        #except:
        #    pass
        self._DrawBusy = False
        #print "stop drawing"
        self.SetCursor(cur)


    def AddLayer(self, obj):
        
        obj._Canvas = self
        
        if obj.InForeground:
            #if  obj.Visible:
            self._ForeDrawList.append(obj)
            #self.UseForeground = True
            #    self._BackgroundDirty = True
            #else:
            #    self._List.append(obj)
        else:
            if  obj.Visible:
                self._DrawList.append(obj)
                #self.UseForeground = True
                self._BackgroundDirty = True
            else:
                self._List.append(obj)
        
        self.BoundingBoxDirty = True
        #self.AddObject(obj)
        
    #def _DrawLayer(self, dc, BBCheck):
    #    WorldToPixel = self.WorldToPixel
    #    ScaleWorldToPixel = self.ScaleWorldToPixel
    #    dc.SetBackground(self.BackgroundBrush)
    #    dc.BeginDrawing()
    #    #dc.DrawLines(array([[0,0], [100,100]], Float))
    #    for layer in self._DrawList:
    #        layer._Draw(dc, WorldToPixel, ScaleWorldToPixel, BBCheck)
    #    dc.EndDrawing()

    def _DrawObjList(self, List, dc, BBCheck):

        WorldToPixel = self.WorldToPixel
        ScaleWorldToPixel = self.ScaleWorldToPixel
        dc.SetBackground(self.BackgroundBrush)
        dc.BeginDrawing()
        for obj in List:
            obj._Draw(dc, WorldToPixel, ScaleWorldToPixel, BBCheck)
        dc.EndDrawing()
        
    def _BBCheck(BB1, BB2):
        """

        BBCheck(BB1, BB2) returns True is the Bounding boxes intesect, False otherwise

        """

        if ( (BB1[1,0] > BB2[0,0]) and (BB1[0,0] < BB2[1,0]) and
             (BB1[1,1] > BB2[0,1]) and (BB1[0,1] < BB2[1,1]) ):
            return True
        else:
            return False
    
    _BBCheck = staticmethod(_BBCheck)

    def _ResetBoundingBox(self):
        if self._DrawList or self._ForeDrawList:
          
            drawbb = [ BB.BoundingBox for BB in self._DrawList if BB.BoundingBox is not None]
            forebb = [ BB.BoundingBox for BB in self._ForeDrawList if BB.BoundingBox is not None]
            #print forebb
            bboxarray = asarray( drawbb+forebb, Float)
            #print bboxarray
            if bboxarray.shape[0] <> 0:
                self.BoundingBox = self._getboundingbox(bboxarray)
            else:
                self.BoundingBox = None
                self.ViewPortCenter= array( (0,0), Float)
                self.TransformVector = array( (1,-1), Float)
                self.MapProjectionVector = array( (1,1), Float)			
                self.Scale = 1           
        else:
            self.BoundingBox = None
            self.ViewPortCenter= array( (0,0), Float)
            self.TransformVector = array( (1,-1), Float)
            self.MapProjectionVector = array( (1,1), Float)			
            self.Scale = 1       
        #print self.BoundingBox
        self.BoundingBoxDirty = False

    

###############################################################################
###############################################################################
###############################################################################


if 0:
#if __name__ == '__main__':
    
    pass
    #break
    class LayerPanel(wx.Panel):
        def __init__(self, parent, Canvas):
            wx.Panel.__init__(self, parent)


            layer_dict = {}

            ################################################################
            #lns = LineDraw(LineColor='#00F0F0', LineWidth=1)
            #pls = PolygonDraw(LineColor="#00F0F0", LineStyle="Solid", LineWidth=1, FillColor="#00F0F0", FillStyle="Solid")
            #ld = LayerDraw(1, LineStyle=lns, PolygonStyle=pls, SymbolStyle=None)
            #ld.Open(r'bkk_v7.dgn', "select * from elements where level=40")        
            #Canvas.AddLayer(ld)
            #layer_dict['แม่น้ำ'] = ld

            
            ################################################################
            ls = LineDraw(LineColor='red', LineWidth=2)    
            pls = PolygonDraw( LineColor="#FF0000", LineStyle="Solid", LineWidth=2, FillColor="#FFB6B6",FillStyle="Solid")
            ld = LayerDraw(2, LineStyle=ls, PolygonStyle=pls, TextStyle=None)
            ld.Open(r'bkk_v7.dgn', "select * from elements where level=30")        
            Canvas.AddLayer(ld)
            layer_dict['ถนนสายหลัก'] = ld
            
            ################################################################
            #ls = LineDraw(LineColor='green', LineWidth=1)    
            ##pls = PolygonDraw( LineColor="#FF0000", LineStyle="Solid", LineWidth=2, FillColor="#FFB6B6",FillStyle="Solid")
            #ld = LayerDraw(2, LineStyle=ls, PolygonStyle=None, SymbolStyle=None)
            #ld.Open(r'bkk_v7.dgn', "select * from elements where level=31")        
            #Canvas.AddLayer(ld)
            #layer_dict['ถนนสายรอง'] = ld

            ################################################################
            #ls = LineDraw(LineColor='red', LineWidth=2)    
            #pls = PolygonDraw( LineColor="#FF0000", LineStyle="Solid", LineWidth=2, FillColor="#FFB6B6",FillStyle="Solid")
            
            #dc = wx.ScreenDC()
            #ScreenPPI = dc.GetPPI()[0] # Assume square pixels
            #del dc

            #Size = 8 #int(round(72.0 * 10 / ScreenPPI))

            #font = wx.Font(Size, wx.FONTFAMILY_SWISS, wx.NORMAL, wx.NORMAL, False, "Tahoma", wx.FONTENCODING_CP874)

            #ss = SymbolDraw(-1, font)

            #ld = LayerDraw(10, LineStyle=ls, PolygonStyle=pls, SymbolStyle=ss)
            #ld.Open(r'bkk_v7.dgn', "select * from elements where level=26")
            #Canvas.AddLayer(ld)
            #layer_dict['ชื่อแม่น้ำ'] = ld

            ################################################################
            
            self.layer_dict = layer_dict


            txt = wx.StaticText(self, -1, u"ชั้นข้อมูล", (8, 10))

            self._Canvas = Canvas

            lb = wx.CheckListBox(self, -1, (10, 10), (100,300), layer_dict.keys())
            self.Bind(wx.EVT_LISTBOX, self.EvtListBox, lb)
            self.Bind(wx.EVT_CHECKLISTBOX, self.EvtCheckListBox, lb)
            #lb.SetSelection(0)
            self.lb = lb
            
            box = wx.BoxSizer(wx.VERTICAL)
            box.Add(txt, 0, wx.ALL | wx.ALIGN_CENTER | wx.GROW, 0)
            box.Add(lb, 0, wx.ALL | wx.ALIGN_CENTER | wx.GROW, 0)
            

            #btn_up = wx.Button(self, -1, "Up")
            #btn_dw = wx.Button(self, -1, "Down")
            #box2 = wx.BoxSizer(wx.HORIZONTAL)
            #box2.Add(btn_up, 0, wx.ALL | wx.ALIGN_CENTER | wx.GROW, 0)
            #box2.Add(btn_dw, 0, wx.ALL | wx.ALIGN_CENTER | wx.GROW, 0)
            
            #box.Add(box2, 0, wx.ALL | wx.ALIGN_CENTER | wx.GROW, 0)
            box.Fit(self)
            self.SetSizer(box)
            
            
            

        def EvtListBox(self, event):
            #self.log.WriteText('EvtListBox: %s\n' % event.GetString())
            pass

        def EvtCheckListBox(self, event):
            index = event.GetSelection()
            label = self.lb.GetString(index)
            #status = 'un'
            #if self.lb.IsChecked(index):

            #    status = ''
            #else:
            try:
                self.layer_dict[label].SetVisible(self.lb.IsChecked(index))
                self._Canvas.Draw()
            except:
                pass
            #self.log.WriteText('Box %s is %schecked \n' % (label, status))
            self.lb.SetSelection(index)    # so that (un)checking also selects (moves the highlight)

            

    class MainSplitter(wx.SplitterWindow):
        def __init__(self, parent, ID, max_size):
            wx.SplitterWindow.__init__(self, parent, ID, style = wx.SP_LIVE_UPDATE )
            
            self.max_size = max_size
            self.Bind(wx.EVT_SPLITTER_SASH_POS_CHANGING, self.OnSashChanging)

        def OnSashChanging(self, evt):
            pass
            #if evt.GetSashPosition() < self.max_size:
            #    evt.SetSashPosition(-1)

    class SubSplitter(wx.SplitterWindow):
        def __init__(self, parent, ID, max_size):
            wx.SplitterWindow.__init__(self, parent, ID, style = wx.SP_LIVE_UPDATE )
            
            self.max_size = max_size
            self.Bind(wx.EVT_SPLITTER_SASH_POS_CHANGING, self.OnSashChanging)

        def OnSashChanging(self, evt):
            pass
            #if evt.GetSashPosition() > self.max_size:
            #evt.SetSashPosition(-200)


    #---------------------------------------------------------------------------

    ID_ZOOM_IN_BUTTON = wx.NewId()
    ID_ZOOM_OUT_BUTTON = wx.NewId()
    ID_ZOOM_TO_FIT_BUTTON = wx.NewId()
    ID_MOVE_MODE_BUTTON = wx.NewId()
    ID_POINTER_BUTTON = wx.NewId()

    import Resources
    import inspect



    class MapPanel(wx.Panel):
        """
        NavCanvas.py

        """ 
        
        def __init__(self, parent, id = -1,
                     size = wx.DefaultSize,
                     StatusFnc = None,
                     **kwargs): # The rest just get passed into FloatCanvas

            wx.Panel.__init__( self, parent, id, wx.DefaultPosition, size)

            ## Create the vertical sizer for the toolbar and Panel
            box = wx.BoxSizer(wx.VERTICAL)
            box.Add(self.BuildMapToolbar(), 0, wx.ALL | wx.ALIGN_LEFT | wx.GROW, 0)

            main_split = MainSplitter(self, -1, 150)
            
            sub_split = SubSplitter(main_split, -1, -200)

            
            self.Canvas = MapCanvas(sub_split, wx.NewId(),
                                       size = wx.DefaultSize,
                                       **kwargs)
            map_panel = self.Canvas

            #linelist = Open(r'bkk_v7.dgn', "select * from elements where level=37")
            #highway = LineList( linelist, LineColor='dark green', LineWidth=3 )
            #highway.SetVisible(False)
            #map_panel.AddObject(highway)

            #sub_split._Canvas = self.Canvas

            layer_panel = LayerPanel( main_split, map_panel )

            control_panel = wx.Window(sub_split, style=wx.BORDER_NONE)
            control_panel.SetBackgroundColour("sky blue")
            wx.StaticText(control_panel, -1, "Control Panel", (5,5))

            sub_split.SetMinimumPaneSize(50)
            sub_split.SplitHorizontally(map_panel, control_panel, -200)

            main_split.SetMinimumPaneSize(50)
            main_split.SplitVertically(layer_panel, sub_split, 150)
            
            box.Add(main_split,1,wx.GROW)
            box.Fit(self)
            self.SetSizer(box)

            # default to Mouse mode
            self.ToolBar.ToggleTool(ID_POINTER_BUTTON,1)
            self.SetMode("Mouse")
            self.SetProjectionFun(None)
            self.SetInvProjectionFun(None)
            self.Cursor = None
            
            
            if inspect.isfunction(StatusFnc):
                self.StatusFnc = StatusFnc
                EVT_MOTION(self.Canvas, self.OnMove ) 

            #EVT_LEFT_UP(self.Canvas, self.OnLeftUp ) 
            #EVT_RIGHT_UP(self.Canvas, self.OnRightUp )
            #EVT_ENTER_WINDOW(self.Canvas, self.OnEnter)
            #EVT_LEAVE_WINDOW(self.Canvas, self.OnLeave)
            
            return None
        
        def __getattr__(self, name):
            """
            Delegate all extra methods to the Canvas
            """
            attrib = getattr(self.Canvas, name)
            ## add the attribute to this module's dict for future calls
            self.__dict__[name] = attrib
            return attrib

        def BuildMapToolbar(self):

            tb = wx.ToolBar(self,-1 , style=wx.TB_HORIZONTAL | wx.NO_BORDER | wx.TB_FLAT | wx.TB_TEXT)
            self.ToolBar = tb
            
            tb.SetToolBitmapSize((23,23))
            
            #tb.AddControl(wxStaticText(tb, -1, "Map Control",wxDefaultPosition, wxDefaultSize))
            #tb.AddSeparator()
            #tb.AddSeparator()
            #tb.AddSeparator()
            #tb.AddSeparator()

            #bmp = wx.ArtProvider_GetBitmap("wxART_NORMAL_FILE", "wx.ART_TOOLBAR_C", (16,16))
            #if not bmp.Ok(): bmp = wxEmptyBitmap(23,23)
            ##tb.AddTool(ID_NEW_MAP_BUTTON, Resources.getNewBitmap(), isToggle=False, shortHelpString = "New Map")
            #tb.AddTool(ID_NEW_MAP_BUTTON, bmp, isToggle=False, shortHelpString = "New Map")
            #wx.EVT_TOOL(self, ID_NEW_MAP_BUTTON, self.NewMap)

            #bmp = wx.ArtProvider_GetBitmap("wxART_FILE_OPEN", "wx.ART_TOOLBAR_C", (16,16))
            #if not bmp.Ok(): bmp = wxEmptyBitmap(23,23)
            ##tb.AddTool(ID_OPEN_MAP_BUTTON, Resources.getOpenBitmap(), isToggle=False, shortHelpString = "Open Map")
            #tb.AddTool(ID_OPEN_MAP_BUTTON, bmp, isToggle=False, shortHelpString = "Open Map")
            #wx.EVT_TOOL(self, ID_OPEN_MAP_BUTTON, self.OpenMap)

            tb.AddTool(ID_POINTER_BUTTON, Resources.GetPointerBitmap(), isToggle=True, shortHelpString = "Pointer")
            wx.EVT_TOOL(self, ID_POINTER_BUTTON, self.SetToolMode)

            tb.AddTool(ID_ZOOM_IN_BUTTON, Resources.GetPlusBitmap(), isToggle=True, shortHelpString = "Zoom In")
            wx.EVT_TOOL(self, ID_ZOOM_IN_BUTTON, self.SetToolMode)
            
            tb.AddTool(ID_ZOOM_OUT_BUTTON, Resources.GetMinusBitmap(), isToggle=True, shortHelpString = "Zoom Out")
            wx.EVT_TOOL(self, ID_ZOOM_OUT_BUTTON, self.SetToolMode)
            
            tb.AddTool(ID_MOVE_MODE_BUTTON, Resources.GetHandBitmap(), isToggle=True, shortHelpString = "Move")
            wx.EVT_TOOL(self, ID_MOVE_MODE_BUTTON, self.SetToolMode)
            
            tb.AddSeparator()
            
            tb.AddControl(wx.Button(tb, ID_ZOOM_TO_FIT_BUTTON, "Zoom To Fit",wx.DefaultPosition, wx.DefaultSize))
            wx.EVT_BUTTON(self, ID_ZOOM_TO_FIT_BUTTON, self.ZoomToFit)
            
            #tb.AddSeparator()
            #tb.AddControl(wxButton(tb, ID_LAYER_BUTTON, "Layer",wxDefaultPosition, wxDefaultSize))
            #EVT_BUTTON(self, ID_LAYER_BUTTON, self.OnLayer)

            #tb.AddSeparator()
            
            #tb.AddTool(ID_FLAT_BUTTON, Resources.getFlatBitmap(), isToggle=True, shortHelpString = "FlatEarth")
            #EVT_TOOL(self, ID_FLAT_BUTTON, self.SetProjectionMode)
            
            #tb.AddTool(ID_FLAT_BUTTON, Resources.getPlanBitmap(), isToggle=True, shortHelpString = "FlatEarth")

            tb.Realize()
            S = tb.GetSize()
            tb.SetSizeHints(S[0],S[1])
            return tb

        

        def _ClrToolMode(self):
            for id in [ID_ZOOM_IN_BUTTON,
                       ID_ZOOM_OUT_BUTTON,
                       ID_MOVE_MODE_BUTTON,
                       ID_POINTER_BUTTON]:
                self.ToolBar.ToggleTool(id,0)

        def SetToolMode(self,event):
            evtId = event.GetId() 
            self._ClrToolMode()
            self.ToolBar.ToggleTool(evtId,1)
            if evtId == ID_ZOOM_IN_BUTTON:
                self.Canvas.SetMode("ZoomIn")
                #cursor = Plus_Cursor
            elif evtId == ID_ZOOM_OUT_BUTTON:
                self.Canvas.SetMode("ZoomOut")
                #cursor = Minus_Cursor
            elif evtId == ID_MOVE_MODE_BUTTON:
                self.Canvas.SetMode("Move")
                #cursor = Hand_Cursor
            elif evtId == ID_POINTER_BUTTON:
                self.Canvas.SetMode("Mouse")
                #cursor = wxStockCursor(wxCURSOR_ARROW)
            #else:
                #cursor = wxStockCursor(wxCURSOR_ARROW)

            # set the cursor for the window
            #self.Canvas.SetCursor(cursor)
            #self._ClrWaypointMode()
            self.WaypointMode = None
        
        
        
        def ZoomToFit(self, event):
            self.Canvas.ZoomToBB()

        

        def OnMove(self, event):
            if self.StatusFnc:
                self.StatusFnc(coords=event.GetCoords(), pos=event.GetPosition(), scale=self.Canvas.Scale)


    ###############################################################################
    ###############################################################################
    ###############################################################################

    #---------------------------------------------------------------------------

    def _test_mapcanvas():
        
        class DrawFrame(wx.Frame):

            def __init__(self,parent, id,title,position,size):
                wx.Frame.__init__(self,parent, id,title,position, size)
                MenuBar = wx.MenuBar()

                file_menu = wx.Menu()
                item0 = file_menu.Append(-1, "&ZoomToFit","Zoom to fit")
                self.Bind(wx.EVT_MENU, self.ZoomToFit, item0)
                item = file_menu.Append(-1, "&Close","Close this frame")
                self.Bind(wx.EVT_MENU, self.OnQuit, item)
                MenuBar.Append(file_menu, "&File")

                draw_menu = wx.Menu()

           
                self.SetMenuBar(MenuBar)

                # Add the Canvas

                #self.Canvas = FloatCanvas(self, -1, (500,500), BackgroundColor = "BLACK")

                self.Canvas = MapPanel(self, -1, (500,500), BackgroundColor = "white")


                #linelist = Open(r'bkk_v7.dgn', "select * from elements where level=11")

                #linelist = array([[[0,0], [100,100]]], Float)
                #l = LineList( linelist, LineColor='Red', LineWidth=3 )
                #lay = LayerObject('Road', l)
      
                #self.Canvas.AddObject(l)
                #self.Canvas.ZoomToBB()
                wx.EVT_CLOSE(self, self.OnCloseWindow)

                
                return None

            def OnQuit(self,event):
                self.Close(True)

            def OnCloseWindow(self, event):
                self.Destroy()
            
            def ZoomToFit(self, event):
                self.Canvas.ZoomToBB()

        class DemoApp(wx.App):

            def __init__(self, *args, **kwargs):
                wx.App.__init__(self, *args, **kwargs)

            def OnInit(self):
                wx.InitAllImageHandlers()
                #DrawFrame = BuildDrawFrame()
                frame = DrawFrame(None, -1, "MapCanvas Demo App",wx.DefaultPosition,(700,700))

                self.SetTopWindow(frame)
                frame.Show()

                return True

        app = DemoApp(False)# put in True if you want output to go to it's own window.
        app.MainLoop()


    #_test_num()

    #test_wkb()

    #_test_line()

    _test_mapcanvas()