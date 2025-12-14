<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Drawing.Color" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.OleDb" %>
<%@ import Namespace="System.Data.Odbc" %>
<%@ import Namespace="System.Data.SqlClient" %>
<script runat="server">

    'dim UName ,UId ,UTel ,UDep ,USec ,ULoc ,UStatus
    
    Sub Page_Load(sender As Object, e As EventArgs)
        if (Session.Contents("SIDD") = Session.SessionID and Session.Contents("UStatus") = "admin") then
            due.text = Format(today, "dddd d MMMM yyyy")
        else
            Response.Redirect("default.aspx")
        end if
    End Sub 'Page_Load
    
    Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs)
        Response.Redirect("../default.aspx")
    End Sub
    
    Sub ImageButton2_Click(sender As Object, e As ImageClickEventArgs)
        Response.Redirect("register.aspx")
    End Sub
    
    Sub ImageButton3_Click(sender As Object, e As ImageClickEventArgs)
        Response.Redirect("default.aspx")
    End Sub
    
    Dim MaxId As Integer
    Dim TmpError As String
    
    Sub Page_Init()
        Clear_All()
        QueryAllDepartment()
        QueryAllSection()
        QueryAllLocation()
        Msg.Visible = "false"
    End Sub
    
    Sub Page_Load()
    
        TmpError = ""
    End Sub
    
    sub QueryAllSection()
            DropDownList1.Items.Clear()
            Dim connectionString As String ="server='SURACHET'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
    
            Dim queryString As String = "SELECT Department_ID,Department FROM [T_Department]"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            while(dataReader.Read())
                DropDownList1.Items.Add(New ListItem( Trim(dataReader.GetString(1)),dataReader.GetInt32(0)))
            end while
    end sub
    
    sub QueryAllDepartment()
            DropDownList2.Items.Clear()
            Dim connectionString As String ="server='SURACHET'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
    
            Dim queryString As String = "SELECT Section_ID,Section FROM [T_Section]"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            while(dataReader.Read())
                DropDownList2.Items.Add(New ListItem( Trim(dataReader.GetString(1)),dataReader.GetInt32(0)))
            end while
    end sub
    
    sub QueryAllLocation()
            DropDownList3.Items.Clear()
            Dim connectionString As String ="server='SURACHET'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
    
            Dim queryString As String = "SELECT Location_ID,Location FROM [T_Location]"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            while(dataReader.Read())
                DropDownList3.Items.Add(New ListItem( Trim(dataReader.GetString(1)),dataReader.GetInt32(0)))
            end while
    end sub
    
    Sub Submit_Click(sender As Object, e As EventArgs)
        TmpError = ""
        if (MyFirstName.Text = "") then
            TmpError = TmpError + " FirstName "
        end if
        if (MyLastName.Text = "") then
            TmpError = TmpError + " LastName "
        end if
        if (UName.Text = "") then
            TmpError = TmpError + " Login "
        end if
        if (UPass.Text = "" or RePass.Text = "") then
            TmpError = TmpError + " Password "
            UPass.Text = ""
            RePass.Text = ""
        end if
        if (UTel.Text = "") then
            TmpError = TmpError + " Telephone"
        end if
        if (UEmail.Text = "") then
            TmpError = TmpError + " Email"
        end if
        if (TmpError = "") then
    
            Dim dataReader As System.Data.IDataReader = QueryMaxId()
            dataReader.Read()
            Session("UName") = UName.text
            Session("UPass") = UPass.text
            try
                MaxId = dataReader.GetInt32(0)+1
            catch ex As Exception
                MaxId = 1
            Finally
                Dim loginReader As System.Data.IDataReader = QueryLogin()
                loginReader.Read()
                Try
                    loginReader.GetString(0)
                    Msg.Text = "UName Ready to use !!!"
                    UName.Text = ""
                Catch ex As Exception
                    loginReader = QueryName()
                    loginReader.Read()
                    Try
                        loginReader.GetString(0)
                        Msg.Text = "FirstName and LastName Ready to use !!!"
                        MyFirstName.Text = ""
                        MyLastName.Text = ""
                    Catch ex2 As Exception
                        Msg.Text = ""
                        RegisterUser()
                        Clear_All()
                        Response.Redirect("welcome.aspx")
                    End Try
                End Try
            End Try
    
        else
            Msg.Text = "Enter " + TmpError
        end if
        Msg.visible = true
    End Sub
    
    Sub Clear_All()
        MyFirstName.Text = ""
        MyLastName.Text = ""
        UName.Text = ""
        UPass.Text = ""
        RePass.Text = ""
        UTel.Text = ""
        UEmail.Text = ""
    End Sub
    
    Function RegisterUser()
    
            Dim connectionString As String ="server='SURACHET'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
    
            Dim queryString As String = "INSERT INTO T_Users (User_ID, Login, Password, Name, Department_ID, Section_ID, Location_ID, Tel, Email"& _
    ", Status) VALUES ('"& MaxId &"', '"+UName.Text+"', '"+UPass.Text+"', '"+MyFirstName.Text+ "  "+ mylastName.text +"', '"+DropDownList1.SelectedItem.Value +"', '"+DropDownList2.SelectedItem.Value+"','"+DropDownList3.SelectedItem.Value+"',  '"+UTel.Text+"', "& _
    "'"+UEmail.Text+"', 'IT Support')"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
    
            Dim rowsAffected As Integer = 0
            dbConnection.Open
            Try
                rowsAffected = dbCommand.ExecuteNonQuery
            Finally
                dbConnection.Close
            End Try
    
    End Function
    
    Function QueryMaxId() As System.Data.IDataReader
            Dim connectionString As String ="server='SURACHET'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
    
            Dim queryString As String = "SELECT MAX(User_ID) FROM T_Users"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
    
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
    
            Return dataReader
    End Function
    
    
    Function QueryLogin() As System.Data.IDataReader
            Dim connectionString As String ="server='SURACHET'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
    
            Dim queryString As String = "SELECT Login FROM T_Users WHERE Login='"+UName.Text+"'"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
    
            dbConnection.Open
    
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
    
            Return dataReader
    End Function
    
    Function QueryName() As System.Data.IDataReader
            Dim connectionString As String ="server='SURACHET'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
    
            Dim queryString As String = "SELECT Login FROM T_Users WHERE Name='"+MyFirstName.Text+ "  "+ mylastName.text +"'"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
    
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
    
            Return dataReader
    End Function

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
    <center><asp:Label id="Label1" visible="false" runat="server"></asp:Label><asp:Label id="Label2" visible="false" runat="server"></asp:Label><asp:Label id="dir_sort" visible="false" runat="server"></asp:Label> 
        <form name="form1" action="" method="post" runat="server">
            <table bordercolor="#000000" height="450" cellspacing="1" cellpadding="1" width="775" border="1">
                <tbody>
                    <tr>
                        <td colspan="2" height="65">
                            <table cellspacing="0" cellpadding="0" width="700" border="0">
                                <tbody>
                                    <tr>
                                        <td width="95" height="65" rowspan="2">
                                            <img height="65" src="images/images01.gif" width="95" /></td>
                                        <td width="673" background="images/images02.gif" height="45">
                                            <span class="style1"><font color="#ffffff">ESSILOR MANUFACTURING (THAILAND) CO., LTD.<br />
                                            MIS SECTION, LOGISTICS DEPARTMENT</font></span></td>
                                    </tr>
                                    <tr>
                                        <td width="673" background="images/images02.gif" height="20">
                                            <table style="WIDTH: 673px; HEIGHT: 20px" height="20" cellspacing="0" cellpadding="0" width="673" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td align="left" width="150">
                                                        </td>
                                                        <td align="middle">
                                                            <asp:Label id="Due" runat="server" forecolor="White">Administrators</asp:Label></td>
                                                        <td align="right" width="120">
                                                        </td>
                                                        <td align="right" width="30">
                                                            <asp:ImageButton id="ImageButton1" onclick="ImageButton1_Click" runat="server" height="20" width="20" src="images/images03.gif" AlternateText="Logout"></asp:ImageButton>
                                                            &nbsp;</td>
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
                        <td valign="top" align="middle" width="95" bgcolor="#4f70c7" height="370">
                            <p>
                            </p>
                            <p>
                                <asp:ImageButton id="ImageButton2" onclick="ImageButton2_Click" runat="server" ImageUrl="images/images04.gif"></asp:ImageButton>
                                <br />
                                <asp:Label id="Label4" runat="server" forecolor="White">New Administator</asp:Label>
                            </p>
                            <p>
                                <asp:ImageButton id="ImageButton3" onclick="ImageButton3_Click" runat="server" ImageUrl="images/images05.gif" Height="30px" Width="33px"></asp:ImageButton>
                                <br />
                                <asp:Label id="Label3" runat="server" forecolor="White">Control panal</asp:Label>
                            </p>
                        </td>
                        <td valign="top" align="middle" width="673" height="370">
                            <p>
                            </p>
                            <p>
                            </p>
                            <p>
                            </p>
                            <p>
                                &nbsp;&nbsp;&nbsp; 
                                <br />
                                <table style="WIDTH: 454px; HEIGHT: 272px" cellspacing="1" cellpadding="1" width="454" align="center" border="0">
                                    <tbody>
                                        <tr>
                                            <td align="left" width="100">
                                                FirstName :</td>
                                            <td width="304">
                                                <asp:TextBox id="MyFirstName" runat="server" Width="194px"></asp:TextBox>
                                            </td>
                                            <td width="50">
                                                <asp:Label id="Label5" runat="server" forecolor="Red">***</asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                LastName :</td>
                                            <td>
                                                <asp:TextBox id="MyLastName" runat="server" Width="194px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label id="Label6" runat="server" forecolor="Red">***</asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                Login :</td>
                                            <td>
                                                <asp:TextBox id="UName" runat="server" Width="194px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label id="Label7" runat="server" forecolor="Red">***</asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                Password :</td>
                                            <td>
                                                <asp:TextBox id="UPass" runat="server" Width="194px" TextMode="Password"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label id="Label8" runat="server" forecolor="Red">***</asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                Re Password : 
                                            </td>
                                            <td>
                                                <asp:TextBox id="RePass" runat="server" Width="194px" TextMode="Password"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label id="Label9" runat="server" forecolor="Red">***</asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                Department&nbsp;:</td>
                                            <td>
                                                <asp:DropDownList id="DropDownList1" runat="server" Width="200px"></asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:Label id="Label10" runat="server" forecolor="Red">***</asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                Section :</td>
                                            <td>
                                                <asp:DropDownList id="DropDownList2" runat="server" Width="200px"></asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:Label id="Label11" runat="server" forecolor="Red">***</asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                Location : 
                                            </td>
                                            <td>
                                                <asp:DropDownList id="DropDownList3" runat="server" Width="200px"></asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:Label id="Label12" runat="server" forecolor="Red">***</asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                Telephone :</td>
                                            <td>
                                                <asp:TextBox id="UTel" runat="server" Width="194px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label id="Label13" runat="server" forecolor="Red">***</asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                Email : 
                                            </td>
                                            <td>
                                                <asp:TextBox id="UEmail" runat="server" Width="194px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label id="Label14" runat="server" forecolor="Red">***</asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="middle" colspan="3">
                                                <p align="center">
                                                    <asp:Button id="Submit" onclick="Submit_Click" runat="server" Text="Submit"></asp:Button>
                                                    &nbsp;&nbsp; 
                                                    <input style="WIDTH: 60px; HEIGHT: 24px" type="reset" size="23" value="Reset" />
                                                </p>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br />
                                <asp:Label id="Msg" runat="server" forecolor="Red" width="206px"></asp:Label>
                                <asp:CompareValidator id="comp1" runat="server" ControlToValidate="UPass" ErrorMessage="Password miss match" ControlToCompare="RePass" Operator="Equal"></asp:CompareValidator>
                                <asp:RegularExpressionValidator id="ereq" runat="server" ControlToValidate="UEmail" ErrorMessage="Invalid Email" ValidationExpression="[\w-]+@[\w-]+\.(com|net|org|co\.th|ac\.th|or\.th|go\.th)"></asp:RegularExpressionValidator>
                            </p>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </center>
</body>
</html>
