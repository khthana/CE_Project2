VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form formBuild 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Relate Frame"
   ClientHeight    =   5175
   ClientLeft      =   1725
   ClientTop       =   1455
   ClientWidth     =   7215
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5175
   ScaleWidth      =   7215
   Begin VB.Frame frmBuild 
      Caption         =   "Build :"
      Height          =   5175
      Left            =   0
      TabIndex        =   3
      Top             =   0
      Visible         =   0   'False
      Width           =   2415
      Begin VB.ListBox lstDomain 
         Height          =   3630
         Left            =   240
         TabIndex        =   6
         Top             =   720
         Width           =   1935
      End
      Begin VB.CommandButton cmdBuild 
         Caption         =   "&Relate"
         Height          =   375
         Left            =   240
         TabIndex        =   5
         Top             =   4560
         Width           =   855
      End
      Begin VB.CommandButton cmdBuildCancel 
         Caption         =   "&Cancel"
         Height          =   375
         Left            =   1320
         TabIndex        =   4
         Top             =   4560
         Width           =   855
      End
      Begin VB.Label txtDomain 
         Caption         =   "Select Domain :"
         Height          =   375
         Left            =   240
         TabIndex        =   7
         Top             =   360
         Width           =   1575
      End
   End
   Begin VB.Frame frmDetails 
      Caption         =   "Details"
      Height          =   5175
      Left            =   2400
      TabIndex        =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   4815
      Begin VB.CommandButton cmdDetailsClose 
         Caption         =   "&Close"
         Height          =   375
         Left            =   1800
         TabIndex        =   1
         Top             =   4560
         Width           =   975
      End
      Begin MSComctlLib.TreeView tvwFrame 
         Height          =   4095
         Left            =   240
         TabIndex        =   2
         Top             =   240
         Width           =   4335
         _ExtentX        =   7646
         _ExtentY        =   7223
         _Version        =   393217
         LabelEdit       =   1
         LineStyle       =   1
         Style           =   7
         Appearance      =   1
      End
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuExit 
         Caption         =   "E&xit Build"
      End
   End
End
Attribute VB_Name = "formBuild"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Option Base 1

Const CAllDomain = "AllDomain"
Const TCRules = "Rules"

Dim cache As New cacheobject.Factory

Dim CDomain As String
Dim IDCDomain As Integer
Dim InstFrames() As String
Dim IDFrame As Integer
Dim InstParms() As String
Dim IDCparameters As Integer
Dim instRules() As String
Dim IDCRules As Integer

Dim FrameChild() As String

'Variables for all
Dim getinstance As Object
Dim getframe As Object
Dim embedclass As Object
Dim queryinstance As Object
Dim SqlStatement As String

Dim domainindex As Integer
Dim frameindex As Integer
Dim parmsindex As Integer
Dim rulesindex As Integer
Dim RestoreIf() As String
Dim RestoreThen() As String
Dim tmpID As Integer

Dim i, j, k, l, m As Integer
Dim tmp As Variant
Dim oid As Integer
Dim columns As Integer
Dim addnode As Node

'CDomain
  '1. ID
  '2. Destination
  '3. FrameTranslationName
  '4. Name
  '5. Source
  '6. Goals_GoalsTranslation
  '7. Goals_Name
  '8. Goals_Type
  '9. Parameters_Default
'10. Parameters_Expect
'11. Parameters_Name
'12. Parameters_ParametersTranslation
'13. Parameters_Prompt
'14. Parameters_Type
'15. Parameters_Value
'16. Rules_FramePointer
'17. Rules_IfStatement
'18. Rules_ThenStatement

'Cache 4
'1. ID
'2. Destination
'3. FrameTranslation
'4. Goals ( Name GoalsTranslation Type)
'5. Name
'6. Parameters ( Name ParametersTranslation Prompt Type Expect Value Default)
'7. Rules ( FramePointer IfStatement ThenStatement)
'8.Source

Private Sub ConnectToCache()
    
    If cache.Connect("cn_iptcp:127.0.0.1[1972]:PROJECT2") Then
        MsgBox ("Connect to Cache OK")
    Else
        MsgBox ("Can't Connect to Cache")
    End If

End Sub

Private Sub LoadDomainList(selectcombo As Object)

    Set queryinstance = cache.ResultSet(CAllDomain, "All")
    queryinstance.Execute
    columns = queryinstance.GetColumnCount()
    selectcombo.Clear
    domainindex = 0
    While queryinstance.Next
        selectcombo.AddItem queryinstance.GetData(2), domainindex
        domainindex = domainindex + 1
    Wend
    queryinstance.Close

End Sub

Private Sub lstDomain_Click()
    
    'map var
    'manage tree view
    'call load tree view
    
    'map var
    CDomain = lstDomain.Text
    IDCDomain = lstDomain.ListIndex + 1
    
    'manage tree view
    frmDetails.Visible = True
    
    'call load tree view
    Call LoadTreeView(CDomain)
    
End Sub

Private Sub LoadTreeView(tmp)
    
    Dim tmpFrame As String
    Dim tmpFrame0 As String
    Dim tmpFrame1 As String
    Dim tmpProperty As String
    Dim tmpGoals As String
    Dim tmpParms As String
    Dim tmpSlots As String
    Dim tmpRules As String
    Dim tmpIfThenRules As String
    Dim tmpName As String
    Dim tagAdd As Boolean
    
    'map var
    'clear tvw
    'get instance from cache before
    'manage button
    'how to work
    
    'map var
    CDomain = tmp
    
    'clear tvw
    tvwFrame.Nodes.Clear
    
    'get instance from cache before
    SqlStatement = "Select * from " & CDomain
    Set queryinstance = cache.DynamicSQL(SqlStatement)
    queryinstance.Execute
    frameindex = 0
    While queryinstance.Next
        frameindex = frameindex + 1
    Wend
    queryinstance.Close
    
    For i = 1 To frameindex
        tmpID = i
        Set getinstance = cache.OpenId(CDomain, i)
        Call RestoreRules(tmpID)
        parmsindex = getinstance.Parameters.Count
        rulesindex = getinstance.Rules.Count
        
        tmpFrame = "Frame : " & getinstance.Name
        If getinstance.Destination = "Own" Then
            If i = 1 Then
                Set addnode = tvwFrame.Nodes.Add(, , tmpFrame, tmpFrame)
                tmpFrame1 = tmpFrame
            Else
                Set addnode = tvwFrame.Nodes.Add(tmpFrame1, tvwChild, tmpFrame, tmpFrame)
            End If

        Else 'mean Destination = "Member"
            tmpFrame0 = "Frame : " & getinstance.Source
            Set addnode = tvwFrame.Nodes.Add(tmpFrame0, tvwChild, tmpFrame, tmpFrame)
        End If
        'add property contain goals and rules and parameters
        tmpProperty = getinstance.Name & " Property : "
        Set addnode = tvwFrame.Nodes.Add(tmpFrame, tvwChild, tmpProperty, tmpProperty)
        
        'add goals header and value parameter 1
        On Error GoTo AddAgain
        Debug.Print getinstance.Goals.GetAt(1).Name
        tagAdd = True
        If getinstance.Goals.GetAt(1).Name <> "" Then
            tmpGoals = getinstance.Name & " Goals : " & getinstance.Goals.GetAt(1).Name
            Set addnode = tvwFrame.Nodes.Add(tmpProperty, tvwChild, tmpGoals, tmpGoals)
            tagAdd = False
        Else
ResumeMain:
            tmpGoals = getinstance.Name & "Goals : (None)"
            Set addnode = tvwFrame.Nodes.Add(tmpProperty, tvwChild, tmpGoals, tmpGoals)
            tagAdd = False
        End If
        
        'header parameters
        tmpParms = getinstance.Name & " Parameters : "
        Set addnode = tvwFrame.Nodes.Add(tmpProperty, tvwChild, tmpParms, tmpParms)
        'parameters 1
        If getinstance.Goals.GetAt(1).Name <> "" Then
            tmpSlots = "Parameter (Goals) : " & getinstance.Parameters.GetAt(1).Name
            Set addnode = tvwFrame.Nodes.Add(tmpParms, tvwChild, tmpSlots, tmpSlots)
        Else
            tmpSlots = "Parameter : " & getinstance.Parameters.GetAt(1).Name
            Set addnode = tvwFrame.Nodes.Add(tmpParms, tvwChild, tmpSlots, tmpSlots)
        End If
        'add parameters 2 to all
        For j = 2 To parmsindex
            tmpSlots = getinstance.Name & " Parameter : " & getinstance.Parameters.GetAt(j).Name
            Set addnode = tvwFrame.Nodes.Add(tmpParms, tvwChild, tmpSlots, tmpSlots)
        Next j
        'header rules
        tmpRules = getinstance.Name & " Rules : "
        Set addnode = tvwFrame.Nodes.Add(tmpProperty, tvwChild, tmpRules, tmpRules)
        For j = 1 To rulesindex
            tmpSlots = j & ". Pointer : " & getinstance.Rules.GetAt(j).FramePointer & ", If : " & RestoreIf(j) & " , Then : " & RestoreThen(j)
            Set addnode = tvwFrame.Nodes.Add(tmpRules, tvwChild, tmpSlots, tmpSlots)
        Next j
    Next i

AddAgain:
    If tagAdd Then
        Resume ResumeMain
    End If

    'manage button
    cmdBuild.Enabled = True
    
End Sub

Private Sub cmdDetailsClose_Click()
    
    frmDetails.Visible = False

End Sub

Private Sub cmdBuildCancel_Click()
    
    'manage frame
    frmBuild.Visible = False
    tvwFrame.Visible = False
    Unload formBuild
    
End Sub

Private Sub cmdBuild_Click()
    
    Dim tmpIf, tmpThen As String
    Dim tmpPointer As String
    Dim tmpSplit() As String
    
    Dim tmpParameters() As String
    Dim tmpFrames() As String
    Dim tmpRules() As String
    
    Dim allFrame As Integer
    Screen.MousePointer = vbHourglass
    'manage FramePointer in Rules Property
    'get all of frame
    SqlStatement = "Select * from " & CDomain
    Set queryinstance = cache.DynamicSQL(SqlStatement)
    queryinstance.Execute
    frameindex = 0
    While queryinstance.Next
        frameindex = frameindex + 1
    Wend
    queryinstance.Close
    allFrame = frameindex
    
    'get count of Frame to frameindex
    ReDim tmpFrames(1 To frameindex, 1 To 2) As String
    ReDim tmpParameters(1 To frameindex, 1 To 2) As String
    ReDim tmpParameters(1 To frameindex, 1 To 2) As String
    
    For i = 1 To frameindex
        Set getinstance = cache.OpenId(CDomain, i)
        parmsindex = getinstance.Parameters.Count
        tmpFrames(i, 1) = i
        tmpFrames(i, 2) = getinstance.Name
        
        tmpParameters(i, 1) = i
        tmp = " "
        If getinstance.Goals.GetAt(1).Name <> "" Then
            For j = 1 To parmsindex
                tmp = tmp & getinstance.Parameters.GetAt(j).Name & " "
            Next j
        Else
            For j = 2 To parmsindex
                tmp = tmp & getinstance.Parameters.GetAt(j).Name & " "
            Next j
        End If
        tmpParameters(i, 2) = Trim(tmp)
        getinstance.sys_Close
    Next i
    Dim tmpFrmName As String
    For i = 1 To frameindex
        Set getinstance = cache.OpenId(CDomain, i)
        columns = getinstance.Rules.Count
        tmpIf = ""
        tmpThen = ""
        For j = 1 To columns ' loop for rules
            tmpPointer = ""
            tmpThen = getinstance.Rules.GetAt(j).ThenStatement
            tmpSplit = Split(tmpThen, "/", -1, vbTextCompare)
            'after split will have 2 parameters
            '1 is the value of goals
            '2 is the next frame
            If tmpSplit(1) <> "" Then
                For k = 1 To allFrame
                    If InStr(1, tmpFrames(k, 2), tmpSplit(1), vbTextCompare) <> 0 Then
                        MsgBox "BinGo"
                        tmpPointer = tmpSplit(1) 'name
                    End If
                Next k
                If tmpPointer = "" Then
                    tmpPointer = tmpFrames(i, 2)
                End If
            Else
                tmpPointer = tmpFrames(i, 2)
            End If
        Set embedclass = cache.New(TCRules)
        embedclass.FramePointer = tmpPointer
        embedclass.IfStatement = getinstance.Rules.GetAt(j).IfStatement
        embedclass.ThenStatement = getinstance.Rules.GetAt(j).ThenStatement
        tmp = getinstance.Rules.SetAt(embedclass, j)
        embedclass.sys_Close
        Next j
        getinstance.sys_Save
        getinstance.sys_Close
    Next i
    Screen.MousePointer = vbDefault
    Call LoadTreeView(CDomain)

End Sub

Private Sub mnuExit_Click()
    
    Unload formBuild
    
End Sub

Private Sub RestoreRules(tmpID)
    
    Dim tmpParameter() As String
    Dim tmpSplit() As String
    Dim columns As Integer
    Dim columns2 As Integer
    
    Set getinstance = cache.OpenId(CDomain, tmpID)
    columns = getinstance.Parameters.Count
    columns2 = getinstance.Rules.Count
    If columns = 0 Or columns2 = 0 Then
    Else
        
        ReDim tmpParameter(1 To columns) As String
        rulesindex = 0
        For k = 1 To columns
            tmpParameter(k) = getinstance.Parameters.GetAt(k).Name
        Next k
        columns = getinstance.Rules.Count
        ReDim RestoreIf(1 To columns) As String
        ReDim RestoreThen(1 To columns) As String
        If getinstance.Goals.GetAt(1).Name = "" Then
            For k = 1 To columns
                RestoreIf(k) = ""
                'if
                tmpSplit = Split(getinstance.Rules.GetAt(k).IfStatement, "/", -1, vbTextCompare)
                For l = 0 To UBound(tmpSplit) - 1
                    If tmpSplit(l) <> "" Then
                        RestoreIf(k) = RestoreIf(k) & tmpParameter(l + 1) & tmpSplit(l) & " AND "
                    End If
                Next l
                If tmpSplit(l) <> "" Then
                    RestoreIf(k) = RestoreIf(k) & tmpParameter(l + 1) & tmpSplit(l)
                End If
            Next k
        Else
            For k = 1 To columns
                RestoreIf(k) = ""
                RestoreThen(k) = ""
                'if
                tmpSplit = Split(getinstance.Rules.GetAt(k).IfStatement, "/", -1, vbTextCompare)
                For l = 1 To UBound(tmpSplit) - 1
                    If tmpSplit(l) <> "" Then
                        RestoreIf(k) = RestoreIf(k) & tmpParameter(l + 1) & tmpSplit(l) & " AND "
                    Else
                        RestoreIf(k) = RestoreIf(k)
                    End If
                Next l
                If tmpSplit(l) <> "" Then
                    RestoreIf(k) = RestoreIf(k) & tmpParameter(l + 1) & tmpSplit(l)
                Else
                    If Len(RestoreIf(k)) > 5 Then
                        RestoreIf(k) = Left(RestoreIf(k), Len(RestoreIf(k)) - 5)
                    End If
                End If
            Next k
        End If
            For k = 1 To columns
                'then
                tmpSplit = Split(getinstance.Rules.GetAt(k).ThenStatement, "/", -1, vbTextCompare)
                If tmpSplit(1) = "" Then
                    RestoreThen(k) = tmpParameter(1) & "= " & tmpSplit(0)
                Else
                    RestoreThen(k) = tmpParameter(1) & "= " & tmpSplit(0) & " AND CONSIDERFRAME " & tmpSplit(1)
                End If
            Next k
    End If
    getinstance.sys_Close

End Sub
