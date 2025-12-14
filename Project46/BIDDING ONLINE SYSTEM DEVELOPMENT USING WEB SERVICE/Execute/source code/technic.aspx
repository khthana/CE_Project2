<%@ Page language="c#" Codebehind="technic.aspx.cs" AutoEventWireup="false" Inherits="project.technic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>technic</title>
<meta content="Microsoft Visual Studio 7.0" name=GENERATOR>
<meta content=C# name=CODE_LANGUAGE>
<meta content=JavaScript name=vs_defaultClientScript>
<meta content=http://schemas.microsoft.com/intellisense/ie5 name=vs_targetSchema>
  </HEAD>
<body MS_POSITIONING="GridLayout">
<form id=technic method=post runat="server">
<TABLE id=Table1 
style="Z-INDEX: 102; LEFT: 21px; WIDTH: 104px; POSITION: absolute; TOP: 53px; HEIGHT: 566px" 
cellSpacing=1 cellPadding=1 width=104 border=0>
  <TR>
    <TD style="WIDTH: 112px; HEIGHT: 179px"><FONT 
      face=Tahoma><asp:linkbutton id=lnkAddNewRow onclick=DataGrid_AddNewRow runat="server">ต้องมากกว่า</asp:linkbutton></FONT></TD></TR>
  <TR>
    <TD style="WIDTH: 112px; HEIGHT: 177px"><asp:linkbutton id=LinkButton1 onclick=DataGrid1_AddNewRow runat="server">ต้องน้อยกว่า</asp:linkbutton></TD></TR>
  <TR>
    <TD style="WIDTH: 112px"><asp:linkbutton id=LinkButton2 onclick=DataGrid2_AddNewRow runat="server" Height="26px">ต้องมีหรือไม่มี</asp:linkbutton></TD></TR></TABLE>
<asp:linkbutton id=lnkmain style="Z-INDEX: 101; LEFT: 329px; POSITION: absolute; TOP: 9px" runat="server">กลับไปหน้าประกวด</asp:linkbutton>
<asp:datagrid id=dg style="Z-INDEX: 104; LEFT: 156px; POSITION: absolute; TOP: 60px" runat="server" Height="174px" Width="532px" PageSize="4" AllowPaging="True" OnPageIndexChanged="DataGrid_Page" OnSortCommand="DataGrid_Sort" OnEditCommand="DataGrid_Edit" OnCancelCommand="DataGrid_Cancel" OnUpdateCommand="DataGrid_Update" OnDeleteCommand="DataGrid_Delete" DataKeyField="IDSpect" AutoGenerateColumns="False" BackColor="#FFE0C0">
<Columns>
<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="Update" HeaderText="Edit" CancelText="Cancle" EditText="Edit"></asp:EditCommandColumn>
<asp:BoundColumn DataField="Detail" HeaderText="ชื่อสเปค"></asp:BoundColumn>
<asp:BoundColumn DataField="Number" HeaderText="จำนวน(ตัวเลข)"></asp:BoundColumn>
<asp:BoundColumn DataField="Unit" HeaderText="หน่วย"></asp:BoundColumn>
<asp:ButtonColumn Text="Delete" HeaderText="Delete" CommandName="Delete"></asp:ButtonColumn>
<asp:TemplateColumn>
	<ItemTemplate>
		
	</ItemTemplate>
</asp:TemplateColumn>
</Columns>

<PagerStyle HorizontalAlign="Left" Mode="NumericPages">
</PagerStyle>
</asp:datagrid>
<asp:datagrid id=dg1 style="Z-INDEX: 105; LEFT: 157px; POSITION: absolute; TOP: 235px" runat="server" Height="176px" Width="532px" PageSize="4" AllowPaging="True" OnPageIndexChanged="DataGrid1_Page" OnSortCommand="DataGrid1_Sort" OnEditCommand="DataGrid1_Edit" OnCancelCommand="DataGrid1_Cancel" OnUpdateCommand="DataGrid1_Update" OnDeleteCommand="DataGrid1_Delete" DataKeyField="IDSpect" AutoGenerateColumns="False" BackColor="#FFFFC0">
<Columns>
<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="Update" HeaderText="Edit" CancelText="Cancle" EditText="Edit"></asp:EditCommandColumn>
<asp:BoundColumn DataField="Detail" HeaderText="ชื่อสเปค"></asp:BoundColumn>
<asp:BoundColumn DataField="Number" HeaderText="จำนวน(ตัวเลข)"></asp:BoundColumn>
<asp:BoundColumn DataField="Unit" HeaderText="หน่วย"></asp:BoundColumn>
<asp:ButtonColumn Text="Delete" HeaderText="Delete" CommandName="Delete"></asp:ButtonColumn>
</Columns>

<PagerStyle HorizontalAlign="Left" Mode="NumericPages">
</PagerStyle>
</asp:datagrid>
<asp:datagrid id="dg2" runat="server" Height="178px" Width="531px" PageSize="4" AllowPaging="True" OnPageIndexChanged="DataGrid2_Page" OnSortCommand="DataGrid2_Sort" OnEditCommand="DataGrid2_Edit" OnCancelCommand="DataGrid2_Cancel" OnUpdateCommand="DataGrid2_Update" OnDeleteCommand="DataGrid2_Delete" DataKeyField="IDSpect" AutoGenerateColumns="False" style="Z-INDEX: 106; LEFT: 157px; POSITION: absolute; TOP: 410px" BackColor="#C0FFC0">
<Columns>
<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="Update" HeaderText="Edit" CancelText="Cancle" EditText="Edit"></asp:EditCommandColumn>
<asp:BoundColumn DataField="Detail" HeaderText="รายละเอียดที่ต้องมี"></asp:BoundColumn>
<asp:ButtonColumn Text="Delete" HeaderText="Delete" CommandName="Delete"></asp:ButtonColumn>
</Columns>

<PagerStyle HorizontalAlign="Left" Mode="NumericPages">
</PagerStyle>
						</asp:datagrid></form>
	</body>
</HTML>
