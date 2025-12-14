VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "mshflxgd.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form Preference 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Preference"
   ClientHeight    =   5835
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8070
   Icon            =   "Preference.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5835
   ScaleWidth      =   8070
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command3 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   6720
      TabIndex        =   4
      Top             =   4920
      Width           =   1095
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Save"
      Height          =   375
      Left            =   5520
      TabIndex        =   3
      Top             =   4920
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Reload"
      Height          =   375
      Left            =   240
      TabIndex        =   2
      Top             =   4920
      Width           =   1095
   End
   Begin VB.Frame Frame1 
      Caption         =   "System Preference"
      Height          =   4575
      Left            =   240
      TabIndex        =   5
      Top             =   240
      Width           =   7575
      Begin VB.TextBox TextMSH1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         ForeColor       =   &H00C00000&
         Height          =   275
         Left            =   0
         MaxLength       =   20
         TabIndex        =   1
         Text            =   "Text1"
         Top             =   4320
         Visible         =   0   'False
         Width           =   975
      End
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
         Height          =   4215
         Left            =   120
         TabIndex        =   0
         Top             =   240
         Width           =   7335
         _ExtentX        =   12938
         _ExtentY        =   7435
         _Version        =   393216
         FixedCols       =   0
         AllowBigSelection=   0   'False
         AllowUserResizing=   1
         _NumberOfBands  =   1
         _Band(0).Cols   =   2
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   6
      Top             =   5520
      Width           =   8070
      _ExtentX        =   14235
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
Attribute VB_Name = "Preference"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private numRec As Long

Sub MSHFlexGrid1Clear()
Dim j As Long

MSHFlexGrid1.Cols = 4
MSHFlexGrid1.Clear
For j = 1 To MSHFlexGrid1.Rows - 2
 MSHFlexGrid1.RemoveItem 1
Next j

MSHFlexGrid1.TextMatrix(0, 0) = "PCode"
MSHFlexGrid1.ColAlignment(0) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(0) = 0

MSHFlexGrid1.TextMatrix(0, 1) = "Description"
MSHFlexGrid1.ColAlignment(1) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(1) = 4000

MSHFlexGrid1.TextMatrix(0, 2) = "OldValue"
MSHFlexGrid1.ColAlignment(2) = flexAlignRightCenter
MSHFlexGrid1.ColWidth(2) = 0

MSHFlexGrid1.TextMatrix(0, 3) = "Value"
MSHFlexGrid1.ColAlignment(3) = flexAlignRightCenter
MSHFlexGrid1.ColWidth(3) = 1500

End Sub

Sub LoadMSHFlexGrid1()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim i As Long

MSHFlexGrid1Clear

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "app_parameter_select_all"
   
Set tRs = tCmd.Execute

numRec = 0

Do While Not tRs.EOF
    numRec = numRec + 1
    
    MSHFlexGrid1.AddItem tRs("PCode") + Chr(9) + tRs("PDesc") + Chr(9) + Format(tRs("PValue"), "#,##0") + Chr(9) + Format(tRs("PValue"), "#,##0")

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

Private Sub Command1_Click()

LoadMSHFlexGrid1

End Sub

Private Sub Command2_Click()

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(1) As Variant
Dim i As Long

On Error GoTo ErrHandler

If numRec = 0 Then
    MsgBox "No record found...", vbExclamation + vbOKOnly
    Exit Sub
End If

Co = MsgBox("Do you want to save preference?", vbQuestion + vbYesNo)
If Co = vbYes Then

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "app_parameter_update"

For i = 1 To numRec
    If CFC(MSHFlexGrid1.TextMatrix(i, 2)) <> CFC(MSHFlexGrid1.TextMatrix(i, 3)) Then

        tPr(0) = MSHFlexGrid1.TextMatrix(i, 0)
        tPr(1) = CFC(MSHFlexGrid1.TextMatrix(i, 3))
    
        Set tRs = tCmd.Execute(, tPr)
    End If
Next i

Set tRs = Nothing
Set tCmd = Nothing

Command1_Click

End If

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Private Sub Command3_Click()

Unload Me

End Sub

Private Sub Form_Load()

Me.Top = (MainMDI.ScaleHeight - Me.Height) / 2
Me.Left = (MainMDI.ScaleWidth - Me.Width) / 2

Command1_Click

End Sub

Private Sub MSHFlexGrid1_EnterCell()

Dim Rowsel As Long, Colsel As Long
Dim Value As String

Rowsel = MSHFlexGrid1.Rowsel
Colsel = MSHFlexGrid1.Colsel
Value = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, MSHFlexGrid1.Colsel)

If Colsel = 3 Then
    TextMSH1.Width = MSHFlexGrid1.CellWidth - 20
    TextMSH1.Height = MSHFlexGrid1.CellHeight - 20
    TextMSH1.Left = MSHFlexGrid1.CellLeft + MSHFlexGrid1.Left
    TextMSH1.Top = MSHFlexGrid1.CellTop + MSHFlexGrid1.Top
    TextMSH1.Text = Value
    TextMSH1.Visible = True
    TextMSH1.SetFocus
Else
    TextMSH1.Visible = False
End If

End Sub

Private Sub MSHFlexGrid1_LeaveCell()

Dim Rowsel As Long, Colsel As Long
Dim Value As String


Rowsel = MSHFlexGrid1.Rowsel
Colsel = MSHFlexGrid1.Colsel
Value = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, MSHFlexGrid1.Colsel)

If TextMSH1.Visible = True Then
    If MSHFlexGrid1.Colsel = 3 And CFC(TextMSH1.Text) >= 0 Then
        MSHFlexGrid1.Text = Format(CFC(TextMSH1.Text), "#,##0")
    End If
    TextMSH1.Text = ""
End If

End Sub

Private Sub MShFlexGrid1_Scroll()

TextMSH1.Visible = False

End Sub

