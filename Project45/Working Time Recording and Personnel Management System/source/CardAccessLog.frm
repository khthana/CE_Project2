VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form CardAccessLog 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Card Access Log"
   ClientHeight    =   7035
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   8790
   Icon            =   "CardAccessLog.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7035
   ScaleWidth      =   8790
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame2 
      Caption         =   "List Conditions"
      Height          =   1575
      Left            =   240
      TabIndex        =   15
      Top             =   240
      Width           =   8295
      Begin VB.OptionButton Option1 
         Caption         =   "Show both Valid && Invalid"
         Height          =   255
         Index           =   2
         Left            =   3960
         TabIndex        =   9
         Top             =   1080
         Width           =   2175
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Show only Valid"
         Height          =   255
         Index           =   1
         Left            =   2160
         TabIndex        =   8
         Top             =   1080
         Width           =   1575
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Show only Invalid"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   7
         Top             =   1080
         Value           =   -1  'True
         Width           =   1575
      End
      Begin VB.CheckBox Check3 
         Caption         =   "To Time :"
         Height          =   255
         Left            =   4320
         TabIndex        =   5
         Top             =   720
         Value           =   1  'Checked
         Width           =   1215
      End
      Begin VB.CheckBox Check2 
         Caption         =   "From Time :"
         Height          =   255
         Left            =   240
         TabIndex        =   3
         Top             =   720
         Value           =   1  'Checked
         Width           =   1215
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Card No :"
         Height          =   255
         Left            =   240
         TabIndex        =   0
         Top             =   360
         Width           =   975
      End
      Begin VB.CommandButton Command1 
         Enabled         =   0   'False
         Height          =   315
         Left            =   7680
         Picture         =   "CardAccessLog.frx":0442
         Style           =   1  'Graphical
         TabIndex        =   2
         Top             =   300
         Width           =   375
      End
      Begin VB.ComboBox EmpCardCb 
         Enabled         =   0   'False
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   1560
         TabIndex        =   1
         Text            =   "Combo1"
         Top             =   300
         Width           =   6135
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   315
         Left            =   1560
         TabIndex        =   4
         Top             =   660
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   556
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   19660803
         CurrentDate     =   36526
         MaxDate         =   2958465.99998843
      End
      Begin MSComCtl2.DTPicker DTPicker2 
         Height          =   315
         Left            =   5640
         TabIndex        =   6
         Top             =   660
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   556
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   19660803
         CurrentDate     =   36526
         MaxDate         =   2958465.99998843
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "List of Card Access Log"
      Height          =   4575
      Left            =   240
      TabIndex        =   13
      Top             =   1920
      Width           =   8295
      Begin VB.CommandButton Command5 
         Caption         =   "&Refresh"
         Height          =   375
         Left            =   7200
         TabIndex        =   11
         Top             =   4080
         Width           =   975
      End
      Begin VB.CommandButton Command4 
         Caption         =   "&Delete All Above Records"
         Height          =   375
         Left            =   120
         TabIndex        =   12
         Top             =   4080
         Width           =   2415
      End
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
         Height          =   3735
         Left            =   120
         TabIndex        =   10
         Top             =   240
         Width           =   8055
         _ExtentX        =   14208
         _ExtentY        =   6588
         _Version        =   393216
         FixedCols       =   0
         AllowBigSelection=   0   'False
         SelectionMode   =   1
         AllowUserResizing=   1
         _NumberOfBands  =   1
         _Band(0).Cols   =   2
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   14
      Top             =   6720
      Width           =   8790
      _ExtentX        =   15505
      _ExtentY        =   556
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   14993
            MinWidth        =   14993
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "CardAccessLog"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private numRec As Long
Private frmCaller As Object

Public Property Get Caller() As Object
   Set Caller = frmCaller
End Property

Public Property Set Caller(NewValue As Object)
   Set frmCaller = NewValue
End Property

Sub MSHFlexGrid1Clear()
Dim j As Long

MSHFlexGrid1.Cols = 5
MSHFlexGrid1.Clear
For j = 1 To MSHFlexGrid1.Rows - 2
 MSHFlexGrid1.RemoveItem 1
Next j

MSHFlexGrid1.TextMatrix(0, 0) = "DateTime"
MSHFlexGrid1.ColAlignment(0) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(0) = 2000

MSHFlexGrid1.TextMatrix(0, 1) = "CardID"
MSHFlexGrid1.ColAlignment(1) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(1) = 1500

MSHFlexGrid1.TextMatrix(0, 2) = "RecorderID"
MSHFlexGrid1.ColAlignment(2) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(2) = 1200

MSHFlexGrid1.TextMatrix(0, 3) = "Valid"
MSHFlexGrid1.ColAlignment(3) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(3) = 1000

MSHFlexGrid1.TextMatrix(0, 4) = "TimeRecord"
MSHFlexGrid1.ColAlignment(4) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(4) = 1000

End Sub

Sub LoadMSHFlexGrid1()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim aPr(2) As ADODB.Parameter
Dim bPr(3) As ADODB.Parameter
Dim i As Long

MSHFlexGrid1Clear

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

If Check1.Value = Unchecked Then

    Set tCmd.ActiveConnection = sConn
    tCmd.CommandType = adCmdStoredProc
    tCmd.CommandText = "ta_card_access_log_select_by_DateTime"
    
    Set aPr(0) = tCmd.CreateParameter("FromTime", adDBTimeStamp, adParamInput, 8)
    Set aPr(1) = tCmd.CreateParameter("ToTime", adDBTimeStamp, adParamInput, 8)
    Set aPr(2) = tCmd.CreateParameter("SelectOption", adTinyInt, adParamInput, 1)
    
    If Check2.Value = Unchecked Then
        aPr(0).Value = Null
    Else
        aPr(0).Value = DTPicker1.Value
    End If
    
    If Check3.Value = Unchecked Then
        aPr(1).Value = Null
    Else
        aPr(1).Value = DTPicker2.Value
    End If
    
    If Option1(0).Value = True Then aPr(2).Value = 1
    If Option1(1).Value = True Then aPr(2).Value = 2
    If Option1(2).Value = True Then aPr(2).Value = 3
    
    For i = 0 To 2
        tCmd.Parameters.Append aPr(i)
    Next i
       
    Set tRs = tCmd.Execute
Else
    
    Set tCmd.ActiveConnection = sConn
    tCmd.CommandType = adCmdStoredProc
    tCmd.CommandText = "ta_card_access_log_select_by_CardID"
    
    Set bPr(0) = tCmd.CreateParameter("CardID", adVarChar, adParamInput, 20)
    Set bPr(1) = tCmd.CreateParameter("FromTime", adDBTimeStamp, adParamInput, 8)
    Set bPr(2) = tCmd.CreateParameter("ToTime", adDBTimeStamp, adParamInput, 8)
    Set bPr(3) = tCmd.CreateParameter("SelectOption", adTinyInt, adParamInput, 1)
    
    If Check1.Value = Unchecked Then
        bPr(0).Value = Null
    Else
        bPr(0).Value = Trim(Left(EmpCardCb.Text, 20))
    End If
        
    If Check2.Value = Unchecked Then
        bPr(1).Value = Null
    Else
        bPr(1).Value = DTPicker1.Value
    End If
    
    If Check3.Value = Unchecked Then
        bPr(2).Value = Null
    Else
        bPr(2).Value = DTPicker2.Value
    End If
    
    If Option1(0).Value = True Then bPr(3).Value = 1
    If Option1(1).Value = True Then bPr(3).Value = 2
    If Option1(2).Value = True Then bPr(3).Value = 3
    
    For i = 0 To 3
        tCmd.Parameters.Append bPr(i)
    Next i
    
    Set tRs = tCmd.Execute
End If

numRec = 0

Do While Not tRs.EOF
    numRec = numRec + 1

    MSHFlexGrid1.AddItem Format(tRs("DateTime"), "dd/MM/yyyy HH:mm:ss") + Chr(9) + tRs("CardID") + Chr(9) + tRs("RecorderID") + Chr(9) + Format(tRs("Valid"), "Yes/No") + Chr(9) + Format(tRs("TimeRecorded"), "Yes/No")

    tRs.MoveNext
Loop

If numRec > 0 Then MSHFlexGrid1.RemoveItem 1

StatusBar1.SimpleText = "Total " + Format(numRec, "#,##0") + " record(s)..."

Set sCmd = Nothing
Set sRs = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MainMDI.MousePointer = vbDefault
MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Private Sub Check1_Click()

If Check1.Value = Checked Then
    EmpCardCb.Enabled = True
    Command1.Enabled = True
ElseIf Check1.Value = Unchecked Then
    EmpCardCb.Enabled = False
    Command1.Enabled = False
End If

Command5_Click

End Sub

Private Sub Check2_Click()

If Check2.Value = Checked Then
    DTPicker1.Enabled = True
ElseIf Check2.Value = Unchecked Then
    DTPicker1.Enabled = False
End If

Command5_Click

End Sub

Private Sub Check3_Click()

If Check3.Value = Checked Then
    DTPicker2.Enabled = True
ElseIf Check3.Value = Unchecked Then
    DTPicker2.Enabled = False
End If

Command5_Click

End Sub

Private Sub Command1_Click()

Dim frmCalled As New EmployeeCard
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

frmCalled.SelectCalled
Me.Enabled = False

End Sub

Private Sub Command4_Click()
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim aPr(2) As ADODB.Parameter
Dim bPr(3) As ADODB.Parameter
Dim i As Long

On Error GoTo ErrHandler

If numRec = 0 Then
    MsgBox "No record found...", vbExclamation + vbOKOnly
    Exit Sub
End If

Co = MsgBox("Do you want to delete these records?", vbQuestion + vbYesNo)
If Co = vbYes Then

    If Check1.Value = Unchecked Then
    
        Set tCmd.ActiveConnection = sConn
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "ta_card_access_log_delete_by_DateTime"
        
        Set aPr(0) = tCmd.CreateParameter("FromTime", adDBTimeStamp, adParamInput, 8)
        Set aPr(1) = tCmd.CreateParameter("ToTime", adDBTimeStamp, adParamInput, 8)
        Set aPr(2) = tCmd.CreateParameter("DeleteOption", adTinyInt, adParamInput, 1)
        
        If Check2.Value = Unchecked Then
            aPr(0).Value = Null
        Else
            aPr(0).Value = DTPicker1.Value
        End If
        
        If Check3.Value = Unchecked Then
            aPr(1).Value = Null
        Else
            aPr(1).Value = DTPicker2.Value
        End If
        
        If Option1(0).Value = True Then aPr(2).Value = 1
        If Option1(1).Value = True Then aPr(2).Value = 2
        If Option1(2).Value = True Then aPr(2).Value = 3
        
        For i = 0 To 2
            tCmd.Parameters.Append aPr(i)
        Next i
           
        Set tRs = tCmd.Execute
    Else
        
        Set tCmd.ActiveConnection = sConn
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "ta_card_access_log_delete_by_CardID"
        
        Set bPr(0) = tCmd.CreateParameter("CardID", adVarChar, adParamInput, 20)
        Set bPr(1) = tCmd.CreateParameter("FromTime", adDBTimeStamp, adParamInput, 8)
        Set bPr(2) = tCmd.CreateParameter("ToTime", adDBTimeStamp, adParamInput, 8)
        Set bPr(3) = tCmd.CreateParameter("DeleteOption", adTinyInt, adParamInput, 1)
        
        If Check1.Value = Unchecked Then
            bPr(0).Value = Null
        Else
            bPr(0).Value = Trim(Left(EmpCardCb.Text, 20))
        End If
            
        If Check2.Value = Unchecked Then
            bPr(1).Value = Null
        Else
            bPr(1).Value = DTPicker1.Value
        End If
        
        If Check3.Value = Unchecked Then
            bPr(2).Value = Null
        Else
            bPr(2).Value = DTPicker2.Value
        End If
        
        If Option1(0).Value = True Then bPr(3).Value = 1
        If Option1(1).Value = True Then bPr(3).Value = 2
        If Option1(2).Value = True Then bPr(3).Value = 3
        
        For i = 0 To 3
            tCmd.Parameters.Append bPr(i)
        Next i
        
        Set tRs = tCmd.Execute
    End If

    Set tRs = Nothing
    Set tCmd = Nothing
    
    Command5_Click

End If

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Public Sub Command5_Click()
    LoadMSHFlexGrid1
End Sub

Private Sub DTPicker1_Change()

Command5_Click

End Sub

Private Sub DTPicker1_Validate(Cancel As Boolean)

Command5_Click

End Sub

Private Sub DTPicker2_Click()

Command5_Click

End Sub

Private Sub DTPicker2_Validate(Cancel As Boolean)

Command5_Click

End Sub

Private Sub EmpCardCb_Change()

Command5_Click

End Sub

Private Sub EmpCardCb_Click()

Command5_Click

End Sub

Private Sub Form_Load()
    Me.Top = (MainMDI.ScaleHeight - Me.Height) / 2
    Me.Left = (MainMDI.ScaleWidth - Me.Width) / 2
    
    EmpCardCb.Enabled = False
    Command1.Enabled = False
    DTPicker1.Enabled = True
    DTPicker2.Enabled = True
    LoadEmpCardCb
    DTPicker1.Value = Now
    DTPicker2.Value = Now
    
    Check2.Value = Checked
    Check3.Value = Checked
    Option1(0).Value = True
    
    Command5_Click
End Sub

Private Sub Form_Unload(Cancel As Integer)

If Not (frmCaller Is Nothing) Then
    frmCaller.Enabled = True
End If

End Sub

Public Sub LoadEmpCardCb()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(0) As Variant

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "ta_employee_card_select_all"
tPr(0) = CurCmp

Set tRs = tCmd.Execute(, tPr)

EmpCardCb.Clear

Do While Not tRs.EOF
    
    EmpCardCb.AddItem FillSpace(tRs("CardID"), 20) + " - " + tRs("EID") + " " + tRs("CardHolderName")

    tRs.MoveNext
Loop

Set sCmd = Nothing
Set sRs = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MainMDI.MousePointer = vbDefault
MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Public Sub EmpCardCbSelect(ByVal Param As String)
Dim i As Long

LoadEmpCardCb

For i = 0 To EmpCardCb.ListCount - 1
    If Trim(Left(EmpCardCb.List(i), 20)) = Trim(Param) Then
        EmpCardCb.Text = EmpCardCb.List(i)
        Command5_Click
        Exit Sub
    End If
Next i

End Sub

Private Sub Option1_Click(Index As Integer)

Command5_Click

End Sub
