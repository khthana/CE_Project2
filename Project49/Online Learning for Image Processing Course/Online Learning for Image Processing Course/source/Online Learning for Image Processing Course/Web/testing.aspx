<%@ Page Language="VB" AutoEventWireup="false" CodeFile="testing.aspx.vb" Inherits="testing" %>
<%@ Register Assembly="WebChart" Namespace="WebChart" TagPrefix="Web" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
    .plain {height:20px; vertical-align:middle;}
    </style>
    <script src="js/buttonscript.js" language="javascript" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
                
        </div>
        <asp:TextBox ID="box1" runat="server"></asp:TextBox>*
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="box1" runat="server" ErrorMessage="กรุณาใส่ข้อมูล" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
            ValidationExpression="\w{8,16}"
            runat="server" 
            ControlToValidate="box1" 
            ErrorMessage="ใส่ข้อมูลให้ถูกต้องด้วย" Display="Dynamic">
            </asp:RegularExpressionValidator>
        <br />
        <asp:DropDownList ID="DDL" runat="server">
            <asp:ListItem Value="select">- - - เลือก - - -</asp:ListItem>
            <asp:ListItem>1</asp:ListItem>
        </asp:DropDownList>
        <asp:CustomValidator ID="CustomValidator1" OnServerValidate="selectDDL" ControlToValidate="DDL" runat="server" ErrorMessage="กรุณาเลือกข้อมูล"></asp:CustomValidator><br />
        <%--<asp:TextBox ID="box2" runat="server"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" 
            ControlToValidate="box1" 
            ControlToCompare="box2" 
            runat="server" 
            ErrorMessage="CompareValidator">
        </asp:CompareValidator><br />--%>
        <asp:Button ID="ok" runat="server" Text="Button" /><br />
        <asp:SqlDataSource ID="ScheduleDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
            SelectCommand="select s.sub_id, s.sub_name, t.tch_name, ss.sec_number, ss.sec_dlearn, ss.sec_tlearn, s.sub_dexam, s.sub_texam, s.sub_quantity from subject s, teacher t, subjectsection ss where s.tch_id=t.tch_id and s.sub_id=ss.sub_id and ([sub_status] = @sub_status) order by s.sub_id">
            <SelectParameters>
                <asp:Parameter DefaultValue="true" Name="sub_status" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
        &nbsp;
        <asp:Label ID="warning" runat="server"></asp:Label><br />
        <%--<asp:TextBox ID="box2" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="box2"
            ErrorMessage="กรุณาใส่ข้อมูลนะนะ"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="box2"
            ErrorMessage="ใส่ข้อมูลให้ถูกต้องด้วยนะนะ" ValidationExpression="\w{8,16}">
            </asp:RegularExpressionValidator>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" />--%>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="sub_id"
            DataSourceID="ScheduleDTS">
            <Columns>
                <asp:TemplateField>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:CheckBox ID="registerChB" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="sub_id" HeaderText="sub_id" InsertVisible="False" ReadOnly="True"
                    SortExpression="sub_id" />
                <asp:BoundField DataField="sub_name" HeaderText="sub_name" SortExpression="sub_name" />
                <asp:BoundField DataField="tch_name" HeaderText="tch_name" SortExpression="tch_name" />
                <asp:BoundField DataField="sec_number" HeaderText="sec_number" SortExpression="sec_number" />
                <asp:BoundField DataField="sec_dlearn" HeaderText="sec_dlearn" SortExpression="sec_dlearn" />
                <asp:BoundField DataField="sec_tlearn" HeaderText="sec_tlearn" SortExpression="sec_tlearn" />
                <asp:BoundField DataField="sub_dexam" HeaderText="sub_dexam" SortExpression="sub_dexam" />
                <asp:BoundField DataField="sub_texam" HeaderText="sub_texam" SortExpression="sub_texam" />
                <asp:BoundField DataField="sub_quantity" HeaderText="sub_quantity" SortExpression="sub_quantity" />
            </Columns>
            <EmptyDataTemplate>
                <asp:CheckBox ID="CheckBox1" runat="server" />
            </EmptyDataTemplate>
        </asp:GridView>
        <br />
        &nbsp;<asp:PlaceHolder ID="hold" runat="server"></asp:PlaceHolder>
        <br />
        <asp:Button ID="submit" runat="server" Text="OK" Width="83px" />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" />&nbsp;<br />
        <br />
        <web:chartcontrol id="MyLineChart" runat="server" borderstyle="Outset" borderwidth="3px" 
            height="250px" leftchartpadding="5" width="550px" HasChartLegend="False" 
            ShowTitlesOnBackground="False" TopPadding="20" YCustomEnd="0" YCustomStart="0" 
            YValuesInterval="0" ShowXValues="False" ShowYValues="False">
            <YAXISFONT StringFormat="Far,Near,Character,LineLimit" />
            <XTITLE Text="คะแนน 0 - 100" StringFormat="Center,Far,Character,LineLimit" ForeColor="SteelBlue" Font="Tahoma, 8pt, style=Bold" />
            <PLOTBACKGROUND ForeColor="#FFFFC0" LinearGradientMode="Vertical" EndPoint="100, 400" CenterPoint="100, 100" Angle="90" Type="LinearGradient" />
            <CHARTTITLE StringFormat="Center,Near,Character,LineLimit" Font="Tahoma, 10pt, style=Bold" ForeColor="White" />
            <XAXISFONT StringFormat="Center,Near,Character,LineLimit" />
            <BACKGROUND ForeColor="#80FF80" Color="CornflowerBlue" Angle="90" EndPoint="100, 400" Type="LinearGradient" />
            <LEGEND Width="0" Font="Microsoft Sans Serif, 8pt" />
            <YTITLE Text="จำนวนผู้เรียน" StringFormat="Near,Near,Character,DirectionVertical" ForeColor="SteelBlue" Font="Tahoma, 8pt, style=Bold" />
            <Border Color="CornflowerBlue" />
        </web:chartcontrol>
        <web:chartcontrol runat="server" id="MyPieChart" height="400px" width="350px" gridlines="None" 
            legend-position="Bottom" ChartPadding="30" ShowTitlesOnBackground="False" TopPadding="20" 
            YCustomEnd="0" YCustomStart="0" YValuesInterval="0" >
            <YAxisFont StringFormat="Far,Near,Character,LineLimit" />
            <XTitle Font="Tahoma, 8pt, style=Bold" ForeColor="SteelBlue" StringFormat="Center,Far,Character,LineLimit" />
            <PlotBackground Angle="90" EndPoint="100, 400" ForeColor="#FFFFC0" Type="LinearGradient" />
            <ChartTitle Font="Tahoma, 10pt, style=Bold" ForeColor="White" StringFormat="Center,Near,Character,LineLimit" />
            <Border Color="CornflowerBlue" />
            <XAxisFont StringFormat="Center,Near,Character,LineLimit" />
            <Background Angle="90" Color="CornflowerBlue" EndPoint="100, 400" ForeColor="#80FF80" Type="LinearGradient" />
            <Legend Position="Bottom"></Legend>
            <YTitle Font="Tahoma, 8pt, style=Bold" ForeColor="SteelBlue" StringFormat="Near,Near,Character,DirectionVertical" />
        </web:chartcontrol>
        <br />
        <br />
        <input class="plain" name="dc2" id="txt" runat="server" onfocus="this.blur()" readonly="readonly" size="12" />
        <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.form1.txt);return false;">
        <img align="absMiddle" alt="" border="0" class="PopcalTrigger" height="22" src="DateRange/calbtn.gif" width="34" /></a>
        <br />
        <input class="plain" name="dc22" id="Text1" runat="server" onfocus="this.blur()" readonly="readonly" size="12" />
        <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.form1.Text1);return false;">
            <img align="absMiddle" alt="" border="0" class="PopcalTrigger" height="22" src="DateRange/calbtn.gif" width="34" /></a>
        <asp:Button ID="btn" runat="server" Text="Button" ValidationGroup="Testing" />
        <asp:RequiredFieldValidator ID="textRFV" runat="server" ControlToValidate="Text1" Display="Dynamic" ValidationGroup="Testing" ErrorMessage="*"></asp:RequiredFieldValidator><br />
        <br />
        <br />
    
    <table align="center">
        <tr bgcolor="#00cc00" height="20" style="font-weight: bold; color: white">
            <td colspan="2">
                :: ระบบสมาชิก ::</td>
        </tr>
        <tr>
            <td width="100">
                ชื่อผู้ใช้</td>
            <td width="100">
                <asp:TextBox ID="usernamelogin" runat="server" Width="100px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                รหัสผ่าน</td>
            <td>
                <asp:TextBox ID="passwordlogin" runat="server" TextMode="Password" Width="100px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="signin" runat="server" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif"
                    Font-Overline="False" Font-Size="Small" ForeColor="White" Text="เข้าสู่ระบบ" ValidationGroup="loginsystem"
                    Width="98px" />
                <asp:Button ID="signup" runat="server" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif"
                    ForeColor="White" Text="สมัครสมาชิก" Width="98px" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="forget" runat="server" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif"
                    Font-Size="Small" ForeColor="White" Text="ลืมรหัสผ่าน" Width="200px" /></td>
        </tr>
    </table>
    <asp:RequiredFieldValidator ID="usernameRFV" runat="server" ControlToValidate="usernamelogin" Display="Dynamic" ValidationGroup="loginsystem" ErrorMessage="กรุณาใส่ชื่อผู้ใช้"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="usernameREV" runat="server" ControlToValidate="usernamelogin" ValidationExpression="\w{8,16}" Display="Dynamic" ValidationGroup="loginsystem" ErrorMessage="ชื่อผู้ใช้ไม่ถูกต้อง"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="passwordRFV" runat="server" ControlToValidate="passwordlogin" Display="Dynamic" ValidationGroup="loginsystem" ErrorMessage="กรุณาใส่รหัสผ่าน"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="passwordREV" runat="server" ControlToValidate="passwordlogin" ValidationExpression="\w{8,16}" Display="Dynamic" ValidationGroup="loginsystem" ErrorMessage="รหัสผ่านไม่ถูกต้อง"></asp:RegularExpressionValidator>
    <asp:Label ID="lbl" runat="server"></asp:Label>
    
    <table align="center" width="800" bgcolor="white">
            <tr bgcolor="#00cc00" style="font-weight:bold;color:White" align="center" height="20">
                <td colspan="4">:: ตอบกระทู้ ::</td>
            </tr>
            <tr height="10">
                <td colspan="4"></td>
            </tr>
            <tr align="center">
                <td style="width: 69px"></td>
                <td width="100">ชื่อผู้ตอบกระทู้</td>
                <td width="450"><asp:TextBox ID="replywriter" MaxLength="10" runat="server" Width="400px"></asp:TextBox></td>
                <td width="125">
                    <asp:RequiredFieldValidator ID="writerRFV" runat="server" ControlToValidate="replywriter" Display="Dynamic" ValidationGroup="replysystem" ErrorMessage="กรุณาใส่ชื่อผู้ตอบกระทู้"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="writerREV" runat="server" ControlToValidate="replywriter" ValidationExpression="[^']+" Display="Dynamic" ValidationGroup="replysystem" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')"></asp:RegularExpressionValidator></td>
            </tr>
            <tr align="center">
                <td style="width: 69px"></td>
                <td>E - Mail</td>
                <td><asp:TextBox ID="replyemail" MaxLength="10" runat="server" Width="400px"></asp:TextBox></td>
                <td></td>
            </tr>
            <tr align="center">
                <td style="width: 69px"></td>
                <td>ข้อความ</td>
                <td><asp:TextBox ID="replycontent" MaxLength="10" runat="server" Width="400px" Height="100" TextMode="MultiLine"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="contentRFV" runat="server" ControlToValidate="replycontent" Display="Dynamic" ValidationGroup="replysystem" ErrorMessage="กรุณาใส่ข้อความ"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="contentREV" runat="server" ControlToValidate="replycontent" ValidationExpression="[^']+" Display="Dynamic" ValidationGroup="replysystem" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')"></asp:RegularExpressionValidator></td>
            </tr>
            <tr align="center">
                <td colspan="4"><asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr align="center">
                <td colspan="4"><asp:Button ID="send" runat="server" Text="ส่งข้อความ" Width="120px" BackColor="#FF8000" Font-Names="Microsoft Sans Serif" ForeColor="White" Font-Bold="True" ValidationGroup="replysystem" />
                <asp:Button ID="clear" runat="server" Text="เคลียร์" Width="120px" BackColor="#FF8000" Font-Names="Microsoft Sans Serif" ForeColor="White" Font-Bold="True" /></td>
            </tr>
        </table>
        
        <table style="margin-bottom:10px;margin-left:10px;margin-right:10px">
            <tr bgcolor="#00cc00" style="font-weight:bold;color:White" height="20">
                <td colspan="2">:: การค้นคืนรหัสผ่าน ::</td>
            </tr>
            <tr height="10">
                <td colspan="2"></td>
            </tr>
            <tr>
                <td width="200">ชื่อผู้ใช้</td>
                <td style="width: 359px"><asp:TextBox ID="username" runat="server" Width="150px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="userRFV" runat="server" ControlToValidate="username" Display="Dynamic" ValidationGroup="retrievesystem" ErrorMessage="กรุณาใส่ชื่อผู้ใช้"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="userREV" runat="server" ControlToValidate="username" Display="Dynamic" ValidationExpression="\w{8,16}" ValidationGroup="retrievesystem" ErrorMessage="ชื่อผู้ใช้ไม่ถูกต้อง"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td>คำถามเมื่อลืมรหัสผ่าน</td>
                <td style="width: 359px">
                    <asp:DropDownList ID="questionDDL" runat="server" Width="156px" AutoPostBack="True">
                        <asp:ListItem Value="Select">[เลือก]</asp:ListItem>
                        <asp:ListItem Value="1">สถานที่ที่คุณชอบไป</asp:ListItem>
                        <asp:ListItem Value="2">ชื่อสัตว์เลี้ยงตัวโปรดของคุณ</asp:ListItem>
                        <asp:ListItem Value="3">ภาพยนตร์ที่คุณชอบ</asp:ListItem>
                        <asp:ListItem Value="4">ชื่อแฟนคนแรกของคุณ</asp:ListItem>
                        <asp:ListItem Value="5">อาหารที่คุณคิดว่าอร่อยที่สุด</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="questionRFV" runat="server" ControlToValidate="questionDDL" InitialValue="Select" Display="Dynamic" ValidationGroup="retrievesystem" ErrorMessage="กรุณาเลือกคำถาม"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>คำตอบ</td>
                <td style="width: 359px"><asp:TextBox ID="answer" runat="server" Width="150px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="answerRFV" runat="server" ControlToValidate="answer" Display="Dynamic" ValidationGroup="retrievesystem" ErrorMessage="กรุณาใส่คำตอบ"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="answerREV" runat="server" ControlToValidate="answer" Display="Dynamic" ValidationExpression="\w{1,45}" ValidationGroup="retrievesystem" ErrorMessage="คำตอบไม่ถูกต้อง"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" Width="50px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="TextBox1" ValidationExpression="1|2|3|4|5|6|7|8|9" ValidationGroup="retrievesystem" runat="server" ErrorMessage="1-9"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="TextBox2" runat="server" Width="46px"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator1" ControlToValidate="TextBox2" MaximumValue="2600" MinimumValue="2549" ValidationGroup="retrievesystem" runat="server" ErrorMessage="2549-2600"></asp:RangeValidator></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="Button2" runat="server" Text="ค้นคืนรหัสผ่าน" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="110px" ValidationGroup="retrievesystem" />
                    <asp:Button ID="Button3" runat="server" Text="เคลียร์" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="110px" />
                </td>
            </tr>
        </table>
    </form>
    <iframe width=132 height=142 name="gToday:contrast:agenda.js" id="gToday:contrast:agenda.js" 
    src="DateRange/ipopeng.htm" scrolling="no" frameborder="0" 
    style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
</iframe>            
</body>
</html>
