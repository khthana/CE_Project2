VERSION 5.00
Begin VB.Form frmFinal 
   Caption         =   "ตัวอย่างผลการศึกษา"
   ClientHeight    =   7815
   ClientLeft      =   1695
   ClientTop       =   510
   ClientWidth     =   9240
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   9.75
      Charset         =   222
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   7815
   ScaleWidth      =   9240
   Begin VB.TextBox txtFinal 
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      Height          =   7575
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   120
      Width           =   9015
   End
End
Attribute VB_Name = "frmFinal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
  LoadGrade
  LoadDataFromFile
End Sub


Private Sub LoadGrade()
    Dim spacefield1 As Integer
    Dim spacefield2 As Integer
    Dim spacefield3 As Integer
    Dim spacefield4 As Integer
    Dim spaceAdd As Integer

    Dim objFil As File
   Dim fso As New FileSystemObject
   Dim objts As TextStream

spacefield1 = 16
spacefield2 = 75
spacefield3 = 15
spacefield4 = 14
   
    fso.CreateTextFile ("c:\test.txt")
  Set objFil = fso.GetFile("c:\test.txt")
  Set objts = objFil.OpenAsTextStream(ForWriting)
  objts.WriteLine "Record No. " + Student.SdId.GetAt(Student.SdId.count()).val
  objts.WriteLine "Name  " + Student.SdNameE.GetAt(Student.SdNameE.count()).val + "    " + Student.SdSurNameE.GetAt(Student.SdSurNameE.count()).val
  objts.WriteLine "Date of Birth  " + Format(Student.SdBirth, "dd/mm/yyyy")
  
  If Format(Student.SdOutDt, "dd/mm/yyyy") <> "31/12/9999" Then
     objts.WriteLine "Date of Addmission  " + Format(Student.SdInDt, "dd/mm/yyyy") + "                                           Date of Graduation  " + Format(Student.SdOutDt, "dd/mm/yyyy")
Else
     objts.WriteLine "Date of Addmission  " + Format(Student.SdInDt, "dd/mm/yyyy") + "                                           Date of Graduation  "
 End If
  objts.WriteLine "Degree  " + Student.course.CourseNameE + "  in " + Student.course.CourseBrn.BrnNameE + "     Major  " + Student.course.CourseBrn.BrnNameE
  objts.WriteLine
  'objts.Close
  
  '+++++++++  write code field1 course title field2   credit field3 grade field4
  Dim temp As String
  'spaceAdd = spacefield1 - Len("CODE") + 1
 ' spaceAdd = spacefield1 - Len("CODE")
 '  objts.Write "CODE" + Space(spaceAdd)
 '  temp = "CODE" + Space(spaceAdd)
   
 '  spaceAdd = spacefield3 - Len("CREDIT")
 '  objts.Write "CREDIT" + Space(spaceAdd)
 '  temp = temp + "CREDIT" + Space(spaceAdd)
 '  spaceAdd = spacefield4 - Len("GRADE")
 '  objts.WriteLine "GRADE" + Space(spaceAdd)
 '   temp = temp + "GRADE" + Space(spaceAdd)
   
 '  spaceAdd = spacefield2 - Len("COURSE TITLE") + 1
 '  objts.Write "COURSE TITLE" + Space(spaceAdd)
 '  temp = temp + "COURSE TITLE" + Space(spaceAdd)
   objts.WriteLine "CODE" + Space(12) + "CREDIT" + Space(7) + "GRADE" + Space(5) + "COURSE TITLE"
   
    
   '+++++++++
    Dim tempstr1 As String
    Dim tempstr2  As String
    
    Dim resultset As CacheObject.resultset
    Dim columns As Integer
     Dim tempobj As Object
    Dim Index As Integer
    Dim idhistkey As String, idhist As Object
    Dim item As ListItem, idcount As Integer
    Dim temps As String
    Set resultset = cache.resultset("RegTranH", "FindSdResult2")
    columns = resultset.GetColumnCount()
    Dim oldsjcode As String
    Dim pers As Object
    Dim oldsjcode1 As String
    Dim gps As Double
    Dim Score As Double
    Dim crdcal As Integer
    Dim ok As Boolean
    ok = resultset.Execute(Student.sys_Id, "", "")
    Dim regid As String
    Dim i As Integer
    Set pers = cache.Static("Subject")
    Dim CrdAcc As Integer
    Dim gps2 As Double
    CrdAcc = 0
    crdcal = 0
    CrdAcc = 0
    
   While resultset.Next()
        regid = resultset.GetData(1)
        Dim termandyear As String
        objts.WriteLine
        termandyear = "ปีการศึกษา " + resultset.GetData(3)
        termandyear = termandyear + "  ภาคการศึกษาที่  " + resultset.GetData(4)
        objts.WriteLine termandyear
        objts.WriteLine
          
         Set Reg = cache.OpenId("RegTranH", regid)
         
         For i = 1 To Reg.ThSj.count()
            Set tempobj = Reg.ThSj.GetAt(i)
             
             oldsjcode = pers.ReturnSjCodeAt(Reg.ThSj.GetAt(i).sys_Id, Reg.sys_Id, i)
             If (oldsjcode <> tempobj.SjCode.GetAt(tempobj.SjCode.count()).val) Then
                    oldsjcode = oldsjcode + "*"
                    spaceAdd = spacefield1 - Len(oldsjcode) - 1
                   oldsjcode = oldsjcode + Space(spaceAdd)
            Else
                   spaceAdd = spacefield1 - Len(oldsjcode)
                    oldsjcode = oldsjcode + Space(spaceAdd)
            End If
           spaceAdd = spacefield3 - Len(CStr(tempobj.SjCrd))
           oldsjcode = oldsjcode + CStr(tempobj.SjCrd) + Space(spaceAdd)
           If Right(Reg.ThGrade.GetAt(i), 1) = "+" Then
                   spaceAdd = spacefield4 - Len(Reg.ThGrade.GetAt(i))
                   oldsjcode = oldsjcode + Reg.ThGrade.GetAt(i) + Space(spaceAdd)
            Else
                    spaceAdd = spacefield4 - Len(Reg.ThGrade.GetAt(i)) + 1
                   oldsjcode = oldsjcode + Reg.ThGrade.GetAt(i) + Space(spaceAdd)
            End If
                          
             oldsjcode1 = pers.ReturnSjNameEAt(Reg.ThSj.GetAt(i).sys_Id, Reg.sys_Id, i)
             
             
             If (oldsjcode1 <> tempobj.SjNameE.GetAt(tempobj.SjNameE.count()).val) Then
                 oldsjcode1 = oldsjcode1 + "*"
             End If
             spaceAdd = spacefield2 - Len(oldsjcode1)
             'oldsjcode1 = oldsjcode1 + "*"
             oldsjcode = oldsjcode + oldsjcode1
             
           
            objts.WriteLine oldsjcode
  
             
             
             oldsjcode = ""
             oldsjcode1 = ""
             Set tempobj = Nothing
          Next i
         
         
         
         CrdAcc = CrdAcc + Reg.GetCrdInTerm()
         gps = Reg.GetGPS()
         tempstr1 = CStr(gps)
         tempstr1 = Left(tempstr1, 4)
        
         crdcal = crdcal + Reg.GetCrdInTermCal()
         Score = Score + Reg.GetScoreInTerm()
         
    If crdcal > 0 Then
      Dim keep As Object
      Set keep = cache.Static("RegTranH")
       gps = keep.FindGPA(Score, crdcal)
       tempstr2 = CStr(gps)
       tempstr2 = Left(tempstr2, 4)
    Else
      tempstr2 = "0.00"
   End If
'         gps = Reg.ThGPA
'         tempstr2 = CStr(gps)
'         tempstr2 = Left(tempstr2, 4)
         
'         objts.WriteLine "           GPS : " + CStr(Reg.ThGPS) + "             GPA :  " + CStr(Reg.ThGPA)
         objts.WriteLine "           GPS : " + tempstr1 + "             GPA :  " + tempstr2
         Reg.sys_close
  
        
    Wend
         objts.WriteLine
         objts.WriteLine "Total Credit hours : " + CStr(CrdAcc)
         objts.WriteLine
         
'         objts.WriteLine "Grading System:   A   :  Excellent                 =   4.00    D+   :  Below Average    =   1.50"
'         objts.WriteLine "                         B+ :  Very Good             =   3.50    D     :   Pass                        =   1.00"
'         objts.WriteLine "                         B    :  Good                       =   3.00    F      :   Failure                    =   0.00"
'         objts.WriteLine "                         C+  :  Above Average   =   2.50   S      :  Satisfactory"
'         objts.WriteLine "                         C    :  Average                  =   2.00   U     :   Unsatifactory"
'         objts.WriteLine
         objts.WriteLine
         objts.WriteLine "Comment " + " * " + "  represent a old value for subject"
         
     
     objts.Close
End Sub

Private Sub LoadDataFromFile()
      ' Dim objFil As File
   Dim fso As New FileSystemObject
   Dim objts As TextStream

       'fso.createtextfile ("c:\test.txt")
  'Set objFil = fso.getfile("c:\test.txt")
  Set objts = fso.OpenTextFile("c:\test.txt", ForReading, False)
  Dim i  As Integer
  txtFinal.text = objts.ReadAll
  'txtFinal.text = objts.ReadLine

End Sub
