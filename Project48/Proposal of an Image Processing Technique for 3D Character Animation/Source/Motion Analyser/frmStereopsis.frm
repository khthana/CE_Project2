VERSION 5.00
Begin VB.Form frmStereopsis 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Stereopsis Settings"
   ClientHeight    =   3375
   ClientLeft      =   4845
   ClientTop       =   975
   ClientWidth     =   11085
   Icon            =   "frmStereopsis.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   225
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   739
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame4 
      Caption         =   "Camera 4"
      Height          =   2655
      Left            =   8280
      TabIndex        =   41
      Top             =   120
      Width           =   2535
      Begin VB.TextBox txt4CCDH 
         Height          =   315
         Left            =   1080
         TabIndex        =   46
         Top             =   2160
         Width           =   1215
      End
      Begin VB.TextBox txt4CCDW 
         Height          =   315
         Left            =   1080
         TabIndex        =   45
         Top             =   1800
         Width           =   1215
      End
      Begin VB.TextBox txt4Focus 
         Height          =   315
         Left            =   1080
         TabIndex        =   44
         Top             =   1440
         Width           =   1215
      End
      Begin VB.TextBox txt4Y 
         Height          =   315
         Left            =   1080
         TabIndex        =   43
         Top             =   600
         Width           =   1215
      End
      Begin VB.TextBox txt4X 
         Height          =   315
         Left            =   1080
         TabIndex        =   42
         Top             =   240
         Width           =   1215
      End
      Begin VB.Label Label25 
         AutoSize        =   -1  'True
         Caption         =   "CCD H:"
         Height          =   195
         Left            =   240
         TabIndex        =   52
         Top             =   2280
         Width           =   540
      End
      Begin VB.Label Label24 
         AutoSize        =   -1  'True
         Caption         =   "CCD W:"
         Height          =   195
         Left            =   240
         TabIndex        =   51
         Top             =   1920
         Width           =   585
      End
      Begin VB.Label Label23 
         AutoSize        =   -1  'True
         Caption         =   "Focus:"
         Height          =   195
         Left            =   240
         TabIndex        =   50
         Top             =   1560
         Width           =   480
      End
      Begin VB.Label Label22 
         AutoSize        =   -1  'True
         Caption         =   "Position Z:  0"
         Height          =   195
         Left            =   240
         TabIndex        =   49
         Top             =   1080
         Width           =   930
      End
      Begin VB.Label Label21 
         AutoSize        =   -1  'True
         Caption         =   "Position Y:"
         Height          =   195
         Left            =   240
         TabIndex        =   48
         Top             =   720
         Width           =   750
      End
      Begin VB.Label Label20 
         AutoSize        =   -1  'True
         Caption         =   "Position X:"
         Height          =   195
         Left            =   240
         TabIndex        =   47
         Top             =   360
         Width           =   750
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "Camera 3"
      Height          =   2655
      Left            =   5520
      TabIndex        =   29
      Top             =   120
      Width           =   2535
      Begin VB.TextBox txt3CCDH 
         Height          =   315
         Left            =   1080
         TabIndex        =   34
         Top             =   2160
         Width           =   1215
      End
      Begin VB.TextBox txt3CCDW 
         Height          =   315
         Left            =   1080
         TabIndex        =   33
         Top             =   1800
         Width           =   1215
      End
      Begin VB.TextBox txt3Focus 
         Height          =   315
         Left            =   1080
         TabIndex        =   32
         Top             =   1440
         Width           =   1215
      End
      Begin VB.TextBox txt3Y 
         Height          =   315
         Left            =   1080
         TabIndex        =   31
         Top             =   600
         Width           =   1215
      End
      Begin VB.TextBox txt3X 
         Height          =   315
         Left            =   1080
         TabIndex        =   30
         Top             =   240
         Width           =   1215
      End
      Begin VB.Label Label19 
         AutoSize        =   -1  'True
         Caption         =   "CCD H:"
         Height          =   195
         Left            =   240
         TabIndex        =   40
         Top             =   2280
         Width           =   540
      End
      Begin VB.Label Label18 
         AutoSize        =   -1  'True
         Caption         =   "CCD W:"
         Height          =   195
         Left            =   240
         TabIndex        =   39
         Top             =   1920
         Width           =   585
      End
      Begin VB.Label Label17 
         AutoSize        =   -1  'True
         Caption         =   "Focus:"
         Height          =   195
         Left            =   240
         TabIndex        =   38
         Top             =   1560
         Width           =   480
      End
      Begin VB.Label Label16 
         AutoSize        =   -1  'True
         Caption         =   "Position Z:  0"
         Height          =   195
         Left            =   240
         TabIndex        =   37
         Top             =   1080
         Width           =   930
      End
      Begin VB.Label Label15 
         AutoSize        =   -1  'True
         Caption         =   "Position Y:"
         Height          =   195
         Left            =   240
         TabIndex        =   36
         Top             =   720
         Width           =   750
      End
      Begin VB.Label Label14 
         AutoSize        =   -1  'True
         Caption         =   "Position X:"
         Height          =   195
         Left            =   240
         TabIndex        =   35
         Top             =   360
         Width           =   750
      End
   End
   Begin VB.TextBox txtZOffset 
      Height          =   315
      Left            =   960
      TabIndex        =   27
      Top             =   2880
      Width           =   1215
   End
   Begin VB.CommandButton cmdApply 
      Caption         =   "Apply"
      Height          =   375
      Left            =   6960
      TabIndex        =   26
      Top             =   2880
      Width           =   1215
   End
   Begin VB.Frame Frame2 
      Caption         =   "Camera 2"
      Height          =   2655
      Left            =   2760
      TabIndex        =   14
      Top             =   120
      Width           =   2535
      Begin VB.TextBox txt2X 
         Height          =   315
         Left            =   1080
         TabIndex        =   19
         Top             =   240
         Width           =   1215
      End
      Begin VB.TextBox txt2Y 
         Height          =   315
         Left            =   1080
         TabIndex        =   18
         Top             =   600
         Width           =   1215
      End
      Begin VB.TextBox txt2Focus 
         Height          =   315
         Left            =   1080
         TabIndex        =   17
         Top             =   1440
         Width           =   1215
      End
      Begin VB.TextBox txt2CCDW 
         Height          =   315
         Left            =   1080
         TabIndex        =   16
         Top             =   1800
         Width           =   1215
      End
      Begin VB.TextBox txt2CCDH 
         Height          =   315
         Left            =   1080
         TabIndex        =   15
         Top             =   2160
         Width           =   1215
      End
      Begin VB.Label Label12 
         AutoSize        =   -1  'True
         Caption         =   "Position X:"
         Height          =   195
         Left            =   240
         TabIndex        =   25
         Top             =   360
         Width           =   750
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         Caption         =   "Position Y:"
         Height          =   195
         Left            =   240
         TabIndex        =   24
         Top             =   720
         Width           =   750
      End
      Begin VB.Label Label10 
         AutoSize        =   -1  'True
         Caption         =   "Position Z:  0"
         Height          =   195
         Left            =   240
         TabIndex        =   23
         Top             =   1080
         Width           =   930
      End
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         Caption         =   "Focus:"
         Height          =   195
         Left            =   240
         TabIndex        =   22
         Top             =   1560
         Width           =   480
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         Caption         =   "CCD W:"
         Height          =   195
         Left            =   240
         TabIndex        =   21
         Top             =   1920
         Width           =   585
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         Caption         =   "CCD H:"
         Height          =   195
         Left            =   240
         TabIndex        =   20
         Top             =   2280
         Width           =   540
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Camera 1"
      Height          =   2655
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   2535
      Begin VB.TextBox txt1CCDH 
         Height          =   315
         Left            =   1080
         TabIndex        =   13
         Top             =   2160
         Width           =   1215
      End
      Begin VB.TextBox txt1CCDW 
         Height          =   315
         Left            =   1080
         TabIndex        =   11
         Top             =   1800
         Width           =   1215
      End
      Begin VB.TextBox txt1Focus 
         Height          =   315
         Left            =   1080
         TabIndex        =   9
         Top             =   1440
         Width           =   1215
      End
      Begin VB.TextBox txt1Y 
         Height          =   315
         Left            =   1080
         TabIndex        =   6
         Top             =   600
         Width           =   1215
      End
      Begin VB.TextBox txt1X 
         Height          =   315
         Left            =   1080
         TabIndex        =   4
         Top             =   240
         Width           =   1215
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         Caption         =   "CCD H:"
         Height          =   195
         Left            =   240
         TabIndex        =   12
         Top             =   2280
         Width           =   540
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         Caption         =   "CCD W:"
         Height          =   195
         Left            =   240
         TabIndex        =   10
         Top             =   1920
         Width           =   585
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "Focus:"
         Height          =   195
         Left            =   240
         TabIndex        =   8
         Top             =   1560
         Width           =   480
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "Position Z:  0"
         Height          =   195
         Left            =   240
         TabIndex        =   7
         Top             =   1080
         Width           =   930
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "Position Y:"
         Height          =   195
         Left            =   240
         TabIndex        =   5
         Top             =   720
         Width           =   750
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Position X:"
         Height          =   195
         Left            =   240
         TabIndex        =   3
         Top             =   360
         Width           =   750
      End
   End
   Begin VB.CommandButton CancelButton 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   5280
      TabIndex        =   1
      Top             =   2880
      Width           =   1215
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   3600
      TabIndex        =   0
      Top             =   2880
      Width           =   1215
   End
   Begin VB.Label Label13 
      AutoSize        =   -1  'True
      Caption         =   "Z Offset:"
      Height          =   195
      Left            =   120
      TabIndex        =   28
      Top             =   3000
      Width           =   615
   End
End
Attribute VB_Name = "frmStereopsis"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub CancelButton_Click()
    Unload Me
End Sub

Private Sub cmdApply_Click()    ' Update data
    Dim cam1 As STR_CAMERA, cam2 As STR_CAMERA, cam3 As STR_CAMERA, cam4 As STR_CAMERA
    
    cam1.X = Val(txt1X.Text)
    cam1.Y = Val(txt1Y.Text)
    cam1.Z = 0
    cam1.focus = Val(txt1Focus.Text)
    cam1.iwidth = Val(txt1CCDW.Text)
    cam1.iheight = Val(txt1CCDH.Text)
    
    cam2.X = Val(txt2X.Text)
    cam2.Y = Val(txt2Y.Text)
    cam2.Z = 0
    cam2.focus = Val(txt2Focus.Text)
    cam2.iwidth = Val(txt2CCDW.Text)
    cam2.iheight = Val(txt2CCDH.Text)
    
    cam3.X = Val(txt3X.Text)
    cam3.Y = Val(txt3Y.Text)
    cam3.Z = 0
    cam3.focus = Val(txt3Focus.Text)
    cam3.iwidth = Val(txt3CCDW.Text)
    cam3.iheight = Val(txt3CCDH.Text)
    
    cam4.X = Val(txt4X.Text)
    cam4.Y = Val(txt4Y.Text)
    cam4.Z = 0
    cam4.focus = Val(txt4Focus.Text)
    cam4.iwidth = Val(txt4CCDW.Text)
    cam4.iheight = Val(txt4CCDH.Text)
    
    
    STR_SetCamera1 cam1
    STR_SetCamera2 cam2
    STR_SetCamera3 cam3
    STR_SetCamera4 cam4
    STR_SetZOffset Val(txtZOffset.Text)
End Sub

Private Sub Form_Load()
    ' Load & display current data
    Dim cam1 As STR_CAMERA, cam2 As STR_CAMERA, cam3 As STR_CAMERA, cam4 As STR_CAMERA
    
    cam1 = STR_GetCamera1
    cam2 = STR_GetCamera2
    cam3 = STR_GetCamera3
    cam4 = STR_GetCamera4
    
    txt1X.Text = Format$(cam1.X, "0.00000")
    txt1Y.Text = Format$(cam1.Y, "0.00000")
    txt1Focus.Text = Format$(cam1.focus, "0.00000")
    txt1CCDW.Text = Format$(cam1.iwidth, "0.00000")
    txt1CCDH.Text = Format$(cam1.iheight, "0.00000")
    
    txt2X.Text = Format$(cam2.X, "0.00000")
    txt2Y.Text = Format$(cam2.Y, "0.00000")
    txt2Focus.Text = Format$(cam2.focus, "0.00000")
    txt2CCDW.Text = Format$(cam2.iwidth, "0.00000")
    txt2CCDH.Text = Format$(cam2.iheight, "0.00000")
    
    txt3X.Text = Format$(cam3.X, "0.00000")
    txt3Y.Text = Format$(cam3.Y, "0.00000")
    txt3Focus.Text = Format$(cam3.focus, "0.00000")
    txt3CCDW.Text = Format$(cam3.iwidth, "0.00000")
    txt3CCDH.Text = Format$(cam3.iheight, "0.00000")
    
    txt4X.Text = Format$(cam4.X, "0.00000")
    txt4Y.Text = Format$(cam4.Y, "0.00000")
    txt4Focus.Text = Format$(cam4.focus, "0.00000")
    txt4CCDW.Text = Format$(cam4.iwidth, "0.00000")
    txt4CCDH.Text = Format$(cam4.iheight, "0.00000")
    
    txtZOffset.Text = Format$(STR_GetZOffset, "0.00000")
End Sub

Private Sub Form_Unload(Cancel As Integer)
    frmMain.mnuStereopsis.Checked = False
End Sub

Private Sub OKButton_Click()
    cmdApply_Click
    Unload Me
End Sub
