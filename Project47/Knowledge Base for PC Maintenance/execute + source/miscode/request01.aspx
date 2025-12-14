<%@ Page Language="VB" ContentType="text/html" Debug="true" %>
<%@ import Namespace="System.Drawing.Color" %>
<%@ import Namespace="System.Web.Mail" %>
<%@ import Namespace="System.IO" %>
<%@ import Namespace="System.Data" %>
<script runat="server">

    dim UName ,UId ,UTel ,UDep ,USec ,ULoc,UStatus


    sub page_Init()
        GetSession()
        QueryAllMachine()
        QueryAllLocationat()
    end sub

    Sub Page_Load(sender As Object, e As EventArgs)
       if (Session.Contents("SIDD") = Session.SessionID) then
            Requests()
            Search()
            History()
            menu1.visible = true
            menu2.visible = false
            menu3.visible = false
            Requester.Text = UName
            ShowUser.Text = UName
            Telephone.Text = UTel
            TextBoxDep.Text = UDep
            TextBoxSec.Text = USec
            TextBoxLoc.Text = ULoc
            due.text = Format(today, "dddd d MMMM yyyy")
        if(Borrow.Checked) Then
            RadioHard.Enabled = "False"
            RadioSoft.Enabled = "False"
            RadioNet.Enabled = "False"
            DropDownMac.Enabled = "False"
            TextBoxWor.Enabled = "False"
        Else
            RadioHard.Enabled = "True"
            RadioSoft.Enabled = "True"
            RadioNet.Enabled = "True"
            DropDownMac.Enabled = "True"
            TextBoxWor.Enabled = "True"
         End If
       else
            Response.Redirect("default.aspx")
       end if
    End Sub 'Page_Load

    Sub GetSession()
        UId     = Trim(Session.Contents("UId"))
        UName   = Trim(Session.Contents("UName"))
        UTel    = Trim(Session.Contents("UTel"))
        UDep    = Trim(Session.Contents("UDep"))
        USec    = Trim(Session.Contents("USec"))
        ULoc    = Trim(Session.Contents("ULoc"))
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
        Session("UStatus") = UStatus
        Session("SIDD") = Session.Contents("SIDD")
    End Sub

    sub QueryAllLocationat()
            Locationat.Items.Clear()
            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String = "SELECT Location_ID,Location FROM [T_Location]"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            while(dataReader.Read())
                Locationat.Items.Add(New ListItem(Trim(dataReader.GetString(1)), Trim(dataReader.GetInt32(0).ToString())))
            end while
            dbConnection.Close
    end sub
    sub QueryAllMachine()
            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String = "SELECT Machine_ID,Machine FROM T_Machine WHERE Machine_ID > 0"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            while(dataReader.Read())
                DropDownMac.Items.Add(New ListItem(Trim(dataReader.GetString(1)), Trim(dataReader.GetInt32(0).ToString())))
            end while

    end sub

    Sub ButtonSave_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
        If Title.Text = "" Then
            Label3.text =  "Please enter a title for this request"
        Else If Detail.Text = "" Then
            Label3.text =  "Please enter a Detail for this request"
        Else
            UserInsert()
            label2.Text =""
            Title.Text =""
            Detail.Text=""
            TextBoxWor.Text=""
            Telephone.Text = ""
        End If
    End Sub

    Sub SaveMe_Click(sender As Object, e As EventArgs)'Button Save


        If Title.Text = "" Then
            Label3.text =  "Please enter a title for this request"
        Else If Detail.Text = "" Then
            Label3.text =  "Please enter a Detail for this request"
        Else if (TextBoxWor.Text = "") and (Borrow.Checked = false) then
            Label3.text =  "Please enter a Workstation for this request"
        Else
            UserInsert()
            label2.Text =""
            Title.Text =""
            Detail.Text=""
            TextBoxWor.Text=""
            Telephone.Text = ""
            Label3.text = ""
        End If


    End Sub


        Function ReturnEmailMisAdmin(ByVal status As String, ByVal email As String) As System.Data.DataSet
            Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String = "SELECT [T_Users].[Email] FROM [T_Users] WHERE (([T_Users].[Status] = @Status) OR "& _
    "([T_Users].[Status] = @Email))"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection

            Dim dbParam_status As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
            dbParam_status.ParameterName = "@Status"
            dbParam_status.Value = status
            dbParam_status.DbType = System.Data.DbType.String
            dbCommand.Parameters.Add(dbParam_status)
            Dim dbParam_email As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
            dbParam_email.ParameterName = "@Email"
            dbParam_email.Value = email
            dbParam_email.DbType = System.Data.DbType.String
            dbCommand.Parameters.Add(dbParam_email)

            Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
            dataAdapter.SelectCommand = dbCommand
            Dim dataSet As System.Data.DataSet = New System.Data.DataSet
            dataAdapter.Fill(dataSet)

            Return dataSet
        End Function

        Function ReturnEmail_SentID(ByVal user_ID As Integer) As System.Data.DataSet
            Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String = "SELECT [T_Users].[Email] FROM [T_Users] WHERE ([T_Users].[User_ID] = @User_ID)"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection

            Dim dbParam_user_ID As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
            dbParam_user_ID.ParameterName = "@User_ID"
            dbParam_user_ID.Value = user_ID
            dbParam_user_ID.DbType = System.Data.DbType.Int32
            dbCommand.Parameters.Add(dbParam_user_ID)

            Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
            dataAdapter.SelectCommand = dbCommand
            Dim dataSet As System.Data.DataSet = New System.Data.DataSet
            dataAdapter.Fill(dataSet)

            Return dataSet
        End Function

    Function UserInsert()
            Dim dataReader As System.Data.IDataReader = QueryMaxRef()
            Dim MaxRef as Integer
            MaxRef = 0
            dataReader.Read()
            try
                MaxRef = dataReader.GetInt32(0)
            catch ex As Exception
                MaxRef = 0
            Finally
                MaxRef = MaxRef+1
                myDate.Text = Now
                Dim myDateTime
                if Day(ToDay)< 9 Then
                    myDateTime = Year(ToDay) & Month(ToDay) & "0" & Day(ToDay)
                End If
                if Month(ToDay)< 9 Then
                    myDateTime = Year(ToDay)& "0" & Month(ToDay) & Day(ToDay)
                End If
                if Month(ToDay)< 9 AND Day(ToDay) < 9 Then
                    myDateTime = Year(ToDay) & "0" & Month(ToDay) & "0" & Day(ToDay)
                End If
                            'msgbox(MaxRef)
                Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
                Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
                Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
                Dim queryString As String
                Dim ProbString As String

                If(Borrow.Checked) Then
                    queryString = "INSERT INTO T_Request (Request_ID, User_ID, Priority,Problem, Machine_ID, ComputerNumber, Title, Detail, Dates, Times, Status, Type) " & _
                                  "VALUES (" & MaxRef & "," & UId & ",'" & piority.SelectedItem.Text & "','NULL',0,'NULL',@Title," & _
                                  "@Detail," & myDateTime & ",'" + Format(Now,"dd/MM/yyyy hh:mm:ss") + "','Borrow','Borrow')"


                    'msgbox(queryString)
                'xxx
                Else
                    If(RadioHard.Checked) Then
                        ProbString += "Hardware"
                    Else If (RadioSoft.Checked) Then
                        ProbString += "Software"
                    Else If (RadioNet.Checked) Then
                        ProbString += "Network"
                    End If
                    queryString = "INSERT INTO T_Request (Request_ID, User_ID, Priority, Problem, Machine_ID, ComputerNumber, Title, Detail, Dates, Times, Status, Type,Location_Req) " & _
                                  "VALUES (" & MaxRef & "," & UId & ",'" & piority.SelectedItem.Text & "','" + ProbString + "',"+DropDownMac.SelectedItem.Value+",@War,@Title," & _
                                  "@Detail," & myDateTime & ",'" + Format(Now,"dd/MM/yyyy hh:mm:ss") + "','Queuing','Normal','" & Locationat.SelectedItem.Text & "')"
                    Dim dbParam_War As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                    dbParam_War.ParameterName = "@War"
                    dbParam_War.Value = UCase(TextBoxWor.Text)
                    dbParam_War.DbType = System.Data.DbType.String
                    dbCommand.Parameters.Add(dbParam_War)

                End If
                'msgbox(queryString)
                    Dim dbParam_Title As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                    dbParam_Title.ParameterName = "@Title"
                    dbParam_Title.Value = Title.Text
                    dbParam_Title.DbType = System.Data.DbType.String
                    dbCommand.Parameters.Add(dbParam_Title)
                    Dim dbParam_Detail As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                    dbParam_Detail.ParameterName = "@Detail"
                    dbParam_Detail.Value = Detail.Text
                    dbParam_Detail.DbType = System.Data.DbType.String
                    dbCommand.Parameters.Add(dbParam_Detail)
                dbCommand.CommandText = queryString
                dbCommand.Connection = dbConnection

                Dim rowsAffected As Integer = 0
                dbConnection.Open
                Try
                    rowsAffected = dbCommand.ExecuteNonQuery
                Finally
                    dbConnection.Close
                    'MsgBox("Request ID#  " + label1.Text, 0, "Information Message")
                    ' mail

                    Dim DataSet As Dataset
                    DataSet = ReturnEmail_SentID(UId)
                    Dim MailFrom = DataSet.Tables(0).Rows(0)(0)
                    DataSet = ReturnEmailMisAdmin("Admin","MIS")
                    Dim n As Integer = DataSet.tables(0).Rows.Count()
                    'Dim tmpRef As variant = MaxRef
                    Dim mail As New MailMessage()
                    Dim MailTo
                    Dim i
                    For i = 0 To n - 1
                        MailTo = DataSet.Tables(0).Rows(i)(0)
                        mail.To = MailTo
                        mail.From = MailFrom
                        mail.Subject = "New MIS Job Order : Piority " + piority.SelectedItem.Text + ", Section " + USec
                        If(Borrow.Checked) Then
                       mail.Subject = "New MIS JobOrder # "+CStr(MaxRef)+" Borrow : " + piority.SelectedItem.Text + ", Section " + USec
                            mail.Body = "Pls. Check Job order system!! New job coming" + vbCrLf  & _
                                        "Job order No#  " + CStr(MaxRef) + vbCrLf  & _
                                        "Priority     : " + piority.SelectedItem.Text + vbCrLf  & _
                                        "Date         : " + Format(Now,"dd/MM/yyyy hh:mm:ss") + vbCrLf  & _
                                        "Name         : " + Uname  + vbCrLf  & _
                                        "Section      : " + USec  + vbCrLf  & _
                                        "Tel          : " + UTel  + vbCrLf   & _
                                        "Type         : " + DropDownMac.SelectedItem.Text + vbCrLf  & _
                                        "Description  : " + vbCrLf + Detail.Text

                        else
                   mail.Subject = "New MIS JobOrder # "+CStr(MaxRef)+" Priority : " + piority.SelectedItem.Text + ", Section " + USec
                            mail.Body = "Pls. Check Job order system!! New job coming" + vbCrLf  & _
                                        "Job order No#  " + CStr(MaxRef) + vbCrLf  & _
                                        "Priority     : " + piority.SelectedItem.Text + vbCrLf  & _
                                        "Date         : " + Format(Now,"dd/MM/yyyy hh:mm:ss") + vbCrLf  & _
                                        "Name         : " + Uname  + vbCrLf  & _
                                        "Section      : " + USec  + vbCrLf  & _
                                        "Tel          : " + UTel  + vbCrLf   & _
                                        "Computername : " + UCase(TextBoxWor.Text) + vbCrLf  & _
                                        "Type         : " + DropDownMac.SelectedItem.Text + vbCrLf  & _
                                        "Description  : " + vbCrLf + Detail.Text
                        end if
                        SmtpMail.SmtpServer = "localhost"
                        SmtpMail.Send(mail)
                    Next i
                    Session("Ref") = MaxRef
                    Response.Redirect("newref.aspx")
                End Try
            End try
    End Function


    Function QueryMaxRef() As System.Data.IDataReader
            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String = "SELECT MAX(Request_ID) AS Expr1 FROM T_Request"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            Return dataReader
    End Function


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
            if (((Session.Contents("UStatus") = "MIS") and j > 0) or (Session.Contents("UStatus") <> "MIS")) then

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

            if (Session.Contents("UStatus") = "MIS") then
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

     End Sub

     Sub Search()
            Dim A() AS String = {"Best Solutions","Job","Cost"} '10
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
            if (UStatus = "MIS") then
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
        End Sub

        Sub History()

            if (Session.Contents("UStatus") = "MIS") then
                Dim A() AS String = {"Requester","Department","Support Rep","Workstation"}
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
                For j = 0 To 3
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
        End Sub

        Sub Cost_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
            Response.Redirect("usermodify.aspx") 'new.aspx
        End Sub

        Sub Req_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
            menu2.Visible = false
            menu3.Visible = false
            menu1.Visible = true
        End Sub

        Sub Sea_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
            menu1.Visible = false
            menu3.Visible = false
            menu2.Visible = true
        End Sub

        Sub His_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
            menu1.Visible = false
            menu2.Visible = false
            menu3.Visible = true
        End Sub
        ' My function
        Sub All_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)

            'MsgBox(Sender.ID)
            if (Sender.ID = "Req01") then
                Response.Redirect("request01.aspx") 'new.aspx
            else if (Sender.ID = "Req02") then
                Response.Redirect("request02_user.aspx") 'showalarm.aspx
            else if (Sender.ID = "Req03") then
                Response.Redirect("request03_user.aspx")
            else if (Sender.ID = "Req04") then
                Response.Redirect("request04_user.aspx")
            else if (Sender.ID = "Req05") then
                Response.Redirect("request05_user.aspx")
            end if

            'Sea
            if (Sender.ID = "Sea01") then
                Response.Redirect("search01_user.aspx")
            else if (Sender.ID = "Sea02") then
                Response.Redirect("search02use.aspx")
            else if (Sender.ID = "Sea03") then
                Response.Redirect("search03.aspx")
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
    <center><asp:Label id="Label1" visible="false" runat="server"></asp:Label><asp:Label id="Label2" visible="false" runat="server"></asp:Label><asp:Label id="myDate" visible="false" runat="server"></asp:Label>
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
                                        <td width="673" background="images/bgheader.gif" height="45">
                                            <span class="style1"><font color="#ffffff"><span class="style1"><font color="red" size="4"><font face="Comic Sans MS"><font color="yellow" size="4"><span class="style1"><font color="#ffffff"><span class="style1"><font color="red" size="4"><font face="Comic Sans MS"><font color="white" size="4">Essilor
                                            Manufacturing (Thailand) co.,ltd.<br />
                                            MIS Section</font>&nbsp;</font></font><font face="Times New Roman" color="#000000" size="2"> </font></span></font></span></font></font></font></span></font></span></td>
                                    </tr>
                                    <tr>
                                        <td width="673" background="images/bgheader.gif" height="20">
                                            <table style="WIDTH: 673px; HEIGHT: 20px" height="20" cellspacing="0" cellpadding="0" width="673" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td align="left" width="150">
                                                            &nbsp;<font face="Comic Sans MS" color="#ffffff" size="2">New job Order</font></td>
                                                        <td align="middle">
                                                            <asp:Label id="Due" runat="server" font-names="Comic Sans MS" forecolor="White"></asp:Label></td>
                                                        <td align="right" width="120" colspan="2">
                                                            <asp:Label id="showUser" runat="server" font-names="Comic Sans MS" forecolor="White"></asp:Label>&nbsp;</td>
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
                        <td valign="top" align="middle" width="95" bgcolor="#009cc6" height="370">
                            <asp:table id="menu1" visible="false" runat="server" Width="95" Border="0" CellPadding="0" CellSpacing="0" BackColor="#009CC6"></asp:table>
                            <asp:table id="menu2" visible="false" runat="server" Width="95" Border="0" CellPadding="0" CellSpacing="0" BackColor="#009CC6"></asp:table>
                            <asp:table id="menu3" visible="false" runat="server" Width="95" Border="0" CellPadding="0" CellSpacing="0" BackColor="#009CC6"></asp:table>
                            <font face="Comic Sans MS" color="yellow">
                            <hr />
                            <p>
                                <font color="#ffffff"></font>
                            </p>
                            <p>
                                <asp:ImageButton id="ImageButton2" onclick="ImageButton1_Click" runat="server" Width="37px" src="images/commond/images03.gif" AlternateText="Logout" Height="33px"></asp:ImageButton>
                            </p>
                            <p>
                                <font color="white">Logout</font>
                            </p>
                            </font></td>
                        <td valign="top" align="middle" width="673" height="370">
                            <table bordercolor="#e0dfed" height="380" cellspacing="0" cellpadding="0" width="660" border="3">
                                <tbody>
                                    <tr bordercolor="#e0dfed" bgcolor="#f6f6f9">
                                        <td width="670" height="155">
                                            <table height="165" width="660" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td align="left" width="100" height="15">
                                                            Genaral
                                                        </td>
                                                        <td width="547" colspan="3" height="15">
                                                            <div align="left">
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="center" align="right" width="100" height="25">
                                                            Requester:
                                                        </td>
                                                        <td height="25">
                                                            <div align="left"><asp:Label id="Requester" runat="server">Label</asp:Label>&nbsp;
                                                            </div>
                                                        </td>
                                                        <td colspan="2">
                                                            <p align="left">
                                                                Tel : <asp:Label id="Telephone" runat="server">Label</asp:Label>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="center" align="right" width="100" height="25">
                                                            Section :</td>
                                                        <td colspan="1" height="25">
                                                            <div align="left"><asp:Label id="TextBoxSec" runat="server">Label</asp:Label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <p align="left">
                                                                Department :<asp:Label id="TextBoxDep" runat="server">Label</asp:Label>
                                                            </p>
                                                        </td>
                                                        <td>
                                                            Location : <asp:Label id="TextBoxLoc" runat="server">Label</asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="center" align="right" width="100" height="25">
                                                            Problem :</td>
                                                        <td colspan="3" height="25">
                                                            <div align="left">&nbsp;&nbsp;<asp:RadioButton id="RadioHard" runat="server" Text="Hardware" Checked="True" GroupName="Problem"></asp:RadioButton>
                                                                <asp:RadioButton id="RadioSoft" runat="server" Text="Software" GroupName="Problem"></asp:RadioButton>
                                                                <asp:RadioButton id="RadioNet" runat="server" Text="Network" GroupName="Problem"></asp:RadioButton>
                                                                &nbsp;
                                                                <asp:DropDownList id="DropDownMac" runat="server"></asp:DropDownList>
                                                                &nbsp;&nbsp;
                                                                <asp:CheckBox id="Borrow" runat="server" Text="Borrow" AutoPostBack="True"></asp:CheckBox>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="center" align="right" width="100" height="25">
                                                            Computer Number :
                                                        </td>
                                                        <td colspan="3" height="25">
                                                            <div align="left">
                                                                <asp:TextBox id="TextBoxWor" runat="server" Width="83px"></asp:TextBox>
                                                                &nbsp;&nbsp;&nbsp;&nbsp;Priority&nbsp;:&nbsp;<asp:dropdownlist id="piority" runat="server" Width="150px">
                                                                    <asp:ListItem Value="0">Critical</asp:ListItem>
                                                                    <asp:ListItem Value="1">High</asp:ListItem>
                                                                    <asp:ListItem Value="2" Selected="True">Medium</asp:ListItem>
                                                                    <asp:ListItem Value="3">Low</asp:ListItem>
                                                                </asp:dropdownlist>
                                                                dem Location&nbsp;:
                                                                <asp:dropdownlist id="Locationat" runat="server" Width="150px"></asp:dropdownlist>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="center" align="right" width="100" height="25">
                                                            Request Title:
                                                        </td>
                                                        <td colspan="3" height="25">
                                                            <div align="left">
                                                                <asp:TextBox id="Title" runat="server" Width="350" TextMode="SingleLine"></asp:TextBox>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr bgcolor="#f6f6f9">
                                        <td valign="top" colspan="2" height="155">
                                            <table height="155" width="660" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td align="left" colspan="3" height="20">
                                                            Problem Details</td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="top" align="middle" colspan="3">
                                                            <asp:TextBox id="Detail" runat="server" Width="582px" Height="149px" TextMode="MultiLine" Columns="77" Rows="7"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <p>
                                                <asp:Button id="Button2" onclick="SaveMe_Click" runat="server" Height="21px" Text="Submit"></asp:Button>
                                            </p>
                                            <p align="center">
                                                <asp:Label id="Label3" runat="server" forecolor="Red"></asp:Label>
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </center>
</body>
</html>
