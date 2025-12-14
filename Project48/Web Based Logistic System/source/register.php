<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
</head>

<body bgcolor="#FFCC00" background="images/bg01.gif">
<script language="JavaScript">
function checknumber()
{
e_k=event.keyCode //if(e_k !=13 &&(e_k<48)||(e_k>57)){event.returnValue=false;
if(((e_k<48)||(e_k>57))&&e_k!=46){
alert("กรุณากรอกตัวเลขเท่านั้น");}}
</script> 
<table width=70% border=0 align='center' cellpadding=0 cellspacing=0 bgcolor="#FFFFFF">
  <tr> 
    <td width="20%"  rowspan=2 bgcolor="#FFCC33"><img src='images/Logistic_01.gif' width=133 height=68 > 
    </td>
    <td width="80%" height="47" bgcolor="#FFCC33" >&nbsp;<img src='images/Logistic_02.gif' width=93 height=45  ><img src='images/Logistic_03.gif' width=90 height=45 ><img src='images/Logistic_04.gif' width=97 height=45 ><img src='images/Logistic_05.gif' width=104 height=45 ><img src='images/Logistic_06.gif' width=90 height=45 ><img src='images/Logistic_07.gif' width=57 height=45 ></td>
  </tr>
  <tr> 
    <td height='18' bgcolor='#FFCC00'><div align="center"><strong><font color="#0000FF" size="3" face="MS Sans Serif, Tahoma, sans-serif">แบบฟอร์มสมัครใช้บริการ</font></strong></div></td>
  </tr>
  <tr> 
    <td height='18' colspan='2' valign='top'> <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr> 
          <td height="18" valign="top" bgcolor="#F0F0F0">
		  <?
		  if($file=="")
		  {
		  include('formpersonal_type.php');
		  }else{
		  include($file);
		  }
		  ?></td>
        </tr>
      </table></td>
  </tr>
  <tr bgcolor="#FFCC33"> 
    <td height='16' colspan='2' valign='top'><div align="right"><strong><font color="#999999" size="2" face="MS Sans Serif, Tahoma, sans-serif">แบบฟอร์มสมัครใช้บริการ</font></strong></div></td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
