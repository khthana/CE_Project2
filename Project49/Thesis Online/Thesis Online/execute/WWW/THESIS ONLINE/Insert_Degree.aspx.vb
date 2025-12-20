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

    Private Shared Degree_ID As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Page.IsPostBack <> True Then
            EditSelectDegree("00000")
        End If
    End Sub
    Protected Sub AutoIDAdviser()
        Dim CountId, Num, CountidNew As Integer
        Dim idcontributor, strConn, NewID, sqlProducts As String
        NewID = ""
        Try
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            sqlProducts = "SELECT DEGREE_ID FROM DC_DEGREE"
            Dim da As New SqlDataAdapter(sqlProducts, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "degree")
            If ds.Tables("degree").Rows.Count = 0 Then
                idcontributor = "D00001"
                AddDataBasedegree(idcontributor)
            Else
                CountId = ds.Tables("degree").Rows.Count
                idcontributor = CStr(ds.Tables("degree").Rows(CountId - 1)(0))
                Do While NewID <= idcontributor
                    Num = Num + 1
                    CountidNew = (CountId - 1) + Num
                    NewID = "D" + Format(CountidNew, "00000")

                Loop
                AddDataBasedegree(NewID)
            End If
        Catch ex As Exception

        End Try

    End Sub
    Protected Sub AddDataBasedegree(ByVal DegreeID As String)
        Try
            If AddDegreeLevel.Text = "" Then
                MsgSearchDegree.Text = "ไม่ได้กรอกข้อมูล"
                Exit Sub
            Else
                Dim strConn As String
                Dim sqlAdviser As String
                strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
                Dim Conn As New SqlConnection(strConn)
                Conn.Open()
                sqlAdviser = "INSERT INTO DC_DEGREE (DEGREE_ID,DEGREE_LAVEL,DEGREE_NAME)"
                sqlAdviser += "VALUES ('" + DegreeID + "',"
                sqlAdviser += "'" + AddDegreeLevel.Text + "',"
                sqlAdviser += "'" + AddDegreeName.Text + "')"
                Dim Conm As New SqlCommand(sqlAdviser, Conn)
                Conm.ExecuteNonQuery()
                Conn.Close()
                MsgSearchDegree.Text = "บันทึกข้อมูลเสร็จแล้ว"
                clearTextdegree()
            End If
        Catch ex As Exception
            MsgSearchDegree.Text = "ไม่สมารถบันทึกข้อมูลได้"

        End Try
    End Sub
    Protected Sub clearTextdegree()
        AddDegreeLevel.Text = ""
        AddDegreeName.Text = ""
        MsgSearchDegree.Text = ""
        EditSelectDegree("00000")
    End Sub
    Protected Sub AddDegree_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles AddDegree.Click
        AutoIDAdviser()
    End Sub

    Protected Sub Editdegree_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles Editdegree.Click
        Try
            If AddDegreeLevel.Text = "" Then
                MsgSearchDegree.Text = "ไม่ได้กรอกข้อมูล"
                clearTextdegree()
                Exit Sub
            Else

                Dim strConn, SelectAdviser As String
                strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
                Dim Conn As New SqlConnection(strConn)
                SelectAdviser = ""
                Conn.Open()
                SelectAdviser += "UPDATE DC_DEGREE SET "
                SelectAdviser += "DEGREE_LAVEL = N'" + AddDegreeLevel.Text
                SelectAdviser += "',DEGREE_NAME = N'" + AddDegreeName.Text
                SelectAdviser += "' WHERE  (DEGREE_ID = N'" + Degree_ID + "')"
                Dim Conm As New SqlCommand(SelectAdviser, Conn)
                Conm.ExecuteNonQuery()
                Conn.Close()
                clearTextdegree()
                MsgSearchDegree.Text = "แก้ไขข้อมูลแล้ว"
            End If
        Catch ex As Exception

            MsgSearchDegree.Text = "ไม่สามารถบันทึกข้อมูลได้"
            clearTextdegree()

        End Try
        Editdegree.Focus()
    End Sub

    Protected Sub DeletdDegree_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles DeletdDegree.Click
        Try

            If AddDegreeLevel.Text = "" Then
                MsgSearchDegree.Text = "ไม่ได้กรอกข้อมูล"
                Exit Sub
            Else

                Dim strConn, Selectdegree As String
                strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
                Dim Conn As New SqlConnection(strConn)
                Selectdegree = ""
                Conn.Open()
                Selectdegree = "DELETE FROM DC_DEGREE WHERE (DEGREE_ID = N'" + Degree_ID + "')"
                Dim Conm As New SqlCommand(Selectdegree, Conn)
                Conm.ExecuteNonQuery()
                Conn.Close()
                clearTextdegree()
                MsgSearchDegree.Text = "ลบข้อมูลแล้ว"
            End If
        Catch ex As Exception

            MsgSearchDegree.Text = "ไม่สามารถลบข้อมูลได้เนื่องจากมีการใช้อยู่"
            clearTextdegree()

        End Try
        DeletdDegree.Focus()

    End Sub

    Protected Sub ClearDegree_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ClearDegree.Click
        clearTextdegree()

    End Sub

    Protected Sub Searchdegree_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles Searchdegree.Click
        If SearchDegreeN.Text = "" Then
            MsgSearchDegree.Text = "ไม่ได้กรอกข้อมูล"
            Exit Sub
        Else
            EditSelectDegree(SearchDegreeN.Text)
        End If
    End Sub
    Protected Sub PageIndxchanged(ByVal sender As Object, ByVal e As DataGridPageChangedEventArgs)
        DatagridA.CurrentPageIndex = e.NewPageIndex
        EditSelectDegree(SearchDegreeN.Text)
    End Sub
    Protected Sub DatagridA_deleteCommand(ByVal sender As Object, ByVal e As DataGridCommandEventArgs) Handles DatagridA.DeleteCommand
        Dim idx As String = CStr(DatagridA.DataKeys(e.Item.ItemIndex))
        ShowText(idx)
    End Sub
    Protected Sub EditSelectDegree(ByVal txtSearch As String)
        Try

            Dim strConn, SelectDegree As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            SelectDegree = "SELECT * FROM DC_DEGREE WHERE (DEGREE_NAME LIKE N'%"
            SelectDegree += txtSearch + "%')"
            Dim da As New SqlDataAdapter(SelectDegree, Conn)
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

            Dim strConn, SelectAdviser As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            SelectAdviser = "SELECT * FROM DC_DEGREE WHERE (DEGREE_ID = N'"
            SelectAdviser += txtSearchId + "')"
            Dim da As New SqlDataAdapter(SelectAdviser, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "Adviser")
            If ds.Tables("Adviser").Rows.Count <> 0 Then
                Degree_ID = CStr(ds.Tables("Adviser").Rows(0)(0))
                AddDegreeLevel.Text = CStr(ds.Tables("Adviser").Rows(0)(1))
                AddDegreeName.Text = CStr(ds.Tables("Adviser").Rows(0)(2))
                SearchDegreeN.Text = ""
                MsgSearchDegree.Text = ""
            Else
                MsgSearchDegree.Text = "ไม่พบข้อมูลที่ค้นหา"
                SearchDegreeN.Text = ""
                clearTextdegree()
            End If

        Catch ex As Exception
            MsgSearchDegree.Text = "ไม่สามารถบันทึกข้อมูลได้"
            clearTextdegree()

        End Try

    End Sub

    Protected Sub SearchDegreeN_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles SearchDegreeN.TextChanged
        If SearchDegreeN.Text = "" Then
            MsgSearchDegree.Text = "ไม่ได้กรอกข้อมูล"
            Exit Sub
        Else
            EditSelectDegree(SearchDegreeN.Text)
        End If
    End Sub
End Class

