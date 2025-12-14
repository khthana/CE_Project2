<%@ Page language="c#" Codebehind="searchinformation.aspx.cs" AutoEventWireup="false" Inherits="Hospital.searchinformation" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>register1</title>
		<META http-equiv="Content-Type" content="text/html; charset=windows-874">
		<meta name="GENERATOR" Content="Microsoft Visual Studio 7.0">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<font color="#ff5000">
			<h3>สอบถามข้อมูลการประกันสุขภาพของประชาชน</h3>
			<br>
		</font>&nbsp; &nbsp; &nbsp; &nbsp; หมายเลขประจำตัวประชาชนผู้ที่ต้องการสืบค้น <FONT face="Tahoma">
			<br>
			<br>
			<DIV ms_positioning="FlowLayout" align="center" style="WIDTH: 612px; POSITION: relative; HEIGHT: 23px">
				<FORM id="Form1" action="queryHealthy/query.aspx" method="post" name="InputForm">
					&nbsp; <STRONG>PID :</STRONG> <INPUT type="text" size="20" name="PIDText"> <INPUT type="button" value=" GO! " onclick="checkInput()">&nbsp;
				</FORM>
		</FONT></DIV></FONT>
	</body>
</HTML>
<SCRIPT LANGUAGE="JavaScript">
<!--
 function checkInput() {
	var o = document.InputForm;
	if(o.PIDText.value==""){
		alert("กรุณาใส่  Input");
	}
	else if (isNaN(o.PIDText.value)){
		alert("กรุณาใส่ Input เป็นตัวเลข");
	}
	else if(o.PIDText.value.length!=13){
		alert("กรุณาใส่Inputเป็นตัวเลข 13 หลัก");
	}
	else {
		o.submit();
	}
 }
//-->
</SCRIPT>
