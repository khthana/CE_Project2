VERSION 5.00
Object = "{DF6D6558-5B0C-11D3-9396-008029E9B3A6}#1.0#0"; "EZVIDC60.OCX"
Begin VB.Form EnableForm 
   Caption         =   "Form1"
   ClientHeight    =   3120
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5385
   LinkTopic       =   "Form1"
   ScaleHeight     =   3120
   ScaleWidth      =   5385
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton ExitButton 
      Caption         =   "Exit"
      Height          =   375
      Left            =   4200
      TabIndex        =   1
      Top             =   1200
      Width           =   950
   End
   Begin vbVidC60.ezVidCap ezVidCap1 
      Height          =   2910
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3870
      _ExtentX        =   6826
      _ExtentY        =   5133
      AutoSize        =   0   'False
      StretchPreview  =   -1  'True
   End
End
Attribute VB_Name = "EnableForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
