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

Partial Class InsertDescription
    Inherits System.Web.UI.Page

    Private Shared DepartmentID, SDescriptionId As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Page.IsPostBack <> True Then
            EditSelectDesciption("00000")
        End If
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

    Protected Sub DepartmentNList()
        Dim strConn, SelectFaculty As String
        strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
        Dim Conn As New SqlConnection(strConn)
        Conn.Open()
        SelectFaculty = "SELECT DC_DEPARTMENT.DEPARTMENT_THAI FROM DC_DEGREE INNER JOIN "
        SelectFaculty += "DC_FACULTY ON DC_DEGREE.DEGREE_ID = DC_FACULTY.DEGREE_ID INNER JOIN "
        SelectFaculty += "DC_DEPARTMENT ON DC_FACULTY.FACULTYID = DC_DEPARTMENT.FACULTYID "
        SelectFaculty += "WHERE (DC_DEGREE.DEGREE_LAVEL = N'"
        SelectFaculty += DegreeLevel.Text
        SelectFaculty += "') AND (DC_DEGREE.DEGREE_NAME = N'"
        SelectFaculty += DegreeName.Text
        SelectFaculty += "') AND (DC_FACULTY.FACULTY_THAI = N'"
        SelectFaculty += FacultList.Text + "')"
        Dim da As New SqlDataAdapter(SelectFaculty, Conn)
        Dim ds As New DataSet
        da.Fill(ds, "DEGREE")
        DepartmentList.DataSource = ds.Tables("DEGREE")
        DepartmentList.DataBind()
        DepartmentList.Focus()
        Conn.Close()
    End Sub

    Protected Sub AutoIDDescription()
        Dim CountId, Num, CountidNew As Integer
        Dim idcontributor, strConn, NewID, sqlProducts As String
        NewID = ""
        Try
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            sqlProducts = "SELECT DESCIPTION_ID FROM DC_DESCIPTION"
            Dim da As New SqlDataAdapter(sqlProducts, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "DESCIPTION")
            If ds.Tables("DESCIPTION").Rows.Count = 0 Then
                idcontributor = "P00001"
                SelectDepartmentID()
                AddDataDesciption(idcontributor)
            Else
                CountId = ds.Tables("DESCIPTION").Rows.Count
                idcontributor = CStr(ds.Tables("DESCIPTION").Rows(CountId - 1)(0))
                Do While NewID <= idcontributor
                    Num = Num + 1
                    CountidNew = (CountId - 1) + Num
                    NewID = "P" + Format(CountidNew, "00000")

                Loop
                SelectDepartmentID()
                AddDataDesciption(NewID)
            End If
        Catch ex As Exception

        End Try

    End Sub
    Protected Sub SelectDepartmentID()
        Dim strConn, SelectDepartment As String
        strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
        Dim Conn As New SqlConnection(strConn)
        Conn.Open()
        SelectDepartment = "SELECT DC_DEPARTMENT.DEPARTMENTID FROM DC_DEGREE INNER JOIN "
        SelectDepartment += "DC_FACULTY ON DC_DEGREE.DEGREE_ID = DC_FACULTY.DEGREE_ID INNER JOIN "
        SelectDepartment += "DC_DEPARTMENT ON DC_FACULTY.FACULTYID = DC_DEPARTMENT.FACULTYID "
        SelectDepartment += "WHERE (DC_DEGREE.DEGREE_LAVEL = N'"
        SelectDepartment += DegreeLevel.Text
        SelectDepartment += "') AND (DC_DEGREE.DEGREE_NAME = N'"
        SelectDepartment += DegreeName.Text
        SelectDepartment += "') AND (DC_FACULTY.FACULTY_THAI = N'"
        SelectDepartment += FacultList.Text
        SelectDepartment += "') AND (DC_DEPARTMENT.DEPARTMENT_THAI = N'"
        SelectDepartment += DepartmentList.Text + "')"
        Dim da As New SqlDataAdapter(SelectDepartment, Conn)
        Dim ds As New DataSet
        da.Fill(ds, "Faculty")
        If ds.Tables("Faculty").Rows.Count <> 0 Then
            DepartmentID = CStr(ds.Tables("Faculty").Rows(0)(0))
        Else
            DepartmentID = ""
        End If
    End Sub
    Protected Sub AddDataDesciption(ByVal DesciptionIDs As String)
        Try
            If AddDesciptionThai.Text = "" Then
                MsgSearchDesciption.Text = "ไม่ได้กรอกข้อมูล"
                Exit Sub
            Else
                Dim strConn As String
                Dim sqlDescription As String = ""
                strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
                Dim Conn As New SqlConnection(strConn)
                Conn.Open()
                sqlDescription = "INSERT INTO DC_DESCIPTION (DESCIPTION_ID,DEPARTMENTID,DESCIPTION_THAI,DESCIPTION_ENGLISH)"
                sqlDescription += " VALUES ('" + DesciptionIDs + "',"
                sqlDescription += "'" + DepartmentID + "',"
                sqlDescription += "'" + AddDesciptionThai.Text + "',"
                sqlDescription += "'" + AddDesciptionEng.Text + "')"
                Dim Conm As New SqlCommand(sqlDescription, Conn)
                Conm.ExecuteNonQuery()
                Conn.Close()
                MsgSearchDesciption.Text = "บันทึกข้อมูลแล้ว"
                clearTextDescription()
            End If
        Catch ex As Exception
            MsgSearchDesciption.Text = "ไม่สามารถบันทึกข้อมูลได้"
        End Try
    End Sub
    Protected Sub clearTextDescription()
        AddDesciptionThai.Text = ""
        AddDesciptionEng.Text = ""
        EditSelectDesciption("00000")
        DegreeLevel.ClearSelection()
        DegreeNameList()
        FacultyList()
        DepartmentNList()
    End Sub

    Protected Sub DegreeLevel_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DegreeLevel.SelectedIndexChanged
        DegreeNameList()
        FacultyList()
        DepartmentNList()
    End Sub

    Protected Sub AddBaseDesciption_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles AddBaseDesciption.Click
        AutoIDDescription()
    End Sub

    Protected Sub DegreeName_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DegreeName.SelectedIndexChanged
        FacultyList()
        DepartmentNList()
    End Sub

    Protected Sub FacultList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles FacultList.SelectedIndexChanged
        DepartmentNList()
    End Sub

    Protected Sub SearchDE_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles SearchDE.Click

        If SearchDesciption.Text = "" Then
            MsgSearchDesciption.Text = "ไม่ได้กรอกข้อมูล"
            Exit Sub
        Else
            EditSelectDesciption(SearchDesciption.Text)
        End If

    End Sub
    Protected Sub DatagridA_deleteCommand(ByVal sender As Object, ByVal e As DataGridCommandEventArgs) Handles DatagridA.DeleteCommand
        Dim idx As String = CStr(DatagridA.DataKeys(e.Item.ItemIndex))
        ShowText(idx)
    End Sub
    Protected Sub EditSelectDesciption(ByVal txtSearch As String)
        Try

            Dim strConn, SelectDesciption As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            SelectDesciption = "SELECT * FROM DC_DESCIPTION WHERE (DESCIPTION_THAI LIKE N'%"
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
    Protected Sub ShowText(ByVal txtSearchId As String)
        Try
            Dim strConn, SelectFaculty As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            SelectFaculty = "SELECT * FROM DC_DESCIPTION WHERE  (DESCIPTION_ID = N'" + txtSearchId + "')"
            Dim da As New SqlDataAdapter(SelectFaculty, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "Desciption")
            SDescriptionId = CStr(ds.Tables("Desciption").Rows(0)(0))
            DepartmentID = CStr(ds.Tables("Desciption").Rows(0)(1))
            SelectindexList()
            AddDesciptionThai.Text = CStr(ds.Tables("Desciption").Rows(0)(2))
            AddDesciptionEng.Text = CStr(ds.Tables("Desciption").Rows(0)(3))
            SearchDesciption.Text = ""
            MsgSearchDesciption.Text = ""

         
        Catch ex As Exception
            MsgSearchDesciption.Text = "ไม่สามารถค้นหาข้อมูลที่บันทึกข้อมูลได้"
            clearTextDescription()

        End Try

    End Sub
    Protected Sub SelectindexList()
        Try
            Dim strConn, SelectFaculty As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            SelectFaculty = "SELECT DC_DEGREE.DEGREE_NAME, DC_DEGREE.DEGREE_LAVEL, DC_FACULTY.FACULTY_THAI, DC_DEPARTMENT.DEPARTMENT_THAI "
            SelectFaculty += "FROM DC_DESCIPTION INNER JOIN DC_DEPARTMENT ON DC_DESCIPTION.DEPARTMENTID = DC_DEPARTMENT.DEPARTMENTID INNER JOIN "
            SelectFaculty += "DC_FACULTY ON DC_DEPARTMENT.FACULTYID = DC_FACULTY.FACULTYID INNER JOIN DC_DEGREE ON DC_FACULTY.DEGREE_ID = DC_DEGREE.DEGREE_ID "
            SelectFaculty += "WHERE     (DC_DESCIPTION.DEPARTMENTID = N'"
            SelectFaculty += DepartmentID + "')"
            Dim da As New SqlDataAdapter(SelectFaculty, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "Faculty")
            If ds.Tables("Faculty").Rows.Count <> 0 Then
                DegreeLevel.SelectedValue = CStr(ds.Tables("Faculty").Rows(0)(1))
                DegreeNameList()
                DegreeName.SelectedValue = CStr(ds.Tables("Faculty").Rows(0)(0))
                FacultyList()
                FacultList.SelectedValue = CStr(ds.Tables("Faculty").Rows(0)(2))
                DepartmentNList()
                DepartmentList.SelectedValue = CStr(ds.Tables("Faculty").Rows(0)(3))
                SelectDepartmentID()
            End If
        Catch ex As Exception
            MsgSearchDesciption.Text = "ERROR"
            clearTextDescription()
        End Try
    End Sub

    Protected Sub EditBaseDesciption_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles EditBaseDesciption.Click
        Try
            If AddDesciptionThai.Enabled = False Then

                Exit Sub
            Else
                Dim strConn, SelectFaculty As String
                strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
                Dim Conn As New SqlConnection(strConn)
                SelectFaculty = ""
                Conn.Open()
                SelectDepartmentID()
                SelectFaculty += "UPDATE DC_DESCIPTION SET "
                SelectFaculty += " DEPARTMENTID = N'" + DepartmentID
                SelectFaculty += "',DESCIPTION_THAI =N'" + Trim(AddDesciptionThai.Text)
                SelectFaculty += "',DESCIPTION_ENGLISH = N'" + Trim(AddDesciptionEng.Text)
                SelectFaculty += "' WHERE  (DESCIPTION_ID = N'" + SDescriptionId + "')"
                Dim Conm As New SqlCommand(SelectFaculty, Conn)
                Conm.ExecuteNonQuery()
                Conn.Close()
                clearTextDescription()
                MsgSearchDesciption.Text = "แก้ไขข้อมูลแล้ว"
            End If
        Catch ex As Exception

            MsgSearchDesciption.Text = "ไม่สามารถแก้ไขข้อมูลได้"
            clearTextDescription()

        End Try
    End Sub

    Protected Sub ClearDesciption_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ClearDesciption.Click
        clearTextDescription()
        MsgSearchDesciption.Text = ""
    End Sub

    Protected Sub DeletdBaseDesciption_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles DeletdBaseDesciption.Click
        Try
            Dim strConn, SelectFaculty As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            SelectFaculty = ""
            Conn.Open()
            SelectFaculty += "DELETE FROM DC_DESCIPTION WHERE  (DESCIPTION_ID = N'" + SDescriptionId + "')"
            Dim Conm As New SqlCommand(SelectFaculty, Conn)
            Conm.ExecuteNonQuery()
            Conn.Close()
            clearTextDescription()
            MsgSearchDesciption.Text = "ลบข้อมูลแล้ว"

        Catch ex As Exception
            MsgSearchDesciption.Text = "ไม่สามารถลบข้อมูลได้"
            clearTextDescription()
        End Try
    End Sub

    Protected Sub SearchDesciption_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles SearchDesciption.TextChanged
        If SearchDesciption.Text = "" Then
            MsgSearchDesciption.Text = "ไม่ได้กรอกข้อมูล"
            Exit Sub
        Else
            EditSelectDesciption(SearchDesciption.Text)
        End If
    End Sub
    Protected Sub PageIndxchanged(ByVal sender As Object, ByVal e As DataGridPageChangedEventArgs)
        DatagridA.CurrentPageIndex = e.NewPageIndex
        EditSelectDesciption(SearchDesciption.Text)
    End Sub

End Class

