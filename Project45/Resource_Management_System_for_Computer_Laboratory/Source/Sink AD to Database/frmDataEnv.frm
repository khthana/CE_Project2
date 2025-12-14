VERSION 5.00
Begin VB.Form frmDataEnv 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   Icon            =   "frmDataEnv.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "frmDataEnv"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Const obu As String = "4D"
Private Sub sink_to_db()
    Dim Conn As ADODB.Connection
    Dim conn2 As ADODB.Connection
    Dim rs As ADODB.Recordset
    Dim sql As String
        Set Conn = New ADODB.Connection
         Set conn2 = New ADODB.Connection
        Set rs = New ADODB.Recordset
        Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
        conn2.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=dataprint;Data Source=coolsharks"
        strComputer = "."
        Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
        Set colItems = objWMIService.ExecQuery("Select * from Win32_Account ", , 48)
        For Each objItem In colItems
'            Debug.Print "*******************************************************"
'            Debug.Print "Caption: " & objItem.Caption
'            Debug.Print "Description: " & objItem.Description
'            Debug.Print "Domain: " & objItem.Domain
'            Debug.Print "InstallDate: " & objItem.InstallDate
'            Debug.Print "Name: " & objItem.name '***
'            Debug.Print "SID: " & objItem.SID
'            Debug.Print "SIDType: " & objItem.SIDType
'            Debug.Print "Status: " & objItem.Status
'            Debug.Print "********************************************************"
            sql = "select * from check_card where username = '" & objItem.Name & "'"
            rs.Open sql, Conn, , , adCmdText
            If rs.EOF Then ' add to database
                If objItem.Description = "" Then
                    sql = "INSERT INTO check_card (username,timecard,canaccess,logon_logoff) VALUES ('" & objItem.Name & "','0000',1,0)"
                    Conn.Execute sql
                End If
            End If
            rs.Close
            sql = "select * from print_credit where id = '" & objItem.Name & "'"
            rs.Open sql, conn2, , , adCmdText
            If rs.EOF Then ' add to database
                If objItem.Description = "" Then
                    sql = "INSERT INTO print_credit (id,credit) VALUES ('" & objItem.Name & "','0')"
                    conn2.Execute sql
                    Call move_group(objItem.Name, "noprint")
                    Call remove_group(objItem.Name, "canprint")
                End If
            End If
            rs.Close
        Next
            Conn.Close
            conn2.Close
End Sub

'Private Sub sink_to_ad()
'Dim Conn As ADODB.Connection
'Dim rs As ADODB.Recordset
'    Set Conn = New ADODB.Connection
'    Set rs = New ADODB.Recordset
'    Conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & App.Path & "\db_access.mdb;Persist Security Info=False"
'    sql = "select * from check_card "
'    rs.Open sql, Conn, , , adCmdText
'    If Not rs.EOF Then
'
'        rs.MoveNext
'    End If
'    rs.Close
'End Sub

Private Sub Form_Load()
    sink_to_db
    End
End Sub
Private Sub move_group(user As String, grp As String)
    On Error Resume Next
    'Dim strcomputer As String
    Dim objgroup  As Object
    Dim objUser  As Object
    'user = "march"
    'user = "wwW"
    Set objgroup = GetObject("LDAP://cn=" & grp & ",cn=Users,dc=awesome,dc=com")
    Set objUser = GetObject("LDAP://cn= " & user & " ,ou=" & obu & ",dc=awesome,dc=com")
    objgroup.Add (objUser.ADsPath)
    
End Sub
Private Sub remove_group(user As String, grp As String)
    On Error Resume Next
    'Dim strcomputer As String
    Dim objgroup  As Object
    Dim objUser  As Object
    'user = "march"
    'user = "wwW"
    Set objgroup = GetObject("LDAP://cn=" & grp & ",cn=Users,dc=awesome,dc=com")
    Set objUser = GetObject("LDAP://cn= " & user & " ,ou=" & obu & ",dc=awesome,dc=com")
    objgroup.Remove (objUser.ADsPath)
    
End Sub

