VERSION 5.00
Begin VB.UserControl zText 
   ClientHeight    =   1005
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1935
   LockControls    =   -1  'True
   ScaleHeight     =   1005
   ScaleWidth      =   1935
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   315
      Left            =   75
      TabIndex        =   0
      Text            =   "zText"
      Top             =   75
      Width           =   1515
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00FFFFFF&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00FF8080&
      Height          =   360
      Left            =   75
      Top             =   450
      Width           =   1545
   End
End
Attribute VB_Name = "zText"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Const def_c1Fore = &H0&
Const def_c1Back = &HFFFFFF
Const def_c1Border = &HE48269
Const def_c2Fore = &H0&
Const def_c2Back = &HE0E0E0
Const def_c2Border = &H808080
Const def_cMode = True

Dim m_c1Fore As Variant
Dim m_c1Back As Variant
Dim m_c1Border As Variant
Dim m_c2Fore As Variant
Dim m_c2Back As Variant
Dim m_c2Border As Variant
Dim m_cMode As Boolean

Event Click()
Event KeyPress(KeyAscii As Integer)
Event Change()

Private Sub Text1_GotFocus()
  If Text1.SelLength = 0 Then
    Text1.SelStart = 0
    Text1.SelLength = 9999
  End If
End Sub

Private Sub UserControl_Resize()
  If m_cMode Then
    Text1.ForeColor = m_c1Fore
    Text1.BackColor = m_c1Back
    Shape1.BackColor = m_c1Back
    Shape1.BorderColor = m_c1Border
  Else
    Text1.ForeColor = m_c2Fore
    Text1.BackColor = m_c2Back
    Shape1.BackColor = m_c2Back
    Shape1.BorderColor = m_c2Border
  End If
  Text1.Left = 45
  Text1.Top = 45
  Text1.Width = ScaleWidth - 60
  Text1.Height = ScaleHeight - 60
  Shape1.Left = 0
  Shape1.Top = 0
  Shape1.Width = ScaleWidth
  Shape1.Height = ScaleHeight
End Sub

Public Property Get BorderColor() As OLE_COLOR
  BorderColor = Shape1.BorderColor
End Property

Public Property Get BackColor() As OLE_COLOR
  BackColor = Shape1.BackColor
End Property

Public Property Get ForeColor() As OLE_COLOR
  ForeColor = Text1.ForeColor
End Property

Public Property Get cMode() As Boolean
  cMode = m_cMode
End Property

Public Property Let cMode(ByVal New_cMode As Boolean)
  m_cMode = New_cMode
  PropertyChanged "cMode"
  UserControl_Resize
End Property

Public Property Get c1Fore() As OLE_COLOR
  c1Fore = m_c1Fore
End Property

Public Property Let c1Fore(ByVal New_c1Fore As OLE_COLOR)
  m_c1Fore = New_c1Fore
  PropertyChanged "c1Fore"
  UserControl_Resize
End Property

Public Property Get c2Fore() As OLE_COLOR
  c2Fore = m_c2Fore
End Property

Public Property Let c2Fore(ByVal New_c2Fore As OLE_COLOR)
  m_c2Fore = New_c2Fore
  PropertyChanged "c2Fore"
  UserControl_Resize
End Property

Public Property Get c1Back() As OLE_COLOR
  c1Back = m_c1Back
End Property

Public Property Let c1Back(ByVal New_c1Back As OLE_COLOR)
  m_c1Back = New_c1Back
  PropertyChanged "c1Back"
  UserControl_Resize
End Property

Public Property Get c2Back() As OLE_COLOR
  c2Back = m_c2Back
End Property

Public Property Let c2Back(ByVal New_c2Back As OLE_COLOR)
  m_c2Back = New_c2Back
  PropertyChanged "c2Back"
  UserControl_Resize
End Property

Public Property Get c1Border() As OLE_COLOR
  c1Border = m_c1Border
End Property

Public Property Let c1Border(ByVal New_c1Border As OLE_COLOR)
  m_c1Border = New_c1Border
  PropertyChanged "c1Border"
  UserControl_Resize
End Property

Public Property Get c2Border() As OLE_COLOR
  c2Border = m_c2Border
End Property

Public Property Let c2Border(ByVal New_c2Border As OLE_COLOR)
  m_c2Border = New_c2Border
  PropertyChanged "c2Border"
  UserControl_Resize
End Property

Public Property Get Enabled() As Boolean
Attribute Enabled.VB_Description = "Returns/sets a value that determines whether an object can respond to user-generated events."
  Enabled = UserControl.Enabled
End Property

Public Property Let Enabled(ByVal New_Enabled As Boolean)
  UserControl.Enabled() = New_Enabled
  PropertyChanged "Enabled"
End Property

Public Property Get Font() As Font
Attribute Font.VB_Description = "Returns a Font object."
Attribute Font.VB_UserMemId = -512
  Set Font = Text1.Font
End Property

Public Property Set Font(ByVal New_Font As Font)
  Set Text1.Font = New_Font
  PropertyChanged "Font"
End Property

Public Property Get Locked() As Boolean
Attribute Locked.VB_Description = "Determines whether a control can be edited."
  Locked = Text1.Locked
End Property

Public Property Let Locked(ByVal New_Locked As Boolean)
  Text1.Locked() = New_Locked
  PropertyChanged "Locked"
  UserControl_Resize
End Property

Private Sub Text1_Click()
  RaiseEvent Click
End Sub

Private Sub Text1_KeyPress(KeyAscii As Integer)
  RaiseEvent KeyPress(KeyAscii)
End Sub

Private Sub Text1_Change()
  RaiseEvent Change
End Sub

Public Property Get PasswordChar() As String
  PasswordChar = Text1.PasswordChar
End Property

Public Property Let PasswordChar(ByVal New_PasswordChar As String)
  Text1.PasswordChar() = New_PasswordChar
  PropertyChanged "PasswordChar"
End Property

Public Property Get Text() As String
  Text = Text1.Text
End Property

Public Property Let Text(ByVal New_Text As String)
  Text1.Text() = New_Text
  PropertyChanged "Text"
End Property

Public Property Get SelLength() As Long
  SelLength = Text1.SelLength
End Property

Public Property Let SelLength(ByVal New_SelLength As Long)
  Text1.SelLength() = New_SelLength
  PropertyChanged "SelLength"
End Property

Public Property Get SelStart() As Long
  SelStart = Text1.SelStart
End Property

Public Property Let SelStart(ByVal New_SelStart As Long)
  Text1.SelStart() = New_SelStart
  PropertyChanged "SelStart"
End Property

Private Sub UserControl_InitProperties()
  m_c1Fore = def_c1Fore
  m_c1Back = def_c1Back
  m_c1Border = def_c1Border
  m_c2Fore = def_c2Fore
  m_c2Back = def_c2Back
  m_c2Border = def_c2Border
  m_cMode = def_cMode
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
  m_c1Fore = PropBag.ReadProperty("c1Fore", def_c1Fore)
  m_c1Back = PropBag.ReadProperty("c1Back", def_c1Back)
  m_c1Border = PropBag.ReadProperty("c1Border", def_c1Border)
  m_c2Fore = PropBag.ReadProperty("c2Fore", def_c2Fore)
  m_c2Back = PropBag.ReadProperty("c2Back", def_c2Back)
  m_c2Border = PropBag.ReadProperty("c2Border", def_c2Border)
  m_cMode = PropBag.ReadProperty("cMode", def_cMode)
  UserControl.Enabled = PropBag.ReadProperty("Enabled", True)
  Set Text1.Font = PropBag.ReadProperty("Font", Ambient.Font)
  Text1.Locked = PropBag.ReadProperty("Locked", False)
  Text1.PasswordChar = PropBag.ReadProperty("PasswordChar", "")
  Text1.Text = PropBag.ReadProperty("Text", "zText")
  UserControl_Resize
  Text1.SelLength = PropBag.ReadProperty("SelLength", 0)
  Text1.SelStart = PropBag.ReadProperty("SelStart", 0)
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
  Call PropBag.WriteProperty("c1Fore", m_c1Fore, def_c1Fore)
  Call PropBag.WriteProperty("c1Back", m_c1Back, def_c1Back)
  Call PropBag.WriteProperty("c1Border", m_c1Border, def_c1Border)
  Call PropBag.WriteProperty("c2Fore", m_c2Fore, def_c2Fore)
  Call PropBag.WriteProperty("c2Back", m_c2Back, def_c2Back)
  Call PropBag.WriteProperty("c2Border", m_c2Border, def_c2Border)
  Call PropBag.WriteProperty("cMode", m_cMode, def_cMode)
  Call PropBag.WriteProperty("Enabled", UserControl.Enabled, True)
  Call PropBag.WriteProperty("Font", Text1.Font, Ambient.Font)
  Call PropBag.WriteProperty("Locked", Text1.Locked, False)
  Call PropBag.WriteProperty("PasswordChar", Text1.PasswordChar, "")
  Call PropBag.WriteProperty("Text", Text1.Text, "zText")
  Call PropBag.WriteProperty("SelLength", Text1.SelLength, 0)
  Call PropBag.WriteProperty("SelStart", Text1.SelStart, 0)
End Sub
