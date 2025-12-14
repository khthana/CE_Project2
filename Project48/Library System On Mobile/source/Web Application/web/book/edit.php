<?

session_register("SessionMember");


if($SessionMember == ""){
?>
	<br><br><br><br><br><br><br><br><TABLE borderColor=#999999 width="50%" align=center bgColor=#999999>
  <TBODY>
  <TR>
    <TD>
      <DIV align=center><FONT face="Verdana, Arial, Helvetica, sans-serif" 
      color=#ffffff size=4><B>สวัดดีครับ :</B></FONT></DIV></TD></TR>
  <TR><td><center><IMG  src="picture/images.jpg"> - </center></td>
    <TD bgColor=#ffffff><br>
<center><b>ขณะนี้คุณยังไม่ได้ Login เข้าสู้ระบบ.............</b> 
		 <br> [ <A  href="login.htm" >กลับไปหน้า login ใหม่</A> ]</center>
<BR><br>
      </TD></TR></td><TR>
          <TD><center> [ <A  href="index.htm" >กลับไปหน้าแรก</A> ]<BR></center></TD></TR></TBODY></TABLE></TD></TR>
 </TBODY></TABLE>

<?
}else{
?>
<?
/*เรียกแฟ้มข้อมูล phpConfig.php*/
include("phpConfig.php");

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
	
	$sql = "select * from book where id = '$id'";
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
							@$catalog = $result[catalog];
							@$code = $result[code];
							@$name_book = $result[name_book];
							@$writer = $result[writer];
							@$company = $result[company];
							@$year_print = $result[year_print];
							@$isbn = $result[isbn];
							@$price = $result[price];
							@$name_borrow = $result[name_borrow];
						   @$return_book = $result[return_book];
							@$datetime = $result[datetime];
							@$detail = $result[detail];
							@$name_borrow = $result[name_borrow];
							@$datetime = $result[datetime];
							@$id = $result[id];
							@$status = $result[status];
							@$status1 = $result[status];
							@$status2 = $result[status];
							@$subject = $result[subject];
							@$id_student = $result[id_student];
		}

echo "<table width=\"95%\" border=\"0\" cellspacing=\"1\" cellpadding=\"3\" align=\"center\">\n";
echo "<tr bgcolor=\"#333366\">\n";
echo "<td width=\"24%\" class=\"Tahoma11\"><b><font color=\"#CCFF00\">::ชื่อหนังสือ ::</font></b></td>\n";
echo "<td width=\"76%\" class=\"Tahoma11\"><b><font color=\"#CCFF00\">:: รายละเอียด ::</font></b></td>\n";
echo "</tr>\n";
echo "<tr bgcolor=\"#7172A8\" valign=\"top\">\n";
echo "<td width=\"24%\" class=\"Tahoma13\">\n";
echo "<p><b><font color=\"#FFFFCC\"><b>$name_book</b></font></b><br>\n";

		echo "</p>\n";
		echo "<table width=\"98%\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\">\n";
		echo "<tr bgcolor=\"#9999CC\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">หมู่ :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\"><b><font color=\"#990099\">$catalog</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#8585C2\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">รหัส :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\"><b><font color=\"#990099\">$code</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#9999CC\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">ผู้แต่ง :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\"><b><font color=\"#990099\">$writer</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#8585C2\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">สำนักพิมพ์ :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\"><b><font color=\"#990099\">$company</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#9999CC\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">ปีที่พิมพ์ :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\" bgcolor=\"#9999CC\"><b><font color=\"#990099\">$year_print</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#8585C2\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">ISBN :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\" bgcolor=\"#8585C2\"><b><font color=\"#990099\">$isbn</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#9999CC\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">ราคา :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\" bgcolor=\"#9999CC\"><b><font color=\"#990099\">$price</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#8585C2\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">คนที่ยืม :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\" bgcolor=\"#8585C2\"><b><font color=\"#990099\">$name_borrow</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#9999CC\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">กำหนดส่งคืน :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\" bgcolor=\"#9999CC\"><b><font color=\"#990099\">$return_book</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#8585C2\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">ถูกยืมมาแล้ว :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\" bgcolor=\"#8585C2\"><b><font color=\"#990099\">$status1</font></b></td>\n";
		echo "</tr>\n";
		echo "</table>\n";
		echo "<br>\n";
		
	

echo "<br>\n";
echo "<table width=\"98%\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\">\n";
echo "<tr>\n";
echo "<td align=\"center\" bgcolor=\"#8585C2\" class=\"Tahoma13\"><span class=\"Tahoma13\"><b>:: คะแนนโหวต ::</b></span></td>\n";
echo "</tr>\n";
echo "<tr>\n";
echo "<td align=\"center\" class=\"Tahoma13\" bgcolor=\"#9999CC\">$status</td>\n";
echo "</tr>\n";
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
echo "<td valign=\"top\" class=\"Tahoma13\"><img src=\"viewpic.php?id=$id\" border=\"1\" hspace=\"1\"><br><font color=\"#fafafa\" size=\"4\"><b>$detail</b><br>&nbsp;</font></td>";
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
<HTML><HEAD><TITLE>โปรแกรมห้องสมุด version 1.0 </TITLE>
<META 
content=freewebboard,freeguestbook,freepoll,freescript,PHP,
name=keywords>
<META 
content="Thai PHP Developer "
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
<FORM  name=addcomment onsubmit="return check()" action=addedit.php
method=post encType=multipart/form-data><INPUT type=hidden value=tips name=user> 
<INPUT type=hidden value=765 name=id><input type="hidden" name="id" value="$id"> 
<TABLE borderColor=#7172A8width="75%" align=center bgColor=#7172A8>
  <TBODY>
  <TR>
    <TD>
      <DIV align=center><FONT face="Verdana, Arial, Helvetica, sans-serif" 
      color=#000000 size=4><B>แก้ไขข้อมูล</B></FONT></DIV></TD></TR>
  <TR>
    <TD bgColor=#7172A8><BR>
      <TABLE width="95%" align=center border=0>
        <TBODY>
         <TR>
          <TD>ชื่อหนังสือ :</TD>
          <TD><INPUT Type=Text maxLength=50 size=50 name=name_book> * </TD></TR>
        <TR>
          <TD>ชือผู้แต่ง :</TD>
          <TD><INPUT Type=Text  maxLength=50 size=50 name=writer> * </TD></TR>
	<TR>
          <TD>สำนักพิมพ์ :</TD>
          <TD><INPUT Type=Text  maxLength=50 size=50 name=company> * </TD></TR>
          <TR>
	  <TD>Subject :</TD>
          <TD><INPUT Type=Text  maxLength=50 size=50 name=subject> * </TD></TR>
          <TR>
          <TD>หมู่ :</td>
         <td><br><SELECT  name=catalog>
<OPTION value =>ไม่กำหนด</OPTION>
<OPTION value = A>A</OPTION>
<OPTION value = B>B</OPTION>
<OPTION value = C>C</OPTION>
<OPTION value = D>D</OPTION>
<OPTION value = E>E</OPTION>
<OPTION value = F>F</OPTION>
<OPTION value = G>G</OPTION>
<OPTION value = H>H</OPTION>
<OPTION value = I>I</OPTION>
<OPTION value = J>J</OPTION>
<OPTION value = K>K</OPTION>
<OPTION value = L>L</OPTION>
<OPTION value = M>M</OPTION>
<OPTION value = N>N</OPTION>
<OPTION value = O>O</OPTION>
<OPTION value = P>P</OPTION>
<OPTION value = Q>Q</OPTION>
<OPTION value = R>R</OPTION>
<OPTION value = S>S</OPTION>
<OPTION value = T>T</OPTION>
<OPTION value =U>U</OPTION>
<OPTION value = V>V</OPTION>
<OPTION value = W>W</OPTION>
<OPTION value = X>X</OPTION>
<OPTION value = Y>Y</OPTION>
<OPTION value = Z>Z</OPTION>
</select> *</TD></TR>
  
 <TR>
          <TD>ราคา :</TD>
          <TD><SELECT  name=priceOne>
<OPTION value =>ไม่กำหนด</OPTION>
<OPTION value = 0>0</OPTION>
<OPTION value = 1>1</OPTION>
<OPTION value = 2>2</OPTION>
<OPTION value = 3>3</OPTION>
<OPTION value =4>4</OPTION>
<OPTION value =5>5</OPTION>
<OPTION value = 6>6</OPTION>
<OPTION value = 7>7</OPTION>
<OPTION value = 8>8</OPTION>
<OPTION value = 9>9</OPTION>
</select>
<SELECT  name=priceTwo>
<OPTION value =>ไม่กำหนด</OPTION>
<OPTION value = 0>0</OPTION>
<OPTION value = 1>1</OPTION>
<OPTION value = 2>2</OPTION>
<OPTION value = 3>3</OPTION>
<OPTION value =4>4</OPTION>
<OPTION value =5>5</OPTION>
<OPTION value = 6>6</OPTION>
<OPTION value = 7>7</OPTION>
<OPTION value = 8>8</OPTION>
<OPTION value = 9>9</OPTION>
</select>
<SELECT  name=priceThree>
<OPTION value =>ไม่กำหนด</OPTION>
<OPTION value = 0>0</OPTION>
<OPTION value = 1>1</OPTION>
<OPTION value = 2>2</OPTION>
<OPTION value = 3>3</OPTION>
<OPTION value =4>4</OPTION>
<OPTION value =5>5</OPTION>
<OPTION value = 6>6</OPTION>
<OPTION value = 7>7</OPTION>
<OPTION value = 8>8</OPTION>
<OPTION value = 9>9</OPTION>
</select>
<SELECT  name=priceFour>
<OPTION value =>ไม่กำหนด</OPTION>
<OPTION value = 0>0</OPTION>
<OPTION value = 1>1</OPTION>
<OPTION value = 2>2</OPTION>
<OPTION value = 3>3</OPTION>
<OPTION value =4>4</OPTION>
<OPTION value =5>5</OPTION>
<OPTION value = 6>6</OPTION>
<OPTION value = 7>7</OPTION>
<OPTION value = 8>8</OPTION>
<OPTION value = 9>9</OPTION>
</select>* </TD></TR>
 <TR>
          <TD>รหัส:</TD>
          <TD><SELECT  name=unitOne>
<OPTION value =>ไม่กำหนด</OPTION>
<OPTION value = 0>0</OPTION>
<OPTION value = 1>1</OPTION>
<OPTION value = 2>2</OPTION>
<OPTION value = 3>3</OPTION>
<OPTION value =4>4</OPTION>
<OPTION value =5>5</OPTION>
<OPTION value = 6>6</OPTION>
<OPTION value = 7>7</OPTION>
<OPTION value = 8>8</OPTION>
<OPTION value = 9>9</OPTION>
</select>
<SELECT  name=unitTwo>
<OPTION value =>ไม่กำหนด</OPTION>
<OPTION value =0>0</OPTION>
<OPTION value = 1>1</OPTION>
<OPTION value = 2>2</OPTION>
<OPTION value = 3>3</OPTION>
<OPTION value =4>4</OPTION>
<OPTION value =5>5</OPTION>
<OPTION value = 6>6</OPTION>
<OPTION value = 7>7</OPTION>
<OPTION value = 8>8</OPTION>
<OPTION value = 9>9</OPTION>
</select>
<SELECT  name=unitThree>
<OPTION value =>ไม่กำหนด</OPTION>
<OPTION value = 0>0</OPTION>
<OPTION value = 1>1</OPTION>
<OPTION value = 2>2</OPTION>
<OPTION value = 3>3</OPTION>
<OPTION value =4>4</OPTION>
<OPTION value =5>5</OPTION>
<OPTION value = 6>6</OPTION>
<OPTION value = 7>7</OPTION>
<OPTION value = 8>8</OPTION>
<OPTION value = 9>9</OPTION>
</select>* </TD></TR>
 <TR>
<TR>
          <TD>ปีที่พิมพ์ :</TD>
          <TD><SELECT  name=year_print>
<OPTION value =>ไม่กำหนด</OPTION>
<OPTION value = 1970>1970</OPTION>
<OPTION value = 1971>1971</OPTION>
<OPTION value = 1972>1972</OPTION>
<OPTION value = 1973>1973</OPTION>
<OPTION value = 1974>1974</OPTION>
<OPTION value = 1975>1975</OPTION>
<OPTION value = 1976>1976</OPTION>
<OPTION value = 1977>1977</OPTION>
<OPTION value = 1978>1978</OPTION>
<OPTION value = 1979>1979</OPTION>
<OPTION value = 1980>1980</OPTION>
<OPTION value = 1981>1981</OPTION>
<OPTION value = 1982>1982</OPTION>
<OPTION value = 1983>1983</OPTION>
<OPTION value = 1984>1984</OPTION>
<OPTION value = 1985>1985</OPTION>
<OPTION value = 1986>1986</OPTION>
<OPTION value = 1987>1987</OPTION>
<OPTION value = 1988>1988</OPTION>
<OPTION value = 1989>1989</OPTION>
<OPTION value = 1990>1990</OPTION>
<OPTION value = 1991>1991</OPTION>
<OPTION value = 1992>1992</OPTION>
<OPTION value = 1993>1993</OPTION>
<OPTION value = 1993>1993</OPTION>
<OPTION value = 194>1994</OPTION>
<OPTION value = 1995>1995</OPTION>
<OPTION value = 1996>1996</OPTION>
<OPTION value = 1997>1997</OPTION>
<OPTION value = 1998>1998</OPTION>
<OPTION value = 1999>1999</OPTION>
<OPTION value = 2000>2000</OPTION>
<OPTION value = 2001>2001</OPTION>
<OPTION value = 2002>2002</OPTION>
<OPTION value = 2003>2003</OPTION>
<OPTION value = 2004>2004</OPTION>
<OPTION value = 2005>2005</OPTION>
<OPTION  value = 2006>2006</OPTION>
<OPTION  value = 2007>2007</OPTION>
<OPTION  value = 2008>2008</OPTION>
  
	  </select> * </TD></TR>
 <TR>
          <TD>ISBN :</TD>
          <TD><INPUT Type=Text maxLength=15 size=15 name=isbn> * </TD></TR>
 <TR>
          <TD>คนที่ยืม :</TD>
          <TD><INPUT Type=Text maxLength=40 size=40   name= name_borrow>*</TD></TR>
<TR>
          <TD>กำหนดส่งคืน :</TD>
          <TD>วัน<SELECT  name=day>
<OPTION value = 1>1</OPTION>
<OPTION  value = 2>2</OPTION>
<OPTION  value = 3>3</OPTION>
<OPTION  value = 4>4</OPTION>
<OPTION  value = 5>5</OPTION>
<OPTION  value = 6>6</OPTION>
<OPTION  value = 7>7</OPTION>
<OPTION  value = 8>8</OPTION>
<OPTION  value = 9>9</OPTION>
<OPTION  value = 10>10</OPTION>
<OPTION  value = 11>11</OPTION>
<OPTION  value = 12>12</OPTION>
<OPTION  value = 13>13</OPTION>
<OPTION  value =14>14</OPTION>
<OPTION  value = 15>15</OPTION>
<OPTION  value = 16>16</OPTION>
<OPTION  value = 17>17</OPTION>
<OPTION  value = 18>18</OPTION>
<OPTION  value = 19>19</OPTION>
<OPTION  value = 20>20</OPTION>
<OPTION  value = 21>21</OPTION>
<OPTION  value = 22>22</OPTION>
<OPTION  value = 23>23</OPTION>
<OPTION  value = 24>24</OPTION>
<OPTION  value = 25>25</OPTION>
<OPTION  value = 26>26</OPTION>
<OPTION  value = 27>27</OPTION>
<OPTION  value = 28>28</OPTION>
<OPTION  value = 29>29</OPTION>
<OPTION  value = 30>30</OPTION>
<OPTION  value = 31>31</OPTION>
  
	  </select>
	เดือน<SELECT  name=mount>
			<OPTION value = มกราคม>มกราคม</OPTION>
			<OPTION  value = กุมภาพันธ์ >กุมภาพันธ์</OPTION>
<OPTION  value = มีนาคม>มีนาคม</OPTION>
<OPTION  value = เมษายน>เมษายน</OPTION>
<OPTION  value = พฤษภาคม>พฤษภาคม</OPTION>
<OPTION  value = มิถุนายน>มิถุนายน</OPTION>
<OPTION  value =กรฎราคม>กรฎราคม</OPTION>
<OPTION  value =สิงหาคม>สิงหาคม</OPTION>
<OPTION  value =กันยายน>กันยายน</OPTION>
<OPTION  value =ตุลาคม>ตุลาคม</OPTION>
<OPTION  value =พฤศจิกายน>พฤศจิกายน</OPTION>
<OPTION  value =ธันวาคม>ธันวาคม</OPTION>

  
	  </select>
	ปี<SELECT  name=year>
			<OPTION value = 2005>2005</OPTION>
			<OPTION  value = 2006>2006</OPTION>
<OPTION  value = 2007>2007</OPTION>
<OPTION  value = 2008>2008</OPTION>
  
	  </select>  * </TD></TR>
<TR>
          <TD>ภาพประกอบ :</TD>
		 
<TD><INPUT type=file  name=picture size = 36></TD></tr>
 

        <TR>
        <TR>
          <TD>รายละเอียด :
           </TD>
          <TD><TEXTAREA name=detail rows=8 cols=50></TEXTAREA> * <BR>

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


          <TD><INPUT type=submit value="Register" name=Action> * <INPUT type=reset value=Clear name=B2><BR>กรุณา Click Post 
            Message เพียงครั้งเดียว <BR><BR></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD bgColor=#7172A8><FONT face=Verdana size=2>ระบบห้องสมุดบนมือถือ :: 
      Powered by  นายปัณณวิช สุวัฒนวนิช กับ นายสุรัช วังรัตนชัย :: 2006 All rights reserved. </FONT><FONT color=white size=1><A 
      href="http://t.extreme-dm.com/?login=212cafe" target=_blank><IMG height=1 
      alt="" 
      src="webboard/i.gif" 
      width=1 border=0></A>
    

     
      </FONT></TD></TR></TBODY></TABLE></FORM>
<SCRIPT language=JavaScript>
function emoticon(what)
{
	document.addcomment.detail.value = document.addcomment.elements.detail.value+" "+what;
	document.addcomment.detail.focus();
}
function open_windows(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
</SCRIPT>



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
echo "<a href=\"list_addmin.php\">";
echo "<img src=\"webboard/home_small.gif\" width=\"16\" height=\"16\" hspace=\"5\" border=\"0\"alt=\"หน้าแรก\">";
echo "</a>";

echo "</td>\n";
echo "</tr>\n";
echo "</table>\n";


		

?>
<br>
</body>
</html>
<?
	}
?>