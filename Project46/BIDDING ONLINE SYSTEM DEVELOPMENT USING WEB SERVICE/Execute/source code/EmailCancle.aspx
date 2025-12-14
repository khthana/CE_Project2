<%@ Page language="c#" Codebehind="EmailCancle.aspx.cs" AutoEventWireup="false" Inherits="project.EmailCancle" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>EmailCancle</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio 7.0">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="EmailCancle" method="post" runat="server">
			<asp:Label id="Label1" style="Z-INDEX: 101; LEFT: 104px; POSITION: absolute; TOP: 85px" runat="server">email นี้จะแจ้งให้ทุกผู้ประกอบการทุกรายทราบข่าวการยกเลิกการประกวด</asp:Label>
			<asp:Label id="Label2" style="Z-INDEX: 102; LEFT: 207px; POSITION: absolute; TOP: 276px" runat="server">ข้อความ</asp:Label>
			<asp:Label id="Label3" style="Z-INDEX: 103; LEFT: 216px; POSITION: absolute; TOP: 162px" runat="server">หัวข้อ</asp:Label>
			<asp:TextBox id="txtnews" style="Z-INDEX: 104; LEFT: 340px; POSITION: absolute; TOP: 165px" runat="server" Width="216px"></asp:TextBox>
			<asp:TextBox id="txtsubject" style="Z-INDEX: 105; LEFT: 342px; POSITION: absolute; TOP: 224px" runat="server" Height="160px" Width="216px"></asp:TextBox>
			<asp:Button id="Button1" style="Z-INDEX: 106; LEFT: 203px; POSITION: absolute; TOP: 438px" runat="server" Text="Button"></asp:Button>
			<INPUT style="Z-INDEX: 107; LEFT: 379px; POSITION: absolute; TOP: 433px" type="reset" value="Reset">
			<asp:Label id="Label4" style="Z-INDEX: 108; LEFT: 178px; POSITION: absolute; TOP: 38px" runat="server">Label</asp:Label>
			<asp:LinkButton id="LinkButton1" style="Z-INDEX: 109; LEFT: 539px; POSITION: absolute; TOP: 436px" runat="server">กลับไปหน้าหลัก</asp:LinkButton>
		</form>
	</body>
</HTML>
