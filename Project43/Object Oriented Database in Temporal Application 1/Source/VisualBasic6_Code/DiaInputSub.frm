VERSION 5.00
Begin VB.Form DiaInputSub 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Dialog Caption"
   ClientHeight    =   2160
   ClientLeft      =   3735
   ClientTop       =   3570
   ClientWidth     =   6030
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2160
   ScaleWidth      =   6030
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txtSubInput 
      BeginProperty Font 
         Name            =   "BrowalliaUPC"
         Size            =   15.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1800
      TabIndex        =   2
      Top             =   480
      Width           =   2655
   End
   Begin VB.CommandButton CancelButton 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   1440
      TabIndex        =   1
      Top             =   1320
      Width           =   1335
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Height          =   495
      Left            =   3360
      TabIndex        =   0
      Top             =   1320
      Width           =   1335
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "รหัสวิชา"
      BeginProperty Font 
         Name            =   "BrowalliaUPC"
         Size            =   15.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   720
      TabIndex        =   3
      Top             =   480
      Width           =   780
   End
End
Attribute VB_Name = "DiaInputSub"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
