<%@ Page language="c#" Codebehind="SubmitGoverment.aspx.cs" AutoEventWireup="false" Inherits="project.SubmitGoverment" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>SubmitGoverment</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="SubmitGoverment" method="post" runat="server">
			<TABLE id="Table1" style="Z-INDEX: 101; LEFT: 74px; WIDTH: 534px; POSITION: absolute; TOP: 25px; HEIGHT: 364px" cellSpacing="1" cellPadding="1" width="534" border="0">
				<TR>
					<TD style="WIDTH: 176px"><asp:label id="Label1" runat="server" Width="125px" Height="24px">ชื่อสำนักงาน</asp:label></TD>
					<TD style="WIDTH: 223px"><asp:textbox id="txtName" runat="server" Width="157px"></asp:textbox></TD>
					<TD><FONT face="Tahoma">
							<asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server" ErrorMessage="กรุณาใส่ชื่อ" ControlToValidate="txtName"></asp:RequiredFieldValidator></FONT></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 176px"><FONT face="Tahoma"><FONT face="Tahoma">
								<asp:label id="Label17" runat="server">เรียกสำนักงานนี้ว่า</asp:label></FONT></FONT></TD>
					<TD style="WIDTH: 223px"><FONT face="Tahoma">
							<asp:textbox id="txtCall" runat="server"></asp:textbox></FONT></TD>
					<TD><FONT face="Tahoma">
							<asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server" ErrorMessage="กรุณาใส่ชื่อย่อ" ControlToValidate="txtCall"></asp:RequiredFieldValidator></FONT></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 176px"><asp:label id="lll" runat="server">ที่อยู่</asp:label></TD>
					<TD style="WIDTH: 223px"><FONT face="Tahoma"><TEXTAREA id="areaAddress" style="WIDTH: 199px; HEIGHT: 38px" name="TEXTAREA1" rows="2" cols="22" runat="server">						</TEXTAREA></FONT></TD>
					<TD><FONT face="Tahoma">
							<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ErrorMessage="กรุณาใส่ที่อยู่" ControlToValidate="areaAddress"></asp:RequiredFieldValidator></FONT></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 176px"><asp:label id="Label12" runat="server">เบอร์โทร</asp:label></TD>
					<TD style="WIDTH: 223px"><asp:textbox id="txtPhone" runat="server" Width="154px"></asp:textbox></TD>
					<TD>
						<asp:RegularExpressionValidator id="regPhone" runat="server" ValidationExpression="((\(\d{2}\) ?)|(\d{2}-))?\d{3}-\d{4}" ErrorMessage="กรุณากรอกให้ถูกรูปแบบ 00-000-0000" ControlToValidate="txtPhone"></asp:RegularExpressionValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 176px"><asp:label id="Label2" runat="server">Username</asp:label></TD>
					<TD style="WIDTH: 223px"><FONT face="Tahoma"><asp:textbox id="txtUser" runat="server"></asp:textbox></FONT></TD>
					<TD><FONT face="Tahoma">
							<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="กรุณาใส่ชื่อ" ControlToValidate="txtUser"></asp:RequiredFieldValidator></FONT></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 176px; HEIGHT: 26px"><asp:label id="Label3" runat="server">Password</asp:label></TD>
					<TD style="WIDTH: 223px; HEIGHT: 26px"><asp:textbox id="txtPass" runat="server" TextMode="Password"></asp:textbox></TD>
					<TD style="HEIGHT: 26px"><FONT face="Tahoma"><FONT face="Tahoma">
								<asp:RequiredFieldValidator id="rfvpwd1" runat="server" ErrorMessage="กรุณาใส่รหัสผ่าน" ControlToValidate="txtPass"></asp:RequiredFieldValidator></FONT></FONT></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 176px"><asp:label id="Label4" runat="server">ConfermPassword</asp:label></TD>
					<TD style="WIDTH: 223px"><asp:textbox id="txtConfirmPass" runat="server" TextMode="Password"></asp:textbox></TD>
					<TD><FONT face="Tahoma"></FONT><FONT face="Tahoma">
							<P>
								<asp:RequiredFieldValidator id="rfvpwd2" runat="server" Width="109px" ErrorMessage="กรุณายืนยันรหัส" ControlToValidate="txtConfirmPass"></asp:RequiredFieldValidator></P>
							<P>
								<asp:CompareValidator id="cmppwd" runat="server" ErrorMessage="ใส่รหัสไม่ตรงกัน" ControlToValidate="txtPass" ControlToCompare="txtConfirmPass"></asp:CompareValidator></P>
						</FONT>
					</TD>
				</TR>
				<TR>
					<TD style="WIDTH: 176px">
						<asp:Label id="Label5" runat="server">Password  ผู้มีสิทธิยกเลิกการประกวด</asp:Label></TD>
					<TD style="WIDTH: 223px">
						<asp:TextBox id="TextBox1" runat="server" TextMode="Password"></asp:TextBox></TD>
					<TD><FONT face="Tahoma">
							<asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox1" ErrorMessage="กรุณาใส่รหัส"></asp:RequiredFieldValidator></FONT></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 176px">
						<asp:Label id="Label6" runat="server">Confirn ผู้มีสิทธิยกเลิกการประกวด</asp:Label></TD>
					<TD style="WIDTH: 223px"><FONT face="Tahoma">
							<asp:TextBox id="TextBox2" runat="server" TextMode="Password"></asp:TextBox></FONT></TD>
					<TD>
						<asp:RequiredFieldValidator id="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox2" ErrorMessage="กรุณายืนยันรหัส"></asp:RequiredFieldValidator>
						<asp:CompareValidator id="CompareValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="ใส่รหัสไม่ตรงกัน" ControlToCompare="TextBox2"></asp:CompareValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 176px"></TD>
					<TD style="WIDTH: 223px">
						<asp:button id="Button1" runat="server" Text="Button"></asp:button><asp:button id="Button2" runat="server" Text="cancle"></asp:button></TD>
					<TD><FONT face="Tahoma"></FONT></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
