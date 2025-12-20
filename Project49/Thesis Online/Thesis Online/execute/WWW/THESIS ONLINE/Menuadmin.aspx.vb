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
Partial Class Manuadmin
    Inherits System.Web.UI.Page

    Protected Sub LinkButton4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton4.Click
        Session.Remove("Status")
        Session.Remove("login")
        Session.Remove("user")
    End Sub
End Class
