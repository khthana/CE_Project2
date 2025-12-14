<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Drawing.Color" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.OleDb" %>
<%@ import Namespace="System.Data.Odbc" %>
<%@ import Namespace="System.Data.SqlClient" %>
<script runat="server">

    dim UName ,UId ,UTel ,UDep ,USec ,ULoc ,UStatus
    Dim HisDept, HisSection, HisLocation
    Dim HisProject , HisType
    Dim Dataset1

    Sub Page_Load(sender As Object, e As EventArgs)
        if (Session.Contents("SIDD") = Session.SessionID) then
            GetSession()
            If Not IsPostBack Then

                ShowData()
            End If

            Requests()
            Search()
            History()
            edit()

            menu1.visible = false
            menu2.visible = false
            menu3.visible = true
            menu4.visible = false
            ShowUser.Text = UName
            due.text = Format(today, "dddd d MMMM yyyy")
        else
            Response.Redirect("default.aspx")
        end if
    End Sub 'Page_Load


    Sub GetSession()
        UId = Trim(Session.Contents("UId"))
        UName = Trim(Session.Contents("UName"))
        UTel = Trim(Session.Contents("UTel"))
        UDep = Trim(Session.Contents("UDep"))
        USec = Trim(Session.Contents("USec"))
        ULoc = Trim(Session.Contents("ULoc"))
        UStatus = Trim(Session.Contents("UStatus"))

                  HisDept = Trim(Session.Contents("HDept"))
                  HisSection = Trim(Session.Contents("HSection"))
                  HisLocation = Trim(Session.Contents("HLocation"))
                  HisProject = Trim(Session.Contents("HProject"))
                  HisType = Trim(Session.Contents("HType"))

        RegNewSession()
    End Sub
              Sub ShowData()
                 Dataset1 = ReturnAll_SentAll(HisDept,HisSection,HisLocation,HisProject,HisType)
                 DataGrid1.DataSource = DataSet1
                 DataGrid1.DataBind
                 DataGrid1.Visible = True
               '  myDataBinding() 'User
              End Sub

              Sub sortDataGrid(o As Object , e As DataGridSortCommandEventArgs)
                   mySortDataBinding(e.SortExpression) 'Suport
              End Sub

              Sub mySortDataBinding(Optional sortExpr As String = "NO") 'User
                Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
                Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
                Dim queryString As String
                If dir_sort.Text = sortExpr Then
                    queryString = "SELECT [History].* FROM [History] WHERE (([History].[Dept] Like '%'+ @HisDept +'%') AND ([History"& _
         "].[Section] Like '%'+ @HisSection +'%') AND ([History].[Location] Like '%'+ @HisLocation +'%') AND ([History].[P"& _
         "roject] Like '%'+ @HisProject +'%') AND ([History].[Type] Like '%'+ @HisType +'%')) ORDER BY " & sortExpr &" DESC"
                    dir_sort.Text = ""
                Else
                    queryString = "SELECT [History].* FROM [History] WHERE (([History].[Dept] Like '%'+ @HisDept +'%') AND ([History"& _
         "].[Section] Like '%'+ @HisSection +'%') AND ([History].[Location] Like '%'+ @HisLocation +'%') AND ([History].[P"& _
         "roject] Like '%'+ @HisProject +'%') AND ([History].[Type] Like '%'+ @HisType +'%')) ORDER BY " & sortExpr &" ASC"
                    dir_sort.Text = sortExpr
                End If

                Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
                  dbCommand.CommandText = queryString
                  dbCommand.Connection = dbConnection

                  Dim dbParam_dept As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                  dbParam_dept.ParameterName = "@HisDept"
                  dbParam_dept.Value = HisDept
                  dbParam_dept.DbType = System.Data.DbType.String
                  dbCommand.Parameters.Add(dbParam_dept)
                  Dim dbParam_section As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                  dbParam_section.ParameterName = "@HisSection"
                  dbParam_section.Value = Hissection
                  dbParam_section.DbType = System.Data.DbType.String
                  dbCommand.Parameters.Add(dbParam_section)
                  Dim dbParam_location As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                  dbParam_location.ParameterName = "@HisLocation"
                  dbParam_location.Value = Hislocation
                  dbParam_location.DbType = System.Data.DbType.String
                  dbCommand.Parameters.Add(dbParam_location)
                  Dim dbParam_project As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                  dbParam_project.ParameterName = "@HisProject"
                  dbParam_project.Value = Hisproject
                  dbParam_project.DbType = System.Data.DbType.String
                  dbCommand.Parameters.Add(dbParam_project)
                  Dim dbParam_type As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                  dbParam_type.ParameterName = "@HisType"
                  dbParam_type.Value = Histype
                  dbParam_type.DbType = System.Data.DbType.String
                  dbCommand.Parameters.Add(dbParam_type)

                  Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
                  dataAdapter.SelectCommand = dbCommand
                  Dim dataSet As System.Data.DataSet = New System.Data.DataSet
                  dataAdapter.Fill(dataSet)
                DataGrid1.DataSource = DataSet
                DataGrid1.DataBind
                DataGrid1.Visible = True
        End Sub

              Sub pageDataGrid(o As Object, e As DataGridPageChangedEventArgs)
                  DataGrid1.CurrentPageIndex = e.NewPageIndex
                  'myDataBinding() 'User
                  ShowData()
              End Sub

              Sub MyDataGrid_Select(sender As Object, e As EventArgs)
                  Session("Reference") = DataGrid1.SelectedItem.Cells(0).Text
                  Response.Redirect("detail.aspx")
              End Sub

    Sub RegNewSession()
        Session("UId") = UId
        Session("UName") = UName
        Session("UTel") = UTel
        Session("UDep") = UDep
        Session("USec") = USec
        Session("ULoc") = ULoc
        Session.Contents("UStatus") = UStatus
        Session("SIDD") = Session.Contents("SIDD")

    End Sub

    Sub DataGrid_DeleteCommand(sender As Object, e As DataGridCommandEventArgs)
                  Dim aa As Integer
                  Dim ComName As String = DataGrid1.DataKeys(e.Item.ItemIndex)
                  aa = MyDeleteMethod(ComName)
                  Dataset1 = ReturnAll_SentAll(HisDept,HisSection,HisLocation,HisProject,HisType)
                 DataGrid1.DataSource = DataSet1
                 DataGrid1.DataBind
                 DataGrid1.Visible = True

              End Sub

    Sub DataGridEdit_Edit(Sender As Object, e As DataGridCommandEventArgs)
        Session("HComName") = DataGrid1.DataKeys(e.Item.ItemIndex)
        Session("HUpdate") = "true"
        Response.Redirect("edit_history.aspx")
    End Sub


    Function MyDeleteMethod(ByVal computerName As String) As Integer
        Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
        Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

        Dim queryString As String = "DELETE FROM [History] WHERE ([History].[ComputerName] = @ComputerName)"
        Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
        dbCommand.CommandText = queryString
        dbCommand.Connection = dbConnection

        Dim dbParam_computerName As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
        dbParam_computerName.ParameterName = "@ComputerName"
        dbParam_computerName.Value = computerName
        dbParam_computerName.DbType = System.Data.DbType.String
        dbCommand.Parameters.Add(dbParam_computerName)

        Dim rowsAffected As Integer = 0
        dbConnection.Open
        Try
            rowsAffected = dbCommand.ExecuteNonQuery
        Finally
            dbConnection.Close
        End Try

        Return rowsAffected
    End Function

              Function ReturnAll_SentAll(ByVal dept As String, ByVal section As String, ByVal location As String, ByVal project As String, ByVal type As String) As System.Data.DataSet
                  Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
                  Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

                 Dim queryString As String = "SELECT [History].* FROM [History] WHERE (([History].[Dept] Like '%'+ @Dept +'%') AND ([History"& _
         "].[Section] Like '%'+ @Section +'%') AND ([History].[Location] Like '%'+ @Location +'%') AND ([History].[P"& _
         "roject] Like '%'+ @Project +'%') AND ([History].[Type] Like '%'+ @Type +'%'))"
                  Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
                  dbCommand.CommandText = queryString
                  dbCommand.Connection = dbConnection

                  Dim dbParam_dept As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                  dbParam_dept.ParameterName = "@Dept"
                  dbParam_dept.Value = dept
                  dbParam_dept.DbType = System.Data.DbType.String
                  dbCommand.Parameters.Add(dbParam_dept)
                  Dim dbParam_section As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                  dbParam_section.ParameterName = "@Section"
                  dbParam_section.Value = section
                  dbParam_section.DbType = System.Data.DbType.String
                  dbCommand.Parameters.Add(dbParam_section)
                  Dim dbParam_location As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                  dbParam_location.ParameterName = "@Location"
                  dbParam_location.Value = location
                  dbParam_location.DbType = System.Data.DbType.String
                  dbCommand.Parameters.Add(dbParam_location)
                  Dim dbParam_project As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                  dbParam_project.ParameterName = "@Project"
                  dbParam_project.Value = project
                  dbParam_project.DbType = System.Data.DbType.String
                  dbCommand.Parameters.Add(dbParam_project)
                  Dim dbParam_type As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                  dbParam_type.ParameterName = "@Type"
                  dbParam_type.Value = type
                  dbParam_type.DbType = System.Data.DbType.String
                  dbCommand.Parameters.Add(dbParam_type)

                  Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
                  dataAdapter.SelectCommand = dbCommand
                  Dim dataSet As System.Data.DataSet = New System.Data.DataSet
                  dataAdapter.Fill(dataSet)

                  Return dataSet
              End Function

    'end sub in this page
    'my change
    Sub Requests()
            Dim A() AS String = {"New","Queuing","Pending","Complete","Borrow"}
            Dim r As New TableRow()
            Dim c As New TableCell()
            Dim d as New ImageButton()

            d.ID = "Req1"
            d.ImageUrl="images/requests/images01.gif"
            AddHandler d.Click, AddressOf Req_Click
            c.Controls.Add(d)
            r.Cells.Add(c)
            menu1.Rows.Add(r)

            Dim j As Integer
            For j = 0 To 4
            if (((Session.Contents("UStatus") <> "User") and j > 0) or (Session.Contents("UStatus") = "User")) then

                Dim r2 As New TableRow()
                Dim c2 As New TableCell()
                Dim d2 As New ImageButton()
                d2.ID = "Req0" & (j+1)
                d2.ImageUrl="images/requests/images0" + Mid(str(j+2),2) + ".gif"
                AddHandler d2.Click, AddressOf Me.All_Click
                c2.Controls.Add(d2)
                r2.Cells.Add(c2)
                menu1.Rows.Add(r2)

                Dim r21 As New TableRow()
                Dim c21 As New TableCell()
                Dim d21 As New Label()
                d21.ForeColor = White
                d21.Text = A(j)
                c21.Controls.Add(d21)
                r21.Cells.Add(c21)
                menu1.Rows.Add(r21)
            end if

            Next j

            Dim r3 As New TableRow()
            Dim c3 As New TableCell()
            Dim d3 as New ImageButton()
            d3.ID = "Sea1"
            d3.ImageUrl="images/requests/images07.gif"
            AddHandler d3.Click, AddressOf Sea_Click
            c3.Controls.Add(d3)
            r3.Cells.Add(c3)
            menu1.Rows.Add(r3)

            if (Session.Contents("UStatus") <> "User") then
                Dim r4 As New TableRow()
                Dim c4 As New TableCell()
                Dim d4 as New ImageButton()
                d4.ID = "His1"
                d4.ImageUrl="images/requests/images08.gif"
                AddHandler d4.Click, AddressOf His_Click
                c4.Controls.Add(d4)
                r4.Cells.Add(c4)
                menu1.Rows.Add(r4)
            end if

            if (UStatus = "User") then
                Dim r5 As New TableRow()
                Dim c5 As New TableCell()
                Dim d5 as New ImageButton()
                d5.ID = "Cost1"
                d5.ImageUrl="images/requests/images09.gif"
                AddHandler d5.Click, AddressOf Cost_Click
                c5.Controls.Add(d5)
                r5.Cells.Add(c5)
                menu1.Rows.Add(r5)
            end if

            Dim r6 As New TableRow()
                Dim c6 As New TableCell()
                Dim d6 as New ImageButton()
                d6.ID = "Edi1"
                d6.ImageUrl="images/requests/images10.gif"
                AddHandler d6.Click, AddressOf Edi_Click
                c6.Controls.Add(d6)
                r6.Cells.Add(c6)
                menu1.Rows.Add(r6)
     End Sub

     Sub Search()
            Dim A() AS String = {"Search History","Job","Cost"} '10
            Dim r As New TableRow()
            Dim c As New TableCell()
            Dim d as New ImageButton()

            d.ID = "Req2"
            d.ImageUrl="images/search/images01.gif"
            AddHandler d.Click, AddressOf Req_Click
            c.Controls.Add(d)
            r.Cells.Add(c)
            menu2.Rows.Add(r)

            Dim r3 As New TableRow()
            Dim c3 As New TableCell()
            Dim d3 as New ImageButton()
            d3.ID = "Sea2"
            d3.ImageUrl="images/search/images02.gif"
            AddHandler d3.Click, AddressOf Sea_Click
            c3.Controls.Add(d3)
            r3.Cells.Add(c3)
            menu2.Rows.Add(r3)

            Dim j As Integer
            For j = 0 To 2
                if (((Session.Contents("UStatus") = "User") and j < 2) or (Session.Contents("UStatus") <> "User")) then
                Dim r2 As New TableRow()
                Dim c2 As New TableCell()
                Dim d2 As New ImageButton()
                d2.ID = "Sea0" & (j+1)
                d2.ImageUrl="images/search/images0" + Mid(str(j+3),2) + ".gif"
                AddHandler d2.Click, AddressOf Me.All_Click
                c2.Controls.Add(d2)
                r2.Cells.Add(c2)
                menu2.Rows.Add(r2)

                Dim r21 As New TableRow()
                Dim c21 As New TableCell()
                Dim d21 As New Label()
                d21.ForeColor=White
                d21.Text = A(j)
                c21.Controls.Add(d21)
                r21.Cells.Add(c21)
                menu2.Rows.Add(r21)
                end if
            Next j
            if (UStatus <> "User") then
                Dim r4 As New TableRow()
                Dim c4 As New TableCell()
                Dim d4 as New ImageButton()
                d4.ID = "His2"
                d4.ImageUrl="images/search/images06.gif"
                AddHandler d4.Click, AddressOf His_Click
                c4.Controls.Add(d4)
                r4.Cells.Add(c4)
                menu2.Rows.Add(r4)
            end if
            if (UStatus = "User") then
                Dim r5 As New TableRow()
                Dim c5 As New TableCell()
                Dim d5 as New ImageButton()
                d5.ID = "Cost2"
                d5.ImageUrl="images/search/images07.gif"
                AddHandler d5.Click, AddressOf Cost_Click
                c5.Controls.Add(d5)
                r5.Cells.Add(c5)
                menu2.Rows.Add(r5)
            end if
            Dim r6 As New TableRow()
                Dim c6 As New TableCell()
                Dim d6 as New ImageButton()
                d6.ID = "Edi2"
                d6.ImageUrl="images/search/images08.gif"
                AddHandler d6.Click, AddressOf Edi_Click
                c6.Controls.Add(d6)
                r6.Cells.Add(c6)
                menu2.Rows.Add(r6)
        End Sub

        Sub History()
            if (Session.Contents("UStatus") <> "User") then
                Dim A() AS String = {"Add History","Edit History","Support Rep","Workstation"}
                Dim r As New TableRow()
                Dim c As New TableCell()
                Dim d as New ImageButton()

                d.ID = "Req3"
                d.ImageUrl="images/history/images01.gif"
                AddHandler d.Click, AddressOf Req_Click
                c.Controls.Add(d)
                r.Cells.Add(c)
                menu3.Rows.Add(r)

                Dim r3 As New TableRow()
                Dim c3 As New TableCell()
                Dim d3 as New ImageButton()
                d3.ID = "Sea3"
                d3.ImageUrl="images/history/images02.gif"
                AddHandler d3.Click, AddressOf Sea_Click
                c3.Controls.Add(d3)
                r3.Cells.Add(c3)
                menu3.Rows.Add(r3)

                Dim r4 As New TableRow()
                Dim c4 As New TableCell()
                Dim d4 as New ImageButton()
                d4.ID = "His3"
                d4.ImageUrl="images/history/images03.gif"
                AddHandler d4.Click, AddressOf His_Click
                c4.Controls.Add(d4)
                r4.Cells.Add(c4)
                menu3.Rows.Add(r4)

                Dim j As Integer
                For j = 0 To 1
                    Dim r2 As New TableRow()
                    Dim c2 As New TableCell()
                    Dim d2 As New ImageButton()
                    d2.ID = "His0" & (j+1)
                    d2.ImageUrl="images/history/images0" + Mid(str(j+4),2) + ".gif"
                    AddHandler d2.Click, AddressOf Me.All_Click
                    c2.Controls.Add(d2)
                    r2.Cells.Add(c2)
                    menu3.Rows.Add(r2)

                    Dim r21 As New TableRow()
                    Dim c21 As New TableCell()
                    Dim d21 As New Label()
                    d21.ForeColor=white
                    d21.Text = A(j)
                    c21.Controls.Add(d21)
                    r21.Cells.Add(c21)
                    menu3.Rows.Add(r21)
                Next j
            end if

            Dim r6 As New TableRow()
                Dim c6 As New TableCell()
                Dim d6 as New ImageButton()
                d6.ID = "His03"
                d6.ImageUrl="images/search/images03.gif"
                AddHandler d6.Click, AddressOf Me.All_Click
                c6.Controls.Add(d6)
                r6.Cells.Add(c6)
                menu3.Rows.Add(r6)

                Dim r22 As New TableRow()
                    Dim c22 As New TableCell()
                    Dim d22 As New Label()
                    d22.ForeColor=white
                    d22.Text = "Search History"
                    c22.Controls.Add(d22)
                    r22.Cells.Add(c22)
                    menu3.Rows.Add(r22)

            Dim r5 As New TableRow()
                Dim c5 As New TableCell()
                Dim d5 as New ImageButton()
                d5.ID = "Edi3"
                d5.ImageUrl="images/history/images09.gif"
                AddHandler d5.Click, AddressOf Edi_Click
                c5.Controls.Add(d5)
                r5.Cells.Add(c5)
                menu3.Rows.Add(r5)
        End Sub

        Sub edit()
            if (Session.Contents("UStatus") <> "User") then
                Dim A() AS String = {"Administator","User","Control panal","User Info"}
                Dim r As New TableRow()
                Dim c As New TableCell()
                Dim d as New ImageButton()

                d.ID = "Req4"
                d.ImageUrl="images/edit/images01.gif"
                AddHandler d.Click, AddressOf Req_Click
                c.Controls.Add(d)
                r.Cells.Add(c)
                menu4.Rows.Add(r)

                Dim r3 As New TableRow()
                Dim c3 As New TableCell()
                Dim d3 as New ImageButton()
                d3.ID = "Sea4"
                d3.ImageUrl="images/edit/images02.gif"
                AddHandler d3.Click, AddressOf Sea_Click
                c3.Controls.Add(d3)
                r3.Cells.Add(c3)
                menu4.Rows.Add(r3)

                Dim r4 As New TableRow()
                Dim c4 As New TableCell()
                Dim d4 as New ImageButton()
                d4.ID = "His4"
                d4.ImageUrl="images/edit/images03.gif"
                AddHandler d4.Click, AddressOf His_Click
                c4.Controls.Add(d4)
                r4.Cells.Add(c4)
                menu4.Rows.Add(r4)

                Dim r5 As New TableRow()
                Dim c5 As New TableCell()
                Dim d5 as New ImageButton()
                d5.ID = "Edi4"
                d5.ImageUrl="images/edit/images04.gif"
                AddHandler d5.Click, AddressOf Edi_Click
                c5.Controls.Add(d5)
                r5.Cells.Add(c5)
                menu4.Rows.Add(r5)

                if (Session.Contents("UStatus") = "Admin") then
                    Dim r2 As New TableRow()
                    Dim c2 As New TableCell()
                    Dim d2 As New ImageButton()

                    d2.ID = "Edi01"
                    d2.ImageUrl="images/edit/images05.gif"
                    AddHandler d2.Click, AddressOf Me.All_Click
                    c2.Controls.Add(d2)
                    r2.Cells.Add(c2)
                    menu4.Rows.Add(r2)

                    Dim r21 As New TableRow()
                    Dim c21 As New TableCell()
                    Dim d21 As New Label()
                    d21.ForeColor=white
                    d21.Text = A(0)
                    c21.Controls.Add(d21)
                    r21.Cells.Add(c21)
                    menu4.Rows.Add(r21)
                 end if


                Dim j As Integer
                For j = 0 To 1
                    Dim r2 As New TableRow()
                    Dim c2 As New TableCell()
                    Dim d2 As New ImageButton()
                    d2.ID = "Edi0" & (j+2)
                    d2.ImageUrl="images/edit/images0" + Mid(str(j+6),2) + ".gif"
                    AddHandler d2.Click, AddressOf Me.All_Click
                    c2.Controls.Add(d2)
                    r2.Cells.Add(c2)
                    menu4.Rows.Add(r2)

                    Dim r21 As New TableRow()
                    Dim c21 As New TableCell()
                    Dim d21 As New Label()
                    d21.ForeColor=white
                    d21.Text = A(j+1)
                    c21.Controls.Add(d21)
                    r21.Cells.Add(c21)
                    menu4.Rows.Add(r21)
                Next j


            end if
        End Sub

        Sub Cost_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
            Response.Redirect("usermodify.aspx") 'new.aspx
        End Sub

        Sub Req_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
            menu2.Visible = false
            menu3.Visible = false
            menu1.Visible = true
            menu4.Visible = false
        End Sub

        Sub Sea_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
            menu1.Visible = false
            menu3.Visible = false
            menu2.Visible = true
            menu4.Visible = false
        End Sub

        Sub His_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
            menu1.Visible = false
            menu2.Visible = false
            menu3.Visible = true
            menu4.Visible = false
        End Sub

        Sub Edi_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
            menu1.Visible = false
            menu2.Visible = false
            menu3.Visible = false
            menu4.Visible = true
        End Sub

        ' My function
        Sub All_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)

            'MsgBox(Sender.ID)
            if (Sender.ID = "Req01") then
                Response.Redirect("request01.aspx") 'new.aspx
            else if (Sender.ID = "Req02") then
                Response.Redirect("request02.aspx") 'showalarm.aspx
            else if (Sender.ID = "Req03") then
                Response.Redirect("request03.aspx")
            else if (Sender.ID = "Req04") then
                Response.Redirect("request04.aspx")
            else if (Sender.ID = "Req05") then
                Response.Redirect("request05.aspx")
            end if

            'Sea
            if (Sender.ID = "Sea01") then
                Response.Redirect("search01.aspx")
            else if (Sender.ID = "Sea02") then
                Response.Redirect("search02.aspx")
            else if (Sender.ID = "Sea03") then
                Response.Redirect("search03.aspx")
            end if

            if (Sender.ID = "His01") then
                Response.Redirect("history01.aspx")
            else if (Sender.ID = "His02") then
                Response.Redirect("history02.aspx")
            else if (Sender.ID = "His03") then
                Response.Redirect("history03x.aspx")
            else if (Sender.ID = "His04") then
                Response.Redirect("history04.aspx")
            end if

            if (Sender.ID = "Edi01") then
                Response.Redirect("edit01.aspx")
            else if (Sender.ID = "Edi02") then
                Response.Redirect("edit02.aspx")
            else if (Sender.ID = "Edi03") then
                Response.Redirect("edit03.aspx")
            end if

        End Sub

    Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs)
        Response.Redirect("default.aspx")
    End Sub

    ' MY Change

</script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>ESSILOR MANUFACTURING (THAILAND) CO., LTD.</title>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
    <style type="text/css">BODY {
	MARGIN: 2px
}
BODY {
	FONT-SIZE: 12px; FONT-FAMILY: Times New Roman, Times, serif
}
TD {
	FONT-SIZE: 12px; FONT-FAMILY: Times New Roman, Times, serif
}
TH {
	FONT-SIZE: 12px; FONT-FAMILY: Times New Roman, Times, serif
}
A {
	FONT-SIZE: 12px; COLOR: #0066ff; FONT-FAMILY: Courier New, Courier, mono
}
A:link {
	TEXT-DECORATION: none
}
A:visited {
	COLOR: #0066ff; TEXT-DECORATION: none
}
A:hover {
	COLOR: #0066ff; TEXT-DECORATION: none
}
A:active {
	COLOR: #0066ff; TEXT-DECORATION: none
}
.style2 {
	COLOR: #ffffff
}
</style>
</head>
<body>
    <center><asp:Label id="Label1" runat="server" visible="false"></asp:Label><asp:Label id="Label2" runat="server" visible="false"></asp:Label><asp:Label id="dir_sort" runat="server" visible="false"></asp:Label>
        <form name="form1" action="" method="post" runat="server">
            <table style="WIDTH: 990px; HEIGHT: 490px" bordercolor="#000000" height="490" cellspacing="1" cellpadding="1" width="990" border="1">
                <tbody>
                    <tr>
                        <td colspan="2" height="65">
                            <table style="WIDTH: 603px; HEIGHT: 65px" cellspacing="0" cellpadding="0" width="603" border="0">
                                <tbody>
                                    <tr>
                                        <td width="95" height="65" rowspan="2">
                                            <img height="65" src="images/logo/images01.gif" width="95" /></td>
                                        <td width="600" background="images/bgheader_admin.gif" height="45">
                                            <p align="center">
                                                <span class="style1"><font color="#ffffff"><span class="style1"><font color="red" size="4"><font face="Comic Sans MS"><font color="yellow" size="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Essilor Manufacturing (Thailand)
                                                co.,ltd.<br />
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                &nbsp; MIS Section</font>&nbsp;</font></font></span></font></span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="600" background="images/bgheader_admin.gif" height="20">
                                            <table height="20" cellspacing="0" cellpadding="0" width="883" border="1">
                                                <tbody>
                                                    <tr>
                                                        <td align="left" width="150">
                                                            &nbsp;<font face="Comic Sans MS" color="yellow">Select Edit History</font></td>
                                                        <td align="middle" width="400">
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label id="due" runat="server" forecolor="Yellow" font-names="Comic Sans MS"></asp:Label></td>
                                                        <td align="right" width="120" colspan="2">
                                                            <asp:Label id="showUser" runat="server" forecolor="Yellow" font-names="Comic Sans MS"></asp:Label>&nbsp;</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="middle" width="95" bgcolor="#1f1fe2" height="370">
                            <asp:table id="menu1" runat="server" visible="false" BackColor="#1F1FE2" CellSpacing="0" CellPadding="0" Border="0" Width="95"></asp:table>
                            <asp:table id="menu2" runat="server" visible="false" BackColor="#1F1FE2" CellSpacing="0" CellPadding="0" Border="0" Width="95"></asp:table>
                            <asp:table id="menu3" runat="server" visible="false" BackColor="#1F1FE2" CellSpacing="0" CellPadding="0" Border="0" Width="95"></asp:table>
                            <asp:table id="menu4" runat="server" visible="false" BackColor="#1F1FE2" CellSpacing="0" CellPadding="0" Border="0" Width="95"></asp:table>
                            <hr />
                            <asp:ImageButton id="ImageButton1" onclick="ImageButton1_Click" runat="server" Width="37px" AlternateText="Logout" src="images/commond/images03.gif" Height="33px"></asp:ImageButton>
                            <br />
                            <font face="Comic Sans MS" color="#ffff00">Logout</font>
                        </td>
                        <td valign="top" align="middle" width="673" height="370">
                            <p>
                                <asp:DataGrid id="DataGrid1" runat="server" Width="882px" OnEditCommand="DataGridEdit_Edit" DataKeyField="ComputerName" OnDeleteCommand="DataGrid_DeleteCommand" BorderColor="#999999" AutoGenerateColumns="False" AllowSorting="True" OnSortCommand="sortDataGrid" AllowPaging="True" PageSize="15" OnPageIndexChanged="pageDataGrid" OnSelectedIndexChanged="MyDataGrid_Select">
                                    <SelectedItemStyle backcolor="Yellow"></SelectedItemStyle>
                                    <HeaderStyle backcolor="#DDDDDD"></HeaderStyle>
                                    <Columns>
                                        <asp:ButtonColumn Text="Delete" CommandName="Delete"></asp:ButtonColumn>
                                        <asp:EditCommandColumn ButtonType="LinkButton" UpdateText="" CancelText="" EditText="Edit"></asp:EditCommandColumn>
                                        <asp:BoundColumn DataField="NO" SortExpression="NO" HeaderText="NO">
                                            <HeaderStyle width="1cm"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="ComputerName" SortExpression="ComputerName" HeaderText="ComputerName">
                                            <HeaderStyle width="6.2cm"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="User" SortExpression="User" HeaderText="User">
                                            <HeaderStyle width="3cm"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="Type" SortExpression="Type" HeaderText=" Type">
                                            <HeaderStyle width="1.8cm"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="Dept" SortExpression="Dept" HeaderText=" Dept">
                                            <HeaderStyle width="1.9cm"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="Section" SortExpression="Section" HeaderText="Section"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="Location" SortExpression="Location" HeaderText="Location"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="Project" SortExpression="Project" HeaderText="Project"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="OS" SortExpression="OS" HeaderText="OS"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="Model" SortExpression="Model" HeaderText="Model"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="CPU" SortExpression="CPU" HeaderText="CPU"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="RAM" SortExpression="RAM" HeaderText="RAM"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="HDD" SortExpression="HDD" HeaderText="HDD"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="Service" SortExpression="Service" HeaderText="Service"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="Remark" SortExpression="Remark" HeaderText="Remark"></asp:BoundColumn>
                                    </Columns>
                                    <PagerStyle horizontalalign="Right" mode="NumericPages"></PagerStyle>
                                </asp:DataGrid>
                            </p>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </center>
</body>
</html>
