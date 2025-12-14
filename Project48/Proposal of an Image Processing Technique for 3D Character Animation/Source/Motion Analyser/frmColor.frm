VERSION 5.00
Begin VB.Form frmColor 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Color Settings"
   ClientHeight    =   6975
   ClientLeft      =   4845
   ClientTop       =   975
   ClientWidth     =   3855
   Icon            =   "frmColor.frx":0000
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   465
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   257
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Color Range"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   6735
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3615
      Begin VB.CheckBox chkSizeUnl 
         BackColor       =   &H00C0FFFF&
         Caption         =   "Unlimited"
         Height          =   315
         Left            =   2700
         Style           =   1  'Graphical
         TabIndex        =   23
         Top             =   5040
         Width           =   855
      End
      Begin VB.CommandButton cmdEPalette 
         BackColor       =   &H00C0C0FF&
         Caption         =   "Start EPalette"
         Height          =   375
         Left            =   1440
         Style           =   1  'Graphical
         TabIndex        =   22
         Top             =   6120
         Width           =   1935
      End
      Begin VB.PictureBox picSize 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00FFFFFF&
         ForeColor       =   &H80000008&
         Height          =   3855
         Left            =   2880
         ScaleHeight     =   255
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   31
         TabIndex        =   18
         Top             =   960
         Width           =   495
         Begin VB.Image imgSize 
            Appearance      =   0  'Flat
            BorderStyle     =   1  'Fixed Single
            Height          =   150
            Left            =   0
            Top             =   0
            Width           =   465
         End
      End
      Begin VB.CommandButton cmdSave 
         BackColor       =   &H00C0C0FF&
         Caption         =   "Save All"
         Height          =   375
         Left            =   1440
         Style           =   1  'Graphical
         TabIndex        =   17
         Top             =   5640
         Width           =   1935
      End
      Begin VB.PictureBox picVal 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00FFFFFF&
         ForeColor       =   &H80000008&
         Height          =   3855
         Left            =   2160
         ScaleHeight     =   255
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   31
         TabIndex        =   13
         Top             =   960
         Width           =   495
         Begin VB.Image imgVal 
            Appearance      =   0  'Flat
            BorderStyle     =   1  'Fixed Single
            Height          =   150
            Left            =   0
            Top             =   0
            Width           =   465
         End
      End
      Begin VB.PictureBox picSat 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00FFFFFF&
         ForeColor       =   &H80000008&
         Height          =   3855
         Left            =   1440
         ScaleHeight     =   255
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   31
         TabIndex        =   9
         Top             =   960
         Width           =   495
         Begin VB.Image imgSat 
            Appearance      =   0  'Flat
            BorderStyle     =   1  'Fixed Single
            Height          =   150
            Left            =   0
            Top             =   0
            Width           =   465
         End
      End
      Begin VB.VScrollBar vsbHueOffset 
         Height          =   5415
         LargeChange     =   10
         Left            =   840
         Max             =   360
         TabIndex        =   4
         Top             =   960
         Width           =   375
      End
      Begin VB.PictureBox picHue 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00FFFFFF&
         ForeColor       =   &H80000008&
         Height          =   5425
         Left            =   240
         ScaleHeight     =   360
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   31
         TabIndex        =   2
         Top             =   960
         Width           =   495
         Begin VB.Image imgHue 
            Appearance      =   0  'Flat
            BorderStyle     =   1  'Fixed Single
            Height          =   150
            Left            =   0
            Top             =   0
            Width           =   465
         End
      End
      Begin VB.ComboBox cmbColor 
         BackColor       =   &H00C0C0FF&
         Height          =   315
         Left            =   1320
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Top             =   0
         Width           =   2175
      End
      Begin VB.Label Label7 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "SIZE"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   195
         Left            =   2910
         TabIndex        =   21
         Top             =   480
         Width           =   435
      End
      Begin VB.Label lblSizeMin 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   3060
         TabIndex        =   20
         Top             =   720
         Width           =   90
      End
      Begin VB.Label lblSizeMax 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   3060
         TabIndex        =   19
         Top             =   4800
         Width           =   90
      End
      Begin VB.Label lblValMax 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   2340
         TabIndex        =   16
         Top             =   4800
         Width           =   90
      End
      Begin VB.Label lblValMin 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   2340
         TabIndex        =   15
         Top             =   720
         Width           =   90
      End
      Begin VB.Label Label3 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "VAL"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   195
         Left            =   2220
         TabIndex        =   14
         Top             =   480
         Width           =   375
      End
      Begin VB.Label Label5 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "SAT"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   195
         Left            =   1500
         TabIndex        =   12
         Top             =   480
         Width           =   375
      End
      Begin VB.Label lblSatMin 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   1620
         TabIndex        =   11
         Top             =   720
         Width           =   90
      End
      Begin VB.Label lblSatMax 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   1620
         TabIndex        =   10
         Top             =   4800
         Width           =   90
      End
      Begin VB.Label lblHueMax 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   420
         TabIndex        =   8
         Top             =   6360
         Width           =   90
      End
      Begin VB.Label lblHueMin 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   420
         TabIndex        =   7
         Top             =   720
         Width           =   90
      End
      Begin VB.Label lblHueOffset 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   1005
         TabIndex        =   6
         Top             =   720
         Width           =   90
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Offset"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00808080&
         Height          =   195
         Left            =   765
         TabIndex        =   5
         Top             =   480
         Width           =   525
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "HUE"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   195
         Left            =   285
         TabIndex        =   3
         Top             =   480
         Width           =   405
      End
   End
End
Attribute VB_Name = "frmColor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub chkSizeUnl_Click()
    UpdateData True
    UpdateData
End Sub

Private Sub cmbColor_Click()
    UpdateData
End Sub

Private Sub cmdEPalette_Click()
    If (Dir(App.Path + "\" + EPALETTE_FILE) <> "") Then WinExec App.Path + "\" + EPALETTE_FILE, 0
End Sub

Private Sub cmdSave_Click()
    SaveColors
End Sub

Private Sub Form_Load()
    ' Control initialization
    Dim i As Long
    For i = 0 To FRAME_MAX
        cmbColor.AddItem ProcessInfo(i).Name
    Next i
    cmbColor.ListIndex = 0
    If (Dir(App.Path + "\" + EPALETTE_FILE) = "") Then cmdEPalette.Enabled = False

    UpdateData
End Sub

Private Sub DrawHueBar(Optional HueOffset As Long = 0)   ' Draw hue color
    Dim i As Long
    Dim r As Single, g As Single, b As Single
    Dim h As Single, s As Single, v As Single
    For i = 0 To 360
        HSVtoRGB r, g, b, (i - HueOffset + 360) Mod 360, 1, 1
        picHue.Line (0, i)-(100, i), RGB(r * 255, g * 255, b * 255)
    Next i
End Sub

Private Sub DrawSatBar()   ' Draw sat color
    Dim i As Long
    Dim r As Single, g As Single, b As Single
    Dim h As Single, s As Single, v As Single
    For i = 0 To 255
        HSVtoRGB r, g, b, (((ProcessInfo(cmbColor.ListIndex).Range.hue_min + ProcessInfo(cmbColor.ListIndex).Range.hue_max) / 2) - ProcessInfo(cmbColor.ListIndex).HueOffset + 360) Mod 360, i / 255, 1
        picSat.Line (0, i)-(100, i), RGB(r * 255, g * 255, b * 255)
    Next i
End Sub

Private Sub DrawValBar()   ' Draw val color
    Dim i As Long
    Dim r As Single, g As Single, b As Single
    Dim h As Single, s As Single, v As Single
    For i = 0 To 255
        HSVtoRGB r, g, b, (((ProcessInfo(cmbColor.ListIndex).Range.hue_min + ProcessInfo(cmbColor.ListIndex).Range.hue_max) / 2) - ProcessInfo(cmbColor.ListIndex).HueOffset + 360) Mod 360, _
            (ProcessInfo(cmbColor.ListIndex).Range.sat_min + ProcessInfo(cmbColor.ListIndex).Range.sat_max) / 2 / 255, i / 255
        picVal.Line (0, i)-(100, i), RGB(r * 255, g * 255, b * 255)
    Next i
End Sub

Private Sub Form_Unload(Cancel As Integer)
    frmMain.mnuShowColor.Checked = False
End Sub

Private Sub imgHue_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single) ' Move Hue
    Dim tmp As Single
    If (Button = vbLeftButton) Then
        ' Move
        imgHue.Top = imgHue.Top + (Y / Screen.TwipsPerPixelY)
        If imgHue.Top > 359 Then imgHue.Top = 359
    ElseIf (Button = vbRightButton) Then
        ' Resize
        tmp = (Y / Screen.TwipsPerPixelY)
        If (tmp < 0) Then tmp = 0
        imgHue.height = tmp
    End If
    
    ' Validate
    If (Button > 0) Then
        If (imgHue.Top < 0) Then imgHue.Top = 0
        If ((imgHue.Top + imgHue.height) > 360) Then imgHue.height = 360 - imgHue.Top
        UpdateData True
    End If
End Sub

Private Sub imgSat_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single) ' Move Sat
    Dim tmp As Single
    If (Button = vbLeftButton) Then
        ' Move
        imgSat.Top = imgSat.Top + (Y / Screen.TwipsPerPixelY)
        If imgSat.Top > 254 Then imgSat.Top = 254
    ElseIf (Button = vbRightButton) Then
        ' Resize
        tmp = (Y / Screen.TwipsPerPixelY)
        If (tmp < 0) Then tmp = 0
        imgSat.height = tmp
    End If
    
    ' Validate
    If (Button > 0) Then
        If (imgSat.Top < 0) Then imgSat.Top = 0
        If ((imgSat.Top + imgSat.height) > 255) Then imgSat.height = 255 - imgSat.Top
        UpdateData True
    End If
End Sub

Private Sub imgSize_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Dim tmp As Single
    If (Button = vbLeftButton) Then
        ' Move
        imgSize.Top = imgSize.Top + (Y / Screen.TwipsPerPixelY)
        If imgSize.Top > 199 Then imgSize.Top = 199
    ElseIf (Button = vbRightButton) Then
        ' Resize
        tmp = (Y / Screen.TwipsPerPixelY)
        If (tmp < 0) Then tmp = 0
        imgSize.height = tmp
    End If
    
    ' Validate
    If (Button > 0) Then
        If (imgSize.Top < 0) Then imgSize.Top = 0
        If ((imgSize.Top + imgSize.height) > 255) Then imgSize.height = 255 - imgSize.Top
        UpdateData True
    End If
End Sub

Private Sub imgVal_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single) ' Move Val
    Dim tmp As Single
    If (Button = vbLeftButton) Then
        ' Move
        imgVal.Top = imgVal.Top + (Y / Screen.TwipsPerPixelY)
        If imgVal.Top > 254 Then imgVal.Top = 254
    ElseIf (Button = vbRightButton) Then
        ' Resize
        tmp = (Y / Screen.TwipsPerPixelY)
        If (tmp < 0) Then tmp = 0
        imgVal.height = tmp
    End If
    
    ' Validate
    If (Button > 0) Then
        If (imgVal.Top < 0) Then imgVal.Top = 0
        If ((imgVal.Top + imgVal.height) > 255) Then imgVal.height = 255 - imgVal.Top
        UpdateData True
    End If
End Sub

Private Sub vsbHueOffset_Change()
    UpdateData True
End Sub

Private Sub vsbHueOffset_Scroll()
    UpdateData True
End Sub

Public Sub UpdateData(Optional SaveAndValidation As Boolean = False)    ' DDX
    If (SaveAndValidation) Then
        ' Control -> Data
        ProcessInfo(cmbColor.ListIndex).HueOffset = vsbHueOffset.Value
        ProcessInfo(cmbColor.ListIndex).Range.hue_min = imgHue.Top
        ProcessInfo(cmbColor.ListIndex).Range.hue_max = imgHue.height + imgHue.Top
        ProcessInfo(cmbColor.ListIndex).Range.sat_min = imgSat.Top
        ProcessInfo(cmbColor.ListIndex).Range.sat_max = imgSat.height + imgSat.Top
        ProcessInfo(cmbColor.ListIndex).Range.val_min = imgVal.Top
        ProcessInfo(cmbColor.ListIndex).Range.val_max = imgVal.height + imgVal.Top
        ProcessInfo(cmbColor.ListIndex).blob_min = imgSize.Top
        If (chkSizeUnl.Value = vbChecked) Then
            ProcessInfo(cmbColor.ListIndex).blob_max = 2147483647   ' Set to maximum value
        Else
            ProcessInfo(cmbColor.ListIndex).blob_max = imgSize.height + imgSize.Top
        End If

    Else
        ' Data -> Control
        imgHue.Top = ProcessInfo(cmbColor.ListIndex).Range.hue_min
        imgHue.height = ProcessInfo(cmbColor.ListIndex).Range.hue_max - imgHue.Top
        imgSat.Top = ProcessInfo(cmbColor.ListIndex).Range.sat_min
        imgSat.height = ProcessInfo(cmbColor.ListIndex).Range.sat_max - imgSat.Top
        imgVal.Top = ProcessInfo(cmbColor.ListIndex).Range.val_min
        imgVal.height = ProcessInfo(cmbColor.ListIndex).Range.val_max - imgVal.Top
        imgSize.Top = ProcessInfo(cmbColor.ListIndex).blob_min
        vsbHueOffset.Value = ProcessInfo(cmbColor.ListIndex).HueOffset ' Must be the last!
        If (ProcessInfo(cmbColor.ListIndex).blob_max > 255) Then
            chkSizeUnl.Value = vbChecked
            imgSize.height = 255 - imgSize.Top
        Else
            chkSizeUnl.Value = vbUnchecked
            imgSize.height = ProcessInfo(cmbColor.ListIndex).blob_max - imgSize.Top
        End If
    End If
    lblHueOffset.Caption = Format$(ProcessInfo(cmbColor.ListIndex).HueOffset, "0")
    lblHueMin.Caption = Format$(ProcessInfo(cmbColor.ListIndex).Range.hue_min, "0")
    lblHueMax.Caption = Format$(ProcessInfo(cmbColor.ListIndex).Range.hue_max, "0")
    lblSatMin.Caption = Format$(ProcessInfo(cmbColor.ListIndex).Range.sat_min, "0")
    lblSatMax.Caption = Format$(ProcessInfo(cmbColor.ListIndex).Range.sat_max, "0")
    lblValMin.Caption = Format$(ProcessInfo(cmbColor.ListIndex).Range.val_min, "0")
    lblValMax.Caption = Format$(ProcessInfo(cmbColor.ListIndex).Range.val_max, "0")
    lblSizeMin.Caption = Format$(ProcessInfo(cmbColor.ListIndex).blob_min, "0")
    If (ProcessInfo(cmbColor.ListIndex).blob_max > 255) Then
        lblSizeMax.Caption = "MAX"
    Else
        lblSizeMax.Caption = Format$(ProcessInfo(cmbColor.ListIndex).blob_max, "0")
    End If
    DrawHueBar ProcessInfo(cmbColor.ListIndex).HueOffset
    DrawSatBar
    DrawValBar
End Sub

