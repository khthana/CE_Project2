#!/usr/bin/env python2.3
# -*- coding: CP874 -*-

import urllib2
from Canvas import *
import Resources
import gps
from math import radians, atan
import encodings.cp874
try:
    from gdal import osr
except ImportError:
    try:
        import osr
    except:
        raise ImportError("I could not import OSR")
from Numeric import array,asarray,Float,cos, sin, pi,sum,minimum,maximum,Int32,zeros, ones, concatenate, sqrt, argmin, power, absolute, matrixmultiply, transpose, sometrue, arange, hypot
srs1 = osr.SpatialReference()
srs1.ImportFromEPSG(4326)

srs2 = osr.SpatialReference()
srs2.ImportFromEPSG(32647)


################
class LayerPanel( wx.Panel ):
    
    def __init__( self, gparent, parent, Canvas ):
        wx.Panel.__init__( self, parent )

        self.gparent = gparent
        layer_dict = {}
        lb = wx.CheckListBox( self, -1, ( 10, 10 ), ( 100, 300 ) )
        
        self.layer_dict = layer_dict

        txt = wx.StaticText( self, -1, unicode( "ชั้นข้อมูล", "cp874" ), ( 8, 10 ) )

        self._Canvas = Canvas

        #lb = wx.CheckListBox(self, -1, (10, 10), (100,300))
        #self.Bind(wx.EVT_LISTBOX, self.EvtListBox, lb)
        self.Bind( wx.EVT_CHECKLISTBOX, self.EvtCheckListBox, lb )        
        #lb.SetSelection(0)
        self.listLayerName = ('layer 30', 'layer 31', 'layer 32', 'layer 20', 'layer 56', 'layer 40', 'layer 26', 'layer 15', 'layer 25', 'layer 33' )
        #self.listLayerId = ( 30, 31, 32, 20, 56, 40, 26, 15, 25, 33, 37, 38 )
        self.lb = lb
        self.lb.Insert(unicode('ทางรถไฟ','cp874') , 0)
        self.lb.Insert(unicode('ชื่อสถานที่','cp874') , 0)
        self.lb.Insert(unicode('สิ่งก่อสร้าง','cp874') , 0)
        self.lb.Insert(unicode('ชื่อคลอง','cp874') , 0)
        self.lb.Insert(unicode('แม่น้ำ','cp874') , 0)
        self.lb.Insert(unicode('สะพาน','cp874') , 0)
        self.lb.Insert(unicode('คลอง','cp874') , 0)
        self.lb.Insert(unicode('ซอย','cp874') , 0)
        self.lb.Insert(unicode('ถนนสายรอง','cp874') , 0)
        self.lb.Insert(unicode('ถนนสายหลัก','cp874') , 0)
                
        box = wx.BoxSizer(wx.VERTICAL)
        box.Add(txt, 0, wx.ALL | wx.ALIGN_CENTER | wx.GROW, 0)
        box.Add(lb, 0, wx.ALL | wx.ALIGN_CENTER | wx.GROW, 0)
        
        box.Fit(self)
        self.SetSizer(box)
        self.SetAutoLayout(True)


    def CreateLayer(self, id, layername, LineStyle=None, PolygonStyle=None, TextStyle=None, fillColor='red', lineColor='black'):
        if LineStyle is None:
            LineStyle = LineDraw(LineColor='red', LineWidth=1)
        if PolygonStyle is None:
            PolygonStyle = PolygonDraw( LineColor=lineColor, LineStyle="Solid", LineWidth=1, FillColor=fillColor, FillStyle="Solid")   
        if TextStyle is None:
            TextStyle = TextDraw(-1,wx.Font(8, 
                                            wx.FONTFAMILY_SWISS, 
                                            wx.NORMAL, 
                                            wx.NORMAL, 
                                            False, 
                                            "Tahoma", 
                                            wx.FONTENCODING_CP874))

        layer = LayerDraw( id, LineStyle, PolygonStyle, TextStyle, False)
        self._Canvas.AddLayer(layer)
        self.layer_dict[layername] = layer
        #self.lb.Insert(unicode(layername,'cp874') , 0)
        return layer
    
    def CreateTrack(self, trackname, LineStyle=None,):
        
        if LineStyle is None:
            LineStyle = LineDraw(LineColor='blue', LineWidth=1)
        
        layer = TrackDraw(LineStyle)
        self._Canvas.AddLayer(layer)
        self.layer_dict[trackname] = layer
        return layer
    
    def CreateRequest(self, trackname, LineStyle=None,):
        
        if LineStyle is None:
            LineStyle = LineDraw(LineColor='blue', LineWidth=1)
        
        layer = RequestPoint(LineStyle)
        self._Canvas.AddLayer(layer)
        self.layer_dict[trackname] = layer
        return layer
 
    def GetLeyerByID(self, id):
        for key in self.layer_dict.keys():
            if self.layer_dict[key].id == id :
                return self.layer_dict[key]
        return None

    def GetLayerByName(self, layername):
        try:
            return self.layer_dict[layername]
        except:
            return None

    def RemoveLayerByName( self, layername ):
        try:
            del self.layer_dict[ layername ]
        except:
            pass
        
        try:
            self._Canvas._List.remove( layername )
        except:
            pass

        try:
            self._Canvas._DrawList.remove( layername )
        except:
            pass

    def EvtCheckListBox( self, event ):
        index = event.GetSelection()
        self.lb.SetSelection( index )    # so that (un)checking also selects (moves the highlight)
        
        label = self.listLayerName[ index ]
        
        #label = label.decode('TIS620')
        if not ( self.layer_dict.has_key( label ) ) :
                        
            if label == 'layer 30':
                layer_road = self.CreateLayer( 30, label, LineStyle = LineDraw( LineColor='gold', LineWidth=2 ) )
                layer_road.Open(r'.\map\30-mainroad.tab', parent = self.gparent )
            elif label == 'layer 31':
                layer_road = self.CreateLayer( 31, label, LineStyle = LineDraw( LineColor='#CD853F', LineWidth=1 ) )
                layer_road.Open(r'.\map\31-subroad.tab', parent = self.gparent )
            elif label == 'layer 32':
                layer_road = self.CreateLayer(32, label, LineStyle = LineDraw( LineColor='#F4A460', LineWidth=1 ) )
                layer_road.Open(r'.\map\32-subroad2.tab', parent = self.gparent )
            elif label == 'layer 20':
                layer_road = self.CreateLayer(20, label, LineStyle = LineDraw( LineColor='#87CEEB', LineWidth=1 ) )
                layer_road.Open(r'.\map\20-miniriver.tab', parent = self.gparent )
            elif label == 'layer 56':
                layer_road = self.CreateLayer(56, label, LineStyle = LineDraw( LineColor='#800000', LineWidth=1 ) )
                layer_road.Open(r'.\map\56-bridge.tab', parent = self.gparent )
            elif label == 'layer 40':
                layer_road = self.CreateLayer(40, label, LineStyle = LineDraw( LineColor='blue', LineWidth=1 ), fillColor='blue' )
                layer_road.Open(r'.\map\40-river.tab', parent = self.gparent )
            elif label == 'layer 26':
                layer_road = self.CreateLayer(26, label, LineStyle = LineDraw(LineColor='#00FF00', LineWidth=1) )
                layer_road.Open(r'.\map\26-rivername.tab', parent = self.gparent)
            elif label == 'layer 15':
                layer_road = self.CreateLayer(15, label, LineStyle = LineDraw(LineColor='#8B4513', LineWidth=1), fillColor='#8B4513' )
                layer_road.Open(r'.\map\15-building.tab', parent = self.gparent)
            elif label == 'layer 25':
                layer_road = self.CreateLayer(25, label, LineStyle = LineDraw(LineColor='#800000', LineWidth=1) )
                layer_road.Open(r'.\map\25-placename.tab', parent = self.gparent )
            elif label == 'layer 33':
                layer_road = self.CreateLayer(33, label, LineStyle = LineDraw(LineColor='red', LineWidth=1), fillColor='red' )
                layer_road.Open(r'.\map\33-trainrail.tab', parent = self.gparent)
        
        print label
        if self.lb.IsChecked(index):
            self.layer_dict[label].SetVisible(True)
        else:
            self.layer_dict[label].SetVisible(False)
            
        if self._Canvas is not None:
            self._Canvas.Draw()
        #except:           

class ContrlPanel(wx.Panel):
    
    def __init__(self, ggm, gparent, parent, Canvas):
        wx.Panel.__init__(self, parent, size=(120,120))
        
        self._Canvas = Canvas
        
        # Picture for Button
        self.zoomIntOnOver = wx.Image( "picture/zoomIn.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.zoomIntOnOut = wx.Image( "picture/n_zoomInt.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.zoomOutOnOver = wx.Image( "picture/zoomOut.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.zoomOutOnOut = wx.Image( "picture/n_zoomOut.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.planerOnOver = wx.Image( "picture/planer.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.planerOnOut = wx.Image( "picture/n_planer.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()

        self.upBtnOnOver = wx.Image( "picture/up_btn_over.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.upBtnOnOut = wx.Image( "picture/up_btn_out.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.downBtnOnOver = wx.Image( "picture/down_btn_over.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.downBtnOnOut = wx.Image( "picture/down_btn_out.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.rightBtnOnOver = wx.Image( "picture/right_btn_over.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.rightBtnOnOut = wx.Image( "picture/right_btn_out.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.leftBtnOnOver = wx.Image( "picture/left_btn_over.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.leftBtnOnOut = wx.Image( "picture/left_btn_out.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()

        self.centerBtn = wx.Image( "picture/centerplanbtn.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        
        self.zoomToFitBtnOnOver = wx.Image( "picture/zoomtofit_over.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.zoomToFitBtnOnOut = wx.Image( "picture/zoomtofit_out.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        
        self.acceptBtnPic = wx.Image( "picture/aaccept.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.pocessBtnPic = wx.Image( "picture/aprocess.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.completeBtnPic = wx.Image( "picture/acomplete.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.onlineBtnPic = wx.Image( "picture/aonline.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.offlineBtnPic = wx.Image( "picture/aoffline.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.setupgpsBtnPic = wx.Image( "picture/gps.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.closeBtnPic = wx.Image( "picture/close.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        
        self.nOnline = wx.Image( "picture/nonline.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.nOffline = wx.Image( "picture/noffline.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.naccept = wx.Image( "picture/naccept.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.ncomplete = wx.Image( "picture/ncomplete.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.nprocess = wx.Image( "picture/nprocess.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        
        self.signal = wx.Image( "picture/smile.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()
        self.esignal = wx.Image( "picture/sad.png", wx.BITMAP_TYPE_PNG ).ConvertToBitmap()

        #------------------------------------
        
        status_grid = wx.GridBagSizer(3, 1)
        self.acceptBtn = wx.BitmapButton( self, -1, self.acceptBtnPic, style=0 )
        self.pocessBtn = wx.BitmapButton( self, -1, self.pocessBtnPic, style=0 )
        self.completeBtn = wx.BitmapButton( self, -1, self.completeBtnPic, style=0 )
        
        status_grid.Add( self.acceptBtn, (0,0), flag=wx.EXPAND )
        status_grid.Add( self.pocessBtn, (0,1), flag=wx.EXPAND )
        status_grid.Add( self.completeBtn, (0,2), flag=wx.EXPAND )
        
        self.disText = wx.TextCtrl(self, -1,"Ready",size=(200, 112), style=wx.TE_MULTILINE)
        
        display_grid = wx.GridBagSizer(2, 1)
        display_grid.Add( self.disText, (0,0), flag=wx.EXPAND )
        display_grid.Add( status_grid, (1,0), flag=wx.EXPAND )
        
        setup_grid = wx.GridBagSizer(3, 2)
        self.onlineBtn = wx.BitmapButton( self, -1, self.onlineBtnPic, style=0 )
        self.offlineBtn = wx.BitmapButton( self, -1, self.nOffline, style=0 )
        self.setupgpsBtn = wx.BitmapButton( self, -1, self.setupgpsBtnPic, style=0 )
        self.closeBtn = wx.BitmapButton( self, -1, self.closeBtnPic, style=0 )
        self.signalBtn = wx.BitmapButton( self, -1, self.signal, style=0 )
        
        setup_grid.Add( self.onlineBtn, (0,0), flag=wx.EXPAND )
        setup_grid.Add( self.offlineBtn, (1,0), flag=wx.EXPAND )
        setup_grid.Add( self.setupgpsBtn, (2,0), flag=wx.EXPAND )
        setup_grid.Add( self.signalBtn, (1,1), flag=wx.EXPAND )
        setup_grid.Add( self.closeBtn, (2,1), flag=wx.EXPAND )
        
        main_grid = wx.GridBagSizer(1, 2)
        main_grid.Add( display_grid, (0,0), flag=wx.EXPAND )
        main_grid.Add( setup_grid, (0,1), flag=wx.EXPAND )
        
        self.stop = False

        self.moveupBtn = wx.BitmapButton( self, -1, self.upBtnOnOut, style=0 )
        #moveupBtn = wx.Button(self, -1, "Move Up", size=(60,60))
        self.movedownBtn = wx.BitmapButton( self, -1, self.downBtnOnOut, style=0 )
        self.moveleftBtn = wx.BitmapButton( self, -1, self.leftBtnOnOut, style=0 )
        self.moverightBtn = wx.BitmapButton( self, -1, self.rightBtnOnOut, style=0 )
        
        self.zoomfitBtn = wx.BitmapButton( self, -1, self.zoomToFitBtnOnOut, style=0 )

        #stopBtn = wx.Button(self, -1, "Stop", size=(60,60))
        #self.stopBtn = stopBtn
        self.zoominBtn = wx.BitmapButton( self, -1, self.zoomIntOnOut, style=0 )
        self.zoomoutBtn = wx.BitmapButton( self, -1, self.zoomOutOnOut, style=0 )
        
        gbs = wx.GridBagSizer( 3, 4 )
        
        gbs.Add( self.zoomfitBtn, (1,1), flag=wx.EXPAND )

        gbs.Add( self.moveupBtn, (0,1), flag=wx.EXPAND )
        gbs.Add( self.movedownBtn, (2,1), flag=wx.EXPAND )
        gbs.Add( self.moveleftBtn, (1,0), flag=wx.EXPAND )
        gbs.Add( self.moverightBtn, (1,2), flag=wx.EXPAND )
        
        gbs.Add( self.zoominBtn, (0,3), flag=wx.EXPAND )
        gbs.Add( self.zoomoutBtn, (2,3), flag=wx.EXPAND )        
        #zoom = wx.GridBagSizer(1, 3)
        
##        zoom.Add( self.zoominBtn, (0,0), flag=wx.EXPAND )
##        zoom.Add( self.zoomoutBtn, (1,0), flag=wx.EXPAND )
##        #zoom.Add( self.zoomfitBtn, (2,0), flag=wx.EXPAND )
                
        direct = wx.GridBagSizer(1, 3)

        box = wx.BoxSizer(wx.HORIZONTAL)
        
        box.Add(gbs, 0, wx.ALL | wx.ALIGN_CENTER | wx.GROW, 0)
        box.Add(direct, 0, wx.ALL | wx.ALIGN_CENTER | wx.GROW, 0)
        box.Add(main_grid, 0, wx.ALL | wx.ALIGN_CENTER | wx.GROW, 0)
##        box.Add(zoom, 0, wx.ALL | wx.ALIGN_CENTER | wx.GROW, 0)
                
        box.Fit(self)
        self.SetSizerAndFit(box)

        #self.SetSizer(self.gbs)
        self.SetAutoLayout(True)

        self.Bind(wx.EVT_BUTTON, self.OnMoveUp, self.moveupBtn)
        self.Bind(wx.EVT_BUTTON, self.OnMoveDown, self.movedownBtn)
        self.Bind(wx.EVT_BUTTON, self.OnMoveLeft, self.moveleftBtn)
        self.Bind(wx.EVT_BUTTON, self.OnMoveRight, self.moverightBtn)

        self.Bind(wx.EVT_BUTTON, self.OnZoomIn, self.zoominBtn)
        self.Bind(wx.EVT_BUTTON, self.OnZoomOut, self.zoomoutBtn)
        self.Bind(wx.EVT_BUTTON, self.OnZoomFit, self.zoomfitBtn)
        
        self.Bind(wx.EVT_BUTTON, gparent.OnQuit, self.closeBtn)
        self.Bind(wx.EVT_BUTTON, gparent.OnLine, self.onlineBtn)
        self.Bind(wx.EVT_BUTTON, gparent.OffLine, self.offlineBtn)
        self.Bind(wx.EVT_BUTTON, gparent.SetupGPS, self.setupgpsBtn)
        
        self.Bind(wx.EVT_BUTTON, ggm.OnAccept, self.acceptBtn)
        self.Bind(wx.EVT_BUTTON, ggm.OnPocess, self.pocessBtn)
        self.Bind(wx.EVT_BUTTON, ggm.OnComplete, self.completeBtn)
##        self.Bind(wx.EVT_BUTTON, gparent.SetupGPS, self.setupgpsBtn)
        
        self.BuildToolbar()

    def ZoomInOnOver( self, event ):
        self.zoominBtn.SetBitmapLabel( self.zoomIntOnOver )

    def ZoomInOnOut( self, event ):
        self.zoominBtn.SetBitmapLabel( self.zoomIntOnOut )

    def ZoomOutOnOver( self, event ):
        self.zoomoutBtn.SetBitmapLabel( self.zoomOutOnOver )

    def ZoomOutOnOut( self, event ):
        self.zoomoutBtn.SetBitmapLabel( self.zoomOutOnOut )
    
    def PlanOnOver( self, event ):
        self.btnPlan.SetBitmapLabel( self.planerOnOver )

    def PlanOnOut( self, event ):
        self.btnPlan.SetBitmapLabel( self.planerOnOut )

    def UpBtnOnOver( self, event ):
        self.moveupBtn.SetBitmapLabel( self.upBtnOnOver )
    
    def UpBtnOnOut( self, event ):
        self.moveupBtn.SetBitmapLabel( self.upBtnOnOut )
    
    def DownBtnOnOver( self, event ):
        self.movedownBtn.SetBitmapLabel( self.downBtnOnOver )
    
    def DownBtnOnOut( self, event ):
        self.movedownBtn.SetBitmapLabel( self.downBtnOnOut )

    def RightBtnOnOver( self, event ):
        self.moverightBtn.SetBitmapLabel( self.rightBtnOnOver )
    
    def RightBtnOnOut( self, event ):
        self.moverightBtn.SetBitmapLabel( self.rightBtnOnOut )
    
    def LeftBtnOnOver( self, event ):
        self.moveleftBtn.SetBitmapLabel( self.leftBtnOnOver )
    
    def LeftBtnOnOut( self, event ):
        self.moveleftBtn.SetBitmapLabel( self.leftBtnOnOut )
    
    def zToFitBtnOnOver( self, event ):
        self.zoomfitBtn.SetBitmapLabel( self.zoomToFitBtnOnOver )
    
    def zToFitBtnOnOut( self, event ):
        self.zoomfitBtn.SetBitmapLabel( self.zoomToFitBtnOnOut )

    def BuildToolbar(self):
        
        #wx.StaticBitmap( self, -1, self.centerBtn, (5, 5), (115, 115), style=0)
                
        self.zoominBtn.Bind( wx.EVT_ENTER_WINDOW, self.ZoomInOnOver )
        self.zoominBtn.Bind( wx.EVT_LEAVE_WINDOW, self.ZoomInOnOut )

        self.zoomoutBtn.Bind( wx.EVT_ENTER_WINDOW, self.ZoomOutOnOver )
        self.zoomoutBtn.Bind( wx.EVT_LEAVE_WINDOW, self.ZoomOutOnOut )
        
##        self.btnPlan = wx.BitmapButton( self, -1, self.planerOnOut, pos=(150, 85), style=0 )
##        self.btnPlan.SetBitmapLabel( self.planerOnOut )       
##        self.Bind( wx.EVT_BUTTON, self.OnClickPlan, self.btnPlan )
##        self.btnPlan.Bind( wx.EVT_ENTER_WINDOW, self.PlanOnOver )
##        self.btnPlan.Bind( wx.EVT_LEAVE_WINDOW, self.PlanOnOut )

        self.moveupBtn.Bind( wx.EVT_ENTER_WINDOW, self.UpBtnOnOver )
        self.moveupBtn.Bind( wx.EVT_LEAVE_WINDOW, self.UpBtnOnOut )

        self.movedownBtn.Bind( wx.EVT_ENTER_WINDOW, self.DownBtnOnOver )
        self.movedownBtn.Bind( wx.EVT_LEAVE_WINDOW, self.DownBtnOnOut )

        self.moverightBtn.Bind( wx.EVT_ENTER_WINDOW, self.RightBtnOnOver )
        self.moverightBtn.Bind( wx.EVT_LEAVE_WINDOW, self.RightBtnOnOut )

        self.moveleftBtn.Bind( wx.EVT_ENTER_WINDOW, self.LeftBtnOnOver )
        self.moveleftBtn.Bind( wx.EVT_LEAVE_WINDOW, self.LeftBtnOnOut )

        self.zoomfitBtn.Bind( wx.EVT_ENTER_WINDOW, self.zToFitBtnOnOver )
        self.zoomfitBtn.Bind( wx.EVT_LEAVE_WINDOW, self.zToFitBtnOnOut )

    def OnZoomIn(self, event):
        self._Canvas.Zoom(1.5)

    def OnZoomOut(self, event):
        self._Canvas.Zoom(0.7)
    
    def OnZoomFit(self, event):
        self._Canvas.ZoomToBB()
        pass
    
    def OnMoveLeft(self, event):
        self._Canvas.Move((-50,0),'Pixel') 
        
    def OnMoveRight(self, event):
        self._Canvas.Move((50,0),'Pixel')

    def OnMoveUp(self, event):
        self._Canvas.Move((0,-50),'Pixel')

    def OnMoveDown(self, event):
        self._Canvas.Move((0,50),'Pixel')
    
##    def OnStopPath(self, event):
##        self.stop = True
##
#---------------------------------------------------------------------------

ID_ZOOM_IN_BUTTON = wx.NewId()
ID_ZOOM_OUT_BUTTON = wx.NewId()
ID_ZOOM_TO_FIT_BUTTON = wx.NewId()
ID_MOVE_MODE_BUTTON = wx.NewId()
ID_POINTER_BUTTON = wx.NewId()

import Resources
import inspect

class MapPanel( wx.Panel ):
    """
    NavCanvas.py

    """ 
    
    def __init__( self, parent, id = -1,
                 size = wx.DefaultSize,
                 StatusFnc = None,
                 **kwargs ): # The rest just get passed into FloatCanvas

        wx.Panel.__init__( self, parent, id, wx.DefaultPosition, size )

        box = wx.BoxSizer( wx.VERTICAL )

        main_split = wx.SplitterWindow( self, -1, style = wx.SP_LIVE_UPDATE )
        
        sub_split = wx.SplitterWindow( main_split, -1, style = wx.SP_LIVE_UPDATE )
        
        self._Canvas = MapCanvas( sub_split, wx.NewId(),
                                   size = wx.DefaultSize,
                                   **kwargs )
        map_panel = self._Canvas
        
        layer_panel = LayerPanel( parent, sub_split, map_panel )
        self.LayerPanel = layer_panel

        transform = osr.CoordinateTransformation( srs1, srs2 )
        trans = transform.TransformPoint
        
        control_panel = ContrlPanel( self, parent, main_split, map_panel )
        self.control_panel = control_panel
        
        # Update Status to Server
        self.serv_id = ""
        self.car_id = ""
        self.car_status = 0
        layer_track = layer_panel.CreateTrack( 'track 1' )
        self.layer_track = layer_track
        layer_request = layer_panel.CreateRequest('request1')
        self.layer_request = layer_request
        def Update( flag, coor ):
            if flag == gps.VALID:
                x, y, z = trans( coor[0], coor[1] )
                fd = None
                req_str = "http://www.natur.in.th/xml/serv.py/online?car_id="+self.car_id+"&x_pos="+str(x)+"&y_pos="+str(y)
                reqOnline = urllib2.Request(req_str)
                fd = urllib2.urlopen(reqOnline)
                xypoint = fd.read(1024)
                if xypoint != '0':
                    control_panel.signalBtn.SetBitmapLabel(control_panel.esignal)
                    serv_point = xypoint.split(',')
                    self.control_panel.disText.Remove(0,self.control_panel.disText.GetLastPosition())
                    self.control_panel.disText.Replace(0, 0, serv_point[1]+"\nมีผู้เรียก ที่  X-Y : "+serv_point[2]+", "+serv_point[3])
                    layer_request.SetStatus(2)
                    layer_request.AddPoint( (float(serv_point[2]),float(serv_point[3])))#,self.statusFact)                    
                else :
                    if layer_request.pointStatus == 2:# or layer_request.pointStatus == 1:
                        layer_request.SetStatus(0)
                    control_panel.signalBtn.SetBitmapLabel(control_panel.signal)
                    self.control_panel.disText.Remove(0,self.control_panel.disText.GetLastPosition())
                    self.control_panel.disText.Replace(0, 0, "Online \nพร้อม")
                
                layer_track.SetStatus( self.car_status )
                layer_track.AddPoint( ( x, y ) )
                       
        self.Update = Update
        # Update Status to Server
        
        self.direction = 1
        
        sub_split.SetMinimumPaneSize( 50 )
        sub_split.SplitVertically( layer_panel, map_panel, 180 )

        main_split.SetMinimumPaneSize( 50 )
        main_split.SplitHorizontally( sub_split, control_panel, 580 )
        
        box.Add( main_split, 1, wx.GROW )
        box.Fit( self )
        self.SetSizer( box )

        def OnSashChanging( event ):
            event.SetSashPosition( -1 )
            event.Skip()

        self.Bind( wx.EVT_SPLITTER_SASH_POS_CHANGING, OnSashChanging, sub_split )
        self.Bind( wx.EVT_SPLITTER_SASH_POS_CHANGING, OnSashChanging, main_split )

        def OnSize( event ):
            sub_split.SetSashPosition( 180 )
            main_split.SetSashPosition( -180 )
            event.Skip()

        wx.EVT_SIZE( self, OnSize )

        self.SetMode( "Move" )
        self.SetProjectionFun( None )
        self.SetInvProjectionFun( None )
        #self._Canvas.SetCursor(wx.StockCursor(wx.CURSOR_HAND))
        
        if inspect.isfunction( StatusFnc ):
            self.StatusFnc = StatusFnc
            EVT_MOTION( self._Canvas, self.OnMove ) 
        
        EVT_MOUSEWHEEL( self._Canvas, self.OnWheel )
        
        self.SetSpecialMode( "Add" )
        
        return None
    # Update to Server
    def OnAccept( self, event ):
        #print "On Accept"
        self.car_status = 1
        self.control_panel.disText.Remove(0,self.control_panel.disText.GetLastPosition())
        self.control_panel.disText.Replace(0, 0, "ตอบรับภาระกิจ")
                        
        reqOnline = urllib2.Request("http://www.natur.in.th/xml/serv.py/onaccept?car_id="+self.car_id)
        fd = urllib2.urlopen(reqOnline)
        self.serv_id = fd.read(1024)
        self.control_panel.acceptBtn.Disable()
        self.control_panel.completeBtn.Disable()
        self.control_panel.pocessBtn.Enable()
    
    def OnPocess( self, event ):
        #print "On Pocess"
        self.car_status = 2
        self.control_panel.disText.Remove(0,self.control_panel.disText.GetLastPosition())
        self.control_panel.disText.Replace(0, 0, "กำลังปฏิบัติภาระกิจ")
                       
        reqOnline = urllib2.Request("http://www.natur.in.th/xml/serv.py/onprocess?car_id="+self.car_id)
        fd = urllib2.urlopen(reqOnline)
        self.control_panel.acceptBtn.Disable()
        self.control_panel.completeBtn.Enable()
        self.control_panel.pocessBtn.Disable()
    
    def OnComplete( self, event ):
        #print "On Complete"
##        self.layer_request.SetStatus(0)
        self.car_status = 0
        
        self.control_panel.disText.Remove(0,self.control_panel.disText.GetLastPosition())
        self.control_panel.disText.Replace(0, 0, "สิ้นสุดภาระกิจ")
                    
        reqOnline = urllib2.Request("http://www.natur.in.th/xml/serv.py/onready?car_id="+self.car_id+"&serv_id="+self.serv_id)
        fd = urllib2.urlopen(reqOnline)
        print fd.read(1024)
        self.control_panel.acceptBtn.Enable()
        self.control_panel.completeBtn.Disable()
        self.control_panel.pocessBtn.Disable()
        
##        self.LayerPanel.layer_dict['request1'].SetVisible(False)
    
    # Update To Server
                
    def __getattr__( self, name ):
        """
        Delegate all extra methods to the Canvas
        """
        attrib = getattr( self._Canvas, name )
        ## add the attribute to this module's dict for future calls
        self.__dict__[ name ] = attrib
        return attrib

    def OnMove( self, event ):
        
        if self.StatusFnc:
            self.StatusFnc( coords=event.GetCoords(), pos=event.GetPosition(), scale=self._Canvas.Scale )

    def OnWheel( self, event ):
        
        rot = event.GetWheelRotation()
        #Center = event.GetCoords() #self.PixelToWorld( event.GetPosition() )
        if rot < 0:
            self.Zoom(1.5, )
        else:
            self.Zoom(0.6, )
        event.Skip()

    def SetSpecialMode(self, mode):
        self.SMode = mode
 
###############################################################################
###############################################################################
###############################################################################
        
#---------------------------------------------------------------------------

#def _test_mapcanvas():
    
class DrawFrame( wx.Frame ):

    def __init__( self, parent, id, title, position, size ):
        
        wx.Frame.__init__( self, parent, id, title, position, size )
        
        MenuBar = wx.MenuBar()
        
        file_menu = wx.Menu()
        #item = file_menu.Append(-1, "&Save\tF5","Save points")
        #self.Bind(wx.EVT_MENU, self.OnSave, item)
        item = file_menu.Append( -1, "&Close", "Close this frame" )
        self.Bind( wx.EVT_MENU, self.OnQuit, item )
        MenuBar.Append( file_menu, "&File" )

        view_menu = wx.Menu()
        view_zoom = view_menu.Append( -1, "&ZoomToFit", "Zoom to fit" )
        self.Bind( wx.EVT_MENU, self.ZoomToFit, view_zoom )
        MenuBar.Append( view_menu, "&View" )        

        #draw_menu = wx.Menu()
        track_menu = wx.Menu()
        track_gpssetup = track_menu.Append( -1, "GPS Setup", "GPS Setup")
        self.Bind( wx.EVT_MENU, self.SetupGPS, track_gpssetup )
        
        #menu4.Append(402, "digits", "123...", wx.ITEM_CHECK)
        track_startstop = track_menu.Append( -1, "Start/Stop track", "", wx.ITEM_CHECK )
        self.startstop = track_startstop
        self.Bind( wx.EVT_MENU, self.OnStartStop, track_startstop )
##        MenuBar.Append( track_menu, "&Tracking" )
        
        self.SetMenuBar( MenuBar )

        # Add the Canvas
        #self.Canvas = FloatCanvas(self, -1, (500,500), BackgroundColor = "BLACK")

        self.gpsdata = None
        
        sb = self.CreateStatusBar()
        
        sb.SetFieldsCount( 5 )
        sb.SetStatusWidths( [ -2, -2, -1, -1, -3 ] )

        transform = osr.CoordinateTransformation( srs2, srs1 )
        trans = transform.TransformPoint

        def ShowStatus( coords, pos, scale ):
            #x, y, z = trans( coords[0], coords[1] )
            x, y = coords[0], coords[1]

            self.SetStatusText( "X-Y : %.6f, %.6f" %( x, y), 1 )
            self.SetStatusText( "Position : %d, %d" %( pos[0], pos[1] ), 2 )
            self.SetStatusText( "Scale : %.4f" %( scale, ), 3 )

        self.Canvas = MapPanel( self, -1, ( 500, 500 ), BackgroundColor = "WHITE", StatusFnc=ShowStatus )
        
        wx.EVT_CLOSE( self, self.OnCloseWindow )
        
        return None

    def OnSave( self, event ):
    	self.Canvas.point_layer.Save()

    def OnQuit( self, event ):
        self.Close( True )

    def OnCloseWindow( self, event ):
        self.Destroy()
    
    def ZoomToFit( self, event ):
        self.Canvas.ZoomToBB()

    def SetupGPS( self, event ):
        
        #self.Canvas.gpsfile.Start()
        
        #pass
        dlg = gps.GPSSetupDlg( self, -1 )
##        dlg.CenterOnScreen()

        # this does not return until the dialog is closed.
        val = dlg.ShowModal()
    
        if val == wx.ID_OK:
            if self.gpsdata is not None:
                self.gpsdata.Stop()
                self.startstop.Check( False )
                #self.gpsdata.close()
                del self.gpsdata
        
            if dlg.offline_radio.GetValue():            
                txtfile = dlg.textfile.GetValue().replace( '\\', '/' )
                self.gpsdata = gps.GPSFile( txtfile, self.Canvas.Update, 0.05 )
            else:
                #pass
                comport = dlg.port_cb.GetValue()
                if dlg.log.GetValue():
                    logfile = open( dlg.textlog.GetValue(), 'w' )
                else:
                    logfile = None
                self.gpsdata = gps.GPSReceiver( comport, self.Canvas.Update, logfile )
                
                #try:
                #    self.gpsdata.Open()

            if not self.gpsdata.isOpen():
                self.gpsdata = None
            self.startstop.Check( False )
        else:
            self.startstop.Check( False )
            self.gpsdata = None
        dlg.Destroy()
    
    def OnLine( self, event ):
        if self.gpsdata is not None:
            dialog = wx.TextEntryDialog( None,
                "ป้อนรหัสรถ",
                "Login", "", style=wx.OK|wx.CANCEL )
            if dialog.ShowModal() == wx.ID_OK:                
                req_str = "http://www.natur.in.th/xml/serv.py/onlogin?car_id="+dialog.GetValue()
                
                reqOnline = urllib2.Request( req_str )
                fd = urllib2.urlopen( reqOnline )
                result = fd.read( 1024 )
                
                if result != "Not":
                    self.Canvas.car_id = dialog.GetValue()
                    self.gpsdata.Start()
                    self.Canvas.control_panel.offlineBtn.SetBitmapLabel(self.Canvas.control_panel.offlineBtnPic)
                    self.Canvas.control_panel.onlineBtn.SetBitmapLabel(self.Canvas.control_panel.nOnline)
                    retCode = wx.MessageBox("Login ผ่าน", "Login",wx.OK | wx.ICON_QUESTION)
                    self.Canvas.layer_track.SetType(result)
                else :
                    retCode = wx.MessageBox("Login ไม่ผ่าน", "Login",wx.OK | wx.ICON_QUESTION)
            dialog.Destroy()
        else :
            pass
    
    def OffLine( self, event ):
        if self.gpsdata is not None:
            self.gpsdata.Stop()
            self.Canvas.control_panel.offlineBtn.SetBitmapLabel(self.Canvas.control_panel.nOffline)
            self.Canvas.control_panel.onlineBtn.SetBitmapLabel(self.Canvas.control_panel.onlineBtnPic)
        else :
            pass
                        
    def OnStartStop( self, event ):
    
        if self.gpsdata is not None:
            if event.IsChecked():
                self.gpsdata.Start()
                #print "checked"
            else:
                self.gpsdata.Stop()
                #print "unchecked"
        
        else:
            #event.Check(False)
            pass
      
class EmerApp(wx.App):

    def __init__(self, *args, **kwargs):
        wx.App.__init__(self, *args, **kwargs)

    def OnInit(self):
        wx.InitAllImageHandlers()
        #DrawFrame = BuildDrawFrame()
        frame = DrawFrame(None, -1, "[[ Emergency Rescue Client ]]", wx.DefaultPosition, ( 700, 700 ) )
        self.SetTopWindow(frame)
        frame.Show()
        return True

if __name__ == '__main__':
    
    pass
    
    app = EmerApp(False)# put in True if you want output to go to it's own window.
    app.MainLoop()
