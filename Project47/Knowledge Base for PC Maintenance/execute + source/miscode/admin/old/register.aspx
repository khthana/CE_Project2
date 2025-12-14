<%@ Page Language="VB" ContentType="text/html" ResponseEncoding="iso-8859-1" Debug="true" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.OleDb" %>
<script runat="server">

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
            Dim connectionString As String = "server='(local)'; trusted_connection=true; database='dem'"
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
            Dim connectionString As String = "server='(local)'; trusted_connection=true; database='dem'"
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
            Dim connectionString As String = "server='(local)'; trusted_connection=true; database='dem'"
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
    
            Dim connectionString As String = "server='(local)'; trusted_connection=true; database='dem'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
    
            Dim queryString As String = "INSERT INTO T_Users (User_ID, Login, Password, Name, Department_ID, Section_ID, Location_ID, Tel, Email"& _
    ", Status) VALUES ('"& MaxId &"', '"+UName.Text+"', '"+UPass.Text+"', '"+MyFirstName.Text+ "  "+ mylastName.text +"', '"+DropDownList1.SelectedItem.Value +"', '"+DropDownList2.SelectedItem.Value+"','"+DropDownList3.SelectedItem.Value+"',  '"+UTel.Text+"', "& _
    "'"+UEmail.Text+"', 'User')"
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
            Dim connectionString As String = "server='(local)'; trusted_connection=true; database='dem'"
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
            Dim connectionString As String = "server='(local)'; trusted_connection=true; database='dem'"
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
            Dim connectionString As String = "server='(local)'; trusted_connection=true; database='dem'"
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
    <title>REGISTER</title> 
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>
<body>
    <center>
        <form runat="server">
            <table style="WIDTH: 454px; HEIGHT: 272px" cellspacing="1" cellpadding="1" width="454" align="center" border="0">
                <tbody>
                    <tr>
                        <td colspan="3">
                            <div align="center">
                                <asp:Image id="Image1" runat="server" ImageUrl="images\register\images01.gif"></asp:Image>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" width="100">
                            FirstName :</td>
                        <td width="304">
                            <asp:TextBox id="MyFirstName" runat="server" Width="194px"></asp:TextBox>
                        </td>
                        <td width="50">
                            <asp:Label id="Label1" runat="server" forecolor="Red">***</asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left">
                            LastName :</td>
                        <td>
                            <asp:TextBox id="MyLastName" runat="server" Width="194px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label id="Label2" runat="server" forecolor="Red">***</asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left">
                            Login :</td>
                        <td>
                            <asp:TextBox id="UName" runat="server" Width="194px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label id="Label3" runat="server" forecolor="Red">***</asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left">
                            Password :</td>
                        <td>
                            <asp:TextBox id="UPass" runat="server" Width="194px" TextMode="Password"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label id="Label4" runat="server" forecolor="Red">***</asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left">
                            Re Password : 
                        </td>
                        <td>
                            <asp:TextBox id="RePass" runat="server" Width="194px" TextMode="Password"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label id="Label5" runat="server" forecolor="Red">***</asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left">
                            Department&nbsp;:</td>
                        <td>
                            <asp:DropDownList id="DropDownList1" runat="server" Width="200px"></asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label id="Label6" runat="server" forecolor="Red">***</asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left">
                            Section :</td>
                        <td>
                            <asp:DropDownList id="DropDownList2" runat="server" Width="200px"></asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label id="Label7" runat="server" forecolor="Red">***</asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left">
                            Location : 
                        </td>
                        <td>
                            <asp:DropDownList id="DropDownList3" runat="server" Width="200px"></asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label id="Label8" runat="server" forecolor="Red">***</asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left">
                            Telephone :</td>
                        <td>
                            <asp:TextBox id="UTel" runat="server" Width="194px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label id="Label9" runat="server" forecolor="Red">***</asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left">
                            Email : 
                        </td>
                        <td>
                            <asp:TextBox id="UEmail" runat="server" Width="194px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label id="Label10" runat="server" forecolor="Red">***</asp:Label></td>
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
            <p>
                <asp:Label id="Msg" runat="server" forecolor="Red" width="206px"></asp:Label>
                <br />
                <asp:CompareValidator id="comp1" runat="server" Operator="Equal" ControlToCompare="RePass" ErrorMessage="Password miss match" ControlToValidate="UPass"></asp:CompareValidator>
                <br />
                <asp:RegularExpressionValidator id="ereq" runat="server" ErrorMessage="Invalid Email" ControlToValidate="UEmail" ValidationExpression="[\w-]+@[\w-]+\.(com|net|org|co\.th|ac\.th|or\.th|go\.th)"></asp:RegularExpressionValidator>
            </p>
        </form>
    </center>
</body>
</html>
