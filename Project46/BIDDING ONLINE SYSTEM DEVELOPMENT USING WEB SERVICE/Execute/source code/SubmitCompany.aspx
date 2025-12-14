<%@ Page language="c#" Codebehind="SubmitCompany.aspx.cs" AutoEventWireup="false" Inherits="project.SubmitCompany" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>SubmitCompany</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="SubmitCompany" method="post" runat="server">
			<TABLE id="Table2" style="Z-INDEX: 102; LEFT: 23px; WIDTH: 674px; POSITION: absolute; TOP: 18px; HEIGHT: 533px" cellSpacing="1" cellPadding="1" width="674" border="0">
				<TR>
					<TD colSpan="3">
						<P><FONT face="Tahoma"></FONT></P>
					</TD>
				</TR>
				<TR>
					<TD style="HEIGHT: 34px"><asp:label id="Label4" runat="server">ชื่อบริษัท</asp:label></TD>
					<TD style="WIDTH: 408px; HEIGHT: 34px"><asp:textbox id="txtName" runat="server" Width="276px"></asp:textbox></TD>
					<TD style="HEIGHT: 34px"><asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" ErrorMessage="กรุณาใส่ชื่อบริษัท" ControlToValidate="txtName"></asp:requiredfieldvalidator></TD>
				</TR>
				<TR>
					<TD style="HEIGHT: 64px"><asp:label id="Label5" runat="server">ที่อยู่</asp:label></TD>
					<TD style="WIDTH: 408px; HEIGHT: 64px"><asp:textbox id="txtAddress" runat="server" Width="446px" Height="51px"></asp:textbox></TD>
					<TD style="HEIGHT: 64px"><asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" ErrorMessage="กรุณาใส่ที่อยู่" ControlToValidate="txtAddress"></asp:requiredfieldvalidator></TD>
				</TR>
				<TR>
					<TD style="HEIGHT: 118px"><asp:label id="Label6" runat="server">โทรศัพท์</asp:label></TD>
					<TD style="WIDTH: 408px; HEIGHT: 118px"><asp:textbox id="txtTelephone" runat="server"></asp:textbox></TD>
					<TD style="HEIGHT: 118px"><asp:regularexpressionvalidator id="regPhone" runat="server" ErrorMessage="กรุณากรอกให้ถูกรูปแบบ 00-000-0000" ValidationExpression="((\(\d{2}\) ?)|(\d{2}-))?\d{3}-\d{4}" ControlToValidate="txtTelephone"></asp:regularexpressionvalidator><asp:requiredfieldvalidator id="RequiredFieldValidator7" runat="server" ErrorMessage="กรุณาใส่เบอร์โทรศัพท์" ControlToValidate="txtTelephone"></asp:requiredfieldvalidator></TD>
				</TR>
				<TR>
					<TD><asp:label id="Label1" runat="server">Email</asp:label></TD>
					<TD style="WIDTH: 408px"><asp:textbox id="txtEmail" runat="server"></asp:textbox></TD>
					<TD><asp:requiredfieldvalidator id="RequiredFieldValidator3" runat="server" ErrorMessage="กรุณาใส่ Email" ControlToValidate="txtEmail"></asp:requiredfieldvalidator>
						<asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="กรุณาใส่ email ให้ถูกต้อง" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></TD>
				</TR>
				<TR>
					<TD><asp:label id="Label7" runat="server">UserName</asp:label></TD>
					<TD style="WIDTH: 408px">
						<P><asp:textbox id="txtUserName" runat="server"></asp:textbox></P>
					</TD>
					<TD><asp:requiredfieldvalidator id="RequiredFieldValidator4" runat="server" ErrorMessage="กรุณาใส่User Name" ControlToValidate="txtUserName"></asp:requiredfieldvalidator></TD>
				</TR>
				<TR>
					<TD><asp:label id="Label2" runat="server">Password</asp:label></TD>
					<TD style="WIDTH: 408px">
						<P><asp:textbox id="txtPassword" runat="server" TextMode="Password"></asp:textbox></P>
					</TD>
					<TD><asp:requiredfieldvalidator id="RequiredFieldValidator5" runat="server" ErrorMessage="กรุณาใส่Password" ControlToValidate="txtPassword"></asp:requiredfieldvalidator></TD>
				</TR>
				<TR>
					<TD><asp:label id="Label3" runat="server">ConfirmPassword</asp:label></TD>
					<TD style="WIDTH: 408px"><asp:textbox id="txtConfirmPass" runat="server" TextMode="Password"></asp:textbox></TD>
					<TD><asp:comparevalidator id="CompareValidator1" runat="server" ErrorMessage="Password Not Match" ControlToValidate="txtConfirmPass" ControlToCompare="txtPassword"></asp:comparevalidator>
						<asp:RequiredFieldValidator id="RequiredFieldValidator6" runat="server" ControlToValidate="txtConfirmPass" ErrorMessage="กรุณายืนยัน password"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD></TD>
					<TD style="WIDTH: 408px">
						<P><asp:button id="Button1" runat="server" Text="Submit"></asp:button><INPUT type="reset" value="Reset"></P>
					</TD>
					<TD></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
