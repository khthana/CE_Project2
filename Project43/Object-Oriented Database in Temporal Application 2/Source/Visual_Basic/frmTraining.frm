VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmTraining 
   Caption         =   "Training History"
   ClientHeight    =   4650
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6585
   LinkTopic       =   "Form1"
   ScaleHeight     =   4650
   ScaleWidth      =   6585
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      Caption         =   "Edit Temporal"
      Height          =   1575
      Left            =   1080
      TabIndex        =   13
      Top             =   2880
      Width           =   5295
      Begin VB.CommandButton cmdAdd 
         Caption         =   "Add"
         Height          =   375
         Left            =   4440
         TabIndex        =   24
         Top             =   360
         Width           =   735
      End
      Begin VB.ComboBox cboTraining 
         Height          =   330
         Left            =   1200
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Top             =   360
         Width           =   3135
      End
      Begin VB.TextBox txtYearTo 
         Height          =   375
         Left            =   4560
         MaxLength       =   4
         TabIndex        =   7
         Top             =   840
         Width           =   495
      End
      Begin VB.TextBox txtDateTo 
         Height          =   375
         Left            =   4080
         MaxLength       =   2
         TabIndex        =   6
         Top             =   840
         Width           =   375
      End
      Begin VB.TextBox txtYearFrom 
         Height          =   375
         Left            =   2160
         MaxLength       =   4
         TabIndex        =   4
         Top             =   840
         Width           =   495
      End
      Begin VB.TextBox txtDateFrom 
         Height          =   375
         Left            =   1680
         MaxLength       =   2
         TabIndex        =   3
         Top             =   840
         Width           =   375
      End
      Begin VB.TextBox txtMonthFrom 
         Height          =   375
         Left            =   1200
         MaxLength       =   2
         TabIndex        =   2
         Top             =   840
         Width           =   375
      End
      Begin VB.TextBox txtMonthTo 
         Height          =   375
         Left            =   3600
         MaxLength       =   2
         TabIndex        =   5
         Top             =   840
         Width           =   375
      End
      Begin VB.Label Label11 
         Caption         =   "mm/dd/yyyy"
         Height          =   255
         Left            =   3840
         TabIndex        =   22
         Top             =   1200
         Width           =   975
      End
      Begin VB.Label Label10 
         Caption         =   "mm/dd/yyyy"
         Height          =   255
         Left            =   1440
         TabIndex        =   21
         Top             =   1200
         Width           =   975
      End
      Begin VB.Label Label9 
         Caption         =   "/"
         Height          =   255
         Left            =   4440
         TabIndex        =   20
         Top             =   960
         Width           =   135
      End
      Begin VB.Label Label8 
         Caption         =   "/"
         Height          =   255
         Left            =   3960
         TabIndex        =   19
         Top             =   960
         Width           =   135
      End
      Begin VB.Label Label7 
         Caption         =   "/"
         Height          =   255
         Left            =   2040
         TabIndex        =   18
         Top             =   960
         Width           =   135
      End
      Begin VB.Label Label1 
         Caption         =   "/"
         Height          =   255
         Left            =   1560
         TabIndex        =   17
         Top             =   960
         Width           =   135
      End
      Begin VB.Label Label4 
         Caption         =   "Training :"
         Height          =   255
         Left            =   360
         TabIndex        =   16
         Top             =   480
         Width           =   855
      End
      Begin VB.Label Label5 
         Caption         =   "From Date :"
         Height          =   255
         Left            =   240
         TabIndex        =   15
         Top             =   960
         Width           =   855
      End
      Begin VB.Label Label6 
         Caption         =   "To Date :"
         Height          =   255
         Left            =   2760
         TabIndex        =   14
         Top             =   960
         Width           =   735
      End
   End
   Begin VB.CommandButton cmdNew 
      Caption         =   "New"
      Height          =   375
      Left            =   3600
      TabIndex        =   9
      Top             =   2280
      Width           =   855
   End
   Begin VB.CommandButton cmdUpdate 
      Caption         =   "Update"
      Height          =   375
      Left            =   5520
      TabIndex        =   11
      Top             =   2280
      Width           =   855
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "Delete"
      Height          =   375
      Left            =   2640
      TabIndex        =   8
      Top             =   2280
      Width           =   855
   End
   Begin VB.CommandButton cmdInsert 
      Caption         =   "Insert"
      Height          =   375
      Left            =   4560
      TabIndex        =   10
      Top             =   2280
      Width           =   855
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "Clear"
      Height          =   375
      Left            =   240
      TabIndex        =   12
      Top             =   4080
      Width           =   735
   End
   Begin MSComctlLib.ListView lvEObj 
      Height          =   1935
      Left            =   1200
      TabIndex        =   0
      Top             =   240
      Width           =   5175
      _ExtentX        =   9128
      _ExtentY        =   3413
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin VB.Label Label3 
      Caption         =   "History :"
      Height          =   255
      Left            =   600
      TabIndex        =   23
      Top             =   240
      Width           =   615
   End
End
Attribute VB_Name = "frmTraining"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public Indicator As Integer
Dim FromDate As String, ToDate As String
Dim FromLessThanTo As Boolean
Dim Kong As Boolean

Public Sub LoadTraining()
    ' Load EObj objects into lvEObj
    Kong = False
    LoadTrainingCombo
    Dim ehist As Object, dept As Object
    Dim item As ListItem, i As Integer
    lvEObj.View = lvwReport
    lvEObj.FullRowSelect = True
    ' load column headers
    lvEObj.ColumnHeaders.Clear
    lvEObj.ColumnHeaders.Add , , "Training", 2400, lvwColumnLeft
    lvEObj.ColumnHeaders.Add , , "From date", 1200, lvwColumnCenter
    lvEObj.ColumnHeaders.Add , , "To date", 1200, lvwColumnCenter
    ' load data
    lvEObj.ListItems.Clear
    i = 1
    Set ehist = Per.RTrainings.GetAt(1)
    Do While Not ehist Is Nothing
        Set item = lvEObj.ListItems.Add
        item.Text = ehist.Training.Name
        item.SubItems(1) = ehist.FromDate
        item.SubItems(2) = ehist.ToDate
        i = i + 1
        Set ehist = Per.RTrainings.GetAt(i)
    Loop
    clearEdit
    If lvEObj.ListItems.Count = 0 Then
        cmdInsert.Enabled = False
        cmdDelete.Enabled = False
        cmdUpdate.Enabled = False
    Else
        cmdInsert.Enabled = True
        cmdDelete.Enabled = True
        cmdUpdate.Enabled = True
    End If
End Sub

Private Sub LoadTrainingCombo()
    Dim obj As Object, i As Integer
    Dim displays As String, delimd As String, objs() As String
    Set obj = cache.Static("Person.Training")
    displays = obj.TrainingDISPLAYLIST
    delimd = Left(displays, 1)
    objs = Split(displays, delimd)
    cboTraining.Clear
    For i = 1 To UBound(objs)
        cboTraining.AddItem objs(i)
    Next i
End Sub

Private Sub cmdClear_Click()
    clearEdit
End Sub

Private Sub clearEdit()
    txtMonthFrom = ""
    txtDateFrom = ""
    txtYearFrom = ""
    txtMonthTo = ""
    txtDateTo = ""
    txtYearTo = ""
End Sub

Private Sub MakeDate()
    FromDate = ""
    ToDate = ""
    If (txtMonthFrom <> "" And txtDateFrom <> "" And txtYearFrom <> "") Then
        FromDate = txtMonthFrom + "/" + txtDateFrom + "/" + txtYearFrom
    End If
    If (txtMonthTo <> "" And txtDateTo <> "" And txtYearTo <> "") Then
        ToDate = txtMonthTo + "/" + txtDateTo + "/" + txtYearTo
    End If
End Sub

Private Sub CompareDate()
    FromLessThanTo = False
    If CInt(txtYearFrom) < 10 Then txtYearFrom.Text = "20" + txtYearFrom.Text
    If CInt(txtYearTo) < 10 Then txtYearTo.Text = "20" + txtYearTo.Text
    If CInt(txtYearFrom) < CInt(txtYearTo) Then FromLessThanTo = True
    If CInt(txtYearFrom) = CInt(txtYearTo) Then
        If CInt(txtMonthFrom) < CInt(txtMonthTo) Then
            FromLessThanTo = True
        ElseIf CInt(txtMonthFrom) = CInt(txtMonthTo) Then
            If CInt(txtDateFrom) < CInt(txtDateTo) Then
                FromLessThanTo = True
            End If
        End If
    End If
End Sub

Private Sub cmdDelete_Click()
    On Error GoTo DeleteError
    
    MakeDate
    CompareDate
    
    If (cboTraining <> "") And (FromDate <> "") And (ToDate <> "") And (FromLessThanTo = True) Then
        Per.RDelete "Training", "Name", no, cboTraining.Text, FromDate, ToDate
        frmTraining.LoadTraining
        Exit Sub
    Else
        MsgBox "You should fill all fields or check your data again"
    End If
    Exit Sub
        
DeleteError:
    VBErrorBox "Delete failed"
    ClearScreen
    
End Sub

Private Sub cmdInsert_Click()
    
    On Error GoTo objInErr
    
    MakeDate
    CompareDate
    
    Dim st As Integer
    If (cboTraining <> "") And (FromDate <> "") And (ToDate <> "") And (FromLessThanTo = True) Then
        st = Per.RInsert("Training", "Name", no, cboTraining.Text, FromDate, ToDate)
        'MsgBox st
        frmTraining.LoadTraining
        Exit Sub
    Else
        MsgBox "You should fill all fields or check your data again"
    End If
    Exit Sub
        
    
objInErr:
    VBErrorBox "Insert failed"
    ClearScreen
   
End Sub

Private Sub cmdNew_Click()
    
    On Error GoTo objAddErr
    
    MakeDate
    
    If (cboTraining <> "") And (FromDate <> "") Then
        If Per.CheckFrom("RTrainings", no, FromDate) Then
            Per.RAppend "Training", "Name", no, cboTraining.Text, FromDate
            clearEdit
        Else
            MsgBox "No Overlap Time"
        End If
    Else
        MsgBox "You should fill Name and FromDate"
    End If
    
    frmTraining.LoadTraining
    Exit Sub
    
objAddErr:
    VBErrorBox "Append new record failed"
    ClearScreen

End Sub

Private Sub cmdUpdate_Click()

    On Error GoTo objUpdateErr

    MakeDate
    CompareDate
    Dim st As String
    If (cboTraining <> "") And (FromDate <> "") And (ToDate <> "") And (FromLessThanTo = True) Then
        st = Per.RUpdate("Training", "Name", no, Indicator, cboTraining.Text, FromDate, ToDate)
        If st <> "Update Complete" Then MsgBox st
        frmTraining.LoadTraining
    Else
        MsgBox "You should fill all fields or check your data again"
    End If
    Exit Sub
    
objUpdateErr:
    VBErrorBox "Update failed"
    ClearScreen

End Sub

Private Sub cmdAdd_Click()
    frmNewTraining.Show 0
    frmNewTraining.lvTraining.ListIndex = 0
End Sub

Private Sub lvEObj_Click()
    If lvEObj.ListItems.Count = 0 Then Exit Sub

    Dim FromArray, ToArray
    Indicator = lvEObj.SelectedItem.Index
    
    FromArray = Split(Per.RTrainings.GetAt(Indicator).FromDate, "/", -1, 1)
    ToArray = Split(Per.RTrainings.GetAt(Indicator).ToDate, "/", -1, 1)
    
    findCombo cboTraining, lvEObj.SelectedItem.Text
    Kong = False
    txtMonthFrom = FromArray(0)
    txtDateFrom = FromArray(1)
    txtYearFrom = FromArray(2)
    txtMonthTo = ToArray(0)
    txtDateTo = ToArray(1)
    txtYearTo = ToArray(2)
    
End Sub

Private Sub findCombo(obj As Object, st As String)
    Dim i As Integer, j As Integer
    j = obj.ListCount - 1
    For i = 0 To j
        If (obj.List(i) = st) Then
            Kong = True
            obj.Text = obj.List(i)
            i = j + 1
        End If
    Next i
End Sub

Private Sub ClearScreen()
    clearEdit
    lvEObj.ColumnHeaders.Clear
    lvEObj.ListItems.Clear
    LoadTraining
End Sub

Private Sub VBErrorBox(Title As String)
    ' Produces an error box from the VB Err object, with the specified Title
    Dim msg As String
    msg = ""
    msg = msg & "Error From        : " & Err.Source & vbCr
    msg = msg & "Error Number      : " & Err.Number & vbCr
    msg = msg & "Error Description : " & Err.Description
    MsgBox msg, , Title
End Sub

