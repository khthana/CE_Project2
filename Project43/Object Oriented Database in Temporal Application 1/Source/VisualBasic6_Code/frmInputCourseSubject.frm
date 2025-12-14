VERSION 5.00
Begin VB.Form frmInputCourseSubject 
   Caption         =   "เพิ่มวิชาในหลักสูตร"
   ClientHeight    =   1305
   ClientLeft      =   4335
   ClientTop       =   1185
   ClientWidth     =   6120
   LinkTopic       =   "Form1"
   ScaleHeight     =   1305
   ScaleWidth      =   6120
   Begin VB.CommandButton cmdCancle 
      Caption         =   "ยกเลิก"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4440
      TabIndex        =   3
      Top             =   720
      Width           =   1455
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "ตกลง"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4440
      TabIndex        =   2
      Top             =   120
      Width           =   1455
   End
   Begin VB.TextBox txtInputSj 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2160
      TabIndex        =   1
      Top             =   240
      Width           =   2055
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "รหัสวิชาที่ต้องการเพิ่ม"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   1710
   End
End
Attribute VB_Name = "frmInputCourseSubject"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim SubInCourse, Sj As Object
Dim Subject As Object
Dim Status As Integer
Dim SjCodeOld As String

Private Sub CancelButton_Click()
 Unload frmInputCourseSubject
End Sub



Private Sub cmdCancle_Click()
    Unload frmInputCourseSubject
End Sub

Private Sub Form_Load()
    Status = 0
    ClearScreen
    
End Sub

Private Sub ClearScreen()
   txtInputSj = ""
'   ClearObjects
End Sub

Private Sub ClearObjects()
    If Not Subject Is Nothing Then
        Subject.sys_close
        Set Subject = Nothing
    End If
End Sub

Private Sub OKButton_Click()
Dim pers As Object
Dim i As Integer
Dim duplicatesub As Boolean

duplicatesub = False
If Not (Subject Is Nothing) Then
  
        
        Dim rs As CacheObject.resultset
       
        Set rs = cache.resultset("SubjectInCourse", "CourseId")
        rs.Execute (frmCourseDetail.txtCourseCode.text)
        
        While rs.Next
           Dim id As Long
            id = rs.GetData(1)
            Set SubInCourse = cache.OpenId("SubjectInCourse", id)
            Set Sj = SubInCourse.SjCode
            If Not Sj Is Nothing Then
                Dim temp1, temp2 As String
                temp1 = Sj.ReturnSjCode(Sj.sys_Id)
                temp2 = Subject.ReturnSjCode(Subject.sys_Id)
                If temp1 = temp2 Then
                    duplicatesub = True
                End If
           End If
            
        Wend
        
        
        
   
   If duplicatesub Then
         duplicatesub = False

      MsgBox "วิชารหัส " + txtInputSj.text + " มีอยู่แล้วในหลักสูตร"
     Unload frmInputCourseSubject
 
     Exit Sub
    End If
    
   frmCourseDetail.txtSjCode = Subject.ReturnSjCode(Subject.sys_Id)
   frmCourseDetail.txtSjName = Subject.ReturnSjName(Subject.sys_Id)
   frmCourseDetail.txtSjNameE = Subject.ReturnSjNameE(Subject.sys_Id)
   ' Set pers = cache.Static("SubjectInCourse")
    '  i = pers.AddRegSj(Reg.sys_Id, Subject.sys_Id)
   'Reg.ThSj.InsertObject (Subject.sys_Oid())
   'Reg.sys_save
   'ClearScreen
  
  Unload frmInputCourseSubject
End If
End Sub

Private Sub txtInputSj_LostFocus()
    ' user keys in SjCode
    If txtInputSj = "" Then
        If Not (Subject Is Nothing) Then Subject.sys_close
        Set Subject = cache.New("Subject")
        ClearScreen
        Exit Sub
    Else
        If Status = 0 Then
            LoadSubject (txtInputSj.text)
        End If
    End If
    
End Sub

Private Sub LoadSubject(SubCode As String)
    On Error GoTo objerr
    Dim pers As Object
    Dim id As Long
    
    ClearObjects
    'Find Oid
    Set pers = cache.Static("Subject")
    id = pers.ReturnSjCodeId(SubCode)
    If id <> 0 Then
        Set Subject = cache.OpenId("Subject", id)
        ClearScreen
        txtInputSj = SubCode
        Status = 1
    Else
         If Not (Subject Is Nothing) Then Subject.sys_close
        MsgBox "ไม่พบวิชารหัส " + txtInputSj.text
        ClearScreen
        txtInputSj.SetFocus
    End If

    Exit Sub
objerr:
    VBErrorBox "โหลดวิชาล้มเหลว"
    ClearScreen
End Sub

