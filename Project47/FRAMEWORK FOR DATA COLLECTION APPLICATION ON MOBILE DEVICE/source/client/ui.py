from elementtree import ElementTree, SimpleXMLTreeBuilder
from elementtree.ElementTree import Element
from Pyro import errors
from win32gui import *
from win32con import *
import sys
import time

import remote

def bufferToUnicode(buffer):
  print "create unicode"
  unicodeStr = unicode()
  #print "finished create"
  #print "len = ",len(buffer)
  l = len(buffer)
  #print type(l)
  #print range
  #print buffer[0]
  #print buffer[1]
  #print buffer[2]
  #print buffer[3]
  #print "range = ", range(0, 4, 2)
  #print "range = ", range(10, 2)
  #print "range = ", range(5)
  #print "range = ", range(l, 2)
  for i in range(0, len(buffer), 2):
   # print "i = ", i,
    print buffer[i]
    unicodeStr += buffer[i]
  return unicodeStr

class MainPage(object):
  IDM_OK = 100
  IDM_CHILD_OK = 101
  IDM_STATIC = 102
  IDM_COMBO = 103
  IDM_UPDATE = 104
  IDM_ERROR_STATIC = 105
  Y_MARGIN = 5
  index = 0
  NORMAL_HEIGHT = 18
  OFFSET = 3
  labelStaticDict = {}
  indexEleName = None
  childWindowsDict = {}
  
  def __init__(self, formRoot, dataRoot, dataElementTree, lookupRoot, xmlForm):
    self.lookupRoot = lookupRoot
    self.xmlForm = xmlForm
    self.dataElementTree = dataElementTree
    self.formRoot = formRoot
    self.dataRoot = dataRoot
    self.windowTitle = self.formRoot.attrib['name']
    self.className = time.time()
    self._initComponents()
  
  def _initComponents(self):
    InitCommonControls()
    
    #print "Platform is " + sys.platform
    if sys.platform == "Pocket PC":
      self.hinst = sys.hinst
      className = unicode(self.className)
    else:
      self.hinst = dllhandle
      className = str(self.className)

    wc = WNDCLASS()
    wc.hInstance = self.hinst
    wc.cbWndExtra = 0
    wc.style = CS_HREDRAW | CS_VREDRAW
    wc.hbrBackground = GetStockObject(WHITE_BRUSH)
    wc.lpszClassName = className
    wc.hCursor = LoadCursor( 0, IDC_ARROW )
    wc.lpfnWndProc = {WM_CLOSE:self.onClose, WM_DESTROY:self.onDestroy, WM_QUIT:self.onQuit, 
                      WM_COMMAND:self.onCommand}
    self.classAtom = RegisterClass(wc)
    if sys.platform == "Pocket PC":
      style = WS_VISIBLE 
    else:
      style = WS_OVERLAPPEDWINDOW
      
    self.hwnd = CreateWindow(self.classAtom, self.windowTitle, style, CW_USEDEFAULT,
                             CW_USEDEFAULT , 240, 268, 0, 0, self.hinst, None)
    self.staticHwnd = CreateWindow("STATIC", None, WS_CHILD | WS_VISIBLE | SS_LEFT ,
        5, self.Y_MARGIN, 230, 20, self.hwnd, self.IDM_STATIC, GetWindowLong(self.hwnd, GWL_HINSTANCE), None)
    self.hwndCombobox = CreateWindow("ComboBox", None, WS_VISIBLE | WS_CHILD | CBS_DROPDOWNLIST | WS_VSCROLL,
        5, self.Y_MARGIN+20, 230, 500, self.hwnd, self.IDM_COMBO, GetWindowLong(self.hwnd, GWL_HINSTANCE), None)
    self.hwndButton = CreateWindow("BUTTON", "OK", WS_VISIBLE | WS_CHILD | BS_PUSHBUTTON, 
        100, 240, 44, 20, self.hwnd, self.IDM_OK, GetWindowLong(self.hwnd, GWL_HINSTANCE), None)
    self.hwndButton = CreateWindow("BUTTON", "UPDATE", WS_VISIBLE | WS_CHILD | BS_PUSHBUTTON, 
        180, 240, 55, 20, self.hwnd, self.IDM_UPDATE, GetWindowLong(self.hwnd, GWL_HINSTANCE), None)
    self.errorStaticHwnd = CreateWindow("STATIC", None, WS_CHILD | WS_VISIBLE | SS_LEFT ,
        5, 220, 230, 20, self.hwnd, self.IDM_ERROR_STATIC, GetWindowLong(self.hwnd, GWL_HINSTANCE), None)
    if sys.platform == "Pocket PC":
      label = unicode(self.formRoot.attrib['label'])
    else:
      label = str(self.formRoot.attrib['label'])
    SendMessage(self.staticHwnd, WM_SETTEXT, len(label), label)
    self._additemToCombobox()
    self._createInfoLabel()
    
  def _additemToCombobox(self):
    self.indexEleName = self.formRoot.attrib['match'].split('/')[2]
    indexEleLst = self.dataRoot.findall(self.indexEleName)
    #print indexEleLst
    indexAttribute = self.formRoot.attrib['combobox'][1:]
    self.comboBoxItems = []
    for indexEle in indexEleLst:
      item = indexEle.attrib[indexAttribute]
      self.comboBoxItems.append(item)
      if sys.platform == "Pocket PC":
        SendMessage(self.hwndCombobox, CB_ADDSTRING, 0, unicode(item))
      else:
        SendMessage(self.hwndCombobox, CB_ADDSTRING, 0, str(item))
    
    #print self.comboBoxItems
    #set combobox to first item
    SendMessage(self.hwndCombobox, CB_SETCURSEL, 0, 0)
      
  def _createInfoLabel(self):
    descripList = self.formRoot.findall('description')
    #print descripList
    yLabel = 50
    for descrip in descripList:
      try:
        row = int(descrip.attrib['row'])
      except:
        row = 1
      hWnd = CreateWindow("STATIC", None, WS_CHILD | WS_VISIBLE | SS_LEFT , 5, yLabel, \
        65, self.NORMAL_HEIGHT*row, self.hwnd, self.IDM_STATIC, GetWindowLong(self.hwnd, GWL_HINSTANCE), None)
      label = descrip.attrib['label']
      SendMessage(hWnd, WM_SETTEXT, len(label), unicode(label))
      hWnd = CreateWindow("STATIC", None, WS_CHILD | WS_VISIBLE | SS_LEFT , 70, yLabel, \
        170, self.NORMAL_HEIGHT*row, self.hwnd, self.IDM_STATIC, GetWindowLong(self.hwnd, GWL_HINSTANCE), None)
      
      self.labelStaticDict[descrip.attrib['match'][1:]] = hWnd
      yLabel += self.NORMAL_HEIGHT*row + self.OFFSET
      #print 'yLabel = ', yLabel
      self._updateInfoLabelValue()
      
    
  def _updateInfoLabelValue(self):
    dataEle = self.dataRoot.findall(self.indexEleName)[self.index]
    for match, hWnd in self.labelStaticDict.items():
      try:
        value = dataEle.attrib[match]
        SendMessage(hWnd, WM_SETTEXT, len(value), unicode(value))
      except KeyError:
        print 'Attribute ', match, ' not found'
      
  def _updateValue(self):
    #print 'begin dumping data xml'
    #self.dataElementTree.write(sys.stdout)
    #set dataroot
    #f = file("\\Program Files\\Python\\updatedubc.xml")
    #tb = SimpleXMLTreeBuilder.TreeBuilder()
    #tb.feed(f.read())
    #e = tb.close()
    #ele = ElementTree.ElementTree(e)
    #root = ele.getroot()
    #self.dataElementTree == ele
    #create new MainPage
    '''mainPage = MainPage(self.formRoot, root, ele, self.remoteObj)
    mainPage.showWindow()
    ShowWindow(self.hwnd, SW_HIDE)
    DestroyWindow(self.hwnd)
    del self'''
    #self.dataElementTree = ele
    
    #print 'complete switch window'
    print "update value with server"
    try:
      self.xmlForm.update()
      text = time.strftime("%d/%m/%Y %H:%M:%S")
      text = "Last update time " + text
      print text
      SendMessage(self.errorStaticHwnd, WM_SETTEXT, len(text), unicode(text))
    except:
      text = u"Connection Fail!"
      print text
      SendMessage(self.errorStaticHwnd, WM_SETTEXT, len(text), text)
    #newXml = self.xmlForm.update()
    #print newXml
    
    
  def onCommand(self, hwnd, msg, wparam, lparam):
    message = HIWORD(wparam)
    controlID = LOWORD(wparam)
    if controlID == self.IDM_COMBO:
      if message == CBN_SELCHANGE:
        index = SendMessage(self.hwndCombobox, CB_GETCURSEL, 0, 0)
        self.index = index
        self._updateInfoLabelValue()
        
    if controlID == self.IDM_OK:
      #create child window
      dataEle = self.dataRoot.findall(self.indexEleName)[self.index]
      formEle = self.formRoot.find('form')
      try:
        form = self.childWindowsDict[self.index]
      except KeyError:
        form = Form(formEle, dataEle, self.lookupRoot, self)
        self.childWindowsDict[self.index] = form
      ShowWindow(form.hwnd, SW_SHOW)
      ShowWindow(self.hwnd, SW_HIDE)
    
    if controlID == self.IDM_UPDATE:
      self._updateValue()
  
  def onClose(self, hwnd, msg, wparam, lparam):
    print "on close"
    DestroyWindow(self.hwnd)
    return 0

  def onDestroy(self, hwnd, msg, wparam, lparam):
    PostQuitMessage(0)

  def onQuit(self, hwnd, msg, wparam, lparam):
    pass
    
  def showWindow(self):
      ShowWindow(self.hwnd, SW_SHOW)
      UpdateWindow(self.hwnd)
      PumpMessages()
  
class Form(object):
  yPos = 5
  IDM_BACK = 100
  NORMAL_HEIGHT = 18
  OFFSET = 3
  
  def __init__(self, formEle, dataEle, lookupRoot, parentWindow):
    self.lookupRoot = lookupRoot
    self.childWindowdict = {}
    self.childFormDict = {}
    self.currentControlID = 200
    self.parentWindow = parentWindow
    #self.className = parentWindow.className + '.' + dataEle.attrib['id']
    self.className = time.time()
    #print self.className
    self.windowTitle = formEle.attrib['name']
    self.formEle = formEle
    self.dataEle = dataEle
    self._initComponents()
    self._constructFormControls()
    
  def _initComponents(self):
    InitCommonControls()
    
    if sys.platform == "Pocket PC":
      self.hinst = sys.hinst
      className = unicode(self.className)
    else:
      self.hinst = dllhandle
      className = str(self.className)

    wc = WNDCLASS()
    wc.hInstance = self.hinst
    wc.cbWndExtra = 0
    wc.style = CS_HREDRAW | CS_VREDRAW
    wc.hbrBackground = GetStockObject(WHITE_BRUSH)
    wc.lpszClassName = className
    wc.hCursor = LoadCursor( 0, IDC_ARROW )
    wc.lpfnWndProc = {WM_CLOSE:self.onClose, WM_DESTROY:self.onDestroy, 
                      WM_QUIT:self.onQuit, WM_COMMAND:self.onCommand}
    self.classAtom = RegisterClass(wc)
    if sys.platform == "Pocket PC":
      style = WS_VISIBLE 
    else:
      style = WS_OVERLAPPEDWINDOW
      
    self.hwnd = CreateWindow(self.classAtom, self.windowTitle, style, CW_USEDEFAULT, \
      CW_USEDEFAULT , 240, 268, 0, 0, self.hinst, None)
    
    self.hwndBackButton = CreateWindow("BUTTON", "Back", WS_VISIBLE | WS_CHILD | BS_PUSHBUTTON, \
      100, 240, 44, 20, self.hwnd, self.IDM_BACK, GetWindowLong(self.hwnd, GWL_HINSTANCE), None)
    
  def _constructFormControls(self):
    childFormLst = self.formEle.getchildren()
    for childEle in childFormLst:
      label = childEle.attrib['label']
      try:
        row = int(childEle.attrib['row'])
        height = self.NORMAL_HEIGHT*row
        if row > 1:
          editStyle = WS_CHILD | WS_VISIBLE | ES_LEFT | ES_AUTOHSCROLL | ES_MULTILINE | WS_BORDER
      except KeyError:
        height = self.NORMAL_HEIGHT
        editStyle = WS_CHILD | WS_VISIBLE | ES_LEFT | ES_AUTOHSCROLL | WS_BORDER
      if str(childEle.tag) == "form":
        hWnd = CreateWindow("STATIC", None, WS_CHILD | WS_VISIBLE | SS_LEFT, 5, self.yPos+2, \
          230, self.NORMAL_HEIGHT, self.hwnd, 0, GetWindowLong(self.hwnd, GWL_HINSTANCE), None)
        self.yPos += self.NORMAL_HEIGHT+self.OFFSET
      else:
        hWnd = CreateWindow("STATIC", None, WS_CHILD | WS_VISIBLE | SS_LEFT , 5, self.yPos+2, \
        75, height, self.hwnd, 0, GetWindowLong(self.hwnd, GWL_HINSTANCE), None)
      SendMessage(hWnd, WM_SETTEXT, len(label), unicode(label))
     
      if str(childEle.tag) == "static":
        hWnd = CreateWindow("STATIC", None, WS_CHILD | WS_VISIBLE | SS_LEFT , 80, self.yPos+2, \
          155, height, self.hwnd, self.currentControlID, GetWindowLong(self.hwnd, GWL_HINSTANCE), None)
        match = childEle.attrib['match'][1:]
        try:
          value = self.dataEle.attrib[match]
          SendMessage(hWnd, WM_SETTEXT, len(value), unicode(value))
        except KeyError:
          print 'Attribute ', match, ' not found'
      elif str(childEle.tag) == "edit":
        hWnd = CreateWindow("EDIT", None, editStyle, 80, self.yPos, 155, height, \
          self.hwnd, self.currentControlID, GetWindowLong(self.hwnd, GWL_HINSTANCE), None)
        match = childEle.attrib['match'][1:]
        try:
          value = self.dataEle.attrib[match]
          SendMessage(hWnd, WM_SETTEXT, len(value), unicode(value))
        except KeyError:
          print 'Attribute ', match, ' not found'
      elif str(childEle.tag) == "form":
        hWnd = CreateWindow("ComboBox", None, WS_VISIBLE | WS_CHILD | CBS_DROPDOWNLIST | WS_VSCROLL,
          5, self.yPos, 230, 100, self.hwnd, self.currentControlID, GetWindowLong(self.hwnd, GWL_HINSTANCE), None)
        comboChildEleName = childEle.attrib['match']
        indexAttributeName = childEle.attrib['combobox'][1:]
        for comboChildEle in self.dataEle.findall(comboChildEleName):
          value = comboChildEle.attrib[indexAttributeName]
          SendMessage(hWnd, CB_ADDSTRING, 0, unicode(value))
        try:
          #print 'in try'
          value = childEle.attrib['addtext']
          #print 'value = ', value
          SendMessage(hWnd, CB_ADDSTRING, 0, unicode(value))
        except KeyError:
          pass
        self.childFormDict[label] = {}
      elif str(childEle.tag) == "lookup":
        hWnd = CreateWindow("ComboBox", None, WS_VISIBLE | WS_CHILD | CBS_DROPDOWNLIST | WS_VSCROLL,
          80, self.yPos, 155, 100, self.hwnd, self.currentControlID, GetWindowLong(self.hwnd, GWL_HINSTANCE), None)
        path = childEle.attrib['from']
        target = path.split('/').pop()
        for item in self.lookupRoot.findall(target):
          value = item.text
          SendMessage(hWnd, CB_ADDSTRING, 0, unicode(value))
        
      self.childWindowdict[label] = [hWnd, self.currentControlID]
      self.currentControlID += 1
      self.yPos += height+self.OFFSET
    
  def onCommand(self, hwnd, msg, wparam, lparam):
    message = HIWORD(wparam)
    controlID = LOWORD(wparam)
    if controlID == self.IDM_BACK:
      #update data element value
      #print 'edit ele num = ', len(self.formEle.findall('edit'))
      for editEle in self.formEle.findall('edit'):
        match = editEle.attrib['match'][1:]
        #print 'match = ', match
        #print 'editEle = ', editEle
        label = editEle.attrib['label']
        hWnd = self.childWindowdict[label][0]
        #print 'edit hWnd = ', hWnd
        bufSize = ((SendMessage(hWnd, WM_GETTEXTLENGTH, 0, 0)+1)*2)-2
        buffer = PyMakeBuffer(bufSize)
        nChar = SendMessage(hWnd, WM_GETTEXT, bufSize, buffer)*2
        print 'before buffer to unicode'
        value = bufferToUnicode(buffer)
        print "before printing root"
        print "value = ", str(value)
        if len(value) > 0:
          self.dataEle.attrib[match] = value
          #print 'dataEle = ', ElementTree.dump(self.dataEle)
      
      for lookupEle in self.formEle.findall('lookup'):
        #print 'in lookup'
        match = lookupEle.attrib['match'][1:]
        label = editEle.attrib['label']
        hWnd = self.childWindowdict[label][0]
        comboBoxHWnd = lparam
        index = SendMessage(lparam, CB_GETCURSEL, 0, 0)
        print "index = ", index
        path = lookupEle.attrib['from']
        target = path.split('/').pop()
        value = self.lookupRoot.findall(target)[index].text
        print "value = ", str(value)
        if len(value) > 0:
          self.dataEle.attrib[match] = value
          #print 'dataEle = ', ElementTree.dump(self.dataEle)
            
      ShowWindow(self.parentWindow.hwnd, SW_SHOW)
      ShowWindow(self.hwnd, SW_HIDE)
    
    if message == CBN_SELENDOK:
      for formEle in self.formEle.findall('form'):
        label = formEle.attrib['label']
        comboBoxID = self.childWindowdict[label][1]
        if controlID == comboBoxID:
          comboBoxHWnd = lparam
          index = SendMessage(lparam, CB_GETCURSEL, 0, 0)
          #if click add item then add new element
          try:
            if formEle.attrib['addtext']:
              itemNum = SendMessage(comboBoxHWnd, CB_GETCOUNT, 0, 0)
              #print 'itemNum = ',itemNum
              #print 'index = ', index
              if index+1 == itemNum:
                tagName = formEle.attrib['match']
                self.dataEle.insert(index, Element(tagName))
                SendMessage(comboBoxHWnd, CB_INSERTSTRING, itemNum-1, unicode(tagName) + unicode(index+1))                #SendMessage(comboBoxHWnd, CB_ADDSTRING, 0, unicode(tagName) + unicode(index))
                #start debug
                #print 'add complete'
                #end debug
          except KeyError:
            pass
          #print index
          #if not yet create child window
          try:
            #print 'label = ',label, ' index = ', index
            form = self.childFormDict[label][index]
            #print 'child window exist'
          except KeyError:
            #print 'create new child window'
            dataEle = self.dataEle.findall(formEle.attrib['match'])[index]
            #print 'dataEle = ', dataEle
            form = Form(formEle, dataEle, self.lookupRoot, self)
            self.childFormDict[label][index] = form
          ShowWindow(form.hwnd, SW_SHOW)
          ShowWindow(self.hwnd, SW_HIDE)
    
  def onClose(self, hwnd, msg, wparam, lparam):
    print "on close"
    DestroyWindow(self.hwnd)
    return 0

  def onDestroy(self, hwnd, msg, wparam, lparam):
    PostQuitMessage(0)

  def onQuit(self, hwnd, msg, wparam, lparam):
    pass
  
class LoginPage(object):
  IDM_USER_STATIC = 100
  IDM_USER_EDIT = 101
  IDM_PASSWD_STATIC = 102
  IDM_PASSWD_EDIT = 103
  IDM_SIGNIN = 104
  IDM_CANCEL = 105
  IDM_ERROR_STATIC = 106
  
  def __init__(self, xmlForm):
    self.className = 'LoginPage'
    self.xmlForm = xmlForm
    self._initComponents()
    
  def _initComponents(self):
    InitCommonControls()
    
    print "Platform is " + sys.platform
    if sys.platform == "Pocket PC":
      self.hinst = sys.hinst
      className = unicode(self.className)
    else:
      self.hinst = dllhandle
      className = str(self.className)

    wc = WNDCLASS()
    wc.hInstance = self.hinst
    wc.cbWndExtra = 0
    wc.style = CS_HREDRAW | CS_VREDRAW
    wc.hbrBackground = GetStockObject(WHITE_BRUSH)
    wc.lpszClassName = className
    wc.hCursor = LoadCursor( 0, IDC_ARROW )
    wc.lpfnWndProc = {WM_CLOSE:self.onClose, WM_DESTROY:self.onDestroy, WM_QUIT:self.onQuit, 
                      WM_COMMAND:self.onCommand}
    self.classAtom = RegisterClass(wc)
    if sys.platform == "Pocket PC":
      style = WS_VISIBLE 
    else:
      style = WS_OVERLAPPEDWINDOW
      
    self.hwnd = CreateWindow(self.classAtom, u'Login', style, CW_USEDEFAULT,
                             CW_USEDEFAULT , 240, 268, 0, 0, self.hinst, None)
    
    self.usernameStaticHWnd = CreateWindow("STATIC", None, WS_CHILD | WS_VISIBLE | SS_LEFT , 10, 40, \
        150, 20, self.hwnd, self.IDM_USER_STATIC, GetWindowLong(self.hwnd, GWL_HINSTANCE), None)
    self.usernameEditHWnd = CreateWindow("EDIT", None, WS_CHILD | WS_VISIBLE | ES_LEFT | ES_AUTOHSCROLL | WS_BORDER, 10, 60, 220, 20, \
          self.hwnd, self.IDM_USER_EDIT, GetWindowLong(self.hwnd, GWL_HINSTANCE), None)
    self.passwordStaticHWnd = CreateWindow("STATIC", None, WS_CHILD | WS_VISIBLE | SS_LEFT , 10, 90, \
        150, 20, self.hwnd, self.IDM_PASSWD_STATIC, GetWindowLong(self.hwnd, GWL_HINSTANCE), None)
    self.passwordEditHWnd = CreateWindow("EDIT", None, WS_CHILD | WS_VISIBLE | ES_LEFT | ES_AUTOHSCROLL | ES_PASSWORD | WS_BORDER, 10, 110, 220, 20, \
          self.hwnd, self.IDM_PASSWD_EDIT, GetWindowLong(self.hwnd, GWL_HINSTANCE), None)
    self.okButtonHWnd = CreateWindow("BUTTON", "Sign in", WS_VISIBLE | WS_CHILD | BS_PUSHBUTTON, 
        120, 160, 55, 20, self.hwnd, self.IDM_SIGNIN, GetWindowLong(self.hwnd, GWL_HINSTANCE), None)
    self.cancelButtonHWnd = CreateWindow("BUTTON", "Cancel", WS_VISIBLE | WS_CHILD | BS_PUSHBUTTON, 
        180, 160, 55, 20, self.hwnd, self.IDM_CANCEL, GetWindowLong(self.hwnd, GWL_HINSTANCE), None)
    self.errorStaticHWnd = CreateWindow("STATIC", None, WS_CHILD | WS_VISIBLE | SS_LEFT , 10, 130, \
        220, 20, self.hwnd, self.IDM_ERROR_STATIC, GetWindowLong(self.hwnd, GWL_HINSTANCE), None)
    
    SendMessage(self.usernameStaticHWnd, WM_SETTEXT, len(u'Username:'), u'Username:')
    SendMessage(self.passwordStaticHWnd, WM_SETTEXT, len(u'Password:'), u'Password:')

  def onCommand(self, hwnd, msg, wparam, lparam):
    message = HIWORD(wparam)
    controlID = LOWORD(wparam)
    
    if controlID == self.IDM_SIGNIN:
      bufSize = ((SendMessage(self.usernameEditHWnd, WM_GETTEXTLENGTH, 0, 0)+1)*2)-2
      buffer = PyMakeBuffer(bufSize)
      nChar = SendMessage(self.usernameEditHWnd, WM_GETTEXT, bufSize, buffer)*2
      username = bufferToUnicode(buffer)
      bufSize = ((SendMessage(self.passwordEditHWnd, WM_GETTEXTLENGTH, 0, 0)+1)*2)-2
      buffer = PyMakeBuffer(bufSize)
      nChar = SendMessage(self.passwordEditHWnd, WM_GETTEXT, bufSize, buffer)*2
      password = bufferToUnicode(buffer)
      try:
        text = u'Retrieving Data...'
        SendMessage(self.errorStaticHWnd, WM_SETTEXT, len(text), text)
        self.xmlForm.setUsernamePassword(username, password)
        self.xmlForm.showMainPage()
      except errors.ConnectionDeniedError:
        text = u'Incorrect Username or Password'
        SendMessage(self.errorStaticHWnd, WM_SETTEXT, len(text), text)
      except errors.ProtocolError:
        text = u'Connection Fail!'
        SendMessage(self.errorStaticHWnd, WM_SETTEXT, len(text), text)
      
    elif controlID == self.IDM_CANCEL:
      #close application
      PostQuitMessage(0)
      DestroyWindow(self.hwnd)
    

  def onClose(self, hwnd, msg, wparam, lparam):
    print "on close"
    DestroyWindow(self.hwnd)
    return 0

  def onDestroy(self, hwnd, msg, wparam, lparam):
    PostQuitMessage(0)

  def onQuit(self, hwnd, msg, wparam, lparam):
    pass    
  
  def showWindow(self):
    ShowWindow(self.hwnd, SW_SHOW)
    UpdateWindow(self.hwnd)
    PumpMessages()

def switchWindow(old, new):
  ShowWindow(new.hwnd, SW_SHOW)
  ShowWindow(old.hwnd, SW_HIDE)
