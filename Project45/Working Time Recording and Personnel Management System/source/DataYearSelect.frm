VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form DataYearSelect 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Data Year Selection"
   ClientHeight    =   2265
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4680
   Icon            =   "DataYearSelect.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   2265
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   3240
      TabIndex        =   2
      Top             =   1560
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   2040
      TabIndex        =   1
      Top             =   1560
      Width           =   1095
   End
   Begin VB.Frame Frame1 
      Caption         =   "Data Year"
      Height          =   1215
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   4095
      Begin MSComCtl2.UpDown UpDown1 
         Height          =   315
         Left            =   2280
         TabIndex        =   4
         Top             =   480
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   556
         _Version        =   393216
         Value           =   1
         BuddyControl    =   "Text1"
         BuddyDispid     =   196612
         OrigLeft        =   2040
         OrigTop         =   480
         OrigRight       =   2295
         OrigBottom      =   795
         Max             =   9999
         Min             =   1
         SyncBuddy       =   -1  'True
         BuddyProperty   =   0
         Enabled         =   -1  'True
      End
      Begin VB.TextBox Text1 
         Alignment       =   1  'Right Justify
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   1440
         MaxLength       =   4
         TabIndex        =   3
         Top             =   480
         Width           =   840
      End
   End
End
Attribute VB_Name = "DataYearSelect"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()

CurDyr = CFC(Text1.Text)
MainMDI.StatusBar2.Panels(3).Text = Format(CurDyr, "0000")

Unload DataYearSelect

End Sub

Private Sub Command2_Click()

Unload DataYearSelect

End Sub

Private Sub Form_Load()
    UpDown1.Value = CurDyr
    Me.Top = (MainMDI.ScaleHeight - Me.Height) / 2
    Me.Left = (MainMDI.ScaleWidth - Me.Width) / 2
End Sub
