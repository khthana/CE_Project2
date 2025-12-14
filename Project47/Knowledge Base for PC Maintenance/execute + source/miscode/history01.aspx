<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Drawing.Color" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.OleDb" %>
<%@ import Namespace="System.Data.Odbc" %>
<%@ import Namespace="System.Data.SqlClient" %>
<script runat="server">

    dim UName ,UId ,UTel ,UDep ,USec ,ULoc ,UStatus
         Dim UserName, UserId, UDepart, UEmail, ReqName
         Dim Dataset1

         Sub Page_Load(sender As Object, e As EventArgs)
             if (Session.Contents("SIDD") = Session.SessionID) then
                 ShowDropDown()

                 GetSession()
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

    Sub ShowDropDown()
             'Session("HComName") = "Com"

             DataSet1 = ReturnDept()
             Dim n1 As Integer = DataSet1.tables(0).Rows.Count()
             Dim i As integer
             for i = 0 To  n1 - 1
                 DropDownDept.Items.Add(DataSet1.Tables(0).Rows(i)(0))
             Next i

             DataSet1 = ReturnSection()
             n1 = DataSet1.tables(0).Rows.Count()
             for i = 0 To  n1 - 1
                 DropDownSection.Items.Add(DataSet1.Tables(0).Rows(i)(0))
             Next i

             DataSet1 = ReturnLocation()
             n1 = DataSet1.tables(0).Rows.Count()
             for i = 0 To  n1 - 1
                 DropDownLocation.Items.Add(DataSet1.Tables(0).Rows(i)(0))
             Next i

         End Sub
         Sub GetSession()
             UId = Trim(Session.Contents("UId"))
             UName = Trim(Session.Contents("UName"))
             UTel = Trim(Session.Contents("UTel"))
             UDep = Trim(Session.Contents("UDep"))
             USec = Trim(Session.Contents("USec"))
             ULoc = Trim(Session.Contents("ULoc"))
             UStatus = Trim(Session.Contents("UStatus"))

             RegNewSession()
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

             Session("HComName") = TextName.text
         End Sub

    Function ReturnDept() As System.Data.DataSet
        Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
        Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

        Dim queryString As String = "SELECT [T_Department].[Department] FROM [T_Department]"
        Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
        dbCommand.CommandText = queryString
        dbCommand.Connection = dbConnection

        Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
        dataAdapter.SelectCommand = dbCommand
        Dim dataSet As System.Data.DataSet = New System.Data.DataSet
        dataAdapter.Fill(dataSet)

        Return dataSet
    End Function


    Function ReturnSection() As System.Data.DataSet
        Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
        Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

        Dim queryString As String = "SELECT [T_Section].[Section] FROM [T_Section]"
        Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
        dbCommand.CommandText = queryString
        dbCommand.Connection = dbConnection

        Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
        dataAdapter.SelectCommand = dbCommand
        Dim dataSet As System.Data.DataSet = New System.Data.DataSet
        dataAdapter.Fill(dataSet)

        Return dataSet
    End Function

    Function ReturnLocation() As System.Data.DataSet
        Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
        Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

        Dim queryString As String = "SELECT [T_Location].[Location] FROM [T_Location]"
        Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
        dbCommand.CommandText = queryString
        dbCommand.Connection = dbConnection

        Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
        dataAdapter.SelectCommand = dbCommand
        Dim dataSet As System.Data.DataSet = New System.Data.DataSet
        dataAdapter.Fill(dataSet)

        Return dataSet
    End Function






        Function ADD_ALL(ByVal computerName As String, ByVal user As String, ByVal type As String, ByVal dept As String, ByVal section As String, ByVal location As String, ByVal project As String, ByVal oS As String, ByVal model As String, ByVal cPU As String, ByVal rAM As String, ByVal hDD As String, ByVal service As String, ByVal remark As String) As Integer
                Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
                Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

               Dim queryString As String = "INSERT INTO [History] ([ComputerName], [User], [Type], [Dept], [Section], [Locati"& _
        "on], [Project], [OS], [Model], [CPU], [RAM], [HDD], [Service], [Remark]) VALUES "& _
        "(@ComputerName, @User, @Type, @Dept, @Section, @Location, @Project, @OS, @Model,"& _
        " @CPU, @RAM, @HDD, @Service, @Remark)"
                Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
                dbCommand.CommandText = queryString
                dbCommand.Connection = dbConnection

                Dim dbParam_computerName As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                dbParam_computerName.ParameterName = "@ComputerName"
                dbParam_computerName.Value = computerName
                dbParam_computerName.DbType = System.Data.DbType.String
                dbCommand.Parameters.Add(dbParam_computerName)
                Dim dbParam_user As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                dbParam_user.ParameterName = "@User"
                dbParam_user.Value = user
                dbParam_user.DbType = System.Data.DbType.String
                dbCommand.Parameters.Add(dbParam_user)
                Dim dbParam_type As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                dbParam_type.ParameterName = "@Type"
                dbParam_type.Value = type
                dbParam_type.DbType = System.Data.DbType.String
                dbCommand.Parameters.Add(dbParam_type)
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
                Dim dbParam_oS As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                dbParam_oS.ParameterName = "@OS"
                dbParam_oS.Value = oS
                dbParam_oS.DbType = System.Data.DbType.String
                dbCommand.Parameters.Add(dbParam_oS)
                Dim dbParam_model As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                dbParam_model.ParameterName = "@Model"
                dbParam_model.Value = model
                dbParam_model.DbType = System.Data.DbType.String
                dbCommand.Parameters.Add(dbParam_model)
                Dim dbParam_cPU As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                dbParam_cPU.ParameterName = "@CPU"
                dbParam_cPU.Value = cPU
                dbParam_cPU.DbType = System.Data.DbType.String
                dbCommand.Parameters.Add(dbParam_cPU)
                Dim dbParam_rAM As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                dbParam_rAM.ParameterName = "@RAM"
                dbParam_rAM.Value = rAM
                dbParam_rAM.DbType = System.Data.DbType.String
                dbCommand.Parameters.Add(dbParam_rAM)
                Dim dbParam_hDD As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                dbParam_hDD.ParameterName = "@HDD"
                dbParam_hDD.Value = hDD
                dbParam_hDD.DbType = System.Data.DbType.String
                dbCommand.Parameters.Add(dbParam_hDD)
                Dim dbParam_service As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                dbParam_service.ParameterName = "@Service"
                dbParam_service.Value = service
                dbParam_service.DbType = System.Data.DbType.String
                dbCommand.Parameters.Add(dbParam_service)
                Dim dbParam_remark As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                dbParam_remark.ParameterName = "@Remark"
                dbParam_remark.Value = remark
                dbParam_remark.DbType = System.Data.DbType.String
                dbCommand.Parameters.Add(dbParam_remark)

                Dim rowsAffected As Integer = 0
                dbConnection.Open
                Try
                    rowsAffected = dbCommand.ExecuteNonQuery
                Finally
                    dbConnection.Close
                End Try

                Return rowsAffected
            End Function


            Function ReturnAll_SentName(ByVal computerName As String) As System.Data.DataSet
                Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
                Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

                 Dim queryString As String = "SELECT [History].* FROM [History] WHERE ([History].[ComputerName] = @ComputerName"& _
        ")"
                Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
                dbCommand.CommandText = queryString
                dbCommand.Connection = dbConnection

                Dim dbParam_computerName As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                dbParam_computerName.ParameterName = "@ComputerName"
                dbParam_computerName.Value = computerName
                dbParam_computerName.DbType = System.Data.DbType.String
                dbCommand.Parameters.Add(dbParam_computerName)

                Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
                dataAdapter.SelectCommand = dbCommand
                Dim dataSet As System.Data.DataSet = New System.Data.DataSet
                dataAdapter.Fill(dataSet)

                Return dataSet
            End Function

    Sub Button1_Click(sender As Object, e As EventArgs)
            Dim aa As integer
            Dataset1 = ReturnAll_SentName(TextName.text)
            if(DataSet1.tables(0).Rows.Count() = 0) then
                if(TextName.text = "") then
                    Label3.visible = true
                else
                    aa = ADD_ALL(TextName.text,TextUser.text,TextType.text,DropDownDept.SelectedItem.Value,DropDownSection.SelectedItem.Value,DropDownLocation.SelectedItem.Value,TextProject.text,TextOS.text,TextModel.text,TextCPU.text,TextRAM.text,TextHDD.text,TextService.text,TextRemark.text)
                    Response.Redirect("show_add.aspx")
                end if
            Else
                Label3.visible = true
            End if
    End Sub
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
            <table bordercolor="#000000" height="450" cellspacing="1" cellpadding="1" width="775" border="1">
                <tbody>
                    <tr>
                        <td colspan="2" height="65">
                            <table cellspacing="0" cellpadding="0" width="700" border="0">
                                <tbody>
                                    <tr>
                                        <td width="95" height="65" rowspan="2">
                                            <img height="65" src="images/logo/images01.gif" width="95" /></td>
                                        <td width="673" background="images/bgheader_admin.gif" height="45">
                                            <span class="style1"><font color="#ffffff"><span class="style1"><font color="red" size="4"><font face="Comic Sans MS"><font color="yellow" size="4">Essilor
                                            Manufacturing (Thailand) co.,ltd.<br />
                                            MIS Section</font>&nbsp;</font></font></span></font></span></td>
                                    </tr>
                                    <tr>
                                        <td width="673" background="images/bgheader_admin.gif" height="20">
                                            <table style="WIDTH: 673px; HEIGHT: 20px" height="20" cellspacing="0" cellpadding="0" width="673" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td align="left" width="150">
                                                            <font face="Comic Sans MS" color="yellow" size="2">Add History</font></td>
                                                        <td align="middle">
                                                            <asp:Label id="due" runat="server" forecolor="Yellow" font-names="Comic Sans MS"></asp:Label></td>
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
                            </p>
                            <p>
                            </p>
                            <p>
                            </p>
                            <p>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </p>
                            <p>
                                <table style="WIDTH: 595px; HEIGHT: 284px">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <asp:Label id="ComName" runat="server" forecolor="Black">Computer Name :</asp:Label></td>
                                            <td>
                                                <asp:TextBox id="TextName" runat="server" Width="200px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label id="Project" runat="server" forecolor="Black">Project :</asp:Label></td>
                                            <td>
                                                <asp:TextBox id="TextProject" runat="server" Width="200px"></asp:TextBox>
                                                &nbsp;&nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label id="User" runat="server" forecolor="Black">User :</asp:Label></td>
                                            <td>
                                                <asp:TextBox id="TextUser" runat="server" Width="200px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label id="Type" runat="server" forecolor="Black">Type :</asp:Label></td>
                                            <td>
                                                <asp:TextBox id="TextType" runat="server" Width="200px"></asp:TextBox>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label id="Dept" runat="server" forecolor="Black">Dept :</asp:Label></td>
                                            <td>
                                                <asp:DropDownList id="DropDownDept" runat="server" Width="200px"></asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:Label id="Label6" runat="server" forecolor="Black">OS :</asp:Label></td>
                                            <td>
                                                <asp:TextBox id="TextOS" runat="server" Width="200px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label id="Section" runat="server" forecolor="Black">Section :</asp:Label></td>
                                            <td>
                                                <asp:DropDownList id="DropDownSection" runat="server" Width="200px"></asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:Label id="Model" runat="server" forecolor="Black">Model :</asp:Label></td>
                                            <td>
                                                <asp:TextBox id="TextModel" runat="server" Width="200px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;<asp:Label id="Location" runat="server" forecolor="Black">Location :</asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList id="DropDownLocation" runat="server" Width="200px"></asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:Label id="CPU" runat="server" forecolor="Black">CPU :</asp:Label></td>
                                            <td>
                                                <asp:TextBox id="TextCPU" runat="server" Width="200px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label id="HDD" runat="server" forecolor="Black">HDD :</asp:Label></td>
                                            <td>
                                                <asp:TextBox id="TextHDD" runat="server" Width="200px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label id="RAM" runat="server" forecolor="Black">RAM :</asp:Label></td>
                                            <td>
                                                <asp:TextBox id="TextRAM" runat="server" Width="200px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label id="Remark" runat="server" forecolor="Black">Remark :</asp:Label></td>
                                            <td>
                                                <asp:TextBox id="TextRemark" runat="server" Width="200px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label id="Service" runat="server" forecolor="Black">Service :</asp:Label></td>
                                            <td>
                                                <asp:TextBox id="TextService" runat="server" Width="200px"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </p>
                            <p>
                                <span><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label id="Label3" runat="server" visible="False" forecolor="Red">Invalid
                                Computer Name</asp:Label></label></span>&nbsp;
                            </p>
                            <p>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button id="Button1" onclick="Button1_Click" runat="server" Text="Summit"></asp:Button>
                            </p>
                            <p>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;
                            </p>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </center>
</body>
</html>
