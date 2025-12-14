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

Private Const EWX_SHUTDOWN As Long = 1
Private Const EWX_LOGOFF As Long = 0
Private Const EWX_REBOOT As Long = 2
Private Const EWX_FORCE As Long = 4

Private Declare Function ExitWindowsEx Lib "user32" (ByVal dwOptions As Long, ByVal dwReserved As Long) As Long

Private Const logoff = 0
Private Const flogoff = 4
Dim username As String
Dim comname As String

Private Sub Form_Load()
Dim objnet As Object
Dim Conn As ADODB.Connection
Dim rs As ADODB.Recordset
Dim sql As String
    Set objnet = CreateObject("WScript.Network") 'Debug.Print objnet.ComputerName & " - " & objnet.UserName
    username = objnet.username
    comname = objnet.computername
    Set Conn = New ADODB.Connection
    Set rs = New ADODB.Recordset
    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
    sql = "select *  from computer where comname = '" & comname & "'"
    rs.Open sql, Conn, , , adCmdText
        If Not (rs.EOF And rs.BOF) Then
            room_script
        Else
            somewhere_script
        End If
    End
End Sub

Private Sub room_script()
Dim Conn As ADODB.Connection
Dim rs As ADODB.Recordset
Dim sql As String
Dim val2 As String
    Set Conn = New ADODB.Connection
    Set rs = New ADODB.Recordset
    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
    sql = "select *  from check_card where username = '" & username & "'"
    rs.Open sql, Conn, , , adCmdText
    If Not (rs.EOF And rs.BOF) Then
        rs.MoveFirst
        If rs("logon_logoff") = 0 Then
            val2 = (DatePart("yyyy", Now) Mod 100) * 12 ' time and date in second
            val2 = (val2 + DatePart("m", Now)) * 31
            val2 = (val2 + DatePart("d", Now)) * 24
            val2 = (val2 + DatePart("h", Now)) * 60
            val2 = (val2 + DatePart("n", Now)) * 60
            val2 = (val2 + DatePart("s", Now))
            If val2 - rs("timecard") < 900 Then
                sql = "INSERT INTO log_user (username,timeactivity,activity) VALUES ('" & username & "','" & val2 & "','" & "logon" & "')"
                Conn.Execute sql
                sql = "update  check_card set logon_logoff = 1 where username = '" & username & "'"
                Conn.Execute sql
                sql = "INSERT INTO comuses(comp_name,username,times,logon_logoff) VALUES ('" & comname & "','" & username & "','" & val2 & "',1 )"
                Conn.Execute sql
                Debug.Print "login"
                GoTo logon
            End If
        End If
    End If
     'logoff_user (comname)
     Call ExitWindowsEx(EWX_LOGOFF, 0&)
    'Debug.Print "logoff"
logon:
    rs.Close
    Conn.Close
End Sub

Private Sub somewhere_script()
Dim Conn As ADODB.Connection
Dim sql As String
Dim val2 As String
    val2 = (DatePart("yyyy", Now) Mod 100) * 12 ' time and date in second
    val2 = (val2 + DatePart("m", Now)) * 31
    val2 = (val2 + DatePart("d", Now)) * 24
    val2 = (val2 + DatePart("h", Now)) * 60
    val2 = (val2 + DatePart("n", Now)) * 60
    val2 = (val2 + DatePart("s", Now))
    Set Conn = New ADODB.Connection
    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
    sql = "INSERT INTO log_user (username,timeactivity,activity) VALUES ('" & username & "','" & val2 & "','" & "logon other" & "')"
    Conn.Execute sql
End Sub



