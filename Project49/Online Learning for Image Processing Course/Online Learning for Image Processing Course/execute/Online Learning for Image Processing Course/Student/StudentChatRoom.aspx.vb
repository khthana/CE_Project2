Imports System.Data
Imports System.Data.SqlClient

Partial Class Student_StudentChatRoom
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If Session("loginstatus") = True And Session("user") <> 0 Then
                If Session("usertype") = "Student" Then
                    
                End If
            End If
        End If
    End Sub
End Class
