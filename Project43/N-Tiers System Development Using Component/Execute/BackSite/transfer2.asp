<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</HEAD>
<BODY>

<%
	SourceID = Request.Form("text4")
	DestID = Request.Form("text5")
	Amount = Request.Form("text6")

	dim result 
	dim findObj 
	set findObj  = server.CreateObject("BankManager.BankController")
	result = findObj.payByDebitCard(Cstr(SourceID),Cstr(DestID),CCur(Amount))
	Response.Write "TransactionID  "
	Response.Write result
%>

</BODY>
</HTML>
