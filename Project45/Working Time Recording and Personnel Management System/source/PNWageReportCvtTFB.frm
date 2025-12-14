VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.Form PNWageReportCvtTFB 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Convert Data for Thai Farmers Bank PCL"
   ClientHeight    =   5070
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8280
   Icon            =   "PNWageReportCvtTFB.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5070
   ScaleWidth      =   8280
   ShowInTaskbar   =   0   'False
   Begin MSComctlLib.ProgressBar ProgressBar1 
      Height          =   255
      Left            =   3060
      TabIndex        =   12
      Top             =   4800
      Width           =   5200
      _ExtentX        =   9181
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   0
   End
   Begin VB.CommandButton Command1 
      Height          =   615
      Left            =   7440
      Picture         =   "PNWageReportCvtTFB.frx":0442
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   3960
      Width           =   615
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   11
      Top             =   4755
      Width           =   8280
      _ExtentX        =   14605
      _ExtentY        =   556
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   2
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   5292
            MinWidth        =   5292
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   9701
            MinWidth        =   9701
         EndProperty
      EndProperty
   End
   Begin VB.Frame Frame1 
      Caption         =   "Conversion Information"
      Height          =   2295
      Left            =   240
      TabIndex        =   5
      Top             =   1560
      Width           =   7815
      Begin VB.Frame Frame6 
         Caption         =   "Pay in Date # YYMMDD"
         Height          =   735
         Left            =   5280
         TabIndex        =   10
         Top             =   1320
         Width           =   2295
         Begin MSMask.MaskEdBox MaskEdBox1 
            Height          =   315
            Left            =   120
            TabIndex        =   3
            Top             =   300
            Width           =   855
            _ExtentX        =   1508
            _ExtentY        =   556
            _Version        =   393216
            ForeColor       =   13062190
            MaxLength       =   6
            Mask            =   "######"
            PromptChar      =   "_"
         End
         Begin VB.Label Label1 
            BackStyle       =   0  'Transparent
            Caption         =   "exp. 010515"
            Height          =   255
            Left            =   1080
            TabIndex        =   13
            Top             =   360
            Width           =   1095
         End
      End
      Begin VB.Frame Frame5 
         Caption         =   "Diskette Drive"
         Height          =   735
         Left            =   3600
         TabIndex        =   9
         Top             =   1320
         Width           =   1575
         Begin VB.ComboBox Combo2 
            ForeColor       =   &H00C7502E&
            Height          =   315
            Left            =   120
            TabIndex        =   2
            Top             =   300
            Width           =   1335
         End
      End
      Begin VB.Frame Frame4 
         Caption         =   "Company Code"
         Height          =   735
         Left            =   1920
         TabIndex        =   8
         Top             =   1320
         Width           =   1575
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            BackStyle       =   0  'Transparent
            ForeColor       =   &H00D34951&
            Height          =   255
            Index           =   1
            Left            =   120
            TabIndex        =   15
            Top             =   360
            Width           =   1335
         End
      End
      Begin VB.Frame Frame3 
         Caption         =   "Payroll Pay No."
         Height          =   735
         Left            =   240
         TabIndex        =   7
         Top             =   1320
         Width           =   1575
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            BackStyle       =   0  'Transparent
            ForeColor       =   &H00D34951&
            Height          =   255
            Index           =   0
            Left            =   120
            TabIndex        =   14
            Top             =   360
            Width           =   1335
         End
      End
      Begin VB.Frame Frame2 
         Caption         =   "Bank Branch"
         Height          =   855
         Left            =   240
         TabIndex        =   6
         Top             =   360
         Width           =   7335
         Begin VB.CommandButton Command3 
            Height          =   315
            Left            =   6840
            Picture         =   "PNWageReportCvtTFB.frx":0884
            Style           =   1  'Graphical
            TabIndex        =   1
            Top             =   300
            Width           =   375
         End
         Begin VB.ComboBox Combo1 
            ForeColor       =   &H00C7502E&
            Height          =   315
            Left            =   120
            TabIndex        =   0
            Top             =   300
            Width           =   6735
         End
      End
   End
   Begin VB.Image Image1 
      Height          =   1155
      Left            =   3960
      Picture         =   "PNWageReportCvtTFB.frx":0986
      Top             =   120
      Width           =   4110
   End
   Begin VB.Shape Shape1 
      BorderStyle     =   0  'Transparent
      FillColor       =   &H00FFFFFF&
      FillStyle       =   0  'Solid
      Height          =   1455
      Left            =   0
      Top             =   0
      Width           =   8295
   End
End
Attribute VB_Name = "PNWageReportCvtTFB"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo1_Change()

Combo1_Click

End Sub

Private Sub Combo1_Click()

If Combo1.Text = "" Then
 Command1.Enabled = False
 MsgBox "You have to select bank branch first...", vbCritical + vbOKOnly
 Exit Sub
End If

Cri$ = "BankBRID = '" + Left(Combo1.Text, 6) + "'"
PNbbTB.Requery
If PNbbTB.RecordCount > 0 Then
PNbbTB.FindFirst Cri$
If Not PNbbTB.NoMatch Then
 Command1.Enabled = True
 Label2(1).Caption = PNbbTB.Fields("CustomerID").Value
Else
 Command1.Enabled = False
 MsgBox "Invalid Bank Branch ID...", vbCritical + vbOKOnly
 Exit Sub
End If
End If

End Sub

Private Sub Command1_Click()

Dim ATPKO As String * 130
Dim ATPKO2 As String * 130
Dim ATPKO3 As String * 1
Dim CTX As Integer
Dim XTL As Currency
Dim LR As Integer

If IsAllNumbers(MaskEdBox1.Text) = False Then
 MsgBox "Invalid pay in date...", vbCritical + vbOKOnly
 MaskEdBox1.SetFocus
 Exit Sub
End If

If Combo2.Text = Combo2.List(0) Then FNX$ = "A:\DATAFILE.TXT"
If Combo2.Text = Combo2.List(1) Then FNX$ = "B:\DATAFILE.TXT"

FILEQ$ = Trim(ProgDir) + "\DATAFILE.TMP"
Open FILEQ$ For Random As #15 Len = Len(ATPKO)

XTL = 0
i = 0

Cri$ = "ReportID = '" + Label2(0).Caption + "' and Balance > 0 and BankID like 'TFB???'"
If PNwrTB.RecordCount > 0 Then
PNwrTB.FindFirst Cri$
Do While Not PNwrTB.NoMatch
 i = i + 1
 NO$ = Format(i, "000000")
 VX$ = Format(PNwrTB.Fields("Balance").Value, "0000000000000.00")
 VX$ = Left(VX$, 13) + Right(VX$, 2)
 BKIX$ = PNwrTB.Fields("BankA/CID").Value
 BKIX$ = Left(BKIX$, 3) + Mid(BKIX$, 5, 1) + Mid(BKIX$, 7, 5) + Mid(BKIX$, 13, 1)
 FNM$ = PNwrTB.Fields("FsName").Value
 FNM$ = FNM$ + Space(23 - Len(FNM$))
 NME$ = PNwrTB.Fields("Name").Value
 NME$ = NME$ + Space(50 - Len(NME$))
 LBX$ = Label2(1).Caption
 LBX$ = Left(LBX$, 3) + Mid(LBX$, 5, 3) + Right(LBX$, 1)

 ATPKO = NO$ + " 7106 " + LBX$ + " " + BKIX$ + " " + VX$ + " " + MaskEdBox1.Text + " " + FNM$ + " " + NME$ + Chr$(13) + Chr$(10)

 StatusBar1.Panels(1).Text = "Processing...Transaction No. " + Format(i, "#,##0")
 ProgressBar1.Value = (i / PNwrTB.RecordCount) * 100
 ProgressBar1.Refresh
 
 Put #15, i, ATPKO
 
 XTL = XTL + CFC(Format(PNwrTB.Fields("Balance").Value, "0.00"))

 ProgressBar1.Value = (i / PNwrTB.RecordCount) * 100
 
 PNwrTB.FindNext Cri$
Loop
End If

GoSub DATASORT

'REARRANGE THE SEQUENCE OF A/C No.
For kX = 1 To i
 Get #15, kX, ATPKO2
 ATPKO2X$ = Format(kX, "000000") + Right(ATPKO2, 124)
 ATPKO2 = ATPKO2X$
 Put #15, kX, ATPKO2
Next kX

VX$ = Format(XTL, "0000000000000.00")
VX$ = Left(VX$, 13) + Right(VX$, 2)

i = i + 1
Nx$ = Format(i, "000000")

ATPKO = Nx$ + " 9000 " + LBX$ + " 0000000000 " + VX$ + " 000000 " + Space(23) + " " + Space(50) + Chr$(13) + Chr$(10)
Put #15, i, ATPKO

i = i + 1
Nx$ = Format(i, "000000")

ATPKO = Nx$ + " 9100 " + LBX$ + " 0000000000 " + VX$ + " 000000 " + Space(23) + " " + Space(50) + Chr$(13) + Chr$(10)
Put #15, i, ATPKO

Close #15

StatusBar1.Panels(1).Text = "Copying file..."
DL& = CopyFile(FILEQ$, FNX$, False)
Kill FILEQ$

Unload PNWageReportCvtTFB

Exit Sub

DATASORT:

StatusBar1.Panels(1).Text = "Sorting Records..."

DATACOUNT = i

If DATACOUNT < 2 Then Return

For Xi = 1 To DATACOUNT

Get #15, Xi, ATPKO

ProgressBar1.Value = (Xi / DATACOUNT) * 100

ATPKO2 = ATPKO

For XK = Xi + 1 To DATACOUNT

Get #15, Xi, ATPKO

ATPKO2 = ATPKO

Get #15, XK, ATPKO

If Mid(ATPKO, 21, 10) < Mid(ATPKO2, 21, 10) Then

Put #15, Xi, ATPKO

ATPKO = ATPKO2

Put #15, XK, ATPKO

GoTo QX

End If

QX:

Next XK

Next Xi

Return

End Sub

Private Sub Command3_Click()

Load PNBankBranchInfo
PNBankBranchInfo.Show
PNBankBranchInfo.CallNotice "CTFB"

End Sub

Private Sub Form_Load()

Command1.Enabled = False
Label2(0).Caption = PNWageReportMain.Label1.Caption
Combo2.Clear
Combo2.AddItem "Drive A"
Combo2.AddItem "Drive B"
Combo2.Text = Combo2.List(0)

Combo1.Clear
PNbbTB.Requery
If PNbbTB.RecordCount > 0 Then
PNbbTB.MoveFirst
Do While Not PNbbTB.EOF
 If Left(PNbbTB.Fields("BankBRID").Value, 3) = "TFB" And PNbbTB.Fields("UsePRSystem").Value = True Then
  
  
  Combo1.AddItem PNbbTB.Fields("BankBRID").Value + "  " + PNbbTB.Fields("BranchName").Value + " " + PNbbTB.Fields("BranchEngName").Value
 End If
 PNbbTB.MoveNext
Loop
End If

End Sub

Private Sub Form_Unload(Cancel As Integer)

PNWageReportPPR.Enabled = True

End Sub
