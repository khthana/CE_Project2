VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form FrmProgress 
   Caption         =   "Please wait ..."
   ClientHeight    =   1530
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5895
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   102
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   393
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.ProgressBar ProgressBar1 
      Height          =   255
      Left            =   240
      TabIndex        =   1
      Top             =   840
      Width           =   5295
      _ExtentX        =   9340
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   1
      Max             =   90
   End
   Begin VB.Label Label1 
      Caption         =   "Processing ....."
      Height          =   255
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   1215
   End
End
Attribute VB_Name = "FrmProgress"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
