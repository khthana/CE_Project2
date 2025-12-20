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
Partial Class NewUser
    Inherits System.Web.UI.Page
    Private Shared chackerror As Boolean = False
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ShowDataTable()
    End Sub
    Protected Sub ShowDataTable()
        Dim strConn, SelectData As String
        strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
        Dim Conn As New SqlConnection(strConn)
        Conn.Open()
        SelectData = "SELECT [USERNAME],[PASSWORD],[PRIVILEGE] "
        SelectData += "FROM [LOGIN]"
        Dim da As New SqlDataAdapter(SelectData, Conn)
        Dim ds As New DataSet
        da.Fill(ds, "Data")
        Datagrid1.DataSource = ds.Tables("Data")
        Datagrid1.DataBind()

        Conn.Close()
    End Sub
    Protected Sub Datagrid1_deleteCommand(ByVal sender As Object, ByVal e As DataGridCommandEventArgs) Handles Datagrid1.DeleteCommand
        Dim idx As String = CStr(Datagrid1.DataKeys(e.Item.ItemIndex))
        Delete_UserName(idx)
        ShowDataTable()
    End Sub
    Protected Sub Delete_UserName(ByVal UserName As String)
        Try
            Dim strConn As String
            Dim sqlSavedata As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            sqlSavedata = "DELETE FROM [LOGIN] "
            sqlSavedata += " WHERE (USERNAME = N'" + UserName + "')"
            Dim Conm As New SqlCommand(sqlSavedata, Conn)
            Conm.ExecuteNonQuery()
            Conn.Close()
        Catch ex As Exception
            Response.Write("ERROR Delete ")
        End Try
    End Sub
    Protected Sub Encrypted(ByVal CheckBox As String)
        Dim md5Provider As New MD5CryptoServiceProvider()
        Dim data() As Byte = Encoding.ASCII.GetBytes(PassWord.Text)
        Dim encryptedData() As Byte = md5Provider.ComputeHash(data)
        Dim encryptedpassword As String = Convert.ToBase64String(encryptedData)
        New_UserName(encryptedpassword, CheckBox)
    End Sub
    Protected Sub New_UserName(ByVal Encrypted As String, ByVal CheckBox As String)
        Try
            Dim strConn As String
            Dim sqlSavedata As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            sqlSavedata = "INSERT INTO  [LOGIN]([USERNAME],[PASSWORD],[PRIVILEGE]) "
            sqlSavedata += " VALUES ('" + UserName.Text + "','" + Encrypted + "','" + CheckBox + "')"
            Dim Conm As New SqlCommand(sqlSavedata, Conn)
            Conm.ExecuteNonQuery()
            Conn.Close()
            UserName.Text = ""
            PassWord.Text = ""
            ConfirmPassword.Text = ""
            UsKeyData.Checked = False
            UsUpLoadFile.Checked = False
            Administrator.Checked = False

            chackerror = False
        Catch ex As Exception
            chackerror = True
            ErrorMsg.Text = "ERROR INSERT "
        End Try
    End Sub

    Protected Sub CreateUse_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CreateUse.Click
        Check_UserName()
        ShowDataTable()
        If chackerror = False Then
            UserName.Text = ""
            PassWord.Text = ""
            ConfirmPassword.Text = ""
            UsKeyData.Checked = False
            UsUpLoadFile.Checked = False
            Administrator.Checked = False

            chackerror = False
        End If

    End Sub
    Protected Sub Check_UserName()
        Try
            Dim strConn As String
            Dim sqlSavedata As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            sqlSavedata = "SELECT [USERNAME] FROM  [LOGIN] "
            sqlSavedata += "WHERE (USERNAME = N'" + UserName.text + "')"
            Dim Conm As New SqlCommand(sqlSavedata, Conn)
            Dim da As New SqlDataAdapter(sqlSavedata, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "Data")
            If ds.Tables("Data").Rows.Count <> 0 Then
                ErrorMsg.Text = "* UserName ซ้ำ !"
                chackerror = True
                Conn.Close()
                Exit Sub
            Else
                Dim CheckBox As String = ""

                If PassWord.Text <> ConfirmPassword.Text Then
                    PassWord.Text = ""
                    ConfirmPassword.Text = ""
                    ErrorMsg.Text = "* PassWord ไม่ตรงกัน"
                    chackerror = True
                    Exit Sub
                Else
                    ErrorMsg.Text = ""
                End If

                If UsKeyData.Checked = True Then
                    CheckBox = "K"
                ElseIf UsUpLoadFile.Checked = True Then
                    CheckBox = "U"
                ElseIf Administrator.Checked = True Then
                    CheckBox = "A"
                Else
                    ErrorMsg.Text = "* คุณยังไม่กำหนดสิทธ์"
                    chackerror = True
                    Exit Sub
                End If
                ErrorMsg.Text = ""
                Encrypted(CheckBox)
                ShowDataTable()
            End If
            Conn.Close()
        Catch ex As Exception
            ErrorMsg.Text = "ERROR "
            chackerror = True
        End Try
    End Sub
    Protected Sub PageIndxchanged(ByVal sender As Object, ByVal e As DataGridPageChangedEventArgs)
        Datagrid1.CurrentPageIndex = e.NewPageIndex
        ShowDataTable()

    End Sub
End Class
