VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form ProgressiveTaxRateDetail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Progressive Tax Rate Information"
   ClientHeight    =   7050
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   8415
   Icon            =   "ProgressiveTaxRateDetail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7050
   ScaleWidth      =   8415
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   6960
      TabIndex        =   14
      Top             =   6120
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   5640
      TabIndex        =   13
      Top             =   6120
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Progressive Tax Rate Information"
      Height          =   5775
      Left            =   240
      TabIndex        =   16
      Top             =   240
      Width           =   7935
      Begin VB.Frame Frame3 
         Caption         =   "Tax Level && Rate Detail"
         Height          =   1455
         Left            =   120
         TabIndex        =   24
         Top             =   3280
         Width           =   7695
         Begin VB.TextBox Text2 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   285
            Left            =   1680
            MaxLength       =   20
            TabIndex        =   7
            Text            =   "Text2"
            Top             =   660
            Width           =   1455
         End
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   285
            Left            =   4680
            MaxLength       =   20
            TabIndex        =   8
            Text            =   "Text3"
            Top             =   660
            Width           =   1455
         End
         Begin VB.TextBox Text4 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   285
            Left            =   1680
            MaxLength       =   20
            TabIndex        =   9
            Text            =   "Text4"
            Top             =   1020
            Width           =   1455
         End
         Begin VB.TextBox Text5 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   285
            Left            =   4680
            MaxLength       =   20
            TabIndex        =   10
            Text            =   "Text5"
            Top             =   1020
            Width           =   1455
         End
         Begin VB.TextBox Text1 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   285
            Left            =   1680
            MaxLength       =   20
            TabIndex        =   6
            Text            =   "Text1"
            Top             =   300
            Width           =   1455
         End
         Begin VB.CommandButton Command6 
            Caption         =   "&OK"
            Height          =   375
            Left            =   6360
            TabIndex        =   11
            Top             =   240
            Width           =   1095
         End
         Begin VB.CommandButton Command7 
            Caption         =   "&Cancel"
            Height          =   375
            Left            =   6360
            TabIndex        =   12
            Top             =   720
            Width           =   1095
         End
         Begin VB.Label Label1 
            BackStyle       =   0  'Transparent
            Caption         =   "Accumulated :"
            Height          =   255
            Index           =   8
            Left            =   3360
            TabIndex        =   29
            Top             =   1080
            Width           =   1095
         End
         Begin VB.Label Label1 
            BackStyle       =   0  'Transparent
            Caption         =   "Tax Rate :"
            Height          =   255
            Index           =   7
            Left            =   240
            TabIndex        =   28
            Top             =   1080
            Width           =   1455
         End
         Begin VB.Label Label1 
            BackStyle       =   0  'Transparent
            Caption         =   "To :"
            Height          =   255
            Index           =   4
            Left            =   3360
            TabIndex        =   27
            Top             =   720
            Width           =   615
         End
         Begin VB.Label Label1 
            BackStyle       =   0  'Transparent
            Caption         =   "Tax Basis From :"
            Height          =   255
            Index           =   2
            Left            =   240
            TabIndex        =   26
            Top             =   720
            Width           =   1455
         End
         Begin VB.Label Label1 
            BackStyle       =   0  'Transparent
            Caption         =   "Tax Level :"
            Height          =   255
            Index           =   1
            Left            =   240
            TabIndex        =   25
            Top             =   360
            Width           =   1455
         End
      End
      Begin VB.Frame Frame2 
         Caption         =   "Lisr of Tax Level && Rate"
         Height          =   2175
         Left            =   120
         TabIndex        =   23
         Top             =   1080
         Width           =   7695
         Begin VB.CommandButton Command3 
            Caption         =   "&Add"
            Height          =   375
            Left            =   6360
            TabIndex        =   4
            Top             =   240
            Width           =   1095
         End
         Begin VB.CommandButton Command4 
            Caption         =   "&Remove"
            Height          =   375
            Left            =   6360
            TabIndex        =   5
            Top             =   720
            Width           =   1095
         End
         Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
            Height          =   1815
            Left            =   120
            TabIndex        =   3
            ToolTipText     =   "Click to view detail..."
            Top             =   240
            Width           =   6015
            _ExtentX        =   10610
            _ExtentY        =   3201
            _Version        =   393216
            FixedCols       =   0
            AllowBigSelection=   0   'False
            SelectionMode   =   1
            AllowUserResizing=   1
            _NumberOfBands  =   1
            _Band(0).Cols   =   2
         End
      End
      Begin VB.CheckBox Check1 
         Caption         =   "No Expire Date"
         Height          =   255
         Left            =   3840
         TabIndex        =   2
         Top             =   720
         Width           =   1455
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   315
         Left            =   2160
         TabIndex        =   0
         Top             =   300
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   556
         _Version        =   393216
         Format          =   19660801
         CurrentDate     =   37642
      End
      Begin MSComCtl2.DTPicker DTPicker2 
         Height          =   315
         Left            =   2160
         TabIndex        =   1
         Top             =   660
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   556
         _Version        =   393216
         Format          =   19660801
         CurrentDate     =   37642
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   1
         Left            =   1920
         TabIndex        =   22
         Top             =   5280
         Width           =   4935
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   0
         Left            =   1920
         TabIndex        =   21
         Top             =   4920
         Width           =   4935
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Last Modified by :"
         Height          =   255
         Index           =   6
         Left            =   360
         TabIndex        =   20
         Top             =   5280
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Created by :"
         Height          =   255
         Index           =   5
         Left            =   360
         TabIndex        =   19
         Top             =   4920
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Expire Date :"
         Height          =   255
         Index           =   3
         Left            =   360
         TabIndex        =   18
         Top             =   720
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Effective Date :"
         Height          =   255
         Index           =   0
         Left            =   360
         TabIndex        =   17
         Top             =   360
         Width           =   1455
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   15
      Top             =   6735
      Width           =   8415
      _ExtentX        =   14843
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
Attribute VB_Name = "ProgressiveTaxRateDetail"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private frmStatus As FormState
Private frmCaller As Object
Private OldCode As String
Private numRec As Long

Public Property Get Caller() As Object
   Set Caller = frmCaller
End Property

Public Property Set Caller(NewValue As Object)
   Set frmCaller = NewValue
End Property

Private Sub ClrScr()

Check1.Value = Unchecked
DTPicker2.Visible = True

DTPicker1.Value = DateFilter(Now)
DTPicker2.Value = DateFilter(Now)

MSHFlexGrid1Clear

Label2(0).Caption = ""
Label2(1).Caption = ""

ClrScrSub

End Sub

Private Sub ClrScrSub()

Text1.Text = ""
Text2.Text = ""
Text3.Text = ""
Text4.Text = ""
Text5.Text = ""

End Sub

Private Sub Check1_Click()

If Check1.Value = Checked Then
    DTPicker2.Visible = False
Else
    DTPicker2.Visible = True
End If

End Sub

Private Sub Command1_Click()
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(3) As Variant
Dim xPr(4) As Variant
Dim dPr(1) As New ADODB.Parameter
Dim iPr(8) As New ADODB.Parameter
Dim i As Long
Dim j As Long

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

Select Case frmStatus
    Case Is = FormState.Create
        
    Case Is = FormState.Modify

        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "pr_ptr_delete"

        Set dPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set dPr(1) = tCmd.CreateParameter("EffectiveDate", adDBTimeStamp, adParamInput, 8)

        dPr(0).Value = CurCmp
        dPr(1).Value = CDateX(OldCode)

        For j = 0 To 1
            tCmd.Parameters.Append dPr(j)
        Next j

        Set tRs = tCmd.Execute

    Case Else
        MsgBox "Invalid Form Status...", vbCritical + vbOKOnly
        Exit Sub
End Select

For i = 1 To numRec

    For j = 0 To tCmd.Parameters.Count - 1
        tCmd.Parameters.Delete 0
    Next j
    
    tCmd.CommandType = adCmdStoredProc
    tCmd.CommandText = "pr_ptr_insert"
    
    Set iPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
    Set iPr(1) = tCmd.CreateParameter("EffectiveDate", adDBTimeStamp, adParamInput, 8)
    Set iPr(2) = tCmd.CreateParameter("ExpireDate", adDBTimeStamp, adParamInput, 8)
    Set iPr(3) = tCmd.CreateParameter("TaxLevel", adTinyInt, adParamInput, 1)
    Set iPr(4) = tCmd.CreateParameter("TaxBaseBasis", adCurrency, adParamInput, 8)
    Set iPr(5) = tCmd.CreateParameter("TaxBaseCutOff", adCurrency, adParamInput, 8)
    Set iPr(6) = tCmd.CreateParameter("TaxRate", adCurrency, adParamInput, 8)
    Set iPr(7) = tCmd.CreateParameter("TaxAccumulatedBF", adCurrency, adParamInput, 8)
    Set iPr(8) = tCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10)
    
    iPr(0).Value = CurCmp
    iPr(1).Value = DateFilter(DTPicker1.Value)
    If Check1.Value = Unchecked Then
        iPr(2).Value = DateFilter(DTPicker2.Value)
    Else
        iPr(2).Value = Null
    End If
    
    iPr(3).Value = CFC(MSHFlexGrid1.TextMatrix(i, 0))
    iPr(4).Value = CFC(MSHFlexGrid1.TextMatrix(i, 1))
    iPr(5).Value = CFC(MSHFlexGrid1.TextMatrix(i, 2))
    iPr(6).Value = CFC(MSHFlexGrid1.TextMatrix(i, 3))
    iPr(7).Value = CFC(MSHFlexGrid1.TextMatrix(i, 4))
    iPr(8).Value = CurUser
    
    For j = 0 To 8
        tCmd.Parameters.Append iPr(j)
    Next j

    Set tRs = tCmd.Execute

Next i

Set tRs = Nothing
Set tCmd = Nothing

Unload Me
frmCaller.Command5_Click
MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly
MainMDI.MousePointer = vbDefault

End Sub

Private Sub Command2_Click()

Unload Me

End Sub

Private Sub Command3_Click()

ClrScrSub
Frame2.Enabled = False
Frame3.Enabled = True
DTPicker1.Enabled = False
DTPicker2.Enabled = False
Check1.Enabled = False
Command1.Enabled = False
Text1.SetFocus

End Sub

Private Sub Command4_Click()

If MSHFlexGrid1.RowSel = 0 Or numRec = 0 Then
    MsgBox "Please choose record first...", vbExclamation + vbOKOnly
    Exit Sub
End If

Co = MsgBox("Do you want to delete this record?", vbQuestion + vbYesNo)
If Co = vbYes Then
    numRec = numRec - 1
    If numRec > 0 Then
        MSHFlexGrid1.RemoveItem MSHFlexGrid1.RowSel
    Else
        MSHFlexGrid1Clear
    End If
End If

End Sub

Private Sub Command6_Click()
Dim i As Long
Dim a As Currency
Dim b As Currency

If CFC(Text1.Text) <= 0 Then
    MsgBox "Invalid Level...", vbExclamation + vbOKOnly
    Exit Sub
End If

'======== Range Collision Check

For i = 1 To numRec
    If CFC(MSHFlexGrid1.TextMatrix(i, 0)) = CFC(Text1.Text) Then
        MsgBox "Duplicated Level...", vbExclamation + vbOKOnly
        Exit Sub
    End If
    a = CFC(MSHFlexGrid1.TextMatrix(i, 1))
    b = CFC(MSHFlexGrid1.TextMatrix(i, 2))
    If (a <= CFC(Text2.Text) And b >= CFC(Text2.Text)) Or (a <= CFC(Text3.Text) And b >= CFC(Text3.Text)) Then
        MsgBox "This level basis range violates existing levels...", vbExclamation + vbOKOnly
        Exit Sub
    End If
Next i

'======== Insert new row
MSHFlexGrid1.AddItem TTi(Text1.Text) + Chr(9) + TTc(Text2.Text) + Chr(9) + TTc(Text3.Text) + Chr(9) + TTc(Text4.Text) + Chr(9) + TTc(Text5.Text)

numRec = numRec + 1
If numRec = 1 Then MSHFlexGrid1.RemoveItem 1

Command7_Click

End Sub

Private Sub Command7_Click()

ClrScrSub
Frame2.Enabled = True
Frame3.Enabled = False
DTPicker1.Enabled = True
DTPicker2.Enabled = True
Check1.Enabled = True
Command1.Enabled = True
MSHFlexGrid1.SetFocus

End Sub

Private Sub Form_Load()

Me.Top = (MainMDI.ScaleHeight - Me.Height) / 2
Me.Left = (MainMDI.ScaleWidth - Me.Width) / 2

End Sub

Private Sub Form_Unload(Cancel As Integer)

If Not (frmCaller Is Nothing) Then
    frmCaller.Enabled = True
End If

End Sub

Public Sub CreateDetail()

ClrScr
StatusBar1.SimpleText = "Create New Record..."
frmStatus = FormState.Create
Label2(0).Caption = "N/A"
Label2(1).Caption = "N/A"

End Sub

Public Sub ViewDetail(ByVal CodeParam As String)

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(1) As Variant
Dim i As Long
Dim j As Long

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

ClrScr

StatusBar1.SimpleText = "View Record Detail..."
frmStatus = FormState.View

Command1.Enabled = False
Command3.Enabled = False
Command4.Enabled = False
DTPicker1.Enabled = False
DTPicker2.Enabled = False
Check1.Enabled = False
Frame3.Enabled = False

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "pr_ptr_select"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
Set tPr(1) = tCmd.CreateParameter("EffectiveDate", adDBTimeStamp, adParamInput, 8)

tPr(0).Value = CurCmp
tPr(1).Value = CDateX(CodeParam)

For i = 0 To 1
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

numRec = 0
MSHFlexGrid1Clear
If tRs.EOF = False Then

    DTPicker1.Value = tRs("EffectiveDate")
    If IsNull(tRs("ExpireDate")) = False Then
        DTPicker2.Value = tRs("ExpireDate")
        Check1.Value = Unchecked
        DTPicker2.Visible = True
    Else
        Check1.Value = Checked
        DTPicker2.Visible = False
    End If
    
    If IsNull(tRs("CreateUserID")) Or IsNull(tRs("CreateDateTime")) Then
        Label2(0).Caption = "N/A"
    Else
        Label2(0).Caption = Trim(tRs("CreateUserID")) + " :: " + Format(tRs("CreateDateTime"), "Long Date") + " " + Format(tRs("CreateDateTime"), "Long Time")
    End If
    If IsNull(tRs("LastModifyUserID")) Or IsNull(tRs("LastModifyDateTime")) Then
        Label2(1).Caption = "N/A"
    Else
        Label2(1).Caption = Trim(tRs("LastModifyUserID")) + " :: " + Format(tRs("LastModifyDateTime"), "Long Date") + " " + Format(tRs("LastModifyDateTime"), "Long Time")
    End If

    Do While Not tRs.EOF
        
        MSHFlexGrid1.AddItem TTi(tRs("TaxLevel")) + Chr(9) + TTc(tRs("TaxBaseBasis")) + Chr(9) + TTc(tRs("TaxBaseCutOff")) + Chr(9) + TTc(tRs("TaxRate")) + Chr(9) + TTc(tRs("TaxAccumulatedBF"))
    
        numRec = numRec + 1
    
        tRs.MoveNext
    Loop
End If

If numRec > 0 Then MSHFlexGrid1.RemoveItem 1

Set tRs = Nothing
Set tCmd = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly
MainMDI.MousePointer = vbDefault

End Sub

Public Sub ModifyDetail(ByVal CodeParam As String)

ViewDetail CodeParam

OldCode = CodeParam

StatusBar1.SimpleText = "Modify Record Detail..."
frmStatus = FormState.Modify

Command1.Enabled = True
Command3.Enabled = True
Command4.Enabled = True
DTPicker1.Enabled = True
DTPicker2.Enabled = True
Check1.Enabled = True
Frame3.Enabled = True

End Sub

Sub MSHFlexGrid1Clear()
Dim j As Long

MSHFlexGrid1.Cols = 5
MSHFlexGrid1.Clear
For j = 1 To MSHFlexGrid1.Rows - 2
 MSHFlexGrid1.RemoveItem 1
Next j

MSHFlexGrid1.TextMatrix(0, 0) = "Level"
MSHFlexGrid1.ColAlignment(0) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(0) = 600

MSHFlexGrid1.TextMatrix(0, 1) = "BasisFrom"
MSHFlexGrid1.ColAlignment(1) = flexAlignRightCenter
MSHFlexGrid1.ColWidth(1) = 1200

MSHFlexGrid1.TextMatrix(0, 2) = "BasisTo"
MSHFlexGrid1.ColAlignment(2) = flexAlignRightCenter
MSHFlexGrid1.ColWidth(2) = 1200

MSHFlexGrid1.TextMatrix(0, 3) = "TaxRate"
MSHFlexGrid1.ColAlignment(3) = flexAlignRightCenter
MSHFlexGrid1.ColWidth(3) = 1200

MSHFlexGrid1.TextMatrix(0, 4) = "Accumulated"
MSHFlexGrid1.ColAlignment(4) = flexAlignRightCenter
MSHFlexGrid1.ColWidth(4) = 1200

numRec = 0

End Sub

Private Sub MSHFlexGrid1_Click()

ClrScrSub

Text1.Text = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.RowSel, 0)
Text2.Text = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.RowSel, 1)
Text3.Text = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.RowSel, 2)
Text4.Text = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.RowSel, 3)
Text5.Text = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.RowSel, 4)

End Sub
