<?php
/*เรียกแฟ้มข้อมูล phpConfig.php*/
include("phpConfig.php");

if(isset($Session[@login_name]))
	@$login_name=$Session[login_name];	
@setlocale("LC_TIME","th");	//ใช้เวลาแบบไทย (ดูตัวอย่างในบทที่ 7)
	$a = date("j");	 // วันที่
	$b = strftime("%B");	 // เดือนเต็ม
	$c = strftime("%Y")+543;	 // ปี พ.ศ.
	$d = date("H:i:s");	 // เวลา

	$a_date = "$a $b $c";

	// เริ่มติดต่อฐานข้อมูล
	mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

		mysql_query("SET NAMES 'tis620'");

	// เลือกฐานข้อมูล
	mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");
	
	$sql = "select * from member where login_name = '$login_name'";
	$db_query = mysql_db_query ($dbname, $sql);
?>
<html>
<head>
<title>:: ระบบห้องสมุดบนมือถือ ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link rel="stylesheet" href="discuss.css" type="text/css">
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<table width="95%" border="0" cellspacing="0" cellpadding="2" align="center">
  <tr> 
    <td><span class="Tahoma25"><b></b></span></td>
  </tr>
</table>
<br>
<?php
$nums_rows = mysql_num_rows($db_query);
		
	if ($nums_rows < 1 )
		{
			echo ("<font color=\"red\">ไม่มีข้อมูลแสดง1</font>");
			exit;
		}	// จบ if


	for ($i=0;$i<$nums_rows;$i++)	// เริ่มรับข้อมูลจากฟิลด์ต่าง ๆ ในตาราง question1
		{
			$result = mysql_fetch_array($db_query);
							@$name = $result[name];
							@$surname = $result[surname];
							@$sex = $result[sex];
							@$age = $result[age];
							@$address = $result[address];
							@$tell = $result[tell];
							@$login_name = $result[login_name];
							@$login_password = $result[login_password];
							@$email = $result[email];
						   @ $pic = $result[pic];
							@$status = $result[status];
							@$status1 = $result[status1];
							@$status2 = $result[status2];
							@$status3 = $result[status3];
		}

echo "<table width=\"95%\" border=\"0\" cellspacing=\"1\" cellpadding=\"3\" align=\"center\">\n";
echo "<tr bgcolor=\"#333366\">\n";
echo "<td width=\"24%\" class=\"Tahoma11\"><b><font color=\"#CCFF00\">::ข้อมูลของคุณ $login_name เป็นดังนี้ ::</font></b></td>\n";
echo "<td width=\"76%\" class=\"Tahoma11\"><b><font color=\"#CCFF00\">:: รายละเอียด ::</font></b></td>\n";
echo "</tr>\n";
echo "<tr bgcolor=\"#7172A8\" valign=\"top\">\n";
echo "<td width=\"24%\" class=\"Tahoma13\">\n";
echo "<p><b><font color=\"#FFFFCC\"><b></b></font></b><br>\n";

		echo "</p>\n";
		echo "<table width=\"98%\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\">\n";
		echo "<tr bgcolor=\"#9999CC\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">ชื่อ:</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\"><b><font color=\"#990099\">$name</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#8585C2\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">นามสกุล :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\"><b><font color=\"#990099\">$surname</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#9999CC\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">อายุ :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\"><b><font color=\"#990099\">$age</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#8585C2\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">เพศ :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\"><b><font color=\"#990099\">$sex</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#9999CC\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">Phone :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\" bgcolor=\"#9999CC\"><b><font color=\"#990099\">$tell</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#8585C2\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">user :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\" bgcolor=\"#8585C2\"><b><font color=\"#990099\">$login_name</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#9999CC\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">password :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\" bgcolor=\"#9999CC\"><b><font color=\"#990099\">$login_password</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#8585C2\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">email :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\" bgcolor=\"#8585C2\"><b><font color=\"#990099\">$email</font></b></td>\n";
		echo "</tr>\n";
		
		
		echo "</table>\n";
		echo "<br>\n";
		
	

echo "<br>\n";
echo "<table width=\"98%\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\">\n";


echo "</table>\n";
echo "<br>\n";
echo "</td>\n";
echo "<td width=\"76%\" class=\"Tahoma13\"><br>\n";
echo "<br>\n";
echo "<table width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n";
echo "<tr>";
echo "<td valign=\"top\" class=\"Tahoma11\" align=\"right\" bgcolor=\"#000000\"><img src=\"webboard/blank.gif\" width=\"1\" height=\"1\"></td>\n";
echo "</tr>\n";

echo "<td valign=\"top\" class=\"Tahoma11\" align=\"right\"><img src=\"webboard/blank.gif\" width=\"1\" height=\"2\"></td>\n";

echo "<tr>\n";
echo "<td valign=\"top\" class=\"Tahoma13\"><font color=\"#fafafa\" size=\"4\"><b></b><br>&nbsp;</font></td>";
echo "</tr>\n";

echo "<tr>\n";
echo "<td valign=\"top\" class=\"Tahoma11\" align=\"right\" bgcolor=\"#000000\"><img src=\"webboard/blank.gif\" width=\"1\" height=\"1\"></td>\n";
echo "</tr>\n";

echo "<tr>\n";
echo "<td valign=\"top\" class=\"Tahoma11\" align=\"right\"><img src=\"img/blank.gif\" width=\"1\" height=\"5\"><br><br></td>\n";
echo "</tr>\n";
echo "<tr>\n";
echo "<td valign=\"top\" class=\"Tahoma11\" align=\"center\"><font color=\"#000000\">\n";
print <<<EOT
<HTML><HEAD><TITLE>:: samharv.cjb.net</TITLE>
<META 
content=freewebboard,freeguestbook,freepoll,freescript,
name=keywords>
<META 
content="Thai PHP Developer PHP devforum เว็บบอร์ดฟรีที่ดีที่สุดในประเทศ" 
name=description>
<META http-equiv=Content-Type content="text/html; charset=tis-620"><LINK 
href="webboard/style.css" 
type=text/css rel=stylesheet>
<SCRIPT language=JavaScript>
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</SCRIPT>
<STYLE type=text/css>A:link {
	FONT-SIZE: x-small; COLOR: #005ca2; FONT-FAMILY: "MS Sans Serif", "Microsoft Sans Serif"; TEXT-DECORATION: underline
}
A:visited {
	FONT-SIZE: x-small; COLOR: green; FONT-FAMILY: "MS Sans Serif", "Microsoft Sans Serif"; TEXT-DECORATION: underline
}
A:active {
	FONT-SIZE: x-small; COLOR: #0099ff; FONT-FAMILY: "MS Sans Serif", "Microsoft Sans Serif"; TEXT-DECORATION: none
}
A:hover {
	FONT-SIZE: x-small; COLOR: #0099ff; FONT-FAMILY: "MS Sans Serif", "Microsoft Sans Serif"; TEXT-DECORATION: none
}
TD {
	FONT-SIZE: x-small; FONT-FAMILY: "MS Sans Serif", "Microsoft Sans Serif"
}
INPUT {
	BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; FONT-SIZE: 10pt; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid; FONT-FAMILY: "MS Sans Serif", "Microsoft Sans Serif"
}
TEXTAREA {
	BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; FONT-SIZE: x-small; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid; FONT-FAMILY: "MS Sans Serif", "Microsoft Sans Serif"
}
</STYLE>

<META content="MSHTML 6.00.2800.1458" name=GENERATOR></HEAD>
<BODY bgColor=#7172A8>
<SCRIPT 
src="webboard/photo2mobileJS.js"></SCRIPT>





<FORM  name=addcomment onsubmit="return check()" action=addedit_member.php
method=post encType=multipart/form-data><INPUT type=hidden value=tips name=user> 
<input type="hidden" name="login_name" value="$login_name"> 
<TABLE borderColor=#7172A8width="75%" align=center bgColor=#7172A8>
  <TBODY>
  <TR>
    <TD>
      <DIV align=center><FONT face="Verdana, Arial, Helvetica, sans-serif" 
      color=#000000 size=4><B>แก้ไขข้อมูลสมาชิก</B></FONT></DIV></TD></TR>
  <TR>
    <TD bgColor=#7172A8><BR>
      <TABLE width="95%" align=center border=0>
        <TBODY>
         <TR>
          <TD>ชื่อ :</TD>
          <TD><INPUT Type=Text maxLength=50 size=50 name=name> * </TD></TR>
        <TR>
          <TD>นามสกุล :</TD>
          <TD><INPUT Type=Text  maxLength=50 size=50 name=surname> * </TD></TR>
          <TR>
          <TD>เพศ :</td>
         <td><INPUT maxLength=5 size=5 name=sex>
        &nbsp;&nbsp; อายุ :&nbsp;&nbsp;<INPUT maxLength=5 size=5 name=age></TD></TR>
   <TR>
          <TD>username :</TD>
          <TD><INPUT Type=Text maxLength=50 size=50 name=login_name2> * </TD></TR>
 <TR>
          <TD>รหัสผ่าน :</TD>
          <TD><INPUT Type=Password  maxLength=10 size=10 name=login_password> *</TD></TR>
  <TR>
          <TD>ยืนยันรหัสผ่าน :</TD>
          <TD><INPUT Type=Password  maxLength=10 size=10 name=login_password2> *</TD></TR>
<TR>
          <TD>E-mail :</TD>
          <TD><INPUT Type=Text maxLength=50 size=50 name=email></TD></TR>
     
		  <TR>
          <TD>เบอร์โทรศัพท์ :</TD>
          <TD><INPUT Type=Text maxLength=10 size=50 name= tell> </TD></TR>
<TR>
          <TD>ภาพประกอบ :</TD>
		 
<TD><INPUT type=file  name=picture size = 36></TD></tr>
 

        <TR>
        <TR>
          <TD>ที่อยู่ที่ติดต่อได้: 
           </TD>
          <TD><TEXTAREA name=address rows=8 cols=50></TEXTAREA> * <BR>
	   <TABLE borderColor=#000000 cellSpacing=0 cellPadding=0 width=200 
            border=1>
              <TBODY>
              <TR vAlign=center align=middle>
                <TD>
                  <DIV align=center><A 
                  href="javascript:emoticon('<b></b>')"><IMG alt=ตัวหนา 
                  src="webboard/icon_bold.gif" 
                  border=0></A> </DIV></TD>
                <TD>
                  <DIV align=center><A 
                  href="javascript:emoticon('<i></i>')"><IMG alt=ตัวเอียง 
                  src="webboard/icon_italic.gif" 
                  border=0></A></DIV></TD>
                <TD>
                  <DIV align=center><A 
                  href="javascript:emoticon('<u></u>')"><IMG alt=ตัวขีดเส้นใต้ 
                  src="webboard/icon_underline.gif" 
                  border=0></A></DIV></TD>
                <TD>
                  <DIV align=center><A 
                  onclick="open_windows('help.htm','add','width=350,height=480')" 
                  href="#"><IMG 
                  alt=Help 
                  src="webboard/icon_help.gif" 
                  border=0></A></DIV></TD></TR></TBODY></TABLE>
           <BR></TD></TR></td>



       

          
  
 <TR>
          <TD>&nbsp;</TD>


          <TD><INPUT type=submit value="Register" name=Action> * <INPUT type=reset value=Clear name=B2> [ <A 
            href="list.php" 
            target=_blank>แจ้งปัญหาการใช้งานเว็บบอร์ด</A> ] <BR></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD bgColor=#7172A8><FONT face=Verdana size=2>โปรแกรมห้องสมุด version 1.0 <B>:: 
      Powered by : </B><A href="http://www.samharv.cjb.net/" 
      target=_blank>นายสุริยัน ศรีมาตย์</A> &copy; 
      2004-2006 All rights reserved. </FONT></TD></TR></TBODY></TABLE></FORM>
   <SCRIPT language=javascript1.2>
function emoticon(what)
{
	document.addcomment.address.value = document.addcomment.elements.address.value+" "+what;
	document.addcomment.address.focus();
}

function open_windows(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

</SCRIPT>
</BODY></HTML>



</body>
</html>

EOT;
echo"</font></td>\n";

echo "</tr>\n";
echo "</table>\n";
echo "</td>\n";
echo "</tr>\n";

echo "<tr bgcolor=\"#333366\">\n";
echo "<td width=\"24%\" class=\"Tahoma13\" align=\"center\" bgcolor=\"#000000\"><font color=\"#FFFFFF\"><DIV align=right><b>Today :<b>\n";
echo"$a_date";
echo"<b> เวลา:</>$d<b>น.</b></DIV><BR></font></td>\n";
echo "<td width=\"76%\" class=\"Tahoma13\">";
echo "<a href=\"list.php\">";
echo "<img src=\"webboard/home_small.gif\" width=\"16\" height=\"16\" hspace=\"5\" border=\"0\"alt=\"หน้าแรก\">";
echo "</a>";


echo "</td>\n";
echo "</tr>\n";
echo "</table>\n";


		

?>
<br>
</body>
</html>