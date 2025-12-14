VERSION 5.00
Begin VB.UserControl zCommand 
   BackColor       =   &H00E48269&
   CanGetFocus     =   0   'False
   ClientHeight    =   1050
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   2025
   LockControls    =   -1  'True
   MousePointer    =   99  'Custom
   ScaleHeight     =   1050
   ScaleWidth      =   2025
   Begin VB.Image Image2 
      Height          =   465
      Left            =   825
      ToolTipText     =   "BBBBBBBBBBBBBBBBB"
      Top             =   150
      Width           =   615
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "zCommand"
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
      Height          =   240
      Left            =   135
      TabIndex        =   0
      ToolTipText     =   "CCCCCCCCCCCCC"
      Top             =   300
      Width           =   1020
   End
   Begin VB.Image Image1 
      Height          =   600
      Left            =   75
      Stretch         =   -1  'True
      ToolTipText     =   "AAAAAAAAAAA"
      Top             =   135
      Width           =   615
   End
End
Attribute VB_Name = "zCommand"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Const def_Style = 1
Const def_cUpFore = &H0&
Const def_cDownFore = &HE48269
Const def_cDisabledFore = &H808080

Dim m_PictureUp As Picture
Dim m_PictureDown As Picture
Dim m_PictureDisabled As Picture
Dim m_Style As Integer
Dim m_cUpFore As OLE_COLOR
Dim m_cDownFore As OLE_COLOR
Dim m_cDisabledFore As OLE_COLOR

Event Click()

Private Sub UserControl_Resize()
  If UserControl.Enabled Then
    Set Image1.Picture = m_PictureUp
    Label1.ForeColor = m_cUpFore
  Else
    Set Image1.Picture = m_PictureDisabled
    Label1.ForeColor = m_cDisabledFore
  End If
  Image1.Left = 0
  Image1.Top = 0
  Image1.Width = ScaleWidth
  Image1.Height = ScaleHeight
  Image2.Visible = (m_Style > 0)
  Label1.Visible = (m_Style < 3)
  Select Case m_Style
    Case 0 ' 0 = No Image, Label Only
      Label1.Left = (ScaleWidth - Label1.Width) \ 2
      Label1.Top = (ScaleHeight - Label1.Height) \ 2
    Case 1 ' 1 = Image On Top
      Dim dy As Integer
      dy = (ScaleHeight - Image2.Height - Label1.Height) \ 3
      Image2.Left = (ScaleWidth - Image2.Width) \ 2
      Image2.Top = dy
      Label1.Left = (ScaleWidth - Label1.Width) \ 2
      Label1.Top = Image2.Height + dy + dy
    Case 2 ' 2 = Image On Left
      Dim dx As Integer
      dx = (ScaleWidth - Image2.Width - Label1.Width) \ 3
      Image2.Left = dx
      Image2.Top = (ScaleHeight - Image2.Height) \ 2
      Label1.Left = Image2.Width + dx + dx
      Label1.Top = (ScaleHeight - Label1.Height) \ 2
    Case 3 ' 3 = Image Only, No Label
      Image2.Left = (ScaleWidth - Image2.Width) \ 2
      Image2.Top = (ScaleHeight - Image2.Height) \ 2
  End Select
End Sub

Public Property Get cUpFore() As OLE_COLOR
  cUpFore = m_cUpFore
End Property

Public Property Let cUpFore(ByVal New_cUpFore As OLE_COLOR)
  m_cUpFore = New_cUpFore
  PropertyChanged "cUpFore"
  UserControl_Resize
End Property

Public Property Get cDownFore() As OLE_COLOR
  cDownFore = m_cDownFore
End Property

Public Property Let cDownFore(ByVal New_cDownFore As OLE_COLOR)
  m_cDownFore = New_cDownFore
  PropertyChanged "cDownFore"
  UserControl_Resize
End Property

Public Property Get cDisabledFore() As OLE_COLOR
  cDisabledFore = m_cDisabledFore
End Property

Public Property Let cDisabledFore(ByVal New_cDisabledFore As OLE_COLOR)
  m_cDisabledFore = New_cDisabledFore
  PropertyChanged "cDisabledFore"
  UserControl_Resize
End Property

Public Property Get Enabled() As Boolean
Attribute Enabled.VB_Description = "Returns/sets a value that determines whether an object can respond to user-generated events."
  Enabled = UserControl.Enabled
End Property

Public Property Let Enabled(ByVal New_Enabled As Boolean)
  UserControl.Enabled() = New_Enabled
  PropertyChanged "Enabled"
  UserControl_Resize
End Property

Public Property Get Font() As Font
Attribute Font.VB_Description = "Returns a Font object."
Attribute Font.VB_UserMemId = -512
  Set Font = Label1.Font
End Property

Public Property Set Font(ByVal New_Font As Font)
  Set Label1.Font = New_Font
  PropertyChanged "Font"
  UserControl_Resize
End Property

Private Sub Image1_Click()
  RaiseEvent Click
End Sub

Private Sub Image1_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  Set Image1.Picture = m_PictureDown
  If UserControl.Enabled Then Label1.ForeColor = m_cDownFore
End Sub

Private Sub Image1_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
  Set Image1.Picture = m_PictureUp
  If UserControl.Enabled Then Label1.ForeColor = m_cUpFore
End Sub

Private Sub Image2_Click()
  RaiseEvent Click
End Sub

Private Sub Image2_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  Set Image1.Picture = m_PictureDown
  If UserControl.Enabled Then Label1.ForeColor = m_cDownFore
End Sub

Private Sub Image2_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
  Set Image1.Picture = m_PictureUp
  If UserControl.Enabled Then Label1.ForeColor = m_cUpFore
End Sub

Private Sub Label1_Click()
  RaiseEvent Click
End Sub

Private Sub Label1_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  Set Image1.Picture = m_PictureDown
  If UserControl.Enabled Then Label1.ForeColor = m_cDownFore
End Sub

Private Sub Label1_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
  Set Image1.Picture = m_PictureUp
  If UserControl.Enabled Then Label1.ForeColor = m_cUpFore
End Sub

Private Sub UserControl_Click()
  RaiseEvent Click
End Sub

Public Property Get Caption() As String
Attribute Caption.VB_Description = "Returns/sets the text displayed in an object's title bar or below an object's icon."
  Caption = Label1.Caption
End Property

Public Property Let Caption(ByVal New_Caption As String)
  Label1.Caption() = New_Caption
  PropertyChanged "Caption"
  UserControl_Resize
End Property

Public Property Get Picture() As Picture
  Set Picture = Image2.Picture
End Property

Public Property Set Picture(ByVal New_Picture As Picture)
  Set Image2.Picture = New_Picture
  PropertyChanged "Picture"
  UserControl_Resize
End Property

Public Property Get PictureUp() As Picture
  Set PictureUp = m_PictureUp
End Property

Public Property Set PictureUp(ByVal New_PictureUp As Picture)
  Set m_PictureUp = New_PictureUp
  PropertyChanged "PictureUp"
  UserControl_Resize
End Property

Public Property Get PictureDown() As Picture
  Set PictureDown = m_PictureDown
End Property

Public Property Set PictureDown(ByVal New_PictureDown As Picture)
  Set m_PictureDown = New_PictureDown
  PropertyChanged "PictureDown"
End Property

Public Property Get PictureDisabled() As Picture
  Set PictureDisabled = m_PictureDisabled
End Property

Public Property Set PictureDisabled(ByVal New_PictureDisabled As Picture)
  Set m_PictureDisabled = New_PictureDisabled
  PropertyChanged "PictureDisabled"
  UserControl_Resize
End Property

Public Property Get Style() As Integer
  Style = m_Style
End Property

Public Property Let Style(ByVal New_Style As Integer)
  m_Style = New_Style
  PropertyChanged "Style"
  UserControl_Resize
End Property

Public Property Get ToolTip() As String
  ToolTip = Image1.ToolTipText
End Property

Public Property Let ToolTip(ByVal New_ToolTip As String)
  Image1.ToolTipText = New_ToolTip
  Image2.ToolTipText = New_ToolTip
  Label1.ToolTipText = New_ToolTip
  PropertyChanged "ToolTip"
End Property

Private Sub UserControl_InitProperties()
  Set m_PictureUp = LoadPicture("")
  Set m_PictureDown = LoadPicture("")
  Set m_PictureDisabled = LoadPicture("")
  m_Style = def_Style
  m_cUpFore = def_cUpFore
  m_cDownFore = def_cDownFore
  m_cDisabledFore = def_cDisabledFore
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
  m_cUpFore = PropBag.ReadProperty("cUpFore", def_cUpFore)
  m_cDownFore = PropBag.ReadProperty("cDownFore", def_cDownFore)
  m_cDisabledFore = PropBag.ReadProperty("cDisabledFore", def_cDisabledFore)
  m_Style = PropBag.ReadProperty("Style", def_Style)
  UserControl.Enabled = PropBag.ReadProperty("Enabled", True)
  Label1.Caption = PropBag.ReadProperty("Caption", "zCommand")
  Set Label1.Font = PropBag.ReadProperty("Font", Ambient.Font)
  Set m_PictureUp = PropBag.ReadProperty("PictureUp", Nothing)
  Set m_PictureDown = PropBag.ReadProperty("PictureDown", Nothing)
  Set m_PictureDisabled = PropBag.ReadProperty("PictureDisabled", Nothing)
  Set Image2.Picture = PropBag.ReadProperty("Picture", Nothing)
  Image1.ToolTipText = PropBag.ReadProperty("ToolTip", "")
  Image2.ToolTipText = PropBag.ReadProperty("ToolTip", "")
  Label1.ToolTipText = PropBag.ReadProperty("ToolTip", "")
  UserControl_Resize
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
  Call PropBag.WriteProperty("cUpFore", m_cUpFore, def_cUpFore)
  Call PropBag.WriteProperty("cDownFore", m_cDownFore, def_cDownFore)
  Call PropBag.WriteProperty("cDisabledFore", m_cDisabledFore, def_cDisabledFore)
  Call PropBag.WriteProperty("Style", m_Style, def_Style)
  Call PropBag.WriteProperty("Enabled", UserControl.Enabled, True)
  Call PropBag.WriteProperty("Caption", Label1.Caption, "zCommand")
  Call PropBag.WriteProperty("Font", Label1.Font, Ambient.Font)
  Call PropBag.WriteProperty("PictureUp", m_PictureUp, Nothing)
  Call PropBag.WriteProperty("PictureDown", m_PictureDown, Nothing)
  Call PropBag.WriteProperty("PictureDisabled", m_PictureDisabled, Nothing)
  Call PropBag.WriteProperty("Picture", Image2.Picture, Nothing)
  Call PropBag.WriteProperty("ToolTip", Image1.ToolTipText, "")
End Sub
