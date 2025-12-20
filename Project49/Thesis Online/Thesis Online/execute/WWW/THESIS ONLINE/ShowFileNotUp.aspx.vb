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
Partial Class ShowFileNotUp
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Page.IsPostBack <> True Then
            Filter()
            YearNList()
        End If

    End Sub
    Protected Sub FacultyNList()
        Try
            FacultyList.Items.Clear()
            Dim strConn, SelectFaculty As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            SelectFaculty = "SELECT DC_FACULTY.FACULTY_THAI FROM DC_FACULTY INNER JOIN  DC_DEGREE ON DC_FACULTY.DEGREE_ID = DC_DEGREE.DEGREE_ID"
            SelectFaculty += " WHERE (DC_DEGREE.DEGREE_LAVEL = N'"
            SelectFaculty += DegreeLevel.Text + "')"
            Dim da As New SqlDataAdapter(SelectFaculty, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "DEGREE")
            If ds.Tables("DEGREE").Rows.Count <> 0 Then

                FacultyList.Items.Add("<<คณะวิชา>>")
                For i As Integer = 0 To ds.Tables("DEGREE").Rows.Count - 1
                    FacultyList.Items.Add(ds.Tables("DEGREE").Rows(i)(0).ToString())
                Next
                Conn.Close()
            Else
                FacultyList.Items.Add("<<คณะวิชา>>")
            End If
            FacultyList.Focus()
            Conn.Close()
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DepartmentNList()
        DepartmentThai.Items.Clear()
        Dim strConn, SelectFaculty As String
        strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
        Dim Conn As New SqlConnection(strConn)
        Conn.Open()
        SelectFaculty = "SELECT DC_DEPARTMENT.DEPARTMENT_THAI FROM DC_DEGREE INNER JOIN "
        SelectFaculty += "DC_FACULTY ON DC_DEGREE.DEGREE_ID = DC_FACULTY.DEGREE_ID INNER JOIN "
        SelectFaculty += "DC_DEPARTMENT ON DC_FACULTY.FACULTYID = DC_DEPARTMENT.FACULTYID "
        SelectFaculty += "WHERE (DC_DEGREE.DEGREE_LAVEL = N'"
        SelectFaculty += DegreeLevel.Text
        SelectFaculty += "') AND (DC_FACULTY.FACULTY_THAI = N'"
        SelectFaculty += FacultyList.Text + "')"
        Dim da As New SqlDataAdapter(SelectFaculty, Conn)
        Dim ds As New DataSet
        da.Fill(ds, "DEPARTMENT")
        If ds.Tables("DEPARTMENT").Rows.Count <> 0 Then
            DepartmentThai.Items.Add("<<ภาควิชา>>")
            For i As Integer = 0 To ds.Tables("DEPARTMENT").Rows.Count - 1
                DepartmentThai.Items.Add(ds.Tables("DEPARTMENT").Rows(i)(0).ToString())
            Next
        Else
            DepartmentThai.Items.Add("<<ภาควิชา>>")
        End If
        DepartmentThai.Focus()
        Conn.Close()

    End Sub
    Protected Sub DesciptionNList()
        DesciptionThai.Items.Clear()
        Dim strConn, SelectFaculty As String
        strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
        Dim Conn As New SqlConnection(strConn)
        Conn.Open()
        SelectFaculty = "SELECT  DESCIPTION_THAI FROM DC_DESCIPTION INNER JOIN "
        SelectFaculty += "DC_DEPARTMENT ON DC_DESCIPTION.DEPARTMENTID = DC_DEPARTMENT.DEPARTMENTID INNER JOIN  "
        SelectFaculty += "DC_FACULTY ON DC_DEPARTMENT.FACULTYID = DC_FACULTY.FACULTYID INNER JOIN "
        SelectFaculty += "DC_DEGREE ON DC_FACULTY.DEGREE_ID = DC_DEGREE.DEGREE_ID  "
        SelectFaculty += "WHERE (DC_DEGREE.DEGREE_LAVEL = N'" + DegreeLevel.Text + "')"
        SelectFaculty += "AND (DC_FACULTY.FACULTY_THAI = N'" + FacultyList.Text + "') "
        SelectFaculty += "AND (DC_DEPARTMENT.DEPARTMENT_THAI = N'" + DepartmentThai.Text + "')"
        Dim da As New SqlDataAdapter(SelectFaculty, Conn)
        Dim ds As New DataSet
        da.Fill(ds, "Desciption")
        If ds.Tables("Desciption").Rows.Count <> 0 Then
            DesciptionThai.Items.Add("<<สาขาวิชา>>")
            For i As Integer = 0 To ds.Tables("Desciption").Rows.Count - 1
                DesciptionThai.Items.Add(ds.Tables("Desciption").Rows(i)(0).ToString())
            Next
        Else
            DesciptionThai.Items.Add("<<สาขาวิชา>>")
        End If
        DesciptionThai.Focus()
        Conn.Close()
    End Sub
    Protected Sub YearNList()
        YareListsh.Items.Clear()
        Dim ArrayYare As New ArrayList
        Dim strConn, SelectFaculty As String
        strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
        Dim Conn As New SqlConnection(strConn)
        Conn.Open()
        SelectFaculty = "SELECT DC_BOOK.YEAYCREATED_THAI FROM  DC_BOOK INNER JOIN "
        SelectFaculty += "DC_DESCIPTION ON DC_BOOK.DESCIPTION_ID = DC_DESCIPTION.DESCIPTION_ID INNER JOIN  "
        SelectFaculty += "DC_DEPARTMENT ON DC_DESCIPTION.DEPARTMENTID = DC_DEPARTMENT.DEPARTMENTID INNER JOIN "
        SelectFaculty += "DC_FACULTY ON DC_DEPARTMENT.FACULTYID = DC_FACULTY.FACULTYID INNER JOIN  "
        SelectFaculty += "DC_DEGREE ON DC_FACULTY.DEGREE_ID = DC_DEGREE.DEGREE_ID "
        If DegreeLevel.Text <> "<<ระดับปริญญา>>" Then
            SelectFaculty += "WHERE (DC_DEGREE.DEGREE_LAVEL = N'" + DegreeLevel.Text + "') "
        End If
        If FacultyList.Text <> "<<คณะวิชา>>" Then
            SelectFaculty += "AND (DC_FACULTY.FACULTY_THAI = N'" + FacultyList.Text + "') "
        End If
        If DepartmentThai.Text <> "<<ภาควิชา>>" Then
            SelectFaculty += "AND (DC_DEPARTMENT.DEPARTMENT_THAI = N'" + DepartmentThai.Text + "') "
        End If
        If DesciptionThai.Text <> "<<สาขาวิชา>>" Then
            SelectFaculty += "AND (DC_DESCIPTION.DESCIPTION_THAI = N'" + DesciptionThai.Text + "') "
        End If
        SelectFaculty += "ORDER BY DC_BOOK.YEAYCREATED_THAI"
        Dim da As New SqlDataAdapter(SelectFaculty, Conn)
        Dim ds As New DataSet
        Dim Ck As Boolean = False
        da.Fill(ds, "YEAYCREATED")
        If ds.Tables("YEAYCREATED").Rows.Count <> 0 Then
            ArrayYare.Add("<<ปี>>")
            Dim C As Integer = 1
            For i As Integer = 0 To ds.Tables("YEAYCREATED").Rows.Count - 1
                If C = 1 Then
                    ArrayYare.Add(CStr(ds.Tables("YEAYCREATED").Rows(i)(0)))
                    C += 1
                ElseIf CStr(ArrayYare(C - 1)) <> CStr(ds.Tables("YEAYCREATED").Rows(i)(0).ToString()) Then
                    ArrayYare.Add(CStr(ds.Tables("YEAYCREATED").Rows(i)(0)))
                    C += 1
                End If
            Next
            For i As Integer = 0 To ArrayYare.Count - 1
                YareListsh.Items.Add(CStr(ArrayYare(i)))
            Next
        Else
            YareListsh.Items.Add("<<ปี>>")
        End If



        YareListsh.Focus()
        Conn.Close()
    End Sub

    Protected Sub DegreeLevel_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DegreeLevel.SelectedIndexChanged
        FacultyNList()
        DepartmentNList()
        DesciptionNList()
        YearNList()
    End Sub

    Protected Sub FacultyList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles FacultyList.SelectedIndexChanged
        DepartmentNList()
        DesciptionNList()
        YearNList()
    End Sub

    Protected Sub DepartmentThai_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DepartmentThai.SelectedIndexChanged
        DesciptionNList()
        YearNList()
    End Sub
    Protected Sub DesciptionThai_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DesciptionThai.SelectedIndexChanged
        YearNList()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Filter()
    End Sub
    Protected Sub Filter()
        Dim strConn, SelectFaculty As String
        strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
        Dim Conn As New SqlConnection(strConn)
        Conn.Open()
        SelectFaculty = "SELECT DC_BOOK.BOOK_ID,DC_BOOK.CALL_NUMBER, DC_BOOK.TITLE_THAI ,DC_BOOK.POSITIONFILE"
        SelectFaculty += " FROM DC_BOOK INNER JOIN DC_DESCIPTION ON DC_BOOK.DESCIPTION_ID = DC_DESCIPTION.DESCIPTION_ID INNER JOIN "
        SelectFaculty += "DC_DEPARTMENT ON DC_DESCIPTION.DEPARTMENTID = DC_DEPARTMENT.DEPARTMENTID INNER JOIN "
        SelectFaculty += "DC_FACULTY ON DC_DEPARTMENT.FACULTYID = DC_FACULTY.FACULTYID INNER JOIN "
        SelectFaculty += "DC_DEGREE ON DC_FACULTY.DEGREE_ID = DC_DEGREE.DEGREE_ID "
        SelectFaculty += "WHERE (DC_BOOK.POSITIONFILE = N'0') "

        If DegreeLevel.Text <> "<<ระดับปริญญา>>" Then
            SelectFaculty += "AND (DC_DEGREE.DEGREE_LAVEL = N'" + DegreeLevel.Text + "') "
        End If
        If FacultyList.Text <> "<<คณะวิชา>>" Then
            SelectFaculty += "AND (DC_FACULTY.FACULTY_THAI = N'" + FacultyList.Text + "') "
        End If
        If DepartmentThai.Text <> "<<ภาควิชา>>" Then
            SelectFaculty += "AND (DC_DEPARTMENT.DEPARTMENT_THAI = N'" + DepartmentThai.Text + "') "
        End If
        If DesciptionThai.Text <> "<<สาขาวิชา>>" Then
            SelectFaculty += "AND (DC_DESCIPTION.DESCIPTION_THAI = N'" + DesciptionThai.Text + "') "
        End If
        If YareListsh.Text <> "<<ปี>>" Then
            SelectFaculty += "AND (DC_BOOK.YEAYCREATED_THAI = N'" + YareListsh.Text + "') "
        End If
        SelectFaculty += "ORDER BY CALL_NUMBER"
        Dim da As New SqlDataAdapter(SelectFaculty, Conn)
        Dim ds As New DataSet
        da.Fill(ds, "DEGREE")
        Datagrid1.DataSource = ds.Tables("DEGREE")
        Datagrid1.DataBind()

        Conn.Close()

    End Sub

    Protected Sub Datagrid1_EditCommand(ByVal sender As Object, ByVal e As DataGridCommandEventArgs) Handles Datagrid1.EditCommand
        Dim idx As String = CStr(Datagrid1.DataKeys(e.Item.ItemIndex))
        Application("bookId") = idx
        Response.Redirect("UpLoad.aspx")
    End Sub
End Class
