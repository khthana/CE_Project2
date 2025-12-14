VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "myNode"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'local variable(s) to hold property value(s)
Private mvarName As String 'local copy
Private mvarIP As String 'local copy
Private mvarStatus As Integer 'local copy
'local variable(s) to hold property value(s)
Private mvarSocketIndex As Integer 'local copy
Public Property Let SocketIndex(ByVal vData As Integer)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.SocketIndex = 5
    mvarSocketIndex = vData
End Property


Public Property Get SocketIndex() As Integer
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.SocketIndex
    SocketIndex = mvarSocketIndex
End Property





Public Property Let Status(ByVal vData As Integer)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.status = 5
    mvarStatus = vData
End Property


Public Property Get Status() As Integer
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.status
    Status = mvarStatus
End Property



Public Property Let IP(ByVal vData As String)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.ip = 5
    mvarIP = vData
End Property


Public Property Get IP() As String
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.ip
    IP = mvarIP
End Property


Public Property Let Name(ByVal vData As String)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.slaveName = 5
    mvarName = vData
End Property


Public Property Get Name() As String
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.slaveName
    Name = mvarName
End Property
