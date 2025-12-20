Imports System.Data
Imports System.Data.SqlClient

Partial Class SearchThesis
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Warning.Text = ""
        If Not Page.IsPostBack Then
            If Request.QueryString("type") = "select" Then
                QueryStr = "select tsis_id,tsis_year,tsis_degree,tsis_tname,tsis_ename from Thesis " & _
                            "where tsis_tname like '%" & Request.QueryString("key") & "%' or tsis_ename = '%" & _
                            Request.QueryString("key") & "%'"
                TableStr = "getsearch"
            ElseIf Request.QueryString("type") = "adv_name" Then
                QueryStr = "select tsis_id,tsis_year,tsis_degree,tsis_tname,tsis_ename from Thesis " & _
                            "where tsis_id in (select tsis_id from AdvisorThesis where adv_name like '%" & _
                            Request.QueryString("key") & "%')"
                TableStr = "getsearch"
            ElseIf Request.QueryString("type") = "dev_name" Then
                QueryStr = "select tsis_id,tsis_year,tsis_degree,tsis_tname,tsis_ename from Thesis " & _
                             "where tsis_id in (select tsis_id from DeveloperThesis where dev_name like '%" & _
                             Request.QueryString("key") & "%')"
                TableStr = "getsearch"
            Else
                QueryStr = "select tsis_id,tsis_year,tsis_degree,tsis_tname,tsis_ename from Thesis " & _
                             "where " & Request.QueryString("type") & " like '%" & Request.QueryString("key") & _
                             "%'"
                TableStr = "getsearch"
            End If
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                    DataList1.DataSource = sqlDS
                    DataList1.DataBind()
                Else
                    Warning.Text = "ไม่พบข้อมูล"
                    DataList1.Visible = False
                    Exit Sub
                End If
            Else
                Response.Redirect("DBFailed.aspx")
            End If
        End If
    End Sub

    Protected Sub search_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles search.Click
        Warning.Text = ""
        If typeDDL.SelectedItem.Value = "select" Then
            If keyword.Text = "" Then
                Warning.Text = "กรุณาเลือกชนิดการค้นหาและใส่คำหลัก"
                Exit Sub
            End If
        Else
            If keyword.Text = "" Then
                Warning.Text = "กรุณาใส่คำหลัก"
                Exit Sub
            End If
        End If
        Warning.Text = ""
        DataList1.Visible = True
        If typeDDL.SelectedItem.Value = "select" Then
            QueryStr = "select tsis_id,tsis_year,tsis_degree,tsis_tname,tsis_ename from Thesis " & _
                        "where tsis_tname like '%" & keyword.Text & "%' or tsis_ename = '%" & _
                        keyword.Text & "%'"
            TableStr = "getsearch"
        ElseIf typeDDL.SelectedItem.Value = "adv_name" Then
            QueryStr = "select tsis_id,tsis_year,tsis_degree,tsis_tname,tsis_ename from Thesis " & _
                        "where tsis_id in (select tsis_id from AdvisorThesis where adv_name like '%" & _
                        keyword.Text & "%')"
            TableStr = "getsearch"
        ElseIf typeDDL.SelectedItem.Value = "dev_name" Then
            QueryStr = "select tsis_id,tsis_year,tsis_degree,tsis_tname,tsis_ename from Thesis " & _
                         "where tsis_id in (select tsis_id from DeveloperThesis where dev_name like '%" & _
                         keyword.Text & "%')"
            TableStr = "getsearch"
        Else
            QueryStr = "select tsis_id,tsis_year,tsis_degree,tsis_tname,tsis_ename from Thesis " & _
                         "where " & typeDDL.SelectedItem.Value & " like '%" & keyword.Text & _
                         "%'"
            TableStr = "getsearch"
        End If
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                DataList1.DataSource = sqlDS
                DataList1.DataBind()
            Else
                Warning.Text = "ไม่พบข้อมูล"
                DataList1.Visible = False
                Exit Sub
            End If
        Else
            Response.Redirect("DBFailed.aspx")
        End If
    End Sub

    Protected Sub signup_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles signup.Click
        Response.Redirect("SignUp.aspx")
    End Sub

    Protected Sub forget_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles forget.Click
        Response.Redirect("ForgetPassword.aspx")
    End Sub

    Protected Sub signin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles signin.Click
        Dim prefix As String = ""
        Dim tablename As String = ""
        Dim status As Boolean = True
        Dim i As Integer = 0
        For i = 0 To 3
            If i = 0 Then
                prefix = "std_"
                tablename = "Student"
            ElseIf i = 1 Then
                prefix = "stf_"
                tablename = "Staff"
            ElseIf i = 2 Then
                prefix = "tch_"
                tablename = "Teacher"
            ElseIf i = 3 Then
                prefix = "adm_"
                tablename = "Administrator"
            End If
            QueryStr = "select " & prefix & "id," & prefix & "username," & prefix & "password from " & tablename & _
                        " where " & prefix & "username = '" & usernamelogin.Text & "' and " & prefix & "password = '" & _
                        passwordlogin.Text & "'"
            TableStr = "checklogin"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                    For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                        status = True
                        Session("user") = row(prefix & "id")
                        Session("usertype") = tablename
                        Session("loginstatus") = True
                    Next
                    Response.Redirect(tablename & "/" & tablename & ".aspx")
                Else
                    status = False
                End If
            Else
                Response.Redirect("DBFailed.aspx")
            End If
        Next
        If status = False Then
            warninglogin.Text = "ข้อมูลของคุณไม่ถูกต้อง"
            Exit Sub
        End If
    End Sub
End Class
