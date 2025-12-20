Imports System.Data
Imports System.Data.SqlClient

Partial Class SubjectDetail
    Inherits System.Web.UI.Page

    Protected Sub StatusDDL_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles StatusDDL.SelectedIndexChanged
        If StatusDDL.SelectedItem.Value = "Open" Then
            QueryStr = "select sub_id,sub_name from Subject where sub_status = '1' order by sub_id"
        ElseIf StatusDDL.SelectedItem.Value = "Close" Then
            QueryStr = "select sub_id,sub_name from Subject where sub_status = '0' order by sub_id"
        ElseIf StatusDDL.SelectedItem.Value = "Open and Close" Then
            QueryStr = "select sub_id,sub_name from Subject order by sub_id"
        ElseIf StatusDDL.SelectedItem.Value = "Select" Then
            Exit Sub
        End If
        TableStr = "getsubject"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                SubjectDDL.DataTextField = "sub_name"
                SubjectDDL.DataValueField = "sub_id"
                SubjectDDL.DataSource = sqlDS
                SubjectDDL.DataBind()
            Else
                warning.Text = "ไม่มีวิชาที่เปิดสอนในภาคการศึกษานี้"
                Exit Sub
            End If
        Else
            Response.Redirect("DBFailed.aspx")
        End If
    End Sub
End Class
