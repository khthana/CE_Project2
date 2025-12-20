Option Explicit On
Option Strict On

Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.Data.OleDb
Imports System.Xml
Imports System.IO
Imports System.IO.Directory
Imports System.Web.UI.HtmlControls


Partial Class Index
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Page.IsPostBack <> True Then
            Session("Status") = ""
            Session.Clear()
            Session.RemoveAll()
        End If

    End Sub
    Protected Sub Search_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Search.Click
        Response.Redirect("ShowSearch.aspx?TextSearch=" + TextSearch.Text + "&List=" + SelectList.Text)
    End Sub

    Protected Sub TextSearch_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles TextSearch.TextChanged
        Response.Redirect("ShowSearch.aspx?TextSearch=" + TextSearch.Text + "&List=" + SelectList.Text)
    End Sub

    Protected Sub MainMenu_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles MainMenu.Click
        Response.Redirect("http://161.246.37.11/")
    End Sub
End Class
