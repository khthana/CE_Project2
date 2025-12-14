VERSION 5.00
Begin VB.Form ViewList 
   Caption         =   "View Existing List"
   ClientHeight    =   6300
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9030
   BeginProperty Font 
      Name            =   "CordiaUPC"
      Size            =   24
      Charset         =   222
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "ViewList.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   6300
   ScaleWidth      =   9030
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtUsername 
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      Left            =   360
      Locked          =   -1  'True
      TabIndex        =   8
      Text            =   "Text1"
      Top             =   1440
      Width           =   2535
   End
   Begin VB.ListBox lstView 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2220
      Left            =   360
      TabIndex        =   3
      Top             =   2520
      Width           =   8295
   End
   Begin VB.PictureBox Picture3 
      BackColor       =   &H8000000E&
      BorderStyle     =   0  'None
      Height          =   855
      Left            =   240
      Picture         =   "ViewList.frx":0442
      ScaleHeight     =   855
      ScaleWidth      =   8535
      TabIndex        =   2
      Top             =   120
      Width           =   8535
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "&Close"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   7680
      TabIndex        =   1
      Top             =   5760
      Width           =   1095
   End
   Begin VB.PictureBox Picture2 
      Height          =   60
      Left            =   240
      ScaleHeight     =   0
      ScaleWidth      =   8475
      TabIndex        =   0
      Top             =   5520
      Width           =   8535
   End
   Begin VB.Label Label7 
      Caption         =   "**"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   5640
      TabIndex        =   11
      Top             =   2160
      Width           =   255
   End
   Begin VB.Label Label6 
      Caption         =   "** Call Status : C = Called, NC = Not called, NS = Not success, S = Success, T=Time out **"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   480
      TabIndex        =   10
      Top             =   5040
      Width           =   8055
   End
   Begin VB.Label Label5 
      Caption         =   "Username"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   360
      TabIndex        =   9
      Top             =   1200
      Width           =   2175
   End
   Begin VB.Label Label4 
      Caption         =   "Last Call"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   6360
      TabIndex        =   7
      Top             =   2160
      Width           =   975
   End
   Begin VB.Label Label3 
      Caption         =   "Call Status"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   4440
      TabIndex        =   6
      Top             =   2160
      Width           =   1335
   End
   Begin VB.Label Label2 
      Caption         =   "Tel#"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2880
      TabIndex        =   5
      Top             =   2160
      Width           =   735
   End
   Begin VB.Label Label1 
      Caption         =   "Date / Time to call"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   360
      TabIndex        =   4
      Top             =   2160
      Width           =   2175
   End
End
Attribute VB_Name = "ViewList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
    Me.Hide
End Sub

