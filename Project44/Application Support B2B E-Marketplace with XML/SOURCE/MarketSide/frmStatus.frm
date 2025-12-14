VERSION 5.00
Begin VB.Form frmStatus 
   BackColor       =   &H80000014&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Files Status"
   ClientHeight    =   4365
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7425
   Icon            =   "frmStatus.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   4365
   ScaleWidth      =   7425
   ShowInTaskbar   =   0   'False
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   800
      Left            =   2280
      Top             =   3720
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      BackColor       =   &H80000014&
      Caption         =   "Bank"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   480
      TabIndex        =   2
      Top             =   3960
      Width           =   540
   End
   Begin VB.Image imgBuyer 
      Height          =   705
      Left            =   360
      Picture         =   "frmStatus.frx":164A
      Stretch         =   -1  'True
      Top             =   120
      Width           =   795
   End
   Begin VB.Image imgPic 
      Height          =   420
      Left            =   960
      Picture         =   "frmStatus.frx":20B8
      Top             =   1560
      Visible         =   0   'False
      Width           =   360
   End
   Begin VB.Image imgPath 
      Height          =   1065
      Index           =   9
      Left            =   3240
      Picture         =   "frmStatus.frx":27E4
      Stretch         =   -1  'True
      Top             =   2400
      Visible         =   0   'False
      Width           =   570
   End
   Begin VB.Image imgPath 
      Height          =   1065
      Index           =   8
      Left            =   3720
      Picture         =   "frmStatus.frx":2B7E
      Stretch         =   -1  'True
      Top             =   2400
      Visible         =   0   'False
      Width           =   570
   End
   Begin VB.Image imgPath 
      Height          =   945
      Index           =   7
      Left            =   1320
      Picture         =   "frmStatus.frx":2F12
      Stretch         =   -1  'True
      Top             =   2400
      Visible         =   0   'False
      Width           =   2145
   End
   Begin VB.Image imgPath 
      Height          =   945
      Index           =   6
      Left            =   600
      Picture         =   "frmStatus.frx":357A
      Stretch         =   -1  'True
      Top             =   2040
      Visible         =   0   'False
      Width           =   2145
   End
   Begin VB.Image imgPath 
      Height          =   945
      Index           =   5
      Left            =   4080
      Picture         =   "frmStatus.frx":3BF5
      Stretch         =   -1  'True
      Top             =   2280
      Visible         =   0   'False
      Width           =   2145
   End
   Begin VB.Image imgPath 
      Height          =   945
      Index           =   4
      Left            =   4800
      Picture         =   "frmStatus.frx":4269
      Stretch         =   -1  'True
      Top             =   2040
      Visible         =   0   'False
      Width           =   2145
   End
   Begin VB.Image imgPath 
      Height          =   945
      Index           =   3
      Left            =   3960
      Picture         =   "frmStatus.frx":48D6
      Stretch         =   -1  'True
      Top             =   720
      Visible         =   0   'False
      Width           =   2145
   End
   Begin VB.Image imgPath 
      Height          =   945
      Index           =   2
      Left            =   4800
      Picture         =   "frmStatus.frx":4F51
      Stretch         =   -1  'True
      Top             =   960
      Visible         =   0   'False
      Width           =   2145
   End
   Begin VB.Image imgPath 
      Height          =   945
      Index           =   0
      Left            =   600
      Picture         =   "frmStatus.frx":55B9
      Stretch         =   -1  'True
      Top             =   960
      Visible         =   0   'False
      Width           =   2145
   End
   Begin VB.Image imgPath 
      Height          =   945
      Index           =   1
      Left            =   1440
      Picture         =   "frmStatus.frx":5C2D
      Stretch         =   -1  'True
      Top             =   720
      Visible         =   0   'False
      Width           =   2145
   End
   Begin VB.Image imgFedEx 
      Height          =   705
      Left            =   6360
      Picture         =   "frmStatus.frx":629A
      Stretch         =   -1  'True
      Top             =   3120
      Width           =   795
   End
   Begin VB.Image imgCat 
      Height          =   705
      Left            =   3360
      Picture         =   "frmStatus.frx":64F1
      Stretch         =   -1  'True
      Top             =   3600
      Width           =   795
   End
   Begin VB.Image imgSeller 
      Height          =   705
      Left            =   6360
      Picture         =   "frmStatus.frx":736B
      Stretch         =   -1  'True
      Top             =   120
      Width           =   795
   End
   Begin VB.Image imgBank 
      Height          =   705
      Left            =   360
      Picture         =   "frmStatus.frx":7574
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   795
   End
   Begin VB.Image Image1 
      Height          =   915
      Left            =   3000
      Picture         =   "frmStatus.frx":82B6
      Stretch         =   -1  'True
      Top             =   1320
      Width           =   1650
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackColor       =   &H80000014&
      Caption         =   "Supplier"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   6360
      TabIndex        =   1
      Top             =   840
      Width           =   885
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackColor       =   &H80000014&
      Caption         =   "Buyer"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   480
      TabIndex        =   0
      Top             =   840
      Width           =   615
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      BackColor       =   &H80000014&
      Caption         =   "CAT"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   4200
      TabIndex        =   3
      Top             =   3840
      Width           =   465
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      BackColor       =   &H80000014&
      Caption         =   "FedEx"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   6360
      TabIndex        =   4
      Top             =   3840
      Width           =   675
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      BackColor       =   &H80000014&
      Caption         =   "Marketplace"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   3240
      TabIndex        =   5
      Top             =   2190
      Width           =   1050
   End
End
Attribute VB_Name = "frmStatus"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Base 1
Option Explicit
Dim img(20) As Integer
Dim index As Integer
Dim indexHead As Integer
Dim flash As Boolean
Dim imgType As Integer

Dim DStatus As Integer
Dim objQ As q
Dim countFlash As Integer

Public Sub EnableFrmStatus()
        Timer1.Enabled = True
End Sub

Public Sub disbleFrmStatus()
        Timer1.Enabled = False
End Sub


Private Sub Form_Load()
        frmRecvFiles.Width = mdiMain.ScaleWidth / 2
        frmRecvFiles.Height = mdiMain.ScaleHeight / 2
        
        frmStatus.Width = (mdiMain.ScaleWidth / 2) - 10
        frmStatus.Height = (mdiMain.ScaleHeight / 2) - 10
        frmStatus.Left = mdiMain.ScaleWidth / 2
        frmStatus.top = mdiMain.ScaleHeight / 2
        
        Set objQ = New q
        index = 1
        HideAll
        flash = True
        countFlash = 0
        DStatus = -1
        indexHead = 1
        
        StatusOpen = True
        EnableFrmStatus
End Sub

Private Sub Form_Unload(Cancel As Integer)
        frmRecvFiles.Width = mdiMain.ScaleWidth / 2
        frmRecvFiles.Height = mdiMain.ScaleHeight
        Set objQ = Nothing
        StatusOpen = False
End Sub

Public Sub addStatus(ByVal Direction As Integer, ByVal imgage As Integer)
        If Not (objQ.isFull) Then
                objQ.EnQueue Direction
                img(index) = imgage
                If index < 20 Then
                        index = index + 1
                Else
                        index = 1
                End If
        Else
                MsgBox "Queue is Full"
        End If
End Sub

Public Function getStatus(ByRef imgage As Integer) As Integer
        If Not (objQ.isEmpty) Then
                imgage = img(indexHead)
                getStatus = objQ.GetItem
                If indexHead < 20 Then
                        indexHead = indexHead + 1
                Else
                        indexHead = 1
                End If
        Else
                'MsgBox "Queue is Empty"
                getStatus = -1
        End If
End Function

Private Sub SetStatus(ByVal Direction As Integer)
                If Direction <> -1 Then
                        If Direction >= 0 And Direction <= 9 Then
                                HideAll
                                imgPath(Direction).Visible = True
                        Else
                                MsgBox "Direction Out of Range"
                        End If
                End If
End Sub

Private Sub HideAll()
        Dim i As Integer
        For i = 0 To 9
                imgPath(i).Visible = False
        Next
End Sub

Private Sub Timer1_Timer()
        If DStatus <> -1 Then
                flash = Not (flash)
                countFlash = countFlash + 1
                If countFlash > 6 Then
                        imgPath(DStatus).Visible = True
                        DStatus = getStatus(imgType)
                         SetStatus DStatus
                        SetPosition
                        SetPicture
                        countFlash = 0
                Else
                        imgPath(DStatus).Visible = flash
                        imgPic.Visible = flash
                End If
        Else
               DStatus = getStatus(imgType)
               If DStatus <> -1 Then
                        HideAll
                        SetPosition
                        SetPicture
                End If
           End If
End Sub

Public Sub AddStatusRecvByUserID(ByVal FileType As String, ByVal user As String)
        Dim memberID As String
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        Dim memberType As String
                
        If user = "Bank" Then
                        Select Case FileType
                                 Case "TS"
                                                addStatus 7, imgTS
                                Case "PN"
                                                addStatus 7, imgPN
                                Case "MP"
                                                addStatus 7, imgMP
                         End Select
        Else
                        Set conn = New ADODB.Connection
                        Set rcs = New ADODB.Recordset
                        
                        conn.ConnectionString = conString
                        conn.Open
                        rcs.Open "select memberID from publickey where userid = '" & user & "'", conn, 1, 3
                        If rcs.RecordCount > 0 Then
                                memberID = rcs!memberID
                        Else
                                Message "Cannot find UserID : " & user & "In publickey Ring"
                                memberID = -1
                        End If
                        rcs.Close
                        conn.Close
                        If memberID <> -1 Then
                                conn.ConnectionString = DBconString
                                conn.CursorLocation = adUseClient
                                conn.Open
                                rcs.Open "select membertype from member where id = " & memberID, conn, 1, 3
                                memberType = rcs!memberType
                                rcs.Close
                                conn.Close
                                
                                
                                Select Case FileType
                                        Case "PO"
                                                        If memberType = "b" Then
                                                                addStatus 1, imgPO
                                                        Else
                                                                addStatus 3, imgPO
                                                        End If
                                        Case "PR"
                                                        If memberType = "b" Then
                                                                addStatus 1, imgPR
                                                        Else
                                                                addStatus 3, imgPR
                                                        End If
                                        Case "IV"
                                                        If memberType = "b" Then
                                                                addStatus 1, imgIV
                                                        Else
                                                                addStatus 3, imgIV
                                                        End If
                                        Case "TS"
                                                        If memberType = "b" Then
                                                                addStatus 1, imgTS
                                                        Else
                                                                addStatus 3, imgTS
                                                        End If
                                        Case "PN"
                                                        If memberType = "b" Then
                                                                addStatus 1, imgPN
                                                        Else
                                                                addStatus 3, imgPN
                                                        End If
                                        Case "MP"
                                                        If memberType = "b" Then
                                                                addStatus 1, imgMP
                                                        Else
                                                                addStatus 3, imgMP
                                                        End If
                                        End Select
                                                                
                        End If
                        Set rcs = Nothing
                        Set conn = Nothing
        End If
End Sub

Public Sub AddStatusSendByUserID(ByVal FileType As String, ByVal user As String)
        Dim memberID As String
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        Dim memberType As String
                
        If user = "Bank" Then
                        Select Case FileType
                                 Case "TS"
                                                addStatus 6, imgTS
                                Case "PN"
                                                addStatus 6, imgPN
                                Case "MP"
                                                addStatus 6, imgMP
                         End Select
        Else
                        Set conn = New ADODB.Connection
                        Set rcs = New ADODB.Recordset
                        
                        conn.ConnectionString = conString
                        conn.Open
                        rcs.Open "select memberID from publickey where userid = '" & user & "'", conn, 1, 3
                        If rcs.RecordCount > 0 Then
                                memberID = rcs!memberID
                        Else
                                Message "Cannot find UserID : " & user & "In publickey Ring"
                                memberID = -1
                        End If
                        rcs.Close
                        conn.Close
                        If memberID <> -1 Then
                                conn.ConnectionString = DBconString
                                conn.CursorLocation = adUseClient
                                conn.Open
                                rcs.Open "select membertype from member where id = " & memberID, conn, 1, 1
                                memberType = rcs!memberType
                                rcs.Close
                                conn.Close
                                
                                
                                Select Case FileType
                                        Case "PO"
                                                        If memberType = "b" Then
                                                                addStatus 0, imgPO
                                                        Else
                                                                addStatus 2, imgPO
                                                        End If
                                        Case "PR"
                                                        If memberType = "b" Then
                                                                addStatus 0, imgPR
                                                        Else
                                                                addStatus 2, imgPR
                                                        End If
                                        Case "IV"
                                                        If memberType = "b" Then
                                                                addStatus 0, imgIV
                                                        Else
                                                                addStatus 2, imgIV
                                                        End If
                                        Case "TS"
                                                        If memberType = "b" Then
                                                                addStatus 0, imgTS
                                                        Else
                                                                addStatus 2, imgTS
                                                        End If
                                        Case "PN"
                                                        If memberType = "b" Then
                                                                addStatus 0, imgPN
                                                        Else
                                                                addStatus 2, imgPN
                                                        End If
                                        Case "MP"
                                                        If memberType = "b" Then
                                                                addStatus 0, imgMP
                                                        Else
                                                                addStatus 2, imgMP
                                                        End If
                                        End Select
                                                                
                        End If
                        Set rcs = Nothing
                        Set conn = Nothing
        End If
End Sub

Public Sub SetPosition()
        Select Case DStatus
                Case 0
                        imgPic.Move 1080, 1680
                Case 1
                        imgPic.Move 2760, 480
                Case 2
                        imgPic.Move 6240, 1560
                Case 3
                        imgPic.Move 4440, 480
                Case 4
                        imgPic.Move 6240, 1920
                Case 5
                        imgPic.Move 4680, 3000
                Case 6
                        imgPic.Move 1080, 1800
                Case 7
                        imgPic.Move 2520, 3120
                Case 8
                        imgPic.Move 4440, 2640
                Case 9
                        imgPic.Move 2760, 2880
        End Select
End Sub

Public Sub SetPicture()
        Select Case imgType
                Case imgPO
                        imgPic.Picture = LoadPicture(App.Path & "\image\PO.bmp")
                Case imgPR
                        imgPic.Picture = LoadPicture(App.Path & "\image\PR.bmp")
                Case imgIV
                        imgPic.Picture = LoadPicture(App.Path & "\image\IV.bmp")
                Case imgTS
                        imgPic.Picture = LoadPicture(App.Path & "\image\TS.bmp")
                Case imgMP
                        imgPic.Picture = LoadPicture(App.Path & "\image\PM.bmp")
                Case imgPN
                        imgPic.Picture = LoadPicture(App.Path & "\image\PN.bmp")
        End Select
                        
End Sub
