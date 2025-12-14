<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</HEAD>
<BODY>

<%
	SourceID = Request.Form("text1")
	DestID = Request.Form("text2")
	Amount = Request.Form("text3")

	dim result 
	dim findObj 
	set findObj  = server.CreateObject("BankManager.BankController")
	result = findObj.payByCreditCard(Cstr(SourceID),Cstr(DestID),CCur(Amount))
	Response.Write "TransactionID  "
	Response.Write result
%>

</BODY>
</HTML>
