VERSION 5.00
Begin VB.Form createfrm 
   BackColor       =   &H0080C0FF&
   Caption         =   "Form1"
   ClientHeight    =   4185
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4080
   Icon            =   "createfrm.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   4185
   ScaleWidth      =   4080
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton Command2 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Clear"
      Height          =   375
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   11
      Top             =   3480
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Add User"
      Height          =   375
      Left            =   480
      MaskColor       =   &H80000008&
      Style           =   1  'Graphical
      TabIndex        =   10
      Top             =   3480
      UseMaskColor    =   -1  'True
      Width           =   1215
   End
   Begin VB.TextBox Text5 
      Height          =   375
      Left            =   1200
      TabIndex        =   8
      Text            =   " "
      Top             =   2760
      Width           =   2175
   End
   Begin VB.TextBox Text4 
      Height          =   375
      Left            =   1200
      TabIndex        =   3
      Text            =   " "
      Top             =   2160
      Width           =   2175
   End
   Begin VB.TextBox Text3 
      Height          =   375
      Left            =   1200
      TabIndex        =   2
      Text            =   " "
      Top             =   1560
      Width           =   2175
   End
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   1200
      TabIndex        =   1
      Text            =   " "
      Top             =   960
      Width           =   2175
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   1200
      TabIndex        =   0
      Top             =   360
      Width           =   2175
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "Confirm Password"
      Height          =   495
      Left            =   360
      TabIndex        =   9
      Top             =   2760
      Width           =   975
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "Password"
      Height          =   495
      Left            =   360
      TabIndex        =   7
      Top             =   2280
      Width           =   1215
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Surname"
      Height          =   495
      Left            =   360
      TabIndex        =   6
      Top             =   1680
      Width           =   1215
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Name"
      Height          =   375
      Left            =   360
      TabIndex        =   5
      Top             =   1080
      Width           =   1215
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Username"
      Height          =   495
      Left            =   360
      TabIndex        =   4
      Top             =   480
      Width           =   1215
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00EFF5F5&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00FF0000&
      BorderWidth     =   3
      Height          =   3975
      Left            =   120
      Top             =   120
      Width           =   3855
   End
End
Attribute VB_Name = "createfrm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim str1 As String
Dim str2 As String
Private Const obu As String = "4D"
Function Add_User(username, name, surname, password) As Boolean
On Error Resume Next
Dim objUser
Dim objOU
Dim objrootdse
Dim objContainer
   Set objOU = GetObject("LDAP://OU=4D,dc=awesome,dc=com")
    Set objUser = objOU.Create("User", "cn= " & username) ' show
    objUser.put "sAMAccountName", username
    objUser.put "userPrincipalName", username & "@coolsharks.com" ' win 2000
    objUser.put "profilePath", "\\HomeFolders\" & username ' profile path
    objUser.put "homeDirectory", "\\HomeFolders\" & username ' home
    objUser.put "homeDrive", "F" ' drive
    objUser.put "givenName", name ' firstname
    objUser.put "displayName", username  'display
    objUser.put "sn", surname ' lastname ***************cannot use thai font
    objUser.setinfo
    objUser.SetPassword password
    objUser.AccountDisabled = False ' enable
    objUser.setinfo
    sink_to_db (username)
    createfrm.Hide
    MsgBox "Add " & username & " Complete"
    createfrm.Show
    createfrm.Enabled = True
    Text1.Text = ""
    Text2.Text = ""
    Text3.Text = ""
    Text4.Text = ""
    Text5.Text = ""
End Function

Private Sub Command1_Click()
    If (str1 <> str2) Then 'check confirm password
        MsgBox "password incorrect", vbOKOnly, "warning"
        Exit Sub
    End If
    If (Text1.Text = "") Or (Text2.Text = "") Or (Text3.Text = "") Then
        MsgBox "some box don't fill", vbOKOnly, "warning"
        Exit Sub
    End If
        createfrm.Enabled = False
        Call Add_User(Text1.Text, Text2.Text, Text3.Text, str1)
End Sub

Private Sub Command2_Click()
    Text1.Text = ""
    Text2.Text = ""
    Text3.Text = ""
    Text4.Text = ""
    Text5.Text = ""
    str1 = ""
    str2 = ""
End Sub

Private Sub Form_Load()
    Text1.Text = ""
    Text2.Text = ""
    Text3.Text = ""
    Text4.Text = ""
    Text5.Text = ""
End Sub

Private Sub Text4_KeyPress(KeyAscii As Integer)
    str1 = str1 & Chr(KeyAscii)
    KeyAscii = Asc("#")
End Sub

Private Sub Text5_KeyPress(KeyAscii As Integer)
    str2 = str2 & Chr(KeyAscii)
    KeyAscii = Asc("#")
End Sub
Private Sub sink_to_db(username As String)
    Dim Conn As ADODB.Connection
    Dim conn2 As ADODB.Connection
    Dim rs As ADODB.Recordset
    Dim sql As String
        Set Conn = New ADODB.Connection
         Set conn2 = New ADODB.Connection
        Set rs = New ADODB.Recordset
        Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
        conn2.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=dataprint;Data Source=coolsharks"
            sql = "select * from check_card where username = '" & username & "'"
            rs.Open sql, Conn, , , adCmdText
            If rs.EOF Then ' add to database
                sql = "INSERT INTO check_card (username,timecard,canaccess,logon_logoff) VALUES ('" & username & "','0000',1,0)"
                Conn.Execute sql
            End If
            rs.Close
            sql = "select * from print_credit where id = '" & username & "'"
            rs.Open sql, conn2, , , adCmdText
            If rs.EOF Then ' add to database
                sql = "INSERT INTO print_credit (id,credit) VALUES ('" & username & "','0')"
                conn2.Execute sql
                Call move_group(username, "noprint")
                Call remove_group(username, "canprint")
            End If
            rs.Close
            Conn.Close
            conn2.Close
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


