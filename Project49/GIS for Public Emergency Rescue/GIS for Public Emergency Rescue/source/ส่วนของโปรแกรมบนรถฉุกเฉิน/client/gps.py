#!C:/Python23/python.exe
# -*- coding: CP874 -*-

from serial import *
import thread
from time import sleep
import wx
def convert(n ):
    d = int(n)
    m = n-d
    #d,m = divmod(n,1)
    m = (m/6.0) * 10
    return d+m

INVALID = 0
VALID   = 1
FAILURE = 2

class GPSThread:
    
    def __init__(self, UpdateFunc,  waittime=0.0, log= None):
        
        self.log = log
        self.keepGoing = False
        self.running = False

        #self.gps = GPSObj
        self.UpdateFunc = UpdateFunc
        self.waittime = waittime

    def Start(self):
        self.keepGoing = self.running = True
        thread.start_new_thread(self.Run, ())

    def Stop(self):
        self.keepGoing = False
 
    def Run(self):
        #if self.gps is None:
        #    self.keepGoing = False
        #    self.running = False
        #    return
        #elif (hasattr(self.gps,'IsOpen') and self.gps.IsOpen()):
        #    try:
        #        self.gps.open()
        #    except:            
        #        self.keepGoing = False
        #        self.running = False
        #        return
        
        if (hasattr(self,'isOpen') and not self.isOpen()):
            try:
                self.open()
            except:            
                self.keepGoing = False
                self.running = False
                return

        ReadLine = self.readline
        UpdateFunc = self.UpdateFunc
        wait = self.waittime
        log = self.log
        while self.keepGoing:
            try:
                line = ReadLine()
                if log:
                    log.write(line)
                    #log.write('\n')

                if line[1:6] == 'GPGGA':
                    line = line.split(',')
                    if UpdateFunc is not None:
                        if line[6] == '1':
                            Coor = [convert(float(line[4])/100), convert(float(line[2]) / 100), float(line[9]) ]          
                            UpdateFunc(VALID, Coor)
                              

                        else:
                            UpdateFunc(INVALID, None)
                    sleep(wait)
                #else:
                #    self.keepGoing = False
            except:
                try:
                    Update(FAILURE, None)
                    self.keepGoing = False
                except:
                    pass
            
        self.running = False

    def IsRunning(self):
        return self.running

    
    def __del__(self):
        """ 
        Close port before kill object for fix error in prolific driver
        """
        if self.running:
            self.Stop()
            sleep(0.1)

        #if self.gps and self.gps.isOpen():
        #    try:
        #        self.gps.close()
        #    except:
        #        pass
        if self.isOpen():
            try:
                self.close()
            except:
                pass


class GPSReceiver(Serial, GPSThread):
    
    def __init__(self, port, UpdateFunc=None, log=None):

        GPSThread.__init__(self, UpdateFunc, 0, log)
        Serial.__init__(self, port=port, 
                        baudrate=4800, 
                        bytesize=EIGHTBITS, 
                        parity=PARITY_NONE,
                        stopbits=STOPBITS_ONE,
                        timeout=None,
                        xonxoff=0, 
                        rtscts=0)
        
    def __del__(self):
        GPSThread.__del__(self)
        if hasattr(self, 'log') and self.log:
            self.log.close()

class GPSFile(GPSThread):
    
    def __init__(self, filename, UpdateFunc=None, waittime=1.0):
        GPSThread.__init__(self, UpdateFunc, waittime)
        self._fpt = open(filename)

        
    def isOpen(self):
        return (self._fpt is None) or (not self._fpt.closed)

    def __getattr__(self, name):
        #print name
        #if name == 'IsOpen':
        #    return self.IsOpen
        #else:
        self.__dict__[name] = getattr(self._fpt, name)
        return self.__dict__[name]

    #def __setattr__(self, name, value):
    #    setattr(self._fpt, name, value)
    

class GPSSetupDlg(wx.Dialog):
    def __init__(
            self, parent, ID,
            online_flag = True, com_port="COM1", 
            log_flag = False, log_file = "",
            off_file = ""
            ):

        pre = wx.PreDialog()
        pre.SetExtraStyle(wx.DIALOG_EX_CONTEXTHELP)
        pre.Create(parent, ID, "GPS Setup", size= (400, 400))

        self.PostCreate(pre)

        # Now continue with the normal construction of the dialog
        # contents
        sizer = wx.BoxSizer(wx.VERTICAL)        
        self.online_radio = wx.RadioButton( self, 10, "Online Mode", style = wx.RB_GROUP )
        
        sizer.Add( self.online_radio, 0, wx.ALIGN_LEFT|wx.ALL, 5 )
        
        self.online_radio.SetValue(online_flag)

        online_grid = wx.FlexGridSizer( 0, 2, 0, 0 )


        self.online_ctrls = []

        port = wx.StaticText( self, -1, "GPS port" )
        
        port_list = ['COM1', 'COM2', 'COM3', 'COM4', 'COM5', 'COM6', 'COM7']
        port_cb = wx.ComboBox( self, -1, "COM1", choices=port_list, style=wx.CB_DROPDOWN)
        port_cb.SetValue(com_port)
        self.port_cb = port_cb
        log = wx.CheckBox( self, -1, "Log" )
        log.SetValue(log_flag)
        self.log = log
        self.textlog = wx.TextCtrl( self, -1, log_file)
        self.textlog.SetValue(log_file)
        self.textlog.Enable(not log_flag)
        
        online_grid.Add( port, 0, wx.ALIGN_LEFT|wx.LEFT|wx.RIGHT|wx.TOP, 5 )
        online_grid.Add( port_cb, 0, wx.ALIGN_LEFT|wx.LEFT|wx.RIGHT|wx.TOP, 5 )
        online_grid.Add( log, 0, wx.ALIGN_LEFT|wx.LEFT|wx.RIGHT|wx.TOP, 5 )
        online_grid.Add( self.textlog, 0, wx.ALIGN_CENTRE|wx.LEFT|wx.RIGHT|wx.TOP, 5 )

        self.online_ctrls.append(port_cb)
        self.online_ctrls.append(log)
        self.online_ctrls.append(self.textlog)
             
        self.Bind(wx.EVT_CHECKBOX, self.OnLog, log)


        for ctrl in self.online_ctrls:
            ctrl.Enable(True)
        
        sizer.Add( online_grid, 0, wx.ALIGN_CENTRE|wx.ALL, 5 )
    
        offline_radio = wx.RadioButton( self, 11, "Offline Mode")
        sizer.Add( offline_radio, 0, wx.ALIGN_LEFT|wx.ALL, 5 )
        offline_grid = wx.FlexGridSizer( 0, 2, 0, 0 )
        #offline_grid = wx.BoxSizer(wx.VERTICAL)
        self.offline_radio = offline_radio

        self.offline_ctrls = []
        
        
        self.textfile = wx.TextCtrl( self, -1, "")
        self.textfile.SetValue(off_file)
        browse = wx.Button( self, -1, "Browse")

        offline_grid.Add( self.textfile, 0, wx.ALIGN_CENTRE|wx.LEFT|wx.RIGHT|wx.TOP, 5 )
        offline_grid.Add( browse, 0, wx.ALIGN_CENTRE|wx.LEFT|wx.RIGHT|wx.TOP, 5 )
        
        self.offline_ctrls.append(self.textfile)
        self.offline_ctrls.append(browse)
        
        for ctrl in self.offline_ctrls:
            ctrl.Enable(False)

        #offline_grid.Add( browse, 0,  wx.ALIGN_CENTRE|wx.LEFT|wx.RIGHT|wx.TOP, 5 )

        self.Bind(wx.EVT_BUTTON, self.OnBrowse, browse)
        browse.SetDefault()

        #offline_box.Add( offline_grid, 0, wx.ALIGN_CENTRE|wx.ALL, 5 )
        sizer.Add( offline_grid, 0, wx.ALIGN_CENTRE|wx.ALL, 5 )
        
        
        #self.radios = [online_radio, offline_radio]

        self.Bind(wx.EVT_RADIOBUTTON, self.OnRadioSelect, self.online_radio )
        self.Bind(wx.EVT_RADIOBUTTON, self.OnRadioSelect, self.offline_radio )


        btnsizer = wx.StdDialogButtonSizer()
        
        if wx.Platform != "__WXMSW__":
            btn = wx.ContextHelpButton(self)
            btnsizer.AddButton(btn)
        
        btn = wx.Button(self, wx.ID_OK)
        btn.SetDefault()
        btnsizer.AddButton(btn)

        btn = wx.Button(self, wx.ID_CANCEL)
        btnsizer.AddButton(btn)
        btnsizer.Realize()

        sizer.Add(btnsizer, 0, wx.ALIGN_CENTER_VERTICAL|wx.ALL, 5)

        self.SetSizer(sizer)
        sizer.Fit(self)
    

    def OnLog(self, event):
        if event.IsChecked():
            self.textlog.Enable(True)
            dlg = wx.FileDialog(
                self, message="Choose a file", defaultDir=os.getcwd(), 
                defaultFile="", wildcard="All files (*.*)|*.*", style=wx.OPEN | wx.CHANGE_DIR
                )
            #dlg.CenterOnScreen()
            if dlg.ShowModal() == wx.ID_OK:
                # This returns a Python list of files that were selected.
                paths = dlg.GetPaths()
                self.textlog.WriteText(paths[0])
            dlg.Destroy()
        else:
            self.textlog.Enable(False)
            

    def OnBrowse(self, event):
        
        dlg = wx.FileDialog(
            self, message="Choose a file", defaultDir=os.getcwd(), 
            defaultFile="", wildcard="All files (*.*)|*.*", style=wx.OPEN | wx.CHANGE_DIR
            )
        #dlg.CenterOnScreen()
        if dlg.ShowModal() == wx.ID_OK:
            # This returns a Python list of files that were selected.
            paths = dlg.GetPaths()
            self.textfile.WriteText(paths[0])

        dlg.Destroy()

    def OnRadioSelect(self, event):
        #radio_selected = event.GetEventObject()
        
        if event.GetId() == 10 :
        #if radio_selected == self.radios[0]:
            #online mode
            selected_list = self.online_ctrls
            deselected_list = self.offline_ctrls
        else:
            #offline mode
            deselected_list = self.online_ctrls
            selected_list = self.offline_ctrls

        for ctrl in deselected_list:
            ctrl.Enable(False)
        
        for ctrl in selected_list:
            ctrl.Enable(True)    

if __name__ == '__main__':
    #fpt = open(r'gps2.txt')
    from gdal import *
    from math import radians
    srs1 = osr.SpatialReference()
    srs1.ImportFromEPSG(4326)
    #srs1.SetWellKnownGeogCS("EPGS:4326")
    
    srs2 = osr.SpatialReference()
    srs2.ImportFromEPSG(23947)
    #srs2.SetWellKnownGeogCS("EPGS:4239")
    #srs2.SetUTM(47, True)

    transform = osr.CoordinateTransformation( srs1, srs2)
    trans = transform.TransformPoint

    #print trans( 100.0, 13.0)
    def Update(flag, value):
        #x ,y ,z
        print flag, value

    
    #print fpt.readline()
    #print fpt.readline()

    #gps = GPSThead(fpt, Update, waittime=1.0)
    #gps = GPSFile(r'gps2.txt', Update, 1.0)
    #sleep(2)
    #gps.Start()
    #sleep(8)
    #gps.Stop()
        
    #s = GPSReceiver(4)
    #s.readCommand()
    #s.readCommand()
    #s.readCommand()
    #s.readCommand()
    #s.readCommand()
    #s.close()


    gps = GPSReceiver('COM5', Update)
    gps.Start()
    sleep(2)
    gps.Stop()
    #while True:
    #    pass