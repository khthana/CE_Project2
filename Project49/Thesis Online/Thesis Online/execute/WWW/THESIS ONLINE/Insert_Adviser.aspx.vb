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
Partial Class InsertAdviser
    Inherits System.Web.UI.Page
    Private Shared AdviserID, FacultyID, FacultyIDN, DegreeID, DesciptionID As String

    '######################################  Adviser  ######################################
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Page.IsPostBack <> True Then
            EditSelectAdviser("00000")
        End If
        Roles_Adviser.Text = "อาจารย์ผู้ควบคุมวิทยานิพนธ์"

    End Sub
    Protected Sub AutoIDAdviser()
        Dim CountId, Num, CountidNew As Integer
        Dim idcontributor, strConn, NewID, sqlProducts As String
        NewID = ""
        Try
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            sqlProducts = "SELECT CONTRIBUTOR_ID FROM DC_CONTRIBUTOR"
            Dim da As New SqlDataAdapter(sqlProducts, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "CONTRIBUTOR")
            If ds.Tables("CONTRIBUTOR").Rows.Count = 0 Then
                idcontributor = "A00001"
                AddDataBaseAdviser(idcontributor)
            Else
                CountId = ds.Tables("CONTRIBUTOR").Rows.Count
                idcontributor = CStr(ds.Tables("CONTRIBUTOR").Rows(CountId - 1)(0))
                Do While NewID <= idcontributor
                    Num = Num + 1
                    CountidNew = (CountId - 1) + Num
                    NewID = "A" + Format(CountidNew, "00000")

                Loop
                AddDataBaseAdviser(NewID)
            End If
        Catch ex As Exception

        End Try

    End Sub
    Protected Sub AddBaseAdviser_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles AddBaseAdviser.Click
        AutoIDAdviser()
        AddBaseAdviser.Focus()
    End Sub
    Protected Sub AddDataBaseAdviser(ByVal CONTRIBUTOR_ID As String)
        Try
            If Thai_Adviser.Text = "" Then
                NOSearch.Text = "ไม่ได้กรอกข้อมูล"
                Exit Sub
            Else
                Dim strConn As String
                Dim sqlAdviser As String
                strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
                Dim Conn As New SqlConnection(strConn)
                Conn.Open()
                sqlAdviser = "INSERT INTO DC_CONTRIBUTOR (CONTRIBUTOR_ID,CONTRIBUTOR_NAME,CONTRIBUTOR_ENGLISH,CONTRIBUTOR_E_MAIL,CONTRIBUTOR_ROLES)"
                sqlAdviser += "VALUES ('" + CONTRIBUTOR_ID + "',"
                sqlAdviser += "'" + Thai_Adviser.Text + "',"
                sqlAdviser += "'" + English_Adviser.Text + "',"
                sqlAdviser += "'" + Email_Adviser.Text + "',"
                sqlAdviser += "'" + Roles_Adviser.Text + "')"
                Dim Conm As New SqlCommand(sqlAdviser, Conn)
                Conm.ExecuteNonQuery()
                Conn.Close()
                clearTextAdviser()
            End If
        Catch ex As Exception

        End Try
    End Sub
    Protected Sub DeleteBaseAdviser_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles DeleteBaseAdviser.Click

        Try
            Dim strConn, SelectAdviser As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            SelectAdviser = ""
            Conn.Open()
            SelectAdviser += "DELETE FROM DC_CONTRIBUTOR WHERE (CONTRIBUTOR_ID = N'" + AdviserID + "')"
            Dim Conm As New SqlCommand(SelectAdviser, Conn)
            Conm.ExecuteNonQuery()
            Conn.Close()
            clearTextAdviser()
            NOSearch.Text = "ลบข้อมูลแล้ว"
            AddBaseAdviser.Enabled = True

        Catch ex As Exception

            NOSearch.Text = "ไม่สามารถบันทึกข้อมูลได้"
            clearTextAdviser()

        End Try
        DeleteBaseAdviser.Focus()
    End Sub
    Protected Sub SearchA_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles SearchA.Click
        If SearchAdviser.Text = "" Then
            NOSearch.Text = "ไม่ได้กรอกข้อมูล"
            Exit Sub
        Else
            EditSelectAdviser(SearchAdviser.Text)
        End If
    End Sub
    Protected Sub EditSelectAdviser(ByVal txtSearch As String)
        Try

            Dim strConn, SelectAdviser As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            SelectAdviser = "SELECT * FROM DC_CONTRIBUTOR WHERE (CONTRIBUTOR_NAME LIKE N'%"
            SelectAdviser += txtSearch + "%')"
            Dim da As New SqlDataAdapter(SelectAdviser, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "Data")
            DatagridA.DataSource = ds.Tables("Data")
            DatagridA.DataBind()
            Conn.Close()

        Catch ex As Exception
            clearTextAdviser()

        End Try
        AddBaseAdviser.Focus()
    End Sub
    Protected Sub DatagridA_deleteCommand(ByVal sender As Object, ByVal e As DataGridCommandEventArgs) Handles DatagridA.DeleteCommand
        Dim idx As String = CStr(DatagridA.DataKeys(e.Item.ItemIndex))
        AdviserID = idx
        SelectAdvise(idx)
    End Sub


    Protected Sub SelectAdvise(ByVal AdviserID As String)

        Dim strConn, SelectAdviser As String
        strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
        Dim Conn As New SqlConnection(strConn)
        Conn.Open()
        SelectAdviser = "SELECT * FROM DC_CONTRIBUTOR WHERE (CONTRIBUTOR_ID = N'" + AdviserID + "')"
        Dim da As New SqlDataAdapter(SelectAdviser, Conn)
        Dim ds As New DataSet
        da.Fill(ds, "Adviser")
        If ds.Tables("Adviser").Rows.Count <> 0 Then
            AdviserID = CStr(ds.Tables("Adviser").Rows(0)(0))
            Thai_Adviser.Text = CStr(ds.Tables("Adviser").Rows(0)(1))
            English_Adviser.Text = CStr(ds.Tables("Adviser").Rows(0)(2))
            Email_Adviser.Text = CStr(ds.Tables("Adviser").Rows(0)(3))
            Roles_Adviser.Text = CStr(ds.Tables("Adviser").Rows(0)(4))
            SearchAdviser.Text = ""
            NOSearch.Text = ""
            AddBaseAdviser.Enabled = False
        End If

        Conn.Close()
    End Sub
    Protected Sub clearTextAdviser()
        SearchAdviser.Text = ""
        Thai_Adviser.Text = ""
        English_Adviser.Text = ""
        Roles_Adviser.Text = "อาจารย์ผู้ควบคุมวิทยานิพนธ์"
        Email_Adviser.Text = ""
        AdviserID = " "
        SelectAdvise(AdviserID)
        EditSelectAdviser("00000")

    End Sub
    Protected Sub ClearAdviser_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ClearAdviser.Click
        clearTextAdviser()
        NOSearch.Text = ""
        AddBaseAdviser.Enabled = True
        ClearAdviser.Focus()
    End Sub
    Protected Sub EditBaseAdviser_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles EditBaseAdviser.Click
        Try
            If Thai_Adviser.Text = "" Then
                NOSearch.Text = "ไม่ได้กรอกข้อมูล"
                Exit Sub
            Else

                Dim strConn, SelectAdviser As String
                strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
                Dim Conn As New SqlConnection(strConn)
                SelectAdviser = ""
                Conn.Open()
                SelectAdviser += "UPDATE DC_CONTRIBUTOR SET"
                SelectAdviser += " CONTRIBUTOR_NAME = N'" + Thai_Adviser.Text
                SelectAdviser += "',CONTRIBUTOR_ENGLISH =N'" + English_Adviser.Text
                SelectAdviser += "',CONTRIBUTOR_E_MAIL = N'" + Email_Adviser.Text
                SelectAdviser += "',CONTRIBUTOR_ROLES = N'" + Roles_Adviser.Text
                SelectAdviser += "' WHERE  (CONTRIBUTOR_ID = N'" + AdviserID + "')"
                Dim Conm As New SqlCommand(SelectAdviser, Conn)
                Conm.ExecuteNonQuery()
                Conn.Close()
                clearTextAdviser()
                NOSearch.Text = "แก้ไขข้อมูลแล้ว"
            End If
        Catch ex As Exception

            NOSearch.Text = "ไม่สามารถบันทึกข้อมูลได้"
            clearTextAdviser()

        End Try
        EditBaseAdviser.Focus()
    End Sub

    Protected Sub SearchAdviser_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles SearchAdviser.TextChanged
        If SearchAdviser.Text = "" Then
            NOSearch.Text = "ไม่ได้กรอกข้อมูล"
            Exit Sub
        Else
            EditSelectAdviser(SearchAdviser.Text)
        End If
    End Sub
    Protected Sub PageIndxchanged(ByVal sender As Object, ByVal e As DataGridPageChangedEventArgs)
        DatagridA.CurrentPageIndex = e.NewPageIndex
        EditSelectAdviser(SearchAdviser.Text)
    End Sub
End Class
