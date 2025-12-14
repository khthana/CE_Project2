VERSION 5.00
Begin VB.Form FormOnlyMouse 
   Caption         =   "เมาส์.."
   ClientHeight    =   1260
   ClientLeft      =   9390
   ClientTop       =   7995
   ClientWidth     =   2310
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   NegotiateMenus  =   0   'False
   ScaleHeight     =   1260
   ScaleWidth      =   2310
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton cmdBack 
      Caption         =   "กลับ.."
      Height          =   375
      Left            =   1200
      TabIndex        =   7
      Top             =   840
      Width           =   1095
   End
   Begin VB.Timer Timer1 
      Interval        =   100
      Left            =   720
      Top             =   720
   End
   Begin VB.Frame FrameMouseButton 
      BackColor       =   &H80000004&
      Caption         =   "mouse button"
      ForeColor       =   &H8000000D&
      Height          =   855
      Left            =   1200
      TabIndex        =   4
      Top             =   0
      Width           =   1095
      Begin VB.OptionButton Op_mouse_left 
         BackColor       =   &H80000004&
         Caption         =   "Left"
         ForeColor       =   &H00008000&
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   240
         Value           =   -1  'True
         Width           =   855
      End
      Begin VB.OptionButton Op_mouse_right 
         BackColor       =   &H80000004&
         Caption         =   "Right"
         ForeColor       =   &H00008000&
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   480
         Width           =   855
      End
   End
   Begin VB.Frame FrameMouseEvent 
      BackColor       =   &H80000004&
      Caption         =   "mouse event"
      ForeColor       =   &H80000002&
      Height          =   1215
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   1095
      Begin VB.OptionButton Op_dbclick 
         BackColor       =   &H80000004&
         Caption         =   "Dbclick"
         ForeColor       =   &H00008000&
         Height          =   375
         Left            =   120
         TabIndex        =   3
         Top             =   480
         Width           =   855
      End
      Begin VB.OptionButton Op_drag 
         BackColor       =   &H80000004&
         Caption         =   "Drag"
         ForeColor       =   &H00008000&
         Height          =   255
         Left            =   120
         TabIndex        =   2
         Top             =   840
         Width           =   855
      End
      Begin VB.OptionButton Op_click 
         BackColor       =   &H80000004&
         Caption         =   "Click"
         ForeColor       =   &H00008000&
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Value           =   -1  'True
         Width           =   855
      End
   End
End
Attribute VB_Name = "FormOnlyMouse"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdBack_Click()
    FormMain.Show
    Unload Me
End Sub

Private Sub Form_Load()
    Call StayOnTop(Me.hwnd, True)
    Call MoveWindowPos(Me.hwnd, 2)
    FormMain.Hide
End Sub

Private Sub Form_Unload(Cancel As Integer)
    FormMain.Show
End Sub

Private Sub Op_click_Click()
    ActionMouse = 1
End Sub

Private Sub Op_dbclick_Click()
    ActionMouse = 2
End Sub

Private Sub Op_drag_Click()
    ActionMouse = 3
End Sub

Private Sub Op_mouse_left_Click()
    ButtonMouse = 1
End Sub

Private Sub Op_mouse_right_Click()
    ButtonMouse = 2
End Sub

Private Sub Timer1_Timer()
    Select Case ButtonMouse
        Case 1: Op_mouse_left.Value = True
        Case 2: Op_mouse_right.Value = True
    End Select
    Select Case ActionMouse
        Case 1: Op_click.Value = True
        Case 2: Op_dbclick.Value = True
        Case 3: Op_drag.Value = True
    End Select
End Sub
