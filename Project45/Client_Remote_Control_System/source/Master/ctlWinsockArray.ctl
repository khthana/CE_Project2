VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.UserControl ctlWinsockArray 
   ClientHeight    =   2235
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3045
   ScaleHeight     =   2235
   ScaleWidth      =   3045
   Begin MSWinsockLib.Winsock sckConnection 
      Index           =   0
      Left            =   1560
      Top             =   1320
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.PictureBox picMask 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   510
      Left            =   2040
      Picture         =   "ctlWinsockArray.ctx":0000
      ScaleHeight     =   34
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   34
      TabIndex        =   1
      Top             =   240
      Width           =   510
   End
   Begin VB.PictureBox picPicture 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   510
      Left            =   1440
      Picture         =   "ctlWinsockArray.ctx":0E12
      ScaleHeight     =   34
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   34
      TabIndex        =   0
      Top             =   240
      Width           =   510
   End
   Begin MSWinsockLib.Winsock sckListen 
      Left            =   840
      Top             =   1320
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
End
Attribute VB_Name = "ctlWinsockArray"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

' ------------------------------------------------------------------------------
'
'   Name:   ctlWinsockArray
'   Author: Will Barden
'   Site:   www.winsockvb.com
'   Purpose:This control will effectively manage a control array of Winsocks
'           and will receive incoming connections on one single port.
'
'           It is free to use and distribute as long
'           as this header remains intact.
'
'           Enjoy!
'
' ------------------------------------------------------------------------------

' ------------------------------------------------------------------------------
'
'   API DECLARES
'
' ------------------------------------------------------------------------------
    Private Declare Function GetDC Lib "user32" (ByVal hwnd As Long) As Long
    Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long

' ------------------------------------------------------------------------------
'
'   EVENTS
'
' ------------------------------------------------------------------------------
    Public Event NewConnection(ByVal Index As Integer, ByVal RemoteIP As String)
    Public Event LostConnection(ByVal Index As Integer)
    Public Event IncomingData(ByVal Index As Integer, ByVal Data As String)
    Public Event SocketError(ByVal Index As Integer, ByVal Description As String)
    Public Event SocketListenError(ByVal Description As String)

' ------------------------------------------------------------------------------
'
'   PROPERTIES
'
' ------------------------------------------------------------------------------
    Private m_ActiveConn As Long
    Private m_MaxConn As Long
    Private m_BytesSent As Long
    Private m_BytesReceived As Long
    
    Public Property Get LocalPort() As Long             ' local port of the array
        LocalPort = sckListen.LocalPort
    End Property
    
    Public Property Let LocalPort(ByVal Port As Long)
        sckListen.LocalPort = Port
    End Property
    
    Public Property Get LocalIP() As String             ' our IP address
        LocalIP = sckListen.LocalIP
    End Property
   
    Public Property Get SocketCount() As Long           ' how many sockets we have
        SocketCount = sckConnection.Count
    End Property
    
    Public Property Get ActiveConnections() As Long     ' how many sockets are connected
        ActiveConnections = m_ActiveConn
    End Property
    
    Public Property Get MaxConnections() As Long        ' the most we've ever had connected
        MaxConnections = m_MaxConn
    End Property
    
    Public Property Get BytesSent() As Long             ' length of data sent
        BytesSent = m_BytesSent
    End Property
    
    Public Property Get BytesReceived() As Long         ' length of data received
        BytesReceived = m_BytesReceived
    End Property
    
    Public Property Get Socket(ByVal Index As Integer) As Winsock
        Set Socket = sckConnection(Index)
    End Property

' ------------------------------------------------------------------------------
'
'   METHODS
'
' ------------------------------------------------------------------------------
    Public Sub Listen()
        sckListen.Listen
    End Sub
    
    Public Sub CloseSocket(ByVal Index As Integer)
        ' check the index
        If IsIndexOK(Index) Then
            ' close the socket
            sckConnection(Index).Close
            ' update count properties
            m_ActiveConn = m_ActiveConn - 1
        Else
            ' raise error
            Err.Raise 9, "CloseSocket", "Subscript out of range"
        End If
    End Sub
    
    Public Sub SendDataOnAll(ByVal Data As String)
    Dim i As Integer
    
        ' send data on all sockets
        For i = 0 To sckConnection.UBound
            Me.SendData i, Data
        Next i
    End Sub
    
    Public Sub SendData(ByVal Index As Integer, ByVal Data As String)
        ' check the index
        If IsIndexOK(Index) Then
            ' check the socket state
            If sckConnection(Index).State = sckConnected Then
                ' send the data
                sckConnection(Index).SendData Data
                DoEvents
                ' update the bytessent property
                m_BytesSent = m_BytesSent + LenB(Data)
            Else
                ' raise error
                Err.Raise 15, "SendData", "Socket specified: " & Index & " is not connected"
            End If
        Else
            ' raise error
            Err.Raise 9, "CloseSocket", "Subscript out of range"
        End If
    End Sub

' ------------------------------------------------------------------------------
'
'   WINSOCK INTERNALS
'
' ------------------------------------------------------------------------------
    Private Sub sckListen_ConnectionRequest(ByVal RequestID As Long)
    Dim lngSocket As Long
        
        ' find a free socket
        lngSocket = FindFirstFreeSocket
        
        ' if theres no free, load a new one
        If lngSocket = -1 Then
            lngSocket = sckConnection.UBound + 1
            Load sckConnection(lngSocket)
        End If
        
        ' accept the connection
        sckConnection(lngSocket).Close
        sckConnection(lngSocket).Accept RequestID
        
        ' and update the properties
        m_ActiveConn = m_ActiveConn + 1
        If m_ActiveConn > m_MaxConn Then
            m_MaxConn = m_ActiveConn
        End If
        
        ' raise the event
        RaiseEvent NewConnection(lngSocket, sckConnection(lngSocket).RemoteHostIP)
    End Sub

    Private Sub sckListen_Error(ByVal Number As Integer, _
        Description As String, ByVal Scode As Long, ByVal Source As String, _
                ByVal HelpFile As String, ByVal HelpContext As Long, _
                    CancelDisplay As Boolean)

        ' raise event
        RaiseEvent SocketListenError(Description)
    End Sub

    Private Sub sckConnection_DataArrival(Index As Integer, ByVal bytesTotal As Long)
    Dim Data As String
    
        ' grab the data
        sckConnection(Index).GetData Data
        
        ' set the byte properties
        m_BytesReceived = m_BytesReceived + bytesTotal
        
        ' raise the event
        RaiseEvent IncomingData(Index, Data)
    End Sub
    
    Private Sub sckConnection_Close(Index As Integer)
        ' set the properties
        m_ActiveConn = m_ActiveConn - 1
        
        ' raise the event
        RaiseEvent LostConnection(Index)
    End Sub
        
    Private Sub sckConnection_Error(Index As Integer, ByVal Number As Integer, _
        Description As String, ByVal Scode As Long, ByVal Source As String, _
                ByVal HelpFile As String, ByVal HelpContext As Long, _
                    CancelDisplay As Boolean)
        ' close socket
        sckConnection(Index).Close
        
        ' set properties
        m_ActiveConn = m_ActiveConn - 1
        
        ' raise errors
        RaiseEvent SocketError(Index, Description)
        RaiseEvent LostConnection(Index)
    End Sub

' ------------------------------------------------------------------------------
'
'   INTERNALS
'
' ------------------------------------------------------------------------------
    Private Function IsIndexOK(ByVal Index As Integer) As Boolean
        ' check if index is within bounds
        If Index < 0 Or Index > sckConnection.UBound Then
            IsIndexOK = False
        Else
            IsIndexOK = True
        End If
    End Function

    Private Function FindFirstFreeSocket() As Long
    Dim i As Integer
    
        ' find the first socket in the array
        ' that isn't connected or in use
        FindFirstFreeSocket = -1
        For i = 0 To sckConnection.UBound
            If sckConnection(i).State <> sckConnected Then
                FindFirstFreeSocket = i
                Exit Function
            End If
        Next i
    End Function

    Private Sub UserControl_Paint()
    Dim hMyDC As Long
    Dim hPicDC As Long
    Dim hMaskDC As Long
    Dim Height As Long
    Dim Width As Long
    
        ' paint the image onto the control
        hMyDC = UserControl.hDC
        hPicDC = picPicture.hDC
        hMaskDC = picMask.hDC
        Height = picPicture.ScaleHeight
        Width = picPicture.ScaleWidth
        
        BitBlt hMyDC, 0, 0, Width, Height, hMaskDC, 0, 0, vbMergePaint
        BitBlt hMyDC, 0, 0, Width, Height, hPicDC, 0, 0, vbSrcAnd
    End Sub
    
    Private Sub UserControl_Resize()
        
        ' fit the control round the image
        UserControl.Height = picPicture.Height
        UserControl.Width = picPicture.Width
    End Sub
