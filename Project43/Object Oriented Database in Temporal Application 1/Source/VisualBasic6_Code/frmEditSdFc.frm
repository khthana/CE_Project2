VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmEditSdFc 
   Caption         =   "แก้ไขประวัติคณะ"
   ClientHeight    =   3900
   ClientLeft      =   3480
   ClientTop       =   2430
   ClientWidth     =   5940
   LinkTopic       =   "Form1"
   ScaleHeight     =   3900
   ScaleWidth      =   5940
   Begin VB.CommandButton cmdEditSdFcClose 
      Caption         =   "ปิด"
      Height          =   495
      Left            =   3960
      TabIndex        =   9
      Top             =   3360
      Width           =   1695
   End
   Begin VB.CommandButton cmdEditSdFc 
      Caption         =   "แก้ไข"
      Height          =   495
      Left            =   360
      TabIndex        =   8
      Top             =   3360
      Width           =   1575
   End
   Begin MSComCtl2.DTPicker DTPicker2 
      Height          =   375
      Left            =   4200
      TabIndex        =   3
      Top             =   2880
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   661
      _Version        =   393216
      Format          =   24444929
      CurrentDate     =   36960
   End
   Begin MSComCtl2.DTPicker DTPicker1 
      Height          =   375
      Left            =   2520
      TabIndex        =   2
      Top             =   2880
      Width           =   1575
      _ExtentX        =   2778
      _ExtentY        =   661
      _Version        =   393216
      Format          =   24444929
      CurrentDate     =   36960
   End
   Begin VB.TextBox txtSdFc 
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   2880
      Width           =   2175
   End
   Begin MSComctlLib.ListView lvSdFc 
      Height          =   2055
      Left            =   480
      TabIndex        =   0
      Top             =   480
      Width           =   5055
      _ExtentX        =   8916
      _ExtentY        =   3625
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "ถึงวันที่"
      Height          =   210
      Left            =   4560
      TabIndex        =   7
      Top             =   2640
      Width           =   495
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "จากวันที่"
      Height          =   210
      Left            =   2880
      TabIndex        =   6
      Top             =   2640
      Width           =   585
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "คณะวิศวกรรมศาสตร์"
      Height          =   210
      Left            =   480
      TabIndex        =   5
      Top             =   2640
      Width           =   1485
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "ประวัติคณะที่ศึกษา"
      Height          =   210
      Left            =   2280
      TabIndex        =   4
      Top             =   120
      Width           =   1305
   End
End
Attribute VB_Name = "frmEditSdFc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdEditSdFcClose_Click()
 frmEditSdFc.Hide
End Sub
