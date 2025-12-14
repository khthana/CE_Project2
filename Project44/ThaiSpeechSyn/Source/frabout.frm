VERSION 5.00
Begin VB.Form frabout 
   AutoRedraw      =   -1  'True
   BackColor       =   &H0080C0FF&
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   4245
   ClientLeft      =   3825
   ClientTop       =   4275
   ClientWidth     =   7275
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "frabout.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4245
   ScaleWidth      =   7275
   ShowInTaskbar   =   0   'False
   Visible         =   0   'False
   Begin VB.Frame Frame1 
      BackColor       =   &H0080C0FF&
      Height          =   4050
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   7080
      Begin VB.Label Label1 
         BackColor       =   &H0080C0FF&
         Caption         =   "Mr. Methee  Tangngam"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   4560
         TabIndex        =   7
         Top             =   3480
         Width           =   2415
      End
      Begin VB.Image imgLogo 
         Height          =   2565
         Left            =   120
         Picture         =   "frabout.frx":08CA
         Stretch         =   -1  'True
         Top             =   1200
         Width           =   2565
      End
      Begin VB.Label lblCopyright 
         BackColor       =   &H0080C0FF&
         Caption         =   "Programmed by"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   4560
         TabIndex        =   3
         Top             =   3060
         Width           =   2415
      End
      Begin VB.Label lblCompany 
         BackColor       =   &H0080C0FF&
         Caption         =   "Mr. Pukkanan  Thiyajai"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   4560
         TabIndex        =   2
         Top             =   3270
         Width           =   2415
      End
      Begin VB.Label lblVersion 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H0080C0FF&
         Caption         =   "Version 1.0a"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   5280
         TabIndex        =   4
         Top             =   1920
         Width           =   1410
      End
      Begin VB.Label lblProductName 
         AutoSize        =   -1  'True
         BackColor       =   &H0080C0FF&
         Caption         =   "Just Speak"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   32.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   765
         Left            =   3360
         TabIndex        =   6
         Top             =   1200
         Width           =   3405
      End
      Begin VB.Label lblLicenseTo 
         Alignment       =   1  'Right Justify
         BackColor       =   &H0080C0FF&
         Caption         =   "Department of Computer Engineering King Mongkut Institue of Technology Ladkrabang"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   6855
      End
      Begin VB.Label lblCompanyProduct 
         AutoSize        =   -1  'True
         BackColor       =   &H0080C0FF&
         Caption         =   "Thai Speech Synthesis Program"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   435
         Left            =   1440
         TabIndex        =   5
         Top             =   705
         Width           =   5505
      End
   End
End
Attribute VB_Name = "frabout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_KeyPress(KeyAscii As Integer)
    Unload Me
End Sub

Private Sub Frame1_Click()
    Unload Me
End Sub

Private Sub imgLogo_Click()
    Unload Me
End Sub

Private Sub Label1_Click()
    Unload Me
End Sub

Private Sub lblCompany_Click()
    Unload Me
End Sub

Private Sub lblCompanyProduct_Click()
    Unload Me
End Sub

Private Sub lblCopyright_Click()
    Unload Me
End Sub

Private Sub lblLicenseTo_Click()
    Unload Me
End Sub

Private Sub lblProductName_Click()
    Unload Me
End Sub

Private Sub lblVersion_Click()
    Unload Me
End Sub
