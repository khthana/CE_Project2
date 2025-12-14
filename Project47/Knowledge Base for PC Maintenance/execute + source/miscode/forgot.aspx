<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.OleDb" %>
<%@ import Namespace="System.Web.Mail" %>
<%@ import Namespace="System.IO" %>
<script runat="server">

    ' Insert page code here
    '
    Sub Button1_Click(sender As Object, e As EventArgs)
    
        Query()
    
    end sub
    
    
    sub Query()
            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
    
            Dim queryString As String
            queryString = "SELECT     Login AS Expr1, Password AS Expr2, Email AS Expr3 " & _
                          "FROM       T_Users " & _
                          "WHERE     (Name = '" + TextBox1.Text + "  " + TextBox2.Text + "')"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            while(dataReader.Read())
                Dim mail As New MailMessage()
                mail.To = Trim(dataReader.GetString(2))
                mail.From = "pronpun@essilor.co.th"
                mail.Subject = "forgot mail"
                mail.Body = "forgot" + vbcrlf + " MY name is " + TextBox1.Text + "  " + TextBox2.Text + VBcrlf + " Login : " + Trim(dataReader.GetString(0)) + VBcrlf + " Password : " + Trim(dataReader.GetString(1))
                SmtpMail.SmtpServer =  "localhost"'/"them0008"
                SmtpMail.Send(mail)
                Response.Redirect("thx.aspx")
            end while
    end sub
    
    Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs)
        Response.Redirect("default.aspx")
    End Sub

</script>
<html>
<head>
    <title>Forgot Password ESSILOR MANUFACTURING (THAILAND) CO., LTD.</title> 
    <meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
    <link href="css/general.css" type="text/css" rel="stylesheet" />
    <link href="css/layout.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form runat="server">
        <p>
        </p>
        <p>
        </p>
        <p>
        </p>
        <p>
        </p>
        <p>
        </p>
        <table style="WIDTH: 460px; HEIGHT: 238px" cellspacing="1" cellpadding="1" width="460" align="center" border="0">
            <tbody>
                <tr>
                    <td colspan="3">
                        <div align="center">
                            <asp:Image id="Image1" runat="server" ImageUrl="images\forgot\images01.gif"></asp:Image>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td align="left" width="100">
                        <asp:Label id="Label4" runat="server">FirstName</asp:Label>&nbsp;: 
                    </td>
                    <td align="middle" width="304">
                        <asp:TextBox id="TextBox1" runat="server"></asp:TextBox>
                    </td>
                    <td width="50">
                        <asp:Label id="Label1" runat="server" forecolor="Red">***</asp:Label></td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label id="Label2" runat="server">LastName</asp:Label>&nbsp;: 
                    </td>
                    <td align="middle">
                        <asp:TextBox id="TextBox2" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label id="Label3" runat="server" forecolor="Red">***</asp:Label></td>
                </tr>
                <tr>
                    <td colspan="3">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="middle" colspan="3">
                        <p align="center">
                            &nbsp;&nbsp;&nbsp;<asp:Button id="Button1" onclick="Button1_Click" runat="server" Text="Send"></asp:Button>
                        </p>
                        <p align="right">
                            <asp:ImageButton id="ImageButton1" onclick="ImageButton1_Click" runat="server" ImageUrl="./images/images03.jpg"></asp:ImageButton>
                        </p>
                    </td>
                </tr>
            </tbody>
        </table>
        <p>
        </p>
        <p align="center">
            <br />
            <asp:Label id="Msg" runat="server" forecolor="Red"></asp:Label>
            <br />
            <br />
        </p>
        <!-- Insert content here -->
    </form>
</body>
</html>