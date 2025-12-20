Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.Data.OleDb
Imports System.Xml
Imports System.IO
Imports System.IO.Directory
Imports System.Web.UI.HtmlControls
Imports System.Security.Cryptography
Partial Class Login
    Inherits System.Web.UI.Page
    Protected Sub Encrypted()
        Dim md5Provider As New MD5CryptoServiceProvider()
        Dim data() As Byte = Encoding.ASCII.GetBytes(Password.Text)
        Dim encryptedData() As Byte = md5Provider.ComputeHash(data)
        Dim encryptedpassword As String = Convert.ToBase64String(encryptedData)
        Check(encryptedpassword)
    End Sub
    Protected Sub Check(ByVal encryptedpassword As String)
        Dim strconn As String = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
        Dim strsql As String
        strsql = "SELECT * FROM LOGIN WHERE (USERNAME = N'" + UserName.Text + "') AND (PASSWORD = N'"
        strsql += encryptedpassword + "')"
        Dim da As New SqlDataAdapter(strsql, strconn)
        Dim ds As New DataSet()
        da.Fill(ds, "member")
        If ds.Tables("member").Rows.Count = 0 Then
            FailureText.Text = "คุณกรอก username และ password ผิดครับ"
            Session("UserAuthentication") = ""
        Else
            Session("user") = "/" & UserName.Text
            Session("login") = "true"
            Dim sta As String = CStr(ds.Tables("member").Rows(0)(2))

            If Trim(sta) = "A" Then
                Session("Status") = Trim(sta)
                Response.Redirect("~/Menuadmin.aspx")
            ElseIf Trim(sta) = "K" Then
                Session("Status") = Trim(sta)
                Response.Redirect("~/Default.aspx")
            ElseIf Trim(sta) = "U" Then
                Session("Status") = Trim(sta)
                Response.Redirect("~/ShowUpLoadFile.aspx")
            End If
            '   Session.Timeout = 30


        End If
    End Sub

    Protected Sub LoginButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LoginButton.Click
        Encrypted()

    End Sub
End Class
