VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form formConsult 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Consult"
   ClientHeight    =   5175
   ClientLeft      =   1725
   ClientTop       =   1455
   ClientWidth     =   7230
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5175
   ScaleWidth      =   7230
   Begin VB.Frame frmSubFrame 
      Caption         =   "SubFrame : "
      Height          =   2415
      Left            =   2640
      TabIndex        =   41
      Top             =   1320
      Visible         =   0   'False
      Width           =   4455
      Begin VB.CommandButton cmdSubFrameNo 
         Caption         =   "&No"
         Height          =   375
         Left            =   2640
         TabIndex        =   43
         Top             =   1440
         Width           =   975
      End
      Begin VB.CommandButton cmdSubFrameYes 
         Caption         =   "&Yes"
         Height          =   375
         Left            =   840
         TabIndex        =   42
         Top             =   1440
         Width           =   975
      End
      Begin VB.Label lblSubFrame 
         Caption         =   "Prompt Process"
         Height          =   495
         Left            =   600
         TabIndex        =   44
         Top             =   480
         Width           =   3255
      End
   End
   Begin VB.Frame frmMulti 
      Caption         =   "Select or Enter the Value :"
      Height          =   3975
      Left            =   2520
      TabIndex        =   11
      Top             =   720
      Visible         =   0   'False
      Width           =   4695
      Begin VB.CommandButton cmdMSelect 
         Caption         =   "&Select"
         Height          =   375
         Left            =   2280
         TabIndex        =   40
         Top             =   3240
         Width           =   855
      End
      Begin VB.CommandButton cmdMWhy 
         Caption         =   "&Why ?"
         Height          =   375
         Left            =   3480
         TabIndex        =   32
         Top             =   3240
         Width           =   855
      End
      Begin VB.CommandButton cmdMCancel 
         Caption         =   "&Cancel"
         Height          =   375
         Left            =   3480
         TabIndex        =   31
         Top             =   2520
         Width           =   855
      End
      Begin VB.CommandButton cmdMNext 
         Caption         =   "&Next"
         Height          =   375
         Left            =   2280
         TabIndex        =   30
         Top             =   2520
         Width           =   855
      End
      Begin VB.TextBox txtMultiValue 
         Height          =   735
         Left            =   2280
         TabIndex        =   29
         Top             =   1440
         Width           =   2055
      End
      Begin VB.ListBox lstMValue 
         Height          =   2160
         Left            =   360
         MultiSelect     =   1  'Simple
         TabIndex        =   28
         Top             =   1440
         Width           =   1575
      End
      Begin VB.Label lblMPrompt 
         Caption         =   "Help"
         Height          =   615
         Left            =   360
         TabIndex        =   39
         Top             =   360
         Width           =   3975
      End
      Begin VB.Label lblM 
         Caption         =   "Enter the Value"
         Height          =   375
         Left            =   2280
         TabIndex        =   33
         Top             =   960
         Width           =   1815
      End
      Begin VB.Label lblMParmName 
         Caption         =   "Name"
         Height          =   255
         Left            =   360
         TabIndex        =   27
         Top             =   960
         Width           =   1455
      End
   End
   Begin VB.Frame frmSingle 
      Caption         =   "Select or Enter the Value :"
      Height          =   3975
      Left            =   2520
      TabIndex        =   10
      Top             =   720
      Visible         =   0   'False
      Width           =   4695
      Begin VB.CommandButton cmdSWhy 
         Caption         =   "&Why ?"
         Height          =   375
         Left            =   2880
         TabIndex        =   26
         Top             =   3240
         Width           =   855
      End
      Begin VB.CommandButton cmdSCancel 
         Caption         =   "&Cancel"
         Height          =   375
         Left            =   3480
         TabIndex        =   25
         Top             =   2520
         Width           =   855
      End
      Begin VB.CommandButton cmdSNext 
         Caption         =   "&Next"
         Height          =   375
         Left            =   2280
         TabIndex        =   24
         Top             =   2520
         Width           =   855
      End
      Begin VB.ListBox lstSValue 
         Height          =   2160
         Left            =   360
         TabIndex        =   22
         Top             =   1440
         Width           =   1575
      End
      Begin VB.TextBox txtSingleValue 
         Height          =   735
         Left            =   2280
         TabIndex        =   20
         Top             =   1440
         Width           =   2055
      End
      Begin VB.Label lblSPrompt 
         Caption         =   "Help"
         Height          =   615
         Left            =   360
         TabIndex        =   37
         Top             =   360
         Width           =   3975
      End
      Begin VB.Label lblS 
         Caption         =   "Enter the Value : "
         Height          =   255
         Left            =   2280
         TabIndex        =   23
         Top             =   960
         Width           =   1455
      End
      Begin VB.Label lblSParmName 
         Caption         =   "Name"
         Height          =   255
         Left            =   360
         TabIndex        =   21
         Top             =   960
         Width           =   1935
      End
   End
   Begin VB.Frame frmYesNo 
      Caption         =   "Select Answer :"
      Height          =   2775
      Left            =   3480
      TabIndex        =   9
      Top             =   1200
      Visible         =   0   'False
      Width           =   2775
      Begin VB.CommandButton cmdYCancel 
         Caption         =   "&Cancel"
         Height          =   375
         Left            =   1560
         TabIndex        =   19
         Top             =   2040
         Width           =   855
      End
      Begin VB.CommandButton cmdYWhy 
         Caption         =   "&Why ?"
         Height          =   375
         Left            =   360
         TabIndex        =   18
         Top             =   2040
         Width           =   855
      End
      Begin VB.CommandButton cmdYNo 
         Caption         =   "&No"
         Height          =   375
         Left            =   1560
         TabIndex        =   17
         Top             =   1440
         Width           =   855
      End
      Begin VB.CommandButton cmdYYes 
         Caption         =   "&Yes"
         Height          =   375
         Left            =   360
         TabIndex        =   16
         Top             =   1440
         Width           =   855
      End
      Begin VB.Label lblYPrompt 
         Caption         =   "Help"
         Height          =   615
         Left            =   360
         TabIndex        =   38
         Top             =   360
         Width           =   2055
      End
      Begin VB.Label lblYParmName 
         Caption         =   "Name"
         Height          =   375
         Left            =   360
         TabIndex        =   34
         Top             =   960
         Width           =   2055
      End
   End
   Begin VB.Frame frmAskAll 
      Caption         =   "Select or Enter the Value : "
      Height          =   4455
      Left            =   2520
      TabIndex        =   8
      Top             =   480
      Visible         =   0   'False
      Width           =   4695
      Begin VB.CommandButton cmdAWhy 
         Caption         =   "Why ?"
         Height          =   375
         Left            =   1920
         TabIndex        =   15
         Top             =   3720
         Width           =   855
      End
      Begin VB.CommandButton cmdACancel 
         Caption         =   "Cancel"
         Height          =   375
         Left            =   3480
         TabIndex        =   14
         Top             =   3720
         Width           =   855
      End
      Begin VB.CommandButton cmdANext 
         Caption         =   "&Next"
         Height          =   375
         Left            =   360
         TabIndex        =   13
         Top             =   3720
         Width           =   855
      End
      Begin VB.ListBox lstAValue 
         Height          =   1950
         Left            =   360
         MultiSelect     =   1  'Simple
         TabIndex        =   12
         Top             =   1440
         Width           =   3975
      End
      Begin VB.Label lblAPrompt 
         Caption         =   "Help"
         Height          =   615
         Left            =   360
         TabIndex        =   36
         Top             =   360
         Width           =   3855
      End
      Begin VB.Label lblAParmName 
         Caption         =   "Name"
         Height          =   375
         Left            =   360
         TabIndex        =   35
         Top             =   960
         Width           =   2415
      End
   End
   Begin VB.Frame frmDetails 
      Caption         =   "Details"
      Height          =   5175
      Left            =   2400
      TabIndex        =   4
      Top             =   0
      Visible         =   0   'False
      Width           =   4815
      Begin VB.CommandButton cmdDetailsClose 
         Caption         =   "&Close"
         Height          =   375
         Left            =   1800
         TabIndex        =   5
         Top             =   4560
         Width           =   975
      End
      Begin MSComctlLib.TreeView tvwFrame 
         Height          =   4095
         Left            =   240
         TabIndex        =   6
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
   Begin VB.Frame frmConsult 
      Caption         =   "Build :"
      Height          =   5175
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   2415
      Begin VB.CommandButton cmdSelect 
         Caption         =   "&Consult"
         Enabled         =   0   'False
         Height          =   375
         Left            =   240
         TabIndex        =   7
         Top             =   4560
         Width           =   855
      End
      Begin VB.CommandButton cmdCancel 
         Caption         =   "&Close"
         Height          =   375
         Left            =   1320
         TabIndex        =   2
         Top             =   4560
         Width           =   855
      End
      Begin VB.ListBox lstDomain 
         Height          =   3630
         Left            =   240
         TabIndex        =   1
         Top             =   720
         Width           =   1935
      End
      Begin VB.Label txtDomain 
         Caption         =   "Select Domain :"
         Height          =   375
         Left            =   240
         TabIndex        =   3
         Top             =   360
         Width           =   1575
      End
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File "
      Begin VB.Menu mnuExit 
         Caption         =   "E&xit Consult"
      End
   End
End
Attribute VB_Name = "formConsult"
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
Dim IDDomain As Integer
Dim IDFrame As Integer
Dim IDParameter As Integer
Dim IDRules As Integer

'Variables for all
Dim getinstance As Object
Dim getframe As Object
Dim embedclass As Object
Dim queryinstance As Object
Dim SqlStatement As String
Dim tagOperation As Integer ' 0=, 1>, 2<, 3>=,4<=,5<>
Dim tagSubFrame As Boolean

Dim domainindex As Integer
Dim frameindex As Integer
Dim parmsindex As Integer
Dim rulesindex As Integer
Dim tagUser As Boolean

Dim tagFindRule As Boolean

Dim parmname As String
Dim parmvalue As String
Dim parmtype As String
Dim parmprompt As String
Dim parmtranslation As String
Dim tagYesNo As Boolean
Dim txtSValue As String
Dim txtMValue As String
Dim CountParm As Integer
Dim RestoreIf() As String
Dim RestoreThen() As String
Dim Ifusers As String
Dim tmpID As Integer
Dim SlotsValue As String
Dim tmptxtSplit As String
Dim SplitThen() As String
Dim StartParameter As String
Dim EKBName As String

Dim SlotsPointer As String
Dim PossibleRules As String
Dim PossibleEKBs As String
Dim IDRulesPointer() As String
Dim FramesList As String

Dim tagFind As Boolean
Dim i, j, k, l As Integer
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


Private Sub Form_Load()
        
    'manage frame
    'manage button
    'manage menu
    'call load domain list
    
    If cache.IsConnected Then
        MsgBox ("Connection is OK")
    Else
        ConnectToCache
    End If
    
    'manage frame
    frmConsult.Visible = True
    
    'manage button
    
    'call load domain list
    Call LoadDomainList(lstDomain)

End Sub

Private Sub ConnectToCache()
    
    If cache.Connect("cn_iptcp:127.0.0.1[1972]:EXPERTSYSTEM") Then
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

Private Sub ManageVars()

    Dim tmprulesid As String
    Dim tmpSplitSlots() As String
    
    'Get All of instance Frame in Class Domain
    SqlStatement = "Select * from " & CDomain
    Set queryinstance = cache.DynamicSQL(SqlStatement)
    queryinstance.Execute
    frameindex = 0
    While queryinstance.Next
        frameindex = frameindex + 1
    Wend
    queryinstance.Close
    ReDim IDRulesPointer(1 To frameindex, 1 To 4) As String
    For i = 1 To frameindex
        For j = 1 To 4
            IDRulesPointer(i, j) = 0
        Next j
    Next i
    
    tmprulesid = ""
    For i = 1 To frameindex
        Set getinstance = cache.OpenId(CDomain, i)
        columns = getinstance.Rules.Count
        For j = 1 To columns
            If getinstance.Rules.GetAt(j).FramePointer <> getinstance.Name Then
                tmprulesid = tmprulesid & j & "/"
            End If
        Next j
        tmprulesid = Trim(tmprulesid)
        IDRulesPointer(i, 1) = i
        If tmprulesid <> "" Then
            IDRulesPointer(i, 2) = tmprulesid
        Else
            IDRulesPointer(i, 2) = 0
        End If
        tmprulesid = ""
        getinstance.sys_Close
        If Len(IDRulesPointer(i, 2)) > 1 Then
            IDRulesPointer(i, 2) = Left(IDRulesPointer(i, 2), Len(IDRulesPointer(i, 2)) - 1)
        End If
    Next i
    'map IDRulesPointer(i, 3) next frame
    For i = 1 To frameindex
        If Val(IDRulesPointer(i, 2)) <> 0 Then
            Set getinstance = cache.OpenId(CDomain, i)
                tmprulesid = getinstance.Rules.GetAt(Val(IDRulesPointer(i, 2))).FramePointer
            getinstance.sys_Close
            For j = i To frameindex
                Set getinstance = cache.OpenId(CDomain, j)
                If tmprulesid = getinstance.Name Then
                    IDRulesPointer(i, 3) = IDRulesPointer(i, 3) & j
                End If
                getinstance.sys_Close
            Next j
        End If
    Next i
    'map IDRulesPointer(i,4) slots
    For i = 1 To frameindex
        If Val(IDRulesPointer(i, 2)) <> 0 Then
            'IDRulesPointer(i, 2)  tell id of rules
            Set getinstance = cache.OpenId(CDomain, i)
            tmpSplitSlots = Split(getinstance.Rules.GetAt(Val(IDRulesPointer(i, 2))).IfStatement, "/", -1, vbTextCompare)
            For j = 0 To UBound(tmpSplitSlots) - 1
                If tmpSplitSlots(j) <> "" Then
                    IDRulesPointer(i, 4) = j + 1
                End If
            Next j
            getinstance.sys_Close
        End If
    Next i
    
End Sub

Private Sub lstDomain_Click()
    
    'map var
    'manage tree view
    'call load tree view
    
    'map var
    CDomain = lstDomain.Text
    IDDomain = lstDomain.ListIndex + 1
    IDFrame = 1
    
    Call ManageVars
        
    'manage tree view
    '
    
    'call load tree view
    '
    
    'manage button
    cmdSelect.Enabled = True
    
End Sub

Private Sub lstDomain_DblClick()
    
    frmDetails.Visible = True
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
    
End Sub

Private Sub cmdDetailsClose_Click()
    
    frmDetails.Visible = False

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

Private Sub cmdCancel_Click()
    
    frmConsult.Visible = False
    
End Sub

Private Sub mnuExit_Click()

    Unload formConsult

End Sub

Private Sub cmdSelect_Click()

    frmDetails.Visible = False
    
    tagSubFrame = False
    IDFrame = 1
    Call ExpertConSult
    
End Sub

Private Sub ExpertConSult()
    
    If tagSubFrame Then ' to next frame
        tagSubFrame = False
        Set getinstance = cache.OpenId(CDomain, IDFrame)
        parmsindex = getinstance.Parameters.Count
        If getinstance.Goals.GetAt(1).Name = "" Then
            IDParameter = 1
            StartParameter = 1
        Else
            IDParameter = 2
            StartParameter = 2
        End If
        getinstance.sys_Close
        tagUser = False
        Call ManageConsult
        
    Else    ' start frame
        Set getinstance = cache.OpenId(CDomain, IDFrame)
        parmsindex = getinstance.Parameters.Count
        If getinstance.Goals.GetAt(1).Name = "" Then
            IDParameter = 1
            StartParameter = 1
            Ifusers = ""
        Else
            IDParameter = 2
            StartParameter = 2
            Ifusers = "/"
        End If
        getinstance.sys_Close
        tagUser = False
        Call ManageConsult
    
    End If

End Sub

Private Sub ManageConsult()
    
    Dim tmpSplit() As String
    
    SlotsValue = Trim(SlotsValue)
    If tagSubFrame Then
        Call ExpertConSult
    Else
        If IDParameter < parmsindex Then '9
            'wait for user input
            If tagUser Then
                Call FindEKB    'look up in EKB to find the possible rules
                If PossibleEKBs <> "" Then
                    'show users and add the value to next parameter
                    Call FindRules
                    If PossibleRules <> "" Then
                        IDParameter = IDParameter + 1
                        Call ShowParameter
                    Else
                        MsgBox "Not Rules to Solve"
                        IDParameter = IDParameter + 1
                        Call ShowParameter
                    End If
                Else
                    'findrules
                    Call FindRules 'look up in Rules for check Framepointer
                    If tagSubFrame Then
                        Call ManageConsult
                    Else
                        ' look PossibleRules
                        If PossibleRules <> "" Then
                            IDParameter = IDParameter + 1
                            Call ShowParameter
                        Else
                            'show users and end of cousult because not in rules and ekbs
                            MsgBox "Not in EKBS and  Rules"
                            Exit Sub
                        End If
                    End If
                End If
            Else 'taguser = false so............ only show
                Call ShowParameter
            End If 'taguser
        
        Else 'idparameter = parmsindex
            If tagUser Then
                Call FindEKB
                If StartParameter = 2 Then
                    'mean have goals
                    If PossibleEKBs <> "" Then
                        'mean find in ekbs
                        MsgBox "Possible EKB " & PossibleEKBs
                        If UBound(Split(PossibleEKBs, "/", -1, vbTextCompare)) = 0 Then
                            SqlStatement = "Select * from " & EKBName
                            Set queryinstance = cache.DynamicSQL(SqlStatement)
                            queryinstance.Execute
                            i = 0
                            While queryinstance.Next
                                i = i + 1
                                If Val(PossibleEKBs) = i Then
                                    MsgBox queryinstance.GetColumnHeader(2) & " : " & queryinstance.GetData(2)
                                End If
                            Wend
                            queryinstance.Close
                        Else 'ubound <> 0
                            tmpSplit = Split(PossibleEKBs, "/", -1, vbTextCompare)
                            SqlStatement = "Select * from " & EKBName
                            Set queryinstance = cache.DynamicSQL(SqlStatement)
                            queryinstance.Execute
                            i = 0
                            j = 0
                            While queryinstance.Next
                                i = i + 1
                                If Val(tmpSplit(j)) = i Then
                                    MsgBox queryinstance.GetColumnHeader(2) & " : " & queryinstance.GetData(2)
                                    If j < UBound(tmpSplit) Then
                                        j = j + 1
                                    End If
                                End If
                            Wend
                            queryinstance.Close
                        End If ' ubound
                    Else ' not in ekbs possible = 0
                        'look up rules to solve
                        Call FindRules
                        If tagSubFrame Then
                            Ifusers = Ifusers & "/"
                            frmSubFrame.Visible = True
                            Set getinstance = cache.OpenId(CDomain, IDFrame)
                            If getinstance.Goals.GetAt(1).Name = "" Then
                                parmprompt = "To SubFrame " & SlotsValue & " To Process"
                            Else
                                parmprompt = getinstance.Parameters.GetAt(1).Prompt
                            End If
                            getinstance.sys_Close
                            lblSubFrame.Caption = parmprompt
                            Call ExpertConSult
                        Else ' tagsubframe = false so.....do next
                            If PossibleRules <> "" Then
                                'have rules to solve
                                MsgBox "Possible Rules " & PossibleRules
                                If UBound(Split(PossibleRules, "/", -1, vbTextCompare)) = 0 Then
                                    'one rules
                                    tmpID = IDFrame
                                    RestoreRules (tmpID)
                                    MsgBox RestoreThen(PossibleRules)
                                    Exit Sub
                                Else ' more one rules
                                    'dont know now how to decision
                                    'check ifstatement if really match show goals
                                    'other no no no
                                    Dim tmpsplitifusers() As String
                                    Dim ifuserscompare As String
                                    tmpsplitifusers = Split(Ifusers, "/", -1, vbTextCompare)
                                    For i = 0 To UBound(tmpsplitifusers)
                                        tmp = InStr(1, tmpsplitifusers(i), "=", vbTextCompare)
                                        If tmp <> 0 Then
                                            tmpsplitifusers(i) = Mid(tmpsplitifusers(i), tmp)
                                        End If
                                    Next i
                                    ifuserscompare = ""
                                    For i = 0 To UBound(tmpsplitifusers)
                                        ifuserscompare = ifuserscompare & tmpsplitifusers(i) & "/"
                                    Next i
                                    ifuserscompare = Left(ifuserscompare, Len(ifuserscompare) - 1)
                                    tmpSplit = Split(PossibleRules, "/", -1, vbTextCompare)
                                    tmpID = IDFrame
                                    Call RestoreRules(tmpID)
                                    For i = 0 To UBound(tmpSplit)
                                        Set getinstance = cache.OpenId(CDomain, IDFrame)
                                            If ifuserscompare = getinstance.Rules.GetAt(Val(tmpSplit(i))).IfStatement Then
                                                MsgBox RestoreThen(Val(tmpSplit(i)))
                                            End If
                                        getinstance.sys_Close
                                    Next i
                                    Exit Sub
                                End If
                            Else 'possiblerules = ""
                                'not have rules to solve so exit sub
                                MsgBox "Not have rules to solve"
                                Exit Sub
                            End If 'possiblerules
                        End If 'tagsubframe
                    End If 'possible
                Else ' start = 1
                    'no goals
                    If PossibleEKBs = "" Then
                        Call FindRules
                        If tagSubFrame Then
                            Exit Sub
                        Else 'not to subframe
                            If PossibleRules <> "" Then
                                'no goals how to do now
                                MsgBox "Have Rules but not have goals and not to next frame and not have EKB"
                                Exit Sub
                            Else
                                'no rules to solve
                                MsgBox "No Rules to Solve and No Goals and not have EKB"
                                Exit Sub
                            End If
                        End If
                    Else
                        'show PossibleEKBs
                        MsgBox "Possible EKBS " & PossibleEKBs
                            'go to next frame by Destination
                            Dim tmpFrameName As String
                            Dim tmpSplitsFrame() As String
                            FramesList = ""
                            Set getinstance = cache.OpenId(CDomain, IDFrame)
                            tmpFrameName = getinstance.Name
                            getinstance.sys_Close
                            For i = IDFrame + 1 To frameindex
                                Set getinstance = cache.OpenId(CDomain, i)
                                If tmpFrameName = getinstance.Source Then
                                    FramesList = FramesList & getinstance.Name & "/"
                                End If
                                getinstance.sys_Close
                            Next i
                            If Len(FramesList) <> 0 Then
                                FramesList = Left(FramesList, Len(FramesList) - 1)
                                'split frameslist
                                tmpSplitsFrame = Split(FramesList, "/", -1, vbTextCompare)
                                If UBound(tmpSplitsFrame) = 0 Then
                                    MsgBox "You want to process Next Frame " & tmpSplitsFrame(0) & " Point By Frame"
                                    'send idframe
                                    SqlStatement = "Select * from " & CDomain
                                    Set queryinstance = cache.DynamicSQL(SqlStatement)
                                    queryinstance.Execute
                                    i = 0
                                    While queryinstance.Next
                                        i = i + 1
                                        If queryinstance.GetData(5) = tmpSplitsFrame(0) Then
                                            IDFrame = i
                                        End If
                                    Wend
                                    PossibleEKBs = ""
                                    PossibleRules = "'"
                                    Call ExpertConSult
                                Else
                                        'show all of frame
                                        MsgBox "Have more one subframe point by destination"
                                End If
                            Else
                                MsgBox "No Frame Rules EKB to Solve"
                            End If
                        Exit Sub
                    End If
                End If
            Else
                Ifusers = Ifusers & "/"
                frmSubFrame.Visible = True
                Set getinstance = cache.OpenId(CDomain, IDFrame)
                If getinstance.Goals.GetAt(1).Name = "" Then
                    parmprompt = "To SubFrame " & SlotsValue & " To Process"
                Else
                    parmprompt = getinstance.Parameters.GetAt(1).Prompt
                End If
                    getinstance.sys_Close
                    lblSubFrame.Caption = parmprompt
                    'Call ExpertConSult
            End If 'tagusers
        End If 'id = parm
    End If ' tagsubframe
    
End Sub

Private Sub ShowParameter()
      
    Set getinstance = cache.OpenId(CDomain, IDFrame)
    parmname = getinstance.Parameters.GetAt(IDParameter).Name
    parmtype = getinstance.Parameters.GetAt(IDParameter).Type
    parmprompt = getinstance.Parameters.GetAt(IDParameter).Prompt
    parmtranslation = getinstance.Parameters.GetAt(IDParameter).ParametersTranslation
    getinstance.sys_Close
    
    Ifusers = Ifusers & parmname & "="
    
    If parmtype = "YES/NO" Then
        Call LoadYesNo
    ElseIf parmtype = "SINGLEVALUED" Then
        Call LoadSingle
    ElseIf parmtype = "MULTIVALUED" Then
        Call LoadMulti
    ElseIf parmtype = "ASK-ALL" Then
        Call LoadAskAll
    End If

End Sub
'Type of Parameters is "YES/NO"
Private Sub LoadYesNo()
    
    'change label caption
    lblYParmName.Caption = parmname & " = "
    lblYPrompt.Caption = parmprompt
    frmYesNo.Visible = True
    
End Sub
'Type of Parameters is "SINGLEVALUED"
Private Sub LoadSingle()
    
    Dim splitvalue() As String
    
    'change label caption
    lblSParmName.Caption = parmname & " = "
    lblSPrompt.Caption = parmprompt
    
    txtSingleValue.Text = ""
    txtSValue = ""
    
    frmSingle.Visible = True
    lstSValue.Clear
    splitvalue = Split(getinstance.Parameters.GetAt(IDParameter).Values, ",", -1, vbTextCompare)
    For i = 0 To UBound(splitvalue)
        lstSValue.AddItem splitvalue(i), i
    Next i

End Sub
'Type of Parameters is "MULTIVALUED"
Private Sub LoadMulti()
    
    Dim splitvalue() As String
    
    'change label caption
    lblMParmName.Caption = parmname & " = "
    lblMPrompt.Caption = parmprompt
    
    txtMultiValue.Text = ""
    txtMValue = ""
    
    frmMulti.Visible = True
    lstMValue.Clear
    splitvalue = Split(getinstance.Parameters.GetAt(IDParameter).Values, ",", -1, vbTextCompare)
    For i = 0 To UBound(splitvalue)
        lstMValue.AddItem splitvalue(i), i
    Next i

End Sub
'Type of Parameters is "ASK-ALL"
Private Sub LoadAskAll()
    
    Dim splitvalue() As String
        
    'change label caption
    lblAParmName.Caption = parmname & " = "
    lblAPrompt.Caption = parmprompt
        
    frmAskAll.Visible = True
    lstAValue.Clear
    splitvalue = Split(getinstance.Parameters.GetAt(IDParameter).Values, ",", -1, vbTextCompare)
    For i = 0 To UBound(splitvalue) - 1
        lstAValue.AddItem splitvalue(i), i
    Next i
    
End Sub

Private Sub cmdANext_Click()
    
    Dim tagA As Boolean
    
    tagA = False
    'check value before
    For i = 0 To lstAValue.ListCount - 1
        If lstAValue.Selected(i) Then
            Ifusers = Ifusers & lstAValue.List(i)
            SlotsValue = lstAValue.List(i)
            tagA = True
        End If
    Next i
    If Not (tagA) Then 'user input is null
        'show frame default to conferm users
        tmp = InputBox("Default Value of " & parmname & " : ", "Default Value", getinstance.Parameters.GetAt(IDParameter).Default)
        Ifusers = Ifusers & tmp
        SlotsValue = tmp
    End If
    
    If IDParameter < parmsindex Then
        Ifusers = Ifusers & "/"
    End If
    
    frmAskAll.Visible = False
    
    tagUser = True
    Call ManageConsult
    
End Sub

Private Sub cmdYYes_Click()

    tagYesNo = True
    
    Ifusers = Ifusers & "Yes"
    SlotsValue = "YES"
    
    If IDParameter < parmsindex Then
        Ifusers = Ifusers & "/"
    End If
    
    frmYesNo.Visible = False
    
    tagUser = True
    Call ManageConsult

End Sub

Private Sub cmdYNo_Click()
    
    tagYesNo = False
    
    Ifusers = Ifusers & "No"
    SlotsValue = "NO"
    
    If IDParameter < parmsindex Then
        Ifusers = Ifusers & "/"
    End If
    
    frmYesNo.Visible = False
    
    tagUser = True
    Call ManageConsult

End Sub

Private Sub cmdSNext_Click()
    
    Dim tagS As Boolean
    
    tagS = False
    'loop to check
    For i = 0 To lstSValue.ListCount - 1
        If lstSValue.Selected(i) Then
            If Trim(txtSingleValue.Text) = lstSValue.List(i) Then
                Ifusers = Ifusers & lstSValue.List(i)
                SlotsValue = lstSValue.List(i)
                tagS = True
            End If
        End If
    Next i
    If Not (tagS) Then
        If txtSingleValue.Text <> "" Then
            Ifusers = Ifusers & UCase$(txtSingleValue.Text)
            SlotsValue = UCase$(txtSingleValue.Text)
        Else
            tmp = InputBox("Default Value of " & parmname & " : ", "Default Value", getinstance.Parameters.GetAt(IDParameter).Default)
            Ifusers = Ifusers & UCase$(tmp)
            SlotsValue = tmp
        End If

    End If
    
    If IDParameter < parmsindex Then
        Ifusers = Ifusers & "/"
    End If
    
    frmSingle.Visible = False
    
    tagUser = True
    Call ManageConsult
    
End Sub

Private Sub cmdMNext_Click()
    
    Dim tagM As Boolean
    
    tagM = False
    'loop to check
    For i = 0 To lstMValue.ListCount - 1
        If lstMValue.Selected(i) Then
            If Trim(txtMultiValue.Text) = lstMValue.List(i) Then
                Ifusers = Ifusers & lstMValue.List(i)
                SlotsValue = lstMValue.List(i)
                tagM = True
            End If
        End If
    Next i
    
    If Not (tagM) Then
        If txtMultiValue.Text <> "" Then
            Ifusers = Ifusers & UCase$(txtMultiValue.Text)
            SlotsValue = UCase$(txtMultiValue.Text)
        Else
            tmp = InputBox("Default Value of " & parmname & " : ", "Default Value", getinstance.Parameters.GetAt(IDParameter).Default)
            Ifusers = Ifusers & UCase$(tmp)
            SlotsValue = tmp
        End If
    End If
    
    If IDParameter < parmsindex Then
        Ifusers = Ifusers & "/"
    End If
    
    tagUser = True
    Call ManageConsult
    
End Sub

Private Sub cmdAWhy_Click()

    MsgBox parmtranslation
    
End Sub

Private Sub cmdYWhy_Click()

    MsgBox parmtranslation

End Sub

Private Sub cmdSWhy_Click()

    MsgBox parmtranslation
    
End Sub

Private Sub cmdMWhy_Click()

    MsgBox parmtranslation

End Sub

Private Sub cmdACancel_Click()
    
    frmAskAll.Visible = False
    
End Sub

Private Sub cmdYCancel_Click()
    
    frmYesNo.Visible = False

End Sub

Private Sub cmdSCancel_Click()

    frmSingle.Visible = False

End Sub

Private Sub cmdMCancel_Click()

    frmMulti.Visible = False
    
End Sub

 Private Sub lstSValue_Click()
    
    txtSingleValue.Text = lstSValue.List(lstSValue.ListIndex) & " "
    
End Sub

Private Sub lstMValue_Click()
    
    'txtMultiValue.Text = txtMultiValue.Text & lstMValue.Selected(lstMValue.ListIndex) & " "

End Sub

Private Sub cmdMSelect_Click()

    For i = 0 To lstMValue.ListCount - 1
        If lstMValue.Selected(i) Then
            Ifusers = Ifusers & lstMValue.List(i) & " "
        End If
    Next i
    
End Sub

Private Sub cmdSubFrameYes_Click()
    
    frmSubFrame.Visible = False
    Call ShowParameter
    
End Sub

Private Sub cmdSubFrameNo_Click()

    MsgBox "Can't Tell Answer"
    frmSubFrame.Visible = False

End Sub

Private Sub FindEKB()

    Dim BakPossibleEKBs As String
    Dim SplitEKBs() As String
    Dim ekbindex As String
    
    If StartParameter = IDParameter Then
        'Get Name of EKB
        Set getinstance = cache.OpenId(CAllDomain, IDDomain)
        ekbindex = getinstance.EKB.Count
        If (ekbindex <> 0) And (IDFrame <= ekbindex) Then
            EKBName = getinstance.EKB.GetAt(IDFrame).Name
            getinstance.sys_Close
            'Get Value
            PossibleEKBs = ""
            SqlStatement = "Select * from " & EKBName
            Set queryinstance = cache.DynamicSQL(SqlStatement)
            queryinstance.Execute
            i = 0
            While queryinstance.Next
                i = i + 1
                If queryinstance.GetData(IDParameter + 1) = SlotsValue Then
                    PossibleEKBs = PossibleEKBs & i & "/"
                End If
            Wend
            queryinstance.Close
            
            If Len(PossibleEKBs) > 1 Then
                PossibleEKBs = Left(PossibleEKBs, Len(PossibleEKBs) - 1)
            End If
        Else
            getinstance.sys_Close
            MsgBox "Not have Extensional Knowledge Base"
        End If
    
    Else
        
        If PossibleEKBs = "" Then
            MsgBox "Not match in Extensional Database"
        Else
            Set getinstance = cache.OpenId(CAllDomain, IDDomain)
            ekbindex = getinstance.EKB.Count
            If UBound(Split(PossibleEKBs, "/", -1, vbTextCompare)) = 0 Then
                BakPossibleEKBs = PossibleEKBs
                PossibleEKBs = ""
                If ekbindex <> 0 Then
                    EKBName = getinstance.EKB.GetAt(1).Name
                    getinstance.sys_Close
                    SqlStatement = "Select * from " & EKBName
                    Set queryinstance = cache.DynamicSQL(SqlStatement)
                    queryinstance.Execute
                    While queryinstance.Next
                        If queryinstance.GetData(IDParameter + 1) = SlotsValue Then
                            PossibleEKBs = BakPossibleEKBs
                        End If
                    Wend
                    queryinstance.Close
                Else
                    getinstance.sys_Close
                    MsgBox "Not have Extensional Knowledge Base"
                End If
            Else
                SplitEKBs = Split(PossibleEKBs, "/", -1, vbTextCompare)
                PossibleEKBs = ""
                'Get Name of EKB
                If ekbindex <> 0 Then
                    EKBName = getinstance.EKB.GetAt(IDFrame).Name
                    getinstance.sys_Close
                    SqlStatement = "Select * from " & EKBName
                    Set queryinstance = cache.DynamicSQL(SqlStatement)
                    queryinstance.Execute
                    i = 0
                    j = 0
                    While queryinstance.Next
                        i = i + 1
                        If i = Val(SplitEKBs(j)) Then
                            If queryinstance.GetData(IDParameter + 1) = SlotsValue Then
                                PossibleEKBs = PossibleEKBs & i & "/"
                            End If
                            If j < UBound(SplitEKBs) Then
                                j = j + 1
                            End If
                        End If
                    Wend
                    queryinstance.Close
                    If Len(PossibleEKBs) > 1 Then
                        PossibleEKBs = Left(PossibleEKBs, Len(PossibleEKBs) - 1)
                    End If
                Else
                    getinstance.sys_Close
                    MsgBox "Not have Extensional Knowledgebase"
            End If
            End If
            getinstance.sys_Close
        End If
    End If
    
End Sub

Private Sub FindRules()

    Dim SplitIf() As String
    Dim SplitPossible() As String
    Dim BakPossible As String
    Dim y As Integer
        
    y = -1
    
    SlotsValue = Trim(SlotsValue)
    If StartParameter = IDParameter Then ' search first time
        'get ifusers and find in rule and select possible rules that math with ifusers
        PossibleRules = ""
        Set getinstance = cache.OpenId(CDomain, IDFrame)
        columns = getinstance.Rules.Count
        getinstance.sys_Close
        If columns = 0 Then
        Else
            For i = 1 To columns
                'check then before
                Set getinstance = cache.OpenId(CDomain, IDFrame)
                SplitThen = Split(getinstance.Rules.GetAt(i).ThenStatement, "/", -1, vbTextCompare)
                'split if
                SplitIf = Split(getinstance.Rules.GetAt(i).IfStatement, "/", -1, vbTextCompare)
                tmptxtSplit = SplitIf(IDParameter - 1)
                'check if if tmptxtsplit at idparameter-1 not have value so don't add it
                If tmptxtSplit = "" Then
                    If SplitThen(1) <> "" Then
                        PossibleRules = PossibleRules & i & "/"
                    End If
                ElseIf tmptxtSplit <> "" Then
                    Call CompareAndOperation(tmptxtSplit)
                    If tagSubFrame Then
                        Exit Sub
                    End If
                    If SplitThen(1) <> "" Then
                        'PossibleRules = PossibleRules & i & "/"
                    End If
                End If
                getinstance.sys_Close
            Next i
            
            If Len(PossibleRules) < 1 Then
                MsgBox "Not Match in Rules"
            Else
                PossibleRules = Left(PossibleRules, Len(PossibleRules) - 1)
            End If
            
        End If
        
    Else 'other Start <> ID
        Set getinstance = cache.OpenId(CDomain, IDFrame)
        columns = getinstance.Rules.Count
        getinstance.sys_Close
        If columns = 0 Then
        Else
            BakPossible = PossibleRules
            PossibleRules = ""
            'split possiblerules
            SplitPossible = Split(BakPossible, "/", -1, vbTextCompare)
            For j = 0 To UBound(SplitPossible)
                Set getinstance = cache.OpenId(CDomain, IDFrame)
                'manage then before
                SplitThen = Split(getinstance.Rules.GetAt(Val(SplitPossible(j))).ThenStatement, "/", -1, vbTextCompare)
                'split if
                SplitIf = Split(getinstance.Rules.GetAt(Val(SplitPossible(j))).IfStatement, "/", -1, vbTextCompare)
                i = SplitPossible(j)
                tmptxtSplit = SplitIf(IDParameter - 1)
                Call CompareAndOperation(tmptxtSplit)
                If tagSubFrame Then
                    Exit Sub
                End If
                getinstance.sys_Close
            Next j
            If Len(PossibleRules) < 1 Then
            Else
                PossibleRules = Left(PossibleRules, Len(PossibleRules) - 1)
            End If
            
        End If
        
    End If
    
End Sub

Private Sub CompareAndOperation(tmptxtSplit)

    Dim y As Integer
    Dim tagNextFrame As Boolean
    Dim tmpSplitRule() As String

    'cut operation and map tagOperation
    If InStr(1, tmptxtSplit, "=", vbTextCompare) <> 0 Then
        tagOperation = 0
        y = 1
    ElseIf InStr(1, tmptxtSplit, ">", vbTextCompare) <> 0 Then
        tagOperation = 1
        y = 1
    ElseIf InStr(1, tmptxtSplit, "<", vbTextCompare) <> 0 Then
        tagOperation = 2
        y = 1
    ElseIf InStr(1, tmptxtSplit, ">=", vbTextCompare) <> 0 Then
        tagOperation = 3
        y = 2
    ElseIf InStr(1, tmptxtSplit, "<=", vbTextCompare) <> 0 Then
        tagOperation = 4
        y = 2
    ElseIf InStr(1, tmptxtSplit, "<>", vbTextCompare) <> 0 Then
        tagOperation = 5
        y = 2
    End If
    tmptxtSplit = Mid(tmptxtSplit, y + 1)
    'case to check operation
    'check subframe or not
    
    tagNextFrame = False
    tagSubFrame = False
    If SplitThen(1) <> "" Then
        'find if tmptxtsplit = split from rules
        Set getinstance = cache.OpenId(CDomain, IDFrame)
        tmpSplitRule = Split(getinstance.Rules.GetAt(i).IfStatement, "/", -1, vbTextCompare)
        getinstance.sys_Close
        
        If Mid(tmpSplitRule(IDParameter - 1), y + 1) = SlotsValue Then
            'get rules
            IDRules = i
            tagNextFrame = True
            'find frame
            For k = 1 To frameindex
                Set getinstance = cache.OpenId(CDomain, k)
                    If SplitThen(1) = getinstance.Name Then
                        IDFrame = k
                    End If
                getinstance.sys_Close
            Next k
        End If
        
        If tagNextFrame Then
            'send IDRules
            'send IDFrame
            tagSubFrame = True
            Exit Sub
        Else
            Select Case tagOperation
                Case 0 '=
                    If SlotsValue = tmptxtSplit Then
                        PossibleRules = PossibleRules & i & "/"
                    End If
                Case 1 '>
                    If SlotsValue > tmptxtSplit Then
                        PossibleRules = PossibleRules & i & "/"
                    End If
                Case 2 '<
                    If SlotsValue < tmptxtSplit Then
                        PossibleRules = PossibleRules & i & "/"
                    End If
                Case 3 '>=
                    If SlotsValue >= tmptxtSplit Then
                        PossibleRules = PossibleRules & i & "/"
                    End If
                Case 4 '<=
                    If SlotsValue <= tmptxtSplit Then
                        PossibleRules = PossibleRules & i & "/"
                    End If
                Case 5 '<>
                    If SlotsValue <> tmptxtSplit Then
                        PossibleRules = PossibleRules & i & "/"
                    End If
            End Select
        End If
    
    Else
        If Val(SlotsValue) = 0 Then
            'string
            Select Case tagOperation
                Case 0 '=
                    If SlotsValue = tmptxtSplit Then
                        PossibleRules = PossibleRules & i & "/"
                    End If
                Case 1 '>
                    If SlotsValue > tmptxtSplit Then
                        PossibleRules = PossibleRules & i & "/"
                    End If
                Case 2 '<
                    If SlotsValue < tmptxtSplit Then
                        PossibleRules = PossibleRules & i & "/"
                    End If
                Case 3 '>=
                    If SlotsValue >= tmptxtSplit Then
                        PossibleRules = PossibleRules & i & "/"
                    End If
                Case 4 '<=
                    If SlotsValue <= tmptxtSplit Then
                        PossibleRules = PossibleRules & i & "/"
                    End If
                Case 5 '<>
                    If SlotsValue <> tmptxtSplit Then
                        PossibleRules = PossibleRules & i & "/"
                    End If
            End Select
        Else
            'val
            Select Case tagOperation
                Case 0 '=
                    If Val(SlotsValue) = Val(tmptxtSplit) Then
                        PossibleRules = PossibleRules & i & "/"
                    End If
                Case 1 '>
                    If Val(SlotsValue) > Val(tmptxtSplit) Then
                        PossibleRules = PossibleRules & i & "/"
                    End If
                Case 2 '<
                    If Val(SlotsValue) < Val(tmptxtSplit) Then
                        PossibleRules = PossibleRules & i & "/"
                    End If
                Case 3 '>=
                    If Val(SlotsValue) >= Val(tmptxtSplit) Then
                        PossibleRules = PossibleRules & i & "/"
                    End If
                Case 4 '<=
                    If Val(SlotsValue) <= Val(tmptxtSplit) Then
                        PossibleRules = PossibleRules & i & "/"
                    End If
                Case 5 '<>
                    If Val(SlotsValue) <> Val(tmptxtSplit) Then
                        PossibleRules = PossibleRules & i & "/"
                    End If
            End Select
        End If
    End If
End Sub
