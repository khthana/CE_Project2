<?php
/*เรียกแฟ้มข้อมูล phpConfig.php*/
include("phpConfig.php");

$login_name="";
$login_password="";

	// เริ่มติดต่อฐานข้อมูล
	mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

		mysql_query("SET NAMES 'tis620'");

	// เลือกฐานข้อมูล
	mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");

	$sql_mem = "select * from member where login_name = '$login_name' AND  login_password = '$login_password'"; 
	$db_query_mem = mysql_db_query ($dbname, $sql_mem);
	
			$result_mem = mysql_fetch_array($db_query_mem);
							@$login_name = $result_mem[login_name];
	
	if(isset($Session[@login_name]))
	@$login_name=$Session[login_name];	

?>
<HTML><HEAD><TITLE>:: ระบบห้องสมุดบนมือถือ ::</TITLE>
<META 
content=freewebboard,freeguestbook,freepoll,freescript,PHP,devforum,thai,ฟรีเว็บบอร์ด,ฟรีสมุดเยี่ยม,ฟรีโพลล์ 
name=keywords>
<META 
content="Thai PHP Developer Freewebboard Freeguestbook Freepoll FreescriptPHP devforum เว็บบอร์ดฟรีที่ดีที่สุดในประเทศ" 
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

<META content="MSHTML 6.00.2800.1479" name=GENERATOR></HEAD>
<BODY bgColor=#ffffff>
<TABLE borderColor=#f0f0f0 cellSpacing=0 cellPadding=0 width="100%" align=center 
border=1>
  <TBODY>
   <img src="picture/head1.gif" border="0" align="right" >
  <TR>
    <TD bgColor=#f0f0f0><FONT face=Verdana size=2>
    </FONT><DIV align=right><!-- <b>วันนี้วันที่:</b> --> <?  

@setlocale("LC_TIME","th");	//ใช้เวลาแบบไทย (ดูตัวอย่างในบทที่ 7)
	$a = date("j");	 // วันที่
	$b = strftime("%B");	 // เดือนเต็ม
	$c = strftime("%Y")+543;	 // ปี พ.ศ.
	$d = date("H:i:s");	 // เวลา

	$a_date = "$a $b $c";
	//echo"$a_date";

?>  <!-- <b>เวลา:</b><?echo"$d";?><b>น.</b> --></DIV></TD></TR>
  <TR>
    <TD><BR>
      <TABLE width="100%" align=center border=0>
        <TBODY>
        <TR>
          <TD>
            <FORM  action=search.php method=post><IMG 
            src="webboard/icon_mini_search.gif"> 
            ค้นหาหนังสือ : <INPUT size=30 name=search>
			
			จาก : <SELECT  name=type>
			<OPTION value = name_book >ไม่กำหนด!!</OPTION>
			<OPTION  value = catalog>หมู่!!</OPTION>
  <OPTION  value = code>รหัส!!</OPTION>
 <OPTION  value = name_book>ชื่อหนังสือ!!</OPTION>
  <OPTION  value = writer>ชื่อผู้แต่ง!!</OPTION>
   <OPTION  value = name_borrow>ชื่อผู้ยืม!!</OPTION>
   <OPTION  value = company>สัมนักพิมพ์!!</OPTION>
    <OPTION  value = year_print>ปีที่พิมพ์!!</OPTION>
	 <OPTION  value = price>ราคา!!</OPTION>
	  <OPTION  value = isbn>ISBN!!</OPTION>
	  <OPTION  value = return_book>วันที่ส่งคืนหนังสือ!!</OPTION>
	 
 
 </SELECT>
			
			
			 <INPUT type=submit value=Search>
			
 
			
			 </FORM></TD>
          <TD>
    <FORM action=list2.php method=post > 
 <DIV align=right>จำนวนหนังสือที่แสดง ต่อหน้า <SELECT name=menu>
  <OPTION value=20>ไม่กำหนด!!</OPTION>
 <OPTION value=10>10</OPTION> 
 <OPTION  value=25>25</OPTION> 
 <OPTION  value=50>50</OPTION>
 <OPTION  value=100>100</OPTION></SELECT>


 <DIV align=right>เรียงลำดับโดย <SELECT name=sort>
  <OPTION value=catalog>ไม่กำหนด!!</OPTION>
 <OPTION value=catalog>หมู่</OPTION> 
 <OPTION  value=code>รหัส</OPTION> 
 <OPTION  value=name_book>ชื่อหนังสือ</OPTION>
 <OPTION  value=writer>ชื่อผู้แต่ง</OPTION>
<OPTION  value=company>สำนักพิมพ์</OPTION>
<OPTION  value=year_print>วัน/เดือน/ปี</OPTION>
<OPTION  value=name_borrow>ผู้ยืม</OPTION>
<OPTION  value=isbn>ISBN</OPTION></SELECT>
 <INPUT type=submit value=ok!>
</form></TD></TR></TBODY></TABLE><IMG 
      src="webboard/line1.gif"> <BR>[ 
      <A href="list.php" target=_blank>Home</A> ][ 
      <A href="veiw_return.php" target=_blank>ดูหนังสือที่ถูกยืมแล้ว</A> ]
 [ <A  href="formmember.htm">สมัครสมาชิกใหม่</A>]  [ <A  href="view_member.php">ข้อมูลสมาชิก</A>][ <A  href="login.htm">เข้าสู่ระบบ</A>]  [ <A  href="logout.php">ออกจากระบบ</A>] [ <A  href="addmin.htm">สำหรับผู้ดูแลระบบ</A>] 
      &nbsp; 
      <BR>
      <TABLE borderColor=black cellSpacing=0 cellPadding=2 width="100%" 
border=0>
        <TBODY>
        <TR>


  <?php  

// ต้องการแสดง 20 หัวข้อ ต่อ 1 หน้า
	$pagesize = $menu;

	
	$status_addmin="";
//รูปการประกาศข่าว
$status1 = "webboard/icon_pin.gif ";
	// ถ้า $page ไม่มีค่า กำหนดให้เท่ากับ 1
	if (empty($page)){
		$page=1;
	}   


$q_sql = "select * from book";
	$q_db_query = mysql_db_query ($dbname, $q_sql);
	$num_rows = mysql_num_rows($q_db_query);
	$rt = $num_rows%$pagesize;	// หาจำนวนหน้าทั้งหมด

	if($rt!=0) 
		{ 
			$totalpage = floor($num_rows/$pagesize)+1; 
		}
	else 
		{
			$totalpage = floor($num_rows/$pagesize); 
		}

	$goto = ($page-1)*$pagesize;	// หาหน้าที่จะกระโดดไป

	$sql = "select * from book order by $sort ASC limit $goto,$pagesize";
	$db_query = mysql_db_query ($dbname, $sql);
		if (!$db_query)
			{ 
				echo("เอ็กซิคิวต์คำสั่ง SQL ไม่ได้ " . mysql_error() ); 
				exit;
			}
		else	 
			{
				$nums_rows = mysql_num_rows($db_query);	 // จำนวนเรกคอร์ดของกระทู้ทั้งหมด


$sql_online = "select status2  from member where login_name='admin'";
$db_query_online = mysql_db_query ($dbname, $sql_online);
$result_online = mysql_fetch_array($db_query_online);
@$status2 = $result_online[status2];

$sql_borrow = "select name_borrow  from book where name_borrow !=''";
	$db_query_borrow = mysql_db_query ($dbname, $sql_borrow );
	$num_rows_borrow = mysql_num_rows($db_query_borrow);
?>
          <TD>จำนวนหนังสือที่แสดง : <B><FONT color=#3399cc><?echo"$pagesize\n";?></FONT></B> 
            เล่ม/หน้า -  หนังสือทั้งหมดมี : <B><?echo"$num_rows\n";?></B>  เล่ม   หนังสือที่ถูกยืมทั้งหมดมี : <B><?
			
			$borrow=$num_rows_borrow;
			echo"$borrow \n";?></B>  เล่ม  <IMG 
            src="webboard/icon_online.gif" 
            border=0>UserOnline : <B><?echo"$status2\n";?></B><BR>
   <?php


echo "<table border=0 bordercolor=black cellspacing=0 cellpadding=2>\n";
					echo "<tr>\n <td><BR>แสดงหน้าที่ :  ";

					// วนรอบแสดงเลขหน้าทั้งหมด
					for($i=1 ; $i<$page ; $i++) 
						{
							echo "<a href=$PHP_SELF?page=$i&menu=$menu&sort=$sort>$i</a> ";
						}

					echo "<font size=2  color=#cc0000><b>$page</b></font> ";
					for($i=$page+1 ; $i<=$totalpage ; $i++) 
						{
							echo "<a href=$PHP_SELF?page=$i&menu=$menu&sort=$sort>$i</a> ";
						}
	
					echo "</font></td>\n</tr>\n";
					echo "</table>\n";



?>


 </TD></TR></TBODY></TABLE>



<!-- <BR><A 
      href="view.php?id=2 " target=_blank>:: 
     <font color=bule> ประกาศวัน ที่16 ธค.47 จะมีการแข่งขันแบดมินตันที่โรงยิมลาดกระบัง เวลา 13.00 น. เป็นต้นไป</font></A> - <? echo"<IMG  src=$status1>\n";?> ประกาศข่าว
  <BR><BR> --></TD></TR></TBODY></TABLE>
<TABLE borderColor=#cccccc cellSpacing=0 cellPadding=2 width="100%" border=1>
  <TBODY>
 <TR bgColor=#cce9fd>
    <TD align=middle width="2%"><FONT color=#000000 size=1><B>รูป</B></FONT></TD>
     <TD align=middle width="3%"><FONT color=#000000 size=1><B>ID</B></FONT></TD>
    <TD align=middle width="3%"><FONT color=#000000 size=1><B>หมู่</B></FONT></TD>
    <TD align=middle width="5%"><FONT color=#000000 size=1><B>รหัส</B></FONT></TD>
	<TD align=middle width="35%"><FONT color=#000000 size=1><B>ชื่อหนังสือ </B></FONT></TD>
	<TD align=middle width="20%"><FONT color=#000000 size=1><B>ชื่อผู้แต่ง</B></FONT></TD>
	<TD align=middle width="10%"><FONT color=#000000 size=1><B>สำนักพิมพ์ </B></FONT></TD>
	<TD align=middle width="6%"><FONT color=#000000 size=1><B>ปี</B></FONT></TD>
    <TD align=middle width="6%"><FONT color=#000000 size=1><B>ISBN<B></FONT></TD>
    <TD align=middle width="4%"><FONT color=#000000 size=1><B>ราคา</B></FONT></TD>
	<TD align=middle width="10%"><FONT color=#000000 size=1><B>ยืมโดย<B></FONT></TD>
	</TR>

<?php
	
	
	
$swap="#fafafa";


					for ($i=0;$i<$nums_rows;$i++)	// อ่านข้อมูลแต่ละเรกคอร์ด
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
						   @ $return_book = $result[return_book];
							@$datetime = $result[datetime];
							@$pic = $result[pic];
							@$total_borrow = $result[total_borrow];
							@$datetime = $result[datetime];
							@$id = $result[id];
							@$status = $result[status];
							@$status1 = $result[status];
							@$status2 = $result[status];
										
	
@setlocale("LC_TIME","th");	//ใช้เวลาแบบไทย (ดูตัวอย่างในบทที่ 7)
	$a = date("j");	 // วันที่
	$b = strftime("%B");	 // เดือนเต็ม
	$c = strftime("%Y")+543;	 // ปี พ.ศ.
	#$d = date("H:i:s");	 // เวลา

	

	$q_today = "$a $b $c  ";

		 
	
							
							
							
							

							
						
					
							
							if(($total_borrow >= 1)&&($total_borrow <=5))
							{
							$status = "<img src =\"webboard/icon_new.gif \" border =\"0\">";
							}
							else if($total_borrow >= 1){
							$status = " <IMG  src =\" webboard/icon_reply.gif\" border =\"0\">";
						}
					else{
							$status = "<img src =\"webboard/icon_pin.gif \" border =\"0\">";
							
							}
							
							
							
	if ($id<=9) {$zero="000";}
	if ($id>=10 and $id<=99) {$zero="00";}
	if ($id>=100 and $id<=999) {$zero="0";}
	if ($id>=1000 and $id<=9999) {$zero="";}					
							
							
      
if($swap=="#fafafa"){
$swap="#cce9fd";
}
else

{
$swap="#fafafa";
}
//echo"<TABLE borderColor=#cccccc cellSpacing=0 cellPadding=0 width=100% border=1>\n";
 //echo" <TBODY>\n";
echo"<TR bgColor=$swap><TD width=2%><DIV align=center><FONT color=#000000 size=1>$status</DIV></TD>\n";
echo"<TD width=3%><DIV align=center><FONT color=#000000 size=1>$zero$id</font></DIV></TD>\n";
echo"<TD width=3%><DIV align=center><FONT color=#000000 size=1>$catalog</font></DIV></TD>\n";
echo"<TD width=5%><DIV align=center><FONT color=#000000 size=1>$code</font></DIV></TD>\n";
echo"<TD width=35%><DIV align=center><FONT color=#000000 size=1><A href=view.php?id=$id target=_blank>$name_book   </A></font></div></TD>\n";
echo"<TD width=20%> <DIV align=center><FONT color=#000000 size=1>$writer</DIV></font></TD>\n"; 
echo"<TD width=10%><div align=center><FONT color=#000000 size=1>$company</font></div> \n";
echo"<TD width=6%> <DIV align=center><FONT color=#000000 size=1>$year_print</DIV></font></TD>\n"; 
echo"<TD width=6%> <DIV align=center><FONT color=#000000 size=1>$isbn</DIV></font></TD>\n"; 
echo"<TD width=4%> <DIV align=center><FONT color=#000000 size=1>$price</DIV></font></TD>\n"; 
echo"<TD width=10%> <DIV align=center><FONT color=#000000 size=1>$name_borrow</DIV></font></TD>\n"; 

echo"<DIV></DIV></TD></TR>\n";
//echo"</TBODY></TABLE>\n";


							
						}	// จบ for
					} // จบ else
				?>

 












<br>
<TABLE borderColor=black cellSpacing=0 cellPadding=2 width="100%" border=0>
  <TBODY>
  <TR>
    <TD><IMG 
      src="webboard/icon_pin.gif"> - 
     หนังสือที่ไม่มีคนสนใจ &nbsp;<IMG 
      src="webboard/icon_new.gif"> - 
    หนังสือที่ถูกยืมแล้ว &nbsp;<IMG 
      src="webboard/icon_reply.gif"> - 
      หนังสือที่นิยมอ่าน &nbsp; <BR><br>
</TD><tr><td><center><FONT face=Verdana size=2>ระบบห้องสมุดบนมือถือ :: 
      Powered by  นายปัณณวิช สุวัฒนวนิช กับ นายสุรัช วังรัตนชัย :: 2006 All rights reserved. </FONT></center></td></tr></TR></TBODY></TABLE>
<P>
<?
print <<<EOT


EOT;
?>
</BODY></HTML>
