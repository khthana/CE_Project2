<%@ Page Language="VB" ContentType="text/html" ResponseEncoding="windows-874" Debug="true" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.OleDb" %>
<script runat="server">

    Sub Page_Init()
        Session.RemoveAll
        Msg.Text = ""
    End Sub

    Sub Page_Load()
        Msg.Text = ""
    End Sub

    Sub VerifyUser(sender As Object, e As System.Web.UI.ImageClickEventArgs)
        Dim dataReader As System.Data.IDataReader
            dataReader = QueryUser(UName.Text,PWord.Text)
            dataReader.Read()
        try
            Session("UId")      = Trim(dataReader.GetInt32(0))
            Session("UStatus")  = Trim(dataReader.GetString(1))
            Session("UName")    = Trim(dataReader.GetString(2))
            Session("UDep")     = Trim(dataReader.GetString(3))
            Session("USec")     = Trim(dataReader.GetString(4))
            Session("ULoc")     = Trim(dataReader.GetString(5))
            Session("UTel")     = Trim(dataReader.GetString(6))
            Session("SIDD")     = Session.SessionID
            if(Trim(dataReader.GetString(1)) = "Admin") then
                Response.Redirect("request02.aspx")
            end if
            if(Trim(dataReader.GetString(1)) = "User") then
              Response.Redirect("request02_user.aspx")
            end if
            if (Trim(dataReader.GetString(1)) = "MIS") then
              Response.Redirect("request02.aspx")
            end if
        catch ex As Exception
            Msg.Text = "Incorrect Login And Password"
        End try
    End Sub


    Function QueryUser(ByVal logins As String, ByVal password As String) As System.Data.IDataReader
            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String
            queryString = "SELECT T_Users.User_ID AS Expr1, T_Users.Status AS Expr2, T_Users.Name AS Expr3, " & _
                          "T_Department.Department AS Expr4, " & _
                          "T_Section.Section AS Expr5, T_Location.Location AS Expr6, T_Users.Tel AS Expr7 " & _
                          "FROM T_Users INNER JOIN " & _
                          "T_Department ON T_Users.Department_ID = T_Department.Department_ID INNER JOIN " & _
                          "T_Location ON T_Users.Location_ID = T_Location.Location_ID INNER JOIN " & _
                          "T_Section ON T_Users.Section_ID = T_Section.Section_ID " & _
                          "WHERE (T_Users.Login = N'" + logins + "') AND (T_Users.Password = N'"+ password + "')"

            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection

            Dim dbParam_logins As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
            dbParam_logins.ParameterName = "@Logins"
            dbParam_logins.Value = logins
            dbParam_logins.DbType = System.Data.DbType.String
            dbCommand.Parameters.Add(dbParam_logins)
            Dim dbParam_password As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
            dbParam_password.ParameterName = "@Password"
            dbParam_password.Value = password
            dbParam_password.DbType = System.Data.DbType.String
            dbCommand.Parameters.Add(dbParam_password)

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
    <link href="css/general.css" type="text/css" rel="stylesheet" />
    <link href="css/layout.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <br />
    <form runat="server">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tbody>
                <tr>
                    <td>
                        <div class="screenBody" id="login" style="WIDTH: 420px; HEIGHT: 200px">
                            <div class="formArea">
                                <table style="WIDTH: 420px; HEIGHT: 200px" cellspacing="0" cellpadding="0">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <img alt="Please login" src="images/login/001.gif" /></td>
                                        </tr>
                                        <tr>
                                            <td id="loginForm">
                                                <p>
                                                    Enter the login name into "Login" and password into the "Password" fields respectively.
                                                    Then click "Login".
                                                </p>
                                                <table class="formFields" cellspacing="0" width="100%" border="0">
                                                    <tbody>
                                                        <tr>
                                                            <td class="name" width="45">
                                                                <label for="login_name">Login</label></td>
                                                            <td width="350" colspan="2">
                                                                <asp:TextBox id="UName" runat="server" TextMode="SingleLine" ToolTip="user name"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="name">
                                                                <label for="passwd">Password</label></td>
                                                            <td colspan="2">
                                                                <asp:TextBox id="PWord" runat="server" TextMode="Password" tooltip="pass word"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" width="50">
                                                                <a href="register.aspx"><img src="images/login/003.gif" /></a></td>
                                                            <td align="middle" width="150">
                                                                <a href="forgot.aspx">
                                                                <asp:Image id="Image1" runat="server" src="images/login/004.gif"></asp:Image>
                                                                </a></td>
                                                            <td align="right" width="200">
                                                                <asp:ImageButton id="ImageButton" onclick="VerifyUser" runat="server" src="images/login/002.gif" Height="20px" width="89px"></asp:ImageButton>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <center>
                            <br />
                            <asp:Label id="Msg" runat="server" borderwidth="0px" forecolor="Red" height="12px" bordercolor="White"></asp:Label>
                        </center>
                        <center>
                            <asp:RequiredFieldValidator id="valid1" runat="server" ErrorMessage="Enter  User Name " ControlToValidate="UName"></asp:RequiredFieldValidator>
                        </center>
                        <center>
                            <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Password " ControlToValidate="PWord"></asp:RequiredFieldValidator>
                        </center>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
    <br />
    <center>
    </center>
</body>
</html>
