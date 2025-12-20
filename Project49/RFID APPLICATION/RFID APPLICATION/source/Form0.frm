VERSION 5.00
Begin VB.Form menu_pro 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "ระบบการจัดการห้องสมุด"
   ClientHeight    =   6165
   ClientLeft      =   45
   ClientTop       =   735
   ClientWidth     =   9000
   LinkTopic       =   "Form4"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Form0.frx":0000
   ScaleHeight     =   6165
   ScaleWidth      =   9000
   StartUpPosition =   2  'CenterScreen
   Begin VB.Image Image8 
      Height          =   360
      Left            =   6015
      Picture         =   "Form0.frx":B4A1A
      Top             =   4905
      Visible         =   0   'False
      Width           =   2250
   End
   Begin VB.Image Image7 
      Height          =   225
      Left            =   6015
      Picture         =   "Form0.frx":B74BC
      Top             =   4125
      Visible         =   0   'False
      Width           =   1650
   End
   Begin VB.Image Image6 
      Height          =   375
      Left            =   6015
      Picture         =   "Form0.frx":B8872
      Top             =   3075
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.Image Image5 
      Height          =   555
      Left            =   6030
      Picture         =   "Form0.frx":BA9E8
      Top             =   2085
      Visible         =   0   'False
      Width           =   1260
   End
   Begin VB.Image Image4 
      Height          =   465
      Left            =   1335
      Picture         =   "Form0.frx":BCE96
      Top             =   4905
      Visible         =   0   'False
      Width           =   1170
   End
   Begin VB.Image Image3 
      Height          =   465
      Left            =   1350
      Picture         =   "Form0.frx":BEB6C
      Top             =   3990
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Image Image2 
      Height          =   555
      Left            =   1350
      Picture         =   "Form0.frx":C0F0A
      Top             =   3000
      Visible         =   0   'False
      Width           =   1305
   End
   Begin VB.Image Image1 
      Height          =   465
      Left            =   1350
      Picture         =   "Form0.frx":C3574
      Top             =   2175
      Visible         =   0   'False
      Width           =   1470
   End
   Begin VB.Menu m1 
      Caption         =   "ออก"
   End
   Begin VB.Menu m2 
      Caption         =   "ผู้จัดทำ"
   End
End
Attribute VB_Name = "menu_pro"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Image1.Visible = False
    Image2.Visible = False
    Image3.Visible = False
    Image4.Visible = False
    Image5.Visible = False
    Image6.Visible = False
    Image7.Visible = False
    Image8.Visible = False
    If Y > 2175 And Y < 2640 And X > 1350 And X < 2820 Then
        Image1.Visible = True
    ElseIf Y > 3000 And Y < 3555 And X > 1350 And X < 2655 Then
        Image2.Visible = True
    ElseIf Y > 3990 And Y < 4455 And X > 1350 And X < 2805 Then
        Image3.Visible = True
    ElseIf Y > 4905 And Y < 5370 And X > 1335 And X < 2505 Then
        Image4.Visible = True
    ElseIf Y > 2085 And Y < 2640 And X > 6030 And X < 7290 Then
        Image5.Visible = True
    ElseIf Y > 3075 And Y < 3450 And X > 6015 And X < 7710 Then
        Image6.Visible = True
    ElseIf Y > 4125 And Y < 4350 And X > 6015 And X < 7665 Then
        Image7.Visible = True
    ElseIf Y > 4905 And Y < 5265 And X > 6015 And X < 8265 Then
        Image8.Visible = True
    End If
    
End Sub

Private Sub Image1_Click()
    f_r_data.Show (vbModal)
End Sub

Private Sub Image2_Click()
    f_a_data.Show (vbModal)
End Sub

Private Sub Image3_Click()
    f_e_data.Show (vbModal)
End Sub

Private Sub Image4_Click()
    f_d_data.Show (vbModal)
End Sub

Private Sub Image5_Click()
    f_read.Show (vbModal)
End Sub

Private Sub Image6_Click()
    f_read_all.Show (vbModal)
End Sub

Private Sub Image7_Click()
    f_l_data.Show (vbModal)
End Sub

Private Sub Image8_Click()
    Unload Me
End Sub

Private Sub m1_Click()
    Unload Me
End Sub

Private Sub m2_Click()
    f_m.Show (vbModal)
End Sub
