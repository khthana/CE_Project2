<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</HEAD>
<BODY>

<%
	SourceID = Request.Form("text7")
	DestID = Request.Form("text8")
	Amount = Request.Form("text9")
	Password = Request.Form("Password1")

	dim result 
	dim findObj 
	set findObj  = server.CreateObject("BankManager.BankController")
	result = findObj.transfer(Cstr(SourceID),Cstr(DestID),CCur(Amount),Cstr(Password))
	Response.Write "TransactionID  "
	Response.Write result
%>

</BODY>
</HTML>
