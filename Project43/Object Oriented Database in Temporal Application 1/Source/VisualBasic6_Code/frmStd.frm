VERSION 5.00
Begin VB.Form frmStd 
   Caption         =   "เพิ่ม/ลบ/แก้ไข นักศึกษา"
   ClientHeight    =   7710
   ClientLeft      =   -390
   ClientTop       =   495
   ClientWidth     =   10575
   LinkTopic       =   "Form2"
   ScaleHeight     =   7710
   ScaleWidth      =   10575
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   615
      Left            =   6480
      TabIndex        =   16
      Top             =   5160
      Width           =   1455
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "Delete"
      Height          =   615
      Left            =   4440
      TabIndex        =   15
      Top             =   5160
      Width           =   1455
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "Clear"
      Height          =   615
      Left            =   2400
      TabIndex        =   14
      Top             =   5160
      Width           =   1575
   End
   Begin VB.CommandButton cmdAddUpdate 
      Caption         =   "Add/Update"
      Height          =   615
      Left            =   480
      TabIndex        =   13
      Top             =   5160
      Width           =   1575
   End
   Begin VB.Frame Frame1 
      Height          =   4695
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   7935
      Begin VB.CommandButton cmdEditID 
         Caption         =   "แก้ไขรหัส"
         Height          =   375
         Left            =   4080
         TabIndex        =   30
         Top             =   240
         Width           =   975
      End
      Begin VB.TextBox txtDtOut 
         Height          =   315
         Left            =   4560
         TabIndex        =   11
         Top             =   3720
         Width           =   1215
      End
      Begin VB.TextBox txtDOB 
         Height          =   315
         Left            =   5160
         TabIndex        =   12
         Top             =   1320
         Width           =   855
      End
      Begin VB.ComboBox cboStatus 
         Height          =   330
         Left            =   3120
         TabIndex        =   5
         Top             =   1320
         Width           =   1215
      End
      Begin VB.ComboBox cboSex 
         Height          =   330
         Left            =   1320
         TabIndex        =   4
         Top             =   1320
         Width           =   735
      End
      Begin VB.TextBox txtDtIn 
         Height          =   315
         Left            =   1800
         TabIndex        =   10
         Top             =   3720
         Width           =   1215
      End
      Begin VB.TextBox txtBrn 
         Height          =   315
         Left            =   1320
         TabIndex        =   9
         Top             =   3240
         Width           =   2535
      End
      Begin VB.TextBox txtDept 
         Height          =   315
         Left            =   1320
         TabIndex        =   8
         Top             =   2880
         Width           =   2535
      End
      Begin VB.TextBox txtAddr 
         Height          =   735
         Left            =   1320
         TabIndex        =   6
         Top             =   1680
         Width           =   4695
      End
      Begin VB.TextBox txtFac 
         Height          =   315
         Left            =   1320
         TabIndex        =   7
         Top             =   2520
         Width           =   2535
      End
      Begin VB.TextBox txtStdId 
         Height          =   315
         Left            =   1320
         TabIndex        =   1
         Top             =   240
         Width           =   1335
      End
      Begin VB.CommandButton cmdEditName 
         Caption         =   "แก้ไขชื่อ"
         Height          =   375
         Left            =   4080
         TabIndex        =   19
         Top             =   840
         Width           =   975
      End
      Begin VB.TextBox txtNameE 
         Height          =   315
         Left            =   1320
         TabIndex        =   3
         Top             =   960
         Width           =   2535
      End
      Begin VB.TextBox txtName 
         Height          =   315
         Left            =   1320
         TabIndex        =   2
         Top             =   600
         Width           =   2535
      End
      Begin VB.Label Label12 
         AutoSize        =   -1  'True
         Caption         =   "วันที่จบการศึกษา"
         Height          =   210
         Left            =   3240
         TabIndex        =   29
         Top             =   3720
         Width           =   1200
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         Caption         =   "สถานะภาพ"
         Height          =   210
         Left            =   2160
         TabIndex        =   28
         Top             =   1320
         Width           =   765
      End
      Begin VB.Label Label10 
         AutoSize        =   -1  'True
         Caption         =   "วันที่เข้าทำการศึกษา"
         Height          =   210
         Left            =   240
         TabIndex        =   27
         Top             =   3720
         Width           =   1425
      End
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         Caption         =   "วันเกิด"
         Height          =   210
         Left            =   4560
         TabIndex        =   26
         Top             =   1320
         Width           =   495
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         Caption         =   "ที่อยู่"
         Height          =   210
         Left            =   840
         TabIndex        =   25
         Top             =   1680
         Width           =   300
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         Caption         =   "สาขาวิชา"
         Height          =   210
         Left            =   600
         TabIndex        =   24
         Top             =   3240
         Width           =   600
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         Caption         =   "ภาควิชา"
         Height          =   210
         Left            =   600
         TabIndex        =   23
         Top             =   2880
         Width           =   555
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         Caption         =   "คณะ"
         Height          =   210
         Left            =   840
         TabIndex        =   22
         Top             =   2520
         Width           =   315
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "เพศ"
         Height          =   210
         Left            =   840
         TabIndex        =   21
         Top             =   1320
         Width           =   315
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "รหัส"
         Height          =   210
         Left            =   840
         TabIndex        =   20
         Top             =   240
         Width           =   285
      End
      Begin VB.Label Label2 
         Caption         =   "ชื่อภาษาอังกฤษ"
         Height          =   255
         Left            =   120
         TabIndex        =   18
         Top             =   960
         Width           =   1215
      End
      Begin VB.Label Label1 
         Caption         =   "ชื่อภาษาไทย"
         Height          =   255
         Left            =   240
         TabIndex        =   17
         Top             =   600
         Width           =   855
      End
   End
End
Attribute VB_Name = "frmStd"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit



Private Sub cmdClear_Click()
txtStdId = ""
txtName = ""
txtNameE = ""
txtDOB = ""
txtAddr = ""
txtFac = ""
txtDept = ""
txtBrn = ""
txtDtIn = ""
txtDtOut = ""
End Sub

Private Sub cmdExit_Click()
  Unload frmStd
End Sub
