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
Partial Class Insert_Faculty
    Inherits System.Web.UI.Page
    Private Shared FacultyID, SDegreeId As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Page.IsPostBack <> True Then
            EditSelectFaculty("00000")
        End If
    End Sub
    Protected Sub AutoIDFaculty()
        Dim CountId, Num, CountidNew As Integer
        Dim idcontributor, strConn, NewID, sqlProducts As String
        NewID = ""
        Try
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            sqlProducts = "SELECT FACULTYID FROM DC_FACULTY"
            Dim da As New SqlDataAdapter(sqlProducts, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "FACULTY")
            If ds.Tables("FACULTY").Rows.Count = 0 Then
                idcontributor = "F00001"
                AddDataBasefaculty(idcontributor)
            Else
                CountId = ds.Tables("FACULTY").Rows.Count
                idcontributor = CStr(ds.Tables("FACULTY").Rows(CountId - 1)(0))
                Do While NewID <= idcontributor
                    Num = Num + 1
                    CountidNew = (CountId - 1) + Num
                    NewID = "F" + Format(CountidNew, "00000")

                Loop
                AddDataBasefaculty(NewID)
            End If
        Catch ex As Exception

        End Try

    End Sub
    Protected Sub AddDataBasefaculty(ByVal FacultyIDs As String)
        Try
            If AddFacultyThai.Text = "" Then
                MsgSearchFaculty.Text = "ไม่ได้กรอกข้อมูล"
                Exit Sub
            Else
                Dim strConn As String
                Dim sqlFaculty As String = ""
                strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
                Dim Conn As New SqlConnection(strConn)
                Conn.Open()
                sqlFaculty = "INSERT INTO DC_FACULTY (FACULTYID,DEGREE_ID,FACULTY_THAI,FACULTY_ENGLISH)"
                sqlFaculty += "VALUES ('" + FacultyIDs + "',"
                sqlFaculty += "'" + SDegreeId + "',"
                sqlFaculty += "'" + AddFacultyThai.Text + "',"
                sqlFaculty += "'" + AddFacultyEng.Text + "')"
                Dim Conm As New SqlCommand(sqlFaculty, Conn)
                Conm.ExecuteNonQuery()
                Conn.Close()
                clearTextFaculty()
                MsgSearchFaculty.Text = "บันทึกข้อมูลแล้ว"
            End If
        Catch ex As Exception
            MsgSearchFaculty.Text = "ไม่สามารถบันทึกข้อมูลได้"
        End Try
    End Sub
    Protected Sub clearTextFaculty()
        AddFacultyThai.Text = ""
        AddFacultyEng.Text = ""
        DegreeLevel.ClearSelection()
        EditSelectFaculty("00000")
        SelectDegreeName()
    End Sub
    Protected Sub DegreeNameL_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DegreeNameL.SelectedIndexChanged
        SqlDegreeNameL()
    End Sub
    Protected Sub SqlDegreeNameL()
        Dim strConn, sqlProducts As String
        Try
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            sqlProducts = "SELECT DEGREE_ID FROM  DC_DEGREE WHERE (DEGREE_LAVEL = N'"
            sqlProducts += DegreeLevel.Text + "') AND (DEGREE_NAME = N'"
            sqlProducts += DegreeNameL.Text + "')"
            Dim da As New SqlDataAdapter(sqlProducts, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "FACULTY")
            If ds.Tables("FACULTY").Rows.Count <> 0 Then
                SDegreeId = CStr(ds.Tables("FACULTY").Rows(0)(0))
            End If
        Catch ex As Exception
            MsgSearchFaculty.Text = ""
        End Try
    End Sub

    Protected Sub AddBaseDegree_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles AddBaseDegree.Click
        AutoIDFaculty()
        clearTextFaculty()
    End Sub

    Protected Sub DeleteBaseDegree_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles DeleteBaseDegree.Click

        Try
            Dim strConn, SelectFaculty As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            SelectFaculty = ""
            Conn.Open()
            SelectFaculty += "DELETE FROM DC_FACULTY WHERE (FACULTYID = N'" + FacultyID + "')"
            Dim Conm As New SqlCommand(SelectFaculty, Conn)
            Conm.ExecuteNonQuery()
            Conn.Close()
            clearTextFaculty()
            MsgSearchFaculty.Text = "ลบข้อมูลแล้ว"

        Catch ex As Exception
            MsgSearchFaculty.Text = "ไม่สามารถลบข้อมูลได้"
            clearTextFaculty()
        End Try
    End Sub
    Protected Sub EditBaseDegree_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles EditBaseDegree.Click
        Try
            Dim strConn, SelectFaculty As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            SelectFaculty = ""
            Conn.Open()
            SelectFaculty += "UPDATE DC_FACULTY SET "
            SelectFaculty += " DEGREE_ID = N'" + SDegreeId
            SelectFaculty += "',FACULTY_THAI =N'" + AddFacultyThai.Text
            SelectFaculty += "',FACULTY_ENGLISH = N'" + AddFacultyEng.Text
            SelectFaculty += "' WHERE  (FACULTYID = N'" + FacultyID + "')"
            Dim Conm As New SqlCommand(SelectFaculty, Conn)
            Conm.ExecuteNonQuery()
            Conn.Close()
            clearTextFaculty()
            MsgSearchFaculty.Text = "แก้ไขข้อมูลแล้ว"

        Catch ex As Exception

            MsgSearchFaculty.Text = "ไม่สามารถแก้ไขข้อมูลได้"
            clearTextFaculty()

        End Try
    End Sub
    Protected Sub SelectindexList()
        Try
            Dim strConn, SelectFaculty As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            SelectFaculty = "SELECT * FROM DC_DEGREE WHERE (DEGREE_ID LIKE N'%"
            SelectFaculty += SDegreeId + "%')"
            Dim da As New SqlDataAdapter(SelectFaculty, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "DEGREE")
            If ds.Tables("DEGREE").Rows.Count <> 0 Then

                DegreeLevel.SelectedValue = CStr(ds.Tables("DEGREE").Rows(0)(1))
                SelectDegreeName()
                DegreeNameL.SelectedValue = CStr(ds.Tables("DEGREE").Rows(0)(2))
            End If
        Catch ex As Exception
            MsgSearchFaculty.Text = "ERROR"
            clearTextFaculty()

        End Try
    End Sub

    Protected Sub SearchF_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles SearchF.Click
        If SearchFaculty.Text = "" Then
            MsgSearchFaculty.Text = "ไม่ได้กรอกข้อมูล"
            Exit Sub
        Else
            EditSelectFaculty(SearchFaculty.Text)
        End If
    End Sub
    Protected Sub EditSelectFaculty(ByVal txtSearch As String)
        Try

            Dim strConn, SelectAdviser As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            SelectAdviser = "SELECT * FROM DC_FACULTY WHERE (FACULTY_THAI LIKE N'%"
            SelectAdviser += txtSearch + "%')"
            Dim da As New SqlDataAdapter(SelectAdviser, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "Data")
            DatagridA.DataSource = ds.Tables("Data")
            DatagridA.DataBind()
            Conn.Close()

        Catch ex As Exception

        End Try

    End Sub
    Protected Sub DatagridA_deleteCommand(ByVal sender As Object, ByVal e As DataGridCommandEventArgs) Handles DatagridA.DeleteCommand
        Dim idx As String = CStr(DatagridA.DataKeys(e.Item.ItemIndex))
        SelectFaculty(idx)
    End Sub
    Protected Sub SelectFaculty(ByVal ID As String)
        FacultyID = ID
        Dim strConn, SelectFaculty As String
        strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
        Dim Conn As New SqlConnection(strConn)
        Conn.Open()
        SelectFaculty = "SELECT * FROM DC_FACULTY WHERE (FACULTYID LIKE N'%"
        SelectFaculty += ID + "%')"
        Dim da As New SqlDataAdapter(SelectFaculty, Conn)
        Dim ds As New DataSet
        da.Fill(ds, "Faculty")
        If ds.Tables("Faculty").Rows.Count <> 0 Then
            SDegreeId = CStr(ds.Tables("Faculty").Rows(0)(1))
            SelectindexList()
            AddFacultyThai.Text = CStr(ds.Tables("Faculty").Rows(0)(2))
            AddFacultyEng.Text = CStr(ds.Tables("Faculty").Rows(0)(3))

            SearchFaculty.Text = ""
            MsgSearchFaculty.Text = ""
        End If

        Conn.Close()
    End Sub
    Protected Sub DegreeLevel_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DegreeLevel.SelectedIndexChanged
        SelectDegreeName()
        SqlDegreeNameL()
    End Sub
    Protected Sub SelectDegreeName()
        Dim strConn, SelectFaculty As String
        strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
        Dim Conn As New SqlConnection(strConn)
        Conn.Open()
        DegreeNameL.ClearSelection()
        SelectFaculty = "SELECT DEGREE_NAME	FROM DC_DEGREE  WHERE  (DEGREE_LAVEL = N'"
        SelectFaculty += DegreeLevel.Text + "')"
        Dim da As New SqlDataAdapter(SelectFaculty, Conn)
        Dim ds As New DataSet
        da.Fill(ds, "DEGREE")
        DegreeNameL.DataSource = ds.Tables("DEGREE")
        DegreeNameL.DataBind()
        DegreeNameL.Focus()
        Conn.Close()
    End Sub

    Protected Sub ClearDegree_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ClearDegree.Click
        clearTextFaculty()
    End Sub

    Protected Sub SearchFaculty_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles SearchFaculty.TextChanged
        If SearchFaculty.Text = "" Then
            MsgSearchFaculty.Text = "ไม่ได้กรอกข้อมูล"
            Exit Sub
        Else
            EditSelectFaculty(SearchFaculty.Text)
        End If
    End Sub
End Class