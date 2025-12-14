VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmRecvFiles 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Receive Files"
   ClientHeight    =   7965
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7215
   Icon            =   "frmRecvFiles.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7965
   ScaleWidth      =   7215
   Begin MSComctlLib.ImageList ImgList 
      Left            =   6480
      Top             =   120
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   24
      ImageHeight     =   28
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   6
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmRecvFiles.frx":164A
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmRecvFiles.frx":1D86
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmRecvFiles.frx":2486
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmRecvFiles.frx":2B77
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmRecvFiles.frx":37CB
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmRecvFiles.frx":441F
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.TreeView treeFiles 
      Height          =   7935
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   7215
      _ExtentX        =   12726
      _ExtentY        =   13996
      _Version        =   393217
      Style           =   7
      ImageList       =   "ImgList"
      Appearance      =   1
   End
End
Attribute VB_Name = "frmRecvFiles"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Counter As Long
Const root = "Root"
Dim s As Boolean
Const imgPO = 1
Const imgPR = 2
Const imgIV = 3

Private Sub Form_Load()
        s = False
        treeFiles.LineStyle = tvwRootLines
        frmRecvFiles.Height = mdiMain.ScaleHeight
        frmRecvFiles.Width = mdiMain.ScaleWidth / 2
        frmRecvFiles.top = 0
        frmRecvFiles.Left = mdiMain.ScaleWidth / 2
        treeFiles.Height = frmRecvFiles.ScaleHeight
        treeFiles.Width = frmRecvFiles.ScaleWidth
        
        Counter = 1
End Sub


Public Sub AddChildTree(ByVal Relation As String, ByVal key As String, ByVal Text As String, ByVal Image As Integer)
        Dim chldNode As Node
        If key = "" Then
                key = "key" & Trim$(Str$(Counter))
        End If
        Set chldNode = treeFiles.Nodes.Add(Relation, tvwChild, key, GetFileName(Text))
        chldNode.Tag = Text
        Counter = Counter + 1
End Sub

Public Function AddRootTree_R(ByVal key As String, ByVal Text As String, ByVal Image As Integer) As String
        Dim chldNode As Node
        If key = "" Then
                key = root & Trim$(Str$(Counter))
        End If
        
        If s Then
                Set chldNode = treeFiles.Nodes.Add(root, tvwFirst, key, , Image)
                AddRootTree_R = key
        Else
                Set chldNode = treeFiles.Nodes.Add(, tvwFirst, root, , Image)
                 AddRootTree_R = root
                 s = True
        End If
        chldNode.Text = GetFileName(Text) & "    (Receive)"
        chldNode.Tag = Text
        Counter = Counter + 1
End Function

Public Function AddRootTree_S(ByVal key As String, ByVal Text As String, ByVal Image As Integer) As String
        Dim chldNode As Node
        If key = "" Then
                key = root & Trim$(Str$(Counter))
        End If
       If s Then
                Set chldNode = treeFiles.Nodes.Add(root, tvwFirst, key, , Image)
                AddRootTree_S = key
        Else
                Set chldNode = treeFiles.Nodes.Add(, tvwFirst, root, , Image)
                AddRootTree_S = root
                s = True
        End If
        chldNode.Text = GetFileName(Text) & "    (Send)"
        chldNode.Tag = Text
        Counter = Counter + 1
End Function

Private Sub Form_Resize()
        treeFiles.Width = frmRecvFiles.ScaleWidth
        treeFiles.Height = frmRecvFiles.ScaleHeight
        frmRecvFiles.top = 0
        frmRecvFiles.Left = mdiMain.ScaleWidth / 2
End Sub

Private Sub Form_Unload(Cancel As Integer)
        s = False
        Counter = 1
        treeFiles.Nodes.Clear
End Sub

Private Sub treeFiles_NodeClick(ByVal Node As MSComctlLib.Node)
        Shell App.Path & "\notepad.exe " & Node.Tag, vbNormalFocus
End Sub

Public Sub Clear()
        treeFiles.Nodes.Clear
        s = False
End Sub
