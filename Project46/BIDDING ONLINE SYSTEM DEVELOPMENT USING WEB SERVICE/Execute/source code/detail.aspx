<%@ Page language="c#" Codebehind="detail.aspx.cs" AutoEventWireup="false" Inherits="WebService1.detail" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>detail</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio 7.0">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="detail" method="post" runat="server">
			<TABLE id="Table1" style="Z-INDEX: 101; LEFT: 21px; WIDTH: 569px; POSITION: absolute; TOP: 28px; HEIGHT: 317px" cellSpacing="1" cellPadding="1" width="569" border="0">
				<TR>
					<TD style="WIDTH: 193px"></TD>
					<TD style="WIDTH: 145px"><FONT face="Tahoma">
							<asp:Label id="Label2" runat="server" Width="170px">ข้อความนี้จะถูกเก็บเป็นความลับภายในสำนักงาน</asp:Label></FONT></TD>
					<TD></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 193px">
						<asp:Label id="Label4" runat="server">วัตถุประสงค์</asp:Label></TD>
					<TD style="WIDTH: 145px"><TEXTAREA rows="2" cols="20" id="TEXTAREA1" name="TEXTAREA1" runat="server">
						</TEXTAREA></TD>
					<TD></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 193px">
						<asp:Label id="Label5" runat="server">กลุ่มเป้าหมาย</asp:Label></TD>
					<TD style="WIDTH: 145px"><TEXTAREA id="TEXTAREA2" name="TEXTAREA2" rows="2" cols="20" runat="server">
						</TEXTAREA></TD>
					<TD></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 193px">
						<asp:Label id="Label6" runat="server">งบประมาณ(ตัวเลข)</asp:Label></TD>
					<TD style="WIDTH: 145px">
						<asp:TextBox id="TextBox1" runat="server"></asp:TextBox></TD>
					<TD><FONT face="Tahoma">
							<asp:Label id="Label14" runat="server">บาท</asp:Label>
							<asp:RangeValidator id="RangeValidator1" runat="server" ErrorMessage="กรุณาใส่เป็นตัวเลข(มากกว่า0)" ControlToValidate="TextBox1" Type="Double" MinimumValue="0" MaximumValue="999999999"></asp:RangeValidator></FONT></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 193px">
						<asp:Label id="Label8" runat="server">ลักษณะกิจกรรม</asp:Label></TD>
					<TD style="WIDTH: 145px"><TEXTAREA id="TEXTAREA3" name="TEXTAREA3" rows="2" cols="20" runat="server">						</TEXTAREA></TD>
					<TD><FONT face="Tahoma"></FONT></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 193px"><FONT face="Tahoma">
							<asp:Label id="Label12" runat="server">หมายเหตุ</asp:Label></FONT></TD>
					<TD style="WIDTH: 145px"><FONT face="Tahoma"><TEXTAREA id="TEXTAREA4" name="TEXTAREA4" rows="2" cols="20" runat="server">						</TEXTAREA></FONT></TD>
					<TD><FONT face="Tahoma"></FONT></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 193px"><FONT face="Tahoma"></FONT><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 145px">&nbsp;
						<asp:Button id="btnsubmit" runat="server" Text="submit"></asp:Button>
						<INPUT type="reset" value="Reset"></TD>
					<TD><FONT face="Tahoma"></FONT></TD>
					<TD><FONT face="Tahoma"></FONT></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 193px"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 145px">
						<P>
							<asp:LinkButton id="lnktomain" runat="server">กลับไปหน้าหลัก</asp:LinkButton></P>
						<P>&nbsp;</P>
					</TD>
					<TD><FONT face="Tahoma"></FONT></TD>
					<TD></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
