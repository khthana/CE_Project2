VERSION 5.00
Begin VB.UserControl zCombo 
   ClientHeight    =   1260
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3105
   LockControls    =   -1  'True
   ScaleHeight     =   1260
   ScaleWidth      =   3105
   Begin VB.Frame West2 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      ForeColor       =   &H80000008&
      Height          =   465
      Left            =   2775
      TabIndex        =   7
      Top             =   600
      Width           =   15
   End
   Begin VB.Frame West 
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      ForeColor       =   &H80000008&
      Height          =   465
      Left            =   2625
      TabIndex        =   6
      Top             =   600
      Width           =   15
   End
   Begin VB.Frame South2 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      ForeColor       =   &H80000008&
      Height          =   15
      Left            =   150
      TabIndex        =   5
      Top             =   1050
      Width           =   2190
   End
   Begin VB.Frame North2 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      ForeColor       =   &H80000008&
      Height          =   15
      Left            =   150
      TabIndex        =   4
      Top             =   900
      Width           =   2190
   End
   Begin VB.Frame North 
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      ForeColor       =   &H80000008&
      Height          =   15
      Left            =   150
      TabIndex        =   3
      Top             =   750
      Width           =   2190
   End
   Begin VB.Frame South 
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      ForeColor       =   &H80000008&
      Height          =   15
      Left            =   150
      TabIndex        =   2
      Top             =   600
      Width           =   2190
   End
   Begin VB.Frame East 
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      ForeColor       =   &H80000008&
      Height          =   465
      Left            =   2475
      TabIndex        =   1
      Top             =   600
      Width           =   15
   End
   Begin VB.ComboBox Combo1 
      BackColor       =   &H00FFFFFF&
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
      Height          =   360
      Left            =   150
      TabIndex        =   0
      Text            =   "zCombo"
      Top             =   75
      Width           =   2640
   End
End
Attribute VB_Name = "zCombo"
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

Private Sub Combo1_GotFocus()
  If Combo1.SelLength = 0 Then
    Combo1.SelStart = 0
    Combo1.SelLength = 9999
  End If
End Sub

Private Sub UserControl_Resize()
  If m_cMode Then
    Combo1.ForeColor = m_c1Fore
    Combo1.BackColor = m_c1Back
    North2.BackColor = m_c1Back
    South2.BackColor = m_c1Back
    West2.BackColor = m_c1Back
    North.BackColor = m_c1Border
    South.BackColor = m_c1Border
    East.BackColor = m_c1Border
    West.BackColor = m_c1Border
  Else
    Combo1.ForeColor = m_c2Fore
    Combo1.BackColor = m_c2Back
    North2.BackColor = m_c2Back
    South2.BackColor = m_c2Back
    West2.BackColor = m_c2Back
    North.BackColor = m_c2Border
    South.BackColor = m_c2Border
    East.BackColor = m_c2Border
    West.BackColor = m_c2Border
  End If
  UserControl.Height = Combo1.Height
  Dim b As Integer 'Border Width
  b = North.Height
  Combo1.Left = 0
  Combo1.Top = 0
  Combo1.Width = UserControl.ScaleWidth
  North.Left = 0
  North.Top = 0
  North.Width = UserControl.ScaleWidth
  North2.Left = b
  North2.Top = b
  North2.Width = UserControl.ScaleWidth - b - b
  South.Left = 0
  South.Top = UserControl.ScaleHeight - b
  South.Width = UserControl.ScaleWidth
  South2.Left = b
  South2.Top = UserControl.ScaleHeight - b - b
  South2.Width = UserControl.ScaleWidth - b - b
  West.Left = 0
  West.Top = 0
  West.Height = UserControl.ScaleHeight
  West2.Left = b
  West2.Top = b
  West2.Height = UserControl.ScaleHeight - b - b
  East.Left = UserControl.ScaleWidth - b
  East.Top = b
  East.Height = UserControl.ScaleHeight
End Sub

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
  Set Font = Combo1.Font
End Property

Public Property Set Font(ByVal New_Font As Font)
  Set Combo1.Font = New_Font
  PropertyChanged "Font"
End Property

Public Property Get Locked() As Boolean
  Locked = Combo1.Locked
End Property

Public Property Let Locked(ByVal New_Locked As Boolean)
  Combo1.Locked() = New_Locked
  PropertyChanged "Locked"
  UserControl_Resize
End Property

Public Sub Clear()
  Combo1.Clear
End Sub

Private Sub Combo1_Click()
  RaiseEvent Click
End Sub

Private Sub Combo1_Change()
  RaiseEvent Click
End Sub

Private Sub Combo1_KeyPress(KeyAscii As Integer)
  RaiseEvent KeyPress(KeyAscii)
End Sub

Public Sub AddItem(ByVal Item As String, Optional ByVal index As Variant)
Attribute AddItem.VB_Description = "Adds an item to a Listbox or ComboBox control or a row to a Grid control."
  Combo1.AddItem Item, index
End Sub

Public Sub RemoveItem(ByVal index As Integer)
  Combo1.RemoveItem index
End Sub

Public Property Get List(ByVal index As Integer) As String
Attribute List.VB_Description = "Returns/sets the items contained in a control's list portion."
  List = Combo1.List(index)
End Property

Public Property Let List(ByVal index As Integer, ByVal New_List As String)
  Combo1.List(index) = New_List
  PropertyChanged "List"
End Property

Public Property Get ListCount() As Integer
Attribute ListCount.VB_Description = "Returns the number of items in the list portion of a control."
  ListCount = Combo1.ListCount
End Property

Public Property Get ListIndex() As Integer
Attribute ListIndex.VB_Description = "Returns/sets the index of the currently selected item in the control."
  ListIndex = Combo1.ListIndex
End Property

Public Property Let ListIndex(ByVal New_ListIndex As Integer)
  Combo1.ListIndex() = New_ListIndex
  PropertyChanged "ListIndex"
End Property

Public Property Get Text() As String
Attribute Text.VB_Description = "Returns/sets the text contained in the control."
  Text = Combo1.Text
End Property

Public Property Let Text(ByVal New_Text As String)
  Combo1.Text() = New_Text
  PropertyChanged "Text"
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
  Dim index As Integer
  m_c1Fore = PropBag.ReadProperty("c1Fore", def_c1Fore)
  m_c1Back = PropBag.ReadProperty("c1Back", def_c1Back)
  m_c1Border = PropBag.ReadProperty("c1Border", def_c1Border)
  m_c2Fore = PropBag.ReadProperty("c2Fore", def_c2Fore)
  m_c2Back = PropBag.ReadProperty("c2Back", def_c2Back)
  m_c2Border = PropBag.ReadProperty("c2Border", def_c2Border)
  m_cMode = PropBag.ReadProperty("cMode", def_cMode)
  Combo1.Enabled = PropBag.ReadProperty("Enabled", True)
  Set Combo1.Font = PropBag.ReadProperty("Font", Ambient.Font)
  Combo1.List(index) = PropBag.ReadProperty("List" & index, "")
  Combo1.ListIndex = PropBag.ReadProperty("ListIndex", 0)
  Combo1.Locked = PropBag.ReadProperty("Locked", False)
  Combo1.Text = PropBag.ReadProperty("Text", "zCombo")
  UserControl_Resize
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
  Dim index As Integer
  Call PropBag.WriteProperty("c1Fore", m_c1Fore, def_c1Fore)
  Call PropBag.WriteProperty("c1Back", m_c1Back, def_c1Back)
  Call PropBag.WriteProperty("c1Border", m_c1Border, def_c1Border)
  Call PropBag.WriteProperty("c2Fore", m_c2Fore, def_c2Fore)
  Call PropBag.WriteProperty("c2Back", m_c2Back, def_c2Back)
  Call PropBag.WriteProperty("c2Border", m_c2Border, def_c2Border)
  Call PropBag.WriteProperty("cMode", m_cMode, def_cMode)
  Call PropBag.WriteProperty("Enabled", Combo1.Enabled, True)
  Call PropBag.WriteProperty("Font", Combo1.Font, Ambient.Font)
  Call PropBag.WriteProperty("List" & index, Combo1.List(index), "")
  Call PropBag.WriteProperty("ListIndex", Combo1.ListIndex, 0)
  Call PropBag.WriteProperty("Locked", Combo1.Locked, False)
  Call PropBag.WriteProperty("Text", Combo1.Text, "zCombo")
End Sub
