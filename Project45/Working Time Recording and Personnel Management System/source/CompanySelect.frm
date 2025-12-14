VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form CompanySelect 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Company Selection"
   ClientHeight    =   4380
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   9255
   Icon            =   "CompanySelect.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   4380
   ScaleWidth      =   9255
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   7920
      TabIndex        =   4
      Top             =   3480
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   6720
      TabIndex        =   3
      Top             =   3480
      Width           =   1095
   End
   Begin VB.Frame Frame1 
      Caption         =   "Company List"
      Height          =   3135
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   8775
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
         Height          =   2775
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   8535
         _ExtentX        =   15055
         _ExtentY        =   4895
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
      TabIndex        =   2
      Top             =   4065
      Width           =   9255
      _ExtentX        =   16325
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
Attribute VB_Name = "CompanySelect"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Sub MSHFlexGrid1Clear()
Dim j As Long

MSHFlexGrid1.Cols = 3
MSHFlexGrid1.Clear
For j = 1 To MSHFlexGrid1.Rows - 2
 MSHFlexGrid1.RemoveItem 1
Next j

MSHFlexGrid1.TextMatrix(0, 0) = "CID"
MSHFlexGrid1.ColAlignment(0) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(0) = 700

MSHFlexGrid1.TextMatrix(0, 1) = "TH_CompanyName"
MSHFlexGrid1.ColAlignment(1) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(1) = 3500

MSHFlexGrid1.TextMatrix(0, 2) = "EN_CompanyName"
MSHFlexGrid1.ColAlignment(2) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(2) = 3500

MSHCount = 0

End Sub

Sub LoadMSHFlexGrid1()

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset

On Error GoTo ErrHandler
    
MainMDI.MousePointer = vbHourglass
    
MSHFlexGrid1Clear
    
Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "app_company_select_all"

Set tRs = tCmd.Execute

MSHCount = 0
Do While Not tRs.EOF
    
    MSHFlexGrid1.AddItem tRs("CID") + Chr(9) + tRs("TH_CompanyName") + Chr(9) + tRs("EN_CompanyName")
    
    MSHCount = MSHCount + 1
    tRs.MoveNext
Loop

If MSHCount > 0 Then MSHFlexGrid1.RemoveItem 1
StatusBar1.SimpleText = "Total " + Format(MSHCount, "#,##0") + " record(s)..."

Set tRs = Nothing
Set tCmd = Nothing
MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly
MainMDI.MousePointer = vbDefault

End Sub

Private Sub Command1_Click()

MainMDI.StatusBar2.Panels(1).Text = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 0)
MainMDI.StatusBar2.Panels(2).Text = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 2)
CurCmp = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 0)
cmpFLAG = True

MainMDI.RefreshMenuAccess

Unload CompanySelect

If dyrFLAG = False Then
    Load DataYearSelect
    DataYearSelect.Show
End If

MainMDI.mChangeCompany.Enabled = True
MainMDI.mChangeYear.Enabled = True
MainMDI.mUserInfo.Enabled = True
MainMDI.mHRM.Enabled = True
MainMDI.mPR.Enabled = True
MainMDI.mTA.Enabled = True
MainMDI.mRpt.Enabled = True

End Sub

Private Sub Command2_Click()

Unload Me

End Sub

Private Sub Form_Load()

Me.Top = (MainMDI.ScaleHeight - Me.Height) / 2
Me.Left = (MainMDI.ScaleWidth - Me.Width) / 2

MainMDI.mChangeYear.Enabled = False
MainMDI.mHRM.Enabled = False
MainMDI.mPR.Enabled = False
MainMDI.mTA.Enabled = False
MainMDI.mRpt.Enabled = False

LoadMSHFlexGrid1

End Sub

Private Sub MSHFlexGrid1_DblClick()

Command1_Click

End Sub
