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
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "frmDataEnv"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Private Sub Form_Load()
Dim objnet As Object
Dim Conn As ADODB.Connection
Dim rs As ADODB.Recordset
Dim sql As String
Dim val1 As String
Dim val2 As String
Dim str1, str2 As String
    Set objnet = CreateObject("WScript.Network") 'Debug.Print objnet.ComputerName & " - " & objnet.UserName
    Set Conn = New ADODB.Connection
    Set rs = New ADODB.Recordset
    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
    sql = "select username from comuses where comp_name = '" & objnet.ComputerName & "' and times = (select max(times) from comuses where  comp_name = '" & objnet.ComputerName & "')"
    rs.Open sql, Conn, , , adCmdText
    If Not rs.EOF Then
        rs.MoveFirst
        val1 = rs("username")
    End If
    rs.Close
    sql = "select comp_name from comuses where logon_logoff = 1 and times = (select max(times) from comuses where  username = '" & val1 & "') "
    rs.Open sql, Conn, , , adCmdText
    If Not rs.EOF Then
        str1 = UCase(rs("comp_name"))
        str2 = UCase(objnet.ComputerName)
        If str1 = str2 Then
            sql = "update check_card set logon_logoff = 0 where username = '" & val1 & "'"
            Conn.Execute sql
            val2 = (DatePart("yyyy", Now) Mod 100) * 12 ' time and date in second
            val2 = (val2 + DatePart("m", Now)) * 31
            val2 = (val2 + DatePart("d", Now)) * 24
            val2 = (val2 + DatePart("h", Now)) * 60
            val2 = (val2 + DatePart("n", Now)) * 60
            val2 = (val2 + DatePart("s", Now))
            sql = "INSERT INTO comuses(comp_name,username,times,logon_logoff) VALUES ('" & rs("comp_name") & "','" & val1 & "','" & val2 & "',0 )"
            Conn.Execute sql
            sql = "INSERT INTO log_user (username,timeactivity,activity) VALUES ('" & val1 & "','" & val2 & "','" & "logoff" & "')"
            Conn.Execute sql
    
        End If
    End If
    rs.Close
    Conn.Close
    End
End Sub


