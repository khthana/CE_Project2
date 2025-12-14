VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 3  'UsesTransaction
END
Attribute VB_Name = "IDatabase"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Dim cn As ADODB.Connection
Dim cmn As ADODB.Command
Dim oContext As ObjectContext
Dim strConnection As String

Public Function SqlExecute(ByVal SqlCommand As String, _
                                                       ByRef strSqlResult As String, _
                                                       Optional ByRef rsResult As ADODB.Recordset) As Boolean
On Error GoTo Oops
    Set cmn = New ADODB.Command
    cmn.ActiveConnection = cn
    cmn.CommandType = adCmdText
    cmn.CommandText = SqlCommand
    If IsMissing(rsResult) Then
        cmn.Execute
    Else
        Set rsResult = cmn.Execute
    End If
    strSqlResult = ""
    SqlExecute = True
    Exit Function
Oops:
    strSqlResult = Err.Description
    SqlExecute = False
    oContext.SetAbort
End Function

Private Sub Class_Initialize()
    Set oContext = GetObjectContext
    strConnection = "Provider=SQLOLEDB.1;" & _
                                   "Persist Security Info=False;" & _
                                   "User ID=sa;" & _
                                   "Initial Catalog=Bus;" & _
                                   "Data Source=SUMMERSERVER"
    Set cn = New ADODB.Connection
    cn.ConnectionString = strConnection
    cn.Open
End Sub

Private Sub Class_Terminate()
    Set cmn = Nothing
    cn.Close
    If Not oContext Is Nothing Then
        Set oContext = Nothing
    End If
End Sub
