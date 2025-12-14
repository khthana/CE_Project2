<%@ Page Language="VB" %>
<script runat="server">

    ' Insert page code here
    '
    
    
    sub page_load ()
        Label3.text = Session.Contents("UName")
    
        Label4.text = Session.Contents("UPass")
    end sub
    Sub Login_Click(sender As Object, e As EventArgs)
        Response.Redirect("../default.aspx")
    End Sub

</script>
<html>
<head>
</head>
<body>
    <form runat="server">
        <!-- Insert content here -->
        <center>
            <table>
                <tbody>
                    <tr>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            REGISTER SUCCESS 
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:Button id="Login" onclick="Login_Click" runat="server" Text="Click here to Login" Width="145px"></asp:Button>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                </tbody>
            </table>
            <br />
            <br />
        </center>
        <center>
            <table style="WIDTH: 190px; HEIGHT: 71px">
                <tbody>
                    <tr>
                        <td width="100">
                            <asp:Label id="Label1" runat="server">Login : </asp:Label></td>
                        <td width="20">
                        </td>
                        <td width="100">
                            <asp:Label id="Label3" runat="server">Label</asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label id="Label2" runat="server">Password : </asp:Label></td>
                        <td>
                        </td>
                        <td>
                            <asp:Label id="Label4" runat="server">Label</asp:Label></td>
                    </tr>
                </tbody>
            </table>
            &nbsp; 
        </center>
        <center>&nbsp;&nbsp; 
        </center>
        <center>&nbsp;&nbsp; 
        </center>
    </form>
</body>
</html>
