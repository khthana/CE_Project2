VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQuery1 
   BackColor       =   &H00C0FFFF&
   Caption         =   "สอบถามตำแหน่งบริหาร"
   ClientHeight    =   6390
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7575
   LinkTopic       =   "Form1"
   Picture         =   "frmQuery1.frx":0000
   ScaleHeight     =   6390
   ScaleWidth      =   7575
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdFind 
      Appearance      =   0  'Flat
      Caption         =   "Query"
      Height          =   375
      Left            =   6480
      TabIndex        =   8
      Top             =   1680
      Width           =   975
   End
   Begin MSComctlLib.ListView lv2 
      Height          =   2055
      Left            =   120
      TabIndex        =   7
      Top             =   4200
      Width           =   7335
      _ExtentX        =   12938
      _ExtentY        =   3625
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      Enabled         =   0   'False
      NumItems        =   0
   End
   Begin MSComctlLib.ListView lv1 
      Height          =   1575
      Left            =   120
      TabIndex        =   6
      Top             =   2280
      Width           =   7335
      _ExtentX        =   12938
      _ExtentY        =   2778
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin VB.ComboBox cboMngPos2 
      Height          =   330
      Left            =   4680
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   1320
      Width           =   2775
   End
   Begin VB.ComboBox cboMngPos1 
      Height          =   330
      Left            =   4680
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   600
      Width           =   2775
   End
   Begin VB.TextBox txtPerID 
      Height          =   315
      Left            =   4680
      MaxLength       =   5
      TabIndex        =   0
      Top             =   240
      Width           =   615
   End
   Begin VB.Image Image1 
      Height          =   720
      Left            =   -120
      Picture         =   "frmQuery1.frx":7FED
      ToolTipText     =   "Home"
      Top             =   0
      Width           =   945
   End
   Begin VB.Label Label3 
      BackColor       =   &H00C0E0FF&
      BackStyle       =   0  'Transparent
      Caption         =   "ท่านที่ต้องการ :"
      Height          =   255
      Left            =   120
      TabIndex        =   9
      Top             =   3960
      Width           =   1215
   End
   Begin VB.Label Label2 
      BackColor       =   &H00C0E0FF&
      BackStyle       =   0  'Transparent
      Caption         =   "ตำแหน่งบริหาร ท่านที่ต้องการ :"
      Height          =   495
      Left            =   3480
      TabIndex        =   5
      Top             =   1320
      Width           =   1215
   End
   Begin VB.Label Label30 
      BackColor       =   &H00C0E0FF&
      BackStyle       =   0  'Transparent
      Caption         =   "ตำแหน่งบริหาร :"
      Height          =   255
      Left            =   3360
      TabIndex        =   3
      Top             =   600
      Width           =   1215
   End
   Begin VB.Label Label1 
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "Person ID :"
      Height          =   255
      Left            =   3720
      TabIndex        =   1
      Top             =   240
      Width           =   855
   End
End
Attribute VB_Name = "frmQuery1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdFind_Click()
    lv2.ListItems.Clear
    If (cboMngPos1 <> "" And cboMngPos2 <> "") Then
        Dim obj As Object
        Set obj = cache.Static("Person.Per")
        no = obj.FindOID(txtPerID.Text)
        If no = 0 Then
            MsgBox "Now, There is no this Person ID", , "บุคลากร"
        Else
            Set Per = cache.OpenId("Person.Per", no)
        
            Dim ehist As Object, item As ListItem, i As Integer, j As Integer
            Dim ObjCount As Integer
            lv1.View = lvwReport
            lv1.FullRowSelect = True
            lv1.ColumnHeaders.Clear
            lv1.ColumnHeaders.Add , , "Person ID", 900, lvwColumnLeft
            lv1.ColumnHeaders.Add , , "Mng.Pos.", 1800, lvwColumnLeft
            lv1.ColumnHeaders.Add , , "First Name", 1800, lvwColumnLeft
            lv1.ColumnHeaders.Add , , "From date", 1200, lvwColumnCenter
            lv1.ColumnHeaders.Add , , "To date", 1200, lvwColumnCenter
            lv1.ListItems.Clear
            i = 1
            ObjCount = Per.RMngPoss.Count
            Set ehist = Per.RMngPoss.GetAt(1)
            Do While (Not ehist Is Nothing) Or (i <= ObjCount)
                If (ehist.MngPos.MngPos = cboMngPos1.Text) And (Not ehist Is Nothing) Then
                    Set item = lv1.ListItems.Add
                    item.Text = Per.PerID
                    item.SubItems(1) = ehist.MngPos.MngPos
                    j = Per.TFirstName.Count
                    item.SubItems(2) = Per.TFirstName.GetAt(j).TFirstName
                    item.SubItems(3) = ehist.FromDate
                    item.SubItems(4) = ehist.ToDate
                    lv1.Enabled = True
                End If
                i = i + 1
                Set ehist = Per.RMngPoss.GetAt(i)
            Loop
        End If
    Else
        MsgBox "Please Fill out All blanks, Thank you", , "บุคลากร"
    End If
End Sub

Private Sub Form_Load()
    ConnectObjects "PROJECT"
    LoadMngPosCombo
    lv1.Enabled = False
    lv2.Enabled = False
End Sub

Private Sub ConnectObjects(Address As String)
    ' Connects Cacheobject to the Cacheserver specified in Address
    Dim ok As Boolean
    Set cache = CreateObject("CacheObject.Factory")
    If Address = "" Then
        Address = cache.ConnectDlg
        If Address = "" Then End
    End If
    ok = cache.Connect(Address)
    If Not ok Then
        MsgBox "Failed to Connect to Cache Object Server", , "Cache Connection"
        End
    End If
End Sub

Private Sub LoadMngPosCombo()
    Dim obj As Object, i As Integer
    Dim displays As String, delimd As String, objs() As String
    Set obj = cache.Static("Person.MngPos")
    displays = obj.MngPosDISPLAYLIST
    delimd = Left(displays, 1)
    objs = Split(displays, delimd)
    cboMngPos1.Clear
    cboMngPos2.Clear
    For i = 1 To UBound(objs)
        cboMngPos1.AddItem objs(i)
        cboMngPos2.AddItem objs(i)
    Next i
End Sub

Private Sub Image1_Click()
    frmMain.Show 0
    Unload Me
End Sub

Private Sub lv1_click()
    If lv1.ListItems.Count = 0 Then Exit Sub
    lv2.Enabled = True
    If lv1.ListItems.Count = 0 Then
        GoTo exitSub
    End If
    Dim ehist As Object, item As ListItem, i As Integer, j As Integer
    Dim FromDate As String, ToDate As String
    Dim CheckFrom As Boolean, CheckTo As Boolean, CheckFromTo As Boolean
    lv2.View = lvwReport
    lv2.FullRowSelect = True
    lv2.ColumnHeaders.Clear
    lv2.ColumnHeaders.Add , , "Person ID", 900, lvwColumnLeft
    lv2.ColumnHeaders.Add , , "Mng.Pos.", 1800, lvwColumnLeft
    lv2.ColumnHeaders.Add , , "First Name", 1800, lvwColumnLeft
    lv2.ColumnHeaders.Add , , "From date", 1200, lvwColumnCenter
    lv2.ColumnHeaders.Add , , "To date", 1200, lvwColumnCenter
    lv2.ListItems.Clear
    Dim obj As Object, OJJ As Object, ObjCount As Integer, stri As String
    Set obj = cache.Static("Person.Per")
    i = obj.FindObj("MngPos", "MngPos", cboMngPos2.Text)
    Set OJJ = cache.OpenId("Person.MngPos", i)
    i = 1
    FromDate = lv1.SelectedItem.SubItems(3)
    ToDate = lv1.SelectedItem.SubItems(4)
    ObjCount = OJJ.RMngPoss.Count
    Set ehist = OJJ.RMngPoss.GetAt(1)
    Do While (Not ehist Is Nothing) Or (i <= ObjCount)
        CheckFrom = CompareDate(ehist.FromDate, FromDate, ToDate, 1)
        CheckTo = CompareDate(ehist.ToDate, FromDate, ToDate, 2)
        CheckFromTo = CompareInterval(ehist.FromDate, ehist.ToDate, FromDate, ToDate)
        If (CheckFrom Or CheckTo Or CheckFromTo) Then
            If Not ehist.Per Is Nothing Then
                stri = ehist.Per.PerID
                If (txtPerID.Text <> stri) And (Not ehist Is Nothing) Then
                    Set item = lv2.ListItems.Add
                    item.Text = ehist.Per.PerID
                    item.SubItems(1) = cboMngPos2.Text
                    j = ehist.Per.TFirstName.Count
                    item.SubItems(2) = ehist.Per.TFirstName.GetAt(j).TFirstName
                    item.SubItems(3) = ehist.FromDate
                    item.SubItems(4) = ehist.ToDate
                End If
            End If
        End If
        i = i + 1
        Set ehist = OJJ.RMngPoss.GetAt(i)
    Loop
exitSub:
End Sub

Private Sub lv1_DblClick()
    If lv1.ListItems.Count <> 0 Then
        frmPerson.Show 0
        frmPerson.txtPerID.Text = lv1.SelectedItem.Text
    End If
End Sub

Private Sub lv2_DblClick()
    If lv2.ListItems.Count <> 0 Then
        frmPerson.Show 0
        frmPerson.txtPerID.Text = lv2.SelectedItem.Text
    End If
End Sub

Function CompareDate(DDate As String, Fobj As String, Tobj As String, id As Integer) As Boolean

    Dim Dd, FromArray, ToArray
    
    Dd = Split(DDate, "/", -1, 1)
    FromArray = Split(Fobj, "/", -1, 1)
    ToArray = Split(Tobj, "/", -1, 1)
    
    If Len(Dd(2)) = 2 Then
        If CInt(Dd(2) <= 29) Then
            DDate = Dd(0) + "/" + Dd(1) + "/20" + Dd(2)
        Else
            DDate = Dd(0) + "/" + Dd(1) + "/19" + Dd(2)
        End If
    End If
    If Len(FromArray(2)) = 2 Then
        If CInt(FromArray(2) <= 29) Then
            Fobj = FromArray(0) + "/" + FromArray(1) + "/20" + FromArray(2)
        Else
            Fobj = FromArray(0) + "/" + FromArray(1) + "/19" + FromArray(2)
        End If
    End If
    If Len(ToArray(2)) = 2 Then
        If CInt(ToArray(2) <= 29) Then
            Tobj = ToArray(0) + "/" + ToArray(1) + "/20" + ToArray(2)
        Else
            Tobj = ToArray(0) + "/" + ToArray(1) + "/19" + ToArray(2)
        End If
    End If

    Dim DDD As Long, FFF As Long, TTT As Long
    Dim obj As Object
    Set obj = cache.Static("Person.Per")
    DDD = obj.ConvertDate(DDate)
    FFF = obj.ConvertDate(Fobj)
    TTT = obj.ConvertDate(Tobj)
    
    CompareDate = False
    If id = 1 Then
        If (FFF <= DDD And DDD < TTT) Then CompareDate = True
    Else
        If (FFF < DDD) Then
            If DDD = 2980013 Then
                If (DDD <= TTT) Then
                    CompareDate = True
                End If
            Else
                If (DDD < TTT) Then
                    CompareDate = True
                End If
            End If
        End If
    End If
    'If (FFF > DDD And DDD > TTT) Then CompareDate = True
    
End Function

Function CompareInterval(DDate As String, TDate As String, Fobj As String, Tobj As String) As Boolean

    Dim Dd, Td, FromArray, ToArray
    
    Dd = Split(DDate, "/", -1, 1)
    Td = Split(TDate, "/", -1, 1)
    FromArray = Split(Fobj, "/", -1, 1)
    ToArray = Split(Tobj, "/", -1, 1)
    
    If Len(Dd(2)) = 2 Then
        If CInt(Dd(2) <= 29) Then
            DDate = Dd(0) + "/" + Dd(1) + "/20" + Dd(2)
        Else
            DDate = Dd(0) + "/" + Dd(1) + "/19" + Dd(2)
        End If
    End If
    If Len(Td(2)) = 2 Then
        If CInt(Td(2) <= 29) Then
            TDate = Td(0) + "/" + Td(1) + "/20" + Td(2)
        Else
            TDate = Td(0) + "/" + Td(1) + "/19" + Td(2)
        End If
    End If
    If Len(FromArray(2)) = 2 Then
        If CInt(FromArray(2) <= 29) Then
            Fobj = FromArray(0) + "/" + FromArray(1) + "/20" + FromArray(2)
        Else
            Fobj = FromArray(0) + "/" + FromArray(1) + "/19" + FromArray(2)
        End If
    End If
    If Len(ToArray(2)) = 2 Then
        If CInt(ToArray(2) <= 29) Then
            Tobj = ToArray(0) + "/" + ToArray(1) + "/20" + ToArray(2)
        Else
            Tobj = ToArray(0) + "/" + ToArray(1) + "/19" + ToArray(2)
        End If
    End If

    Dim DDD As Long, DTT As Long, FFF As Long, TTT As Long
    Dim obj As Object
    Set obj = cache.Static("Person.Per")
    DDD = obj.ConvertDate(DDate)
    DTT = obj.ConvertDate(TDate)
    FFF = obj.ConvertDate(Fobj)
    TTT = obj.ConvertDate(Tobj)
    
    CompareInterval = False
    If (DDD <= FFF And DTT >= TTT) Then CompareInterval = True
    
End Function

