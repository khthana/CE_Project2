<%@ Page Language="VB" %>
<script runat="server">

    ' Insert page code here
    '
    
    
    sub page_load ()
        Label3.text = Session.Contents("UName")
    
        Label4.text = Session.Contents("UPass")
    end sub
    Sub Login_Click(sender As Object, e As EventArgs)
        Response.Redirect("default.aspx")
    End Sub

</script>
<html>
<head>
</head>
<body>
    <form runat="server">
        <!-- Insert content here -->
        <center>
            <br />
            <font face="Comic Sans MS">ขณะนี้ท่านได้ทำการ Login เรียบร้อยแล้ว</font> 
        </center>
        <center><font face="Comic Sans MS">โปรดตรวจสอบ Login และ Password ของท่านด้วย</font> 
        </center>
        <center><font face="Comic Sans MS">ขอบคุณค่ะ</font> 
        </center>
        <center><font face="Comic Sans MS">-----------------------------</font> 
        </center>
        <center><font face="Comic Sans MS"></font>
        </center>
        <center><font face="Comic Sans MS">Now&nbsp;system already register new account for
            you</font> 
        </center>
        <center><font face="Comic Sans MS">Pls. check your login and password</font> 
        </center>
        <center><font face="Comic Sans MS">thank you<br />
            </font>&nbsp; 
        </center>
        <center>
            <table style="WIDTH: 167px; HEIGHT: 71px">
                <tbody>
                    <tr>
                        <td width="100" colspan="2">
                            <div align="center"><asp:Label id="Label1" runat="server" font-bold="True" font-names="Comic Sans MS">Login
                                : </asp:Label>
                            </div>
                        </td>
                        <td width="100">
                            <div align="center"><asp:Label id="Label3" runat="server" font-bold="True" font-names="Comic Sans MS">Label</asp:Label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div align="center"><asp:Label id="Label2" runat="server" font-bold="True" font-names="Comic Sans MS">Password
                                : </asp:Label>
                            </div>
                        </td>
                        <td>
                            <div align="center"><asp:Label id="Label4" runat="server" font-bold="True" font-names="Comic Sans MS">Label</asp:Label>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </center>
        <center>
        </center>
        <center>
        </center>
        <center>
        </center>
        <center><font face="Comic Sans MS">คลิ้กข้างล่างเพื่อกลับสู่หน้า Login</font>&nbsp; 
        </center>
        <center><font face="Comic Sans MS">Click below button for login page</font> 
        </center>
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
                            <font face="Comic Sans MS">REGISTER SUCCESS</font> 
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <div align="center">
                                <asp:Button id="Button1" onclick="Login_Click" runat="server" Text="Click here to Login" Width="145px"></asp:Button>
                            </div>
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
            &nbsp;&nbsp; 
        </center>
        <center>
        </center>
        <center>
        </center>
    </form>
</body>
</html>