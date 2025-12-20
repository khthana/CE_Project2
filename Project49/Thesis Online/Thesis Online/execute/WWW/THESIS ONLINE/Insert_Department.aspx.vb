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

Partial Class Department
    Inherits System.Web.UI.Page
    Private Shared FacultyID, SDepartmentId As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Page.IsPostBack <> True Then
            EditSelectDesciption("00000")
        End If
    End Sub
    Protected Sub DegreeName_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DegreeName.SelectedIndexChanged
        FacultyList()
    End Sub
    Protected Sub FacultyList()
        Dim strConn, SelectFaculty As String
        strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
        Dim Conn As New SqlConnection(strConn)
        Conn.Open()
        SelectFaculty = "SELECT DC_FACULTY.FACULTY_THAI FROM DC_FACULTY INNER JOIN  DC_DEGREE ON DC_FACULTY.DEGREE_ID = DC_DEGREE.DEGREE_ID"
        SelectFaculty += " WHERE (DC_DEGREE.DEGREE_LAVEL = N'"
        SelectFaculty += DegreeLevel.Text
        SelectFaculty += "') AND (DC_DEGREE.DEGREE_NAME = N'"
        SelectFaculty += DegreeName.Text + "')"
        Dim da As New SqlDataAdapter(SelectFaculty, Conn)
        Dim ds As New DataSet
        da.Fill(ds, "DEGREE")
        FacultList.DataSource = ds.Tables("DEGREE")
        FacultList.DataBind()
        FacultList.Focus()
        Conn.Close()
    End Sub
    Protected Sub DegreeNameList()
        Dim strConn, SelectDegreeName As String
        strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
        Dim Conn As New SqlConnection(strConn)
        Conn.Open()
        SelectDegreeName = "SELECT DEGREE_NAME  FROM DC_DEGREE WHERE(DEGREE_LAVEL = N'"
        SelectDegreeName += DegreeLevel.Text + "')"
        Dim da As New SqlDataAdapter(SelectDegreeName, Conn)
        Dim ds As New DataSet
        da.Fill(ds, "DEGREE")
        DegreeName.DataSource = ds.Tables("DEGREE")
        DegreeName.DataBind()
        DegreeName.Focus()
        Conn.Close()
    End Sub

    Protected Sub DegreeLevel_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DegreeLevel.SelectedIndexChanged
        DegreeNameList()
        FacultyList()
    End Sub
    Protected Sub AutoIDDepartment()
        Dim CountId, Num, CountidNew As Integer
        Dim idcontributor, strConn, NewID, sqlProducts As String
        NewID = ""
        Try
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            sqlProducts = "SELECT DEPARTMENTID FROM DC_DEPARTMENT"
            Dim da As New SqlDataAdapter(sqlProducts, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "Department")
            If ds.Tables("Department").Rows.Count = 0 Then
                idcontributor = "M00001"
                SelectFacultyID()
                AddDataDepartment(idcontributor)
            Else
                CountId = ds.Tables("Department").Rows.Count
                idcontributor = CStr(ds.Tables("Department").Rows(CountId - 1)(0))
                Do While NewID <= idcontributor
                    Num = Num + 1
                    CountidNew = (CountId - 1) + Num
                    NewID = "M" + Format(CountidNew, "00000")

                Loop
                SelectFacultyID()
                AddDataDepartment(NewID)
            End If
        Catch ex As Exception

        End Try

    End Sub
    Protected Sub SelectFacultyID()
        Dim strConn, SelectFaculty As String
        strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
        Dim Conn As New SqlConnection(strConn)
        Conn.Open()
        SelectFaculty = "SELECT DC_FACULTY.FACULTYID FROM DC_DEGREE INNER JOIN "
        SelectFaculty += "DC_FACULTY ON DC_DEGREE.DEGREE_ID = DC_FACULTY.DEGREE_ID "
        SelectFaculty += "WHERE (DC_DEGREE.DEGREE_LAVEL = N'"
        SelectFaculty += DegreeLevel.Text
        SelectFaculty += "') AND (DC_DEGREE.DEGREE_NAME = N'"
        SelectFaculty += DegreeName.Text
        SelectFaculty += "') AND (DC_FACULTY.FACULTY_THAI = N'"
        SelectFaculty += FacultList.Text + "')"
        Dim da As New SqlDataAdapter(SelectFaculty, Conn)
        Dim ds As New DataSet
        da.Fill(ds, "Faculty")
        If ds.Tables("Faculty").Rows.Count <> 0 Then
            FacultyID = CStr(ds.Tables("Faculty").Rows(0)(0))
        Else
            FacultyID = ""
        End If
    End Sub
    Protected Sub AddDataDepartment(ByVal DepartmentIDs As String)
        Try
            If AddDepartmentThai.Text = "" Then
                MsgSearchDep.Text = "ไม่ได้กรอกข้อมูล"
                Exit Sub
            Else
                Dim strConn As String
                Dim sqlDepartment As String = ""
                strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
                Dim Conn As New SqlConnection(strConn)
                Conn.Open()
                sqlDepartment = "INSERT INTO DC_DEPARTMENT (DEPARTMENTID,FACULTYID,DEPARTMENT_THAI,DEPARTMENTID_ENG)"
                sqlDepartment += " VALUES ('" + DepartmentIDs + "',"
                sqlDepartment += "'" + FacultyID + "',"
                sqlDepartment += "'" + AddDepartmentThai.Text + "',"
                sqlDepartment += "'" + AddDepartmentEng.Text + "')"
                Dim Conm As New SqlCommand(sqlDepartment, Conn)
                Conm.ExecuteNonQuery()
                Conn.Close()
                MsgSearchDep.Text = "บันทึกข้อมูลแล้ว"
                clearTextDepartment()
            End If
        Catch ex As Exception
            MsgSearchDep.Text = "ไม่สามารถบันทึกข้อมูลได้"
        End Try
    End Sub
    Protected Sub clearTextDepartment()
        AddDepartmentThai.Text = ""
        AddDepartmentEng.Text = ""
        EditSelectDesciption("00000")
        DegreeLevel.ClearSelection()
        DegreeNameList()
        FacultyList()
    End Sub
    Protected Sub AddBaseDegree_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles AddBaseDegree.Click
        AutoIDDepartment()
    End Sub

    Protected Sub ShowText(ByVal txtSearchId As String)
        Try
            Dim strConn, SelectFaculty As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            SelectFaculty = "SELECT * FROM DC_DEPARTMENT WHERE (DEPARTMENTID = N'"
            SelectFaculty += txtSearchId + "')"
            Dim da As New SqlDataAdapter(SelectFaculty, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "Faculty")
            If ds.Tables("Faculty").Rows.Count <> 0 Then
                SDepartmentId = CStr(ds.Tables("Faculty").Rows(0)(0))
                FacultyID = CStr(ds.Tables("Faculty").Rows(0)(1))
                SelectindexList()
                AddDepartmentThai.Text = CStr(ds.Tables("Faculty").Rows(0)(2))
                AddDepartmentEng.Text = CStr(ds.Tables("Faculty").Rows(0)(3))

                SearchDep.Text = ""
                MsgSearchDep.Text = ""
            Else
                MsgSearchDep.Text = "ไม่พบข้อมูลที่ค้นหา"
                SearchDep.Text = ""
                clearTextDepartment()
            End If

        Catch ex As Exception
            MsgSearchDep.Text = "ไม่สามารถค้นหาข้อมูลที่บันทึกข้อมูลได้"
            clearTextDepartment()

        End Try
    End Sub
    Protected Sub SelectindexList()
        Try
            Dim strConn, SelectFaculty As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            SelectFaculty = "SELECT DC_DEGREE.DEGREE_LAVEL, DC_DEGREE.DEGREE_NAME, DC_FACULTY.FACULTY_THAI "
            SelectFaculty += "FROM DC_FACULTY INNER JOIN "
            SelectFaculty += "DC_DEPARTMENT ON DC_FACULTY.FACULTYID = DC_DEPARTMENT.FACULTYID INNER JOIN "
            SelectFaculty += "DC_DEGREE ON DC_FACULTY.DEGREE_ID = DC_DEGREE.DEGREE_ID "
            SelectFaculty += "WHERE (DC_DEPARTMENT.DEPARTMENTID = N'"
            SelectFaculty += SDepartmentId + "')"
            Dim da As New SqlDataAdapter(SelectFaculty, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "Faculty")
            If ds.Tables("Faculty").Rows.Count <> 0 Then
                DegreeLevel.SelectedValue = CStr(ds.Tables("Faculty").Rows(0)(0))
                DegreeNameList()
                DegreeName.SelectedValue = CStr(ds.Tables("Faculty").Rows(0)(1))
                FacultyList()
                FacultList.SelectedValue = CStr(ds.Tables("Faculty").Rows(0)(2))
                SelectFacultyID()
            End If
        Catch ex As Exception
            MsgSearchDep.Text = "ERROR"
            clearTextDepartment()
        End Try
    End Sub
    Protected Sub EditBaseDegree_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles EditBaseDegree.Click
        Try
            If AddDepartmentThai.Enabled = False Then

                Exit Sub
            Else
                Dim strConn, SelectFaculty As String
                strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
                Dim Conn As New SqlConnection(strConn)
                SelectFaculty = ""

                Conn.Open()
                SelectFacultyID()
                SelectFaculty += "UPDATE DC_DEPARTMENT SET "
                SelectFaculty += " FACULTYID = N'" + FacultyID
                SelectFaculty += "',DEPARTMENT_THAI =N'" + AddDepartmentThai.Text
                SelectFaculty += "',DEPARTMENTID_ENG = N'" + AddDepartmentEng.Text
                SelectFaculty += "' WHERE  (DEPARTMENTID = N'" + SDepartmentId + "')"
                Dim Conm As New SqlCommand(SelectFaculty, Conn)
                Conm.ExecuteNonQuery()
                Conn.Close()
                clearTextDepartment()
                MsgSearchDep.Text = "แก้ไขข้อมูลแล้ว"
            End If
        Catch ex As Exception

            MsgSearchDep.Text = "ไม่สามารถแก้ไขข้อมูลได้"
            clearTextDepartment()

        End Try
    End Sub

    Protected Sub DeleteDepartment_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles DeleteDepartment.Click
        Try
            Dim strConn, SelectFaculty As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            SelectFaculty = ""
            Conn.Open()
            SelectFaculty += "DELETE FROM DC_DEPARTMENT WHERE  (DEPARTMENTID = N'" + SDepartmentId + "')"
            Dim Conm As New SqlCommand(SelectFaculty, Conn)
            Conm.ExecuteNonQuery()
            Conn.Close()
            clearTextDepartment()
            MsgSearchDep.Text = "ลบข้อมูลแล้ว"

        Catch ex As Exception
            MsgSearchDep.Text = "ไม่สามารถลบข้อมูลได้"
            clearTextDepartment()
        End Try
    End Sub

    Protected Sub ClearDegree_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ClearDegree.Click
        clearTextDepartment()

    End Sub
    Protected Sub PageIndxchanged(ByVal sender As Object, ByVal e As DataGridPageChangedEventArgs)
        DatagridA.CurrentPageIndex = e.NewPageIndex
        EditSelectDesciption(SearchDep.Text)
    End Sub
    Protected Sub EditSelectDesciption(ByVal txtSearch As String)
        Try

            Dim strConn, SelectDesciption As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            SelectDesciption = "SELECT * FROM DC_DEPARTMENT WHERE (DEPARTMENT_THAI LIKE N'%"
            SelectDesciption += txtSearch + "%')"
            Dim da As New SqlDataAdapter(SelectDesciption, Conn)
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
        ShowText(idx)
    End Sub
    Protected Sub SearchDep_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles SearchDep.TextChanged
        If SearchDep.Text = "" Then
            MsgSearchDep.Text = "ไม่ได้กรอกข้อมูล"
            Exit Sub
        Else
            EditSelectDesciption(SearchDep.Text)
        End If
    End Sub

    Protected Sub SearchDEPM_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles SearchDEPM.Click
        If SearchDep.Text = "" Then
            MsgSearchDep.Text = "ไม่ได้กรอกข้อมูล"
            Exit Sub
        Else
            EditSelectDesciption(SearchDep.Text)
        End If
    End Sub
End Class