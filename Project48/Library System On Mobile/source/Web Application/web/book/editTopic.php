
<HTML><HEAD><TITLE>:: ระบบห้องสมุดมือถือ ::</TITLE>


<META http-equiv=Content-Type content="text/html; charset=tis-620"><LINK 
href="webboard/style.css" 
type=text/css rel=stylesheet>


<META content="MSHTML 6.00.2800.1479" name=GENERATOR></HEAD>

<?php
//กำหนดตัวแปรเพื่อนำไปใช้งาน
/*เรียกแฟ้มข้อมูล phpConfig.php*/
include("phpConfig.php");

$tblname = "book";	//ชื่อตาราง

// เริ่มติดต่อฐานข้อมูล
mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

	mysql_query("SET NAMES 'tis620'");

// เลือกฐานข้อมูล
mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");

// คำสั่ง SQL และสั่งให้ทำงาน








$sql_search = "select * from  book  where status3 = 1 ";	// กำหนดคำสั่ง SQL เพื่อแสดงข้อมูล
$db_query_search = mysql_db_query($dbname, $sql_search);

// หาจำนวนเรกคอร์ดข้อมูลในตาราง
$num_rows_search = mysql_num_rows($db_query_search);

// หาจำนวนฟิลด์ในตาราง
$num_fields = mysql_num_fields($db_query_search);


?>
<BODY bgColor=#ffffff>
<TABLE borderColor=#f0f0f0 cellSpacing=0 cellPadding=0 width="100%" align=center 
border=1>
  <TBODY>
   <TR>
    <TD><BR>
    [  <A href="list_addmin.php" target=_blank>Home</A> ] [ <A 
      href="formaddbook.htm?login_name=<?echo"$login_name";?>&login_password=<?echo"$login_password";?>">เพิ่มหนังสือใหม่</A>] [ <A  href="borrow.htm">ยืมหนังสือ</A>]  [ <A  href="return.htm">คืนหนังสือ</A>] [ <A  href="list_addmin.php">ดูหนังสือทั้งหมด</A>] [ <A  href="veiw_return_admin.php">ดูหนังสือที่ถูกยืมไปแล้ว</A>] 
 [ <A  href="formmember.htm">สมัครสมาชิกใหม่</A>]  [ <A  href="view_member_addmin.php">ข้อมูลสมาชิก</A>][ <A  href="login.htm">เข้าสู่ระบบ</A>]  [ <A  href="logout.php">ออกจากระบบ</A>] [ <A  href="addmin.htm">สำหรับผู้ดูแลระบบ</A>] 
      &nbsp; 
    <BR>
      <TABLE borderColor=black cellSpacing=0 cellPadding=2 width="100%" 
border=0>
        <TBODY>
        <TR>
	

 <?php  

// ต้องการแสดง 20 หัวข้อ ต่อ 1 หน้า
	$pagesize = 20;
	
	$status_admin="";
//รูปการประกาศข่าว
$status1 = "webboard/icon_pin.gif ";
	



$sql_online = "select status2  from member where login_name='admin'";
$db_query_online = mysql_db_query ($dbname, $sql_online);
$result_online = mysql_fetch_array($db_query_online);
@$status2 = $result_online[status2];

?>  <IMG   src="webboard/icon_online.gif"   border=0>UserOnline : <B><?echo"$status2\n";?></B> คน<BR>   	
 </TD></TR></TBODY></TABLE><br><br>
<IMG 
      src="webboard/line1.gif"><IMG 
      src="webboard/line1.gif"><IMG 
      src="webboard/line1.gif"><IMG 
      src="webboard/line1.gif"><IMG 
      src="webboard/line1.gif"><IMG 
      src="webboard/line1.gif"><IMG 
      src="webboard/line1.gif"> <BR><BR>
<TABLE borderColor=#cccccc cellSpacing=0 cellPadding=2 width="100%" border=1>
  <TBODY>
  <TR bgColor=#cce9fd>
    <TD align=middle width="2%"><FONT color=#000000 size=1><B>รูป</B></FONT></TD>
 <TD align=middle width="3%"><FONT color=#000000 size=1><B>Ck</B></FONT></TD>
    <TD align=middle width="3%"><FONT color=#000000 size=1><B>หมู่ </B></FONT></TD>
    <TD align=middle width="5%"><FONT color=#000000 size=1><B>รหัส</B></FONT></TD>
    <TD align=middle width="35%"><FONT color=#000000 size=1><B>ชื่อหนังสือ</B></FONT></TD>
    <TD align=middle width="10%"><FONT color=#000000 size=1><B>ชื่อผู้แต่ง</B></FONT></TD>
    <TD align=middle width="10%"><FONT color=#000000 size=1><B>สัมนักพิมพ์ </B></FONT></TD>
 <TD align=middle width="6%"><FONT color=#000000 size=1><B>ปี</B></FONT></TD>
 <TD align=middle width="6%"><FONT color=#000000 size=1><B>ISBN</B></FONT></TD>
<TD align=middle width="4%"><FONT color=#000000 size=1><B>ราคา</B></FONT></TD>
<TD align=middle width="10%"><FONT color=#000000 size=1><B>ยืมโดย</B></FONT></TD>
</TR>
<form name = "edit" action = "addCkedit.php" method="post">
<?php	
		
						

// พิมพ์ส่วนหัวตาราง
$swap="#cce9fd";

for ($i=0;$i < $num_rows_search;$i++)
	{
		
		
							$result = mysql_fetch_array($db_query_search);
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
							@$pic = $result[pic];
							@$total_borrow = $result[total_borrow];
							@$datetime = $result[datetime];
							@$id = $result[id];
							@$status = $result[status];
							@$status1 = $result[status];
							@$status2 = $result[status];

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

		
	



 


{
	if ($id<=9) {$zero="000";}
	if ($id>=10 and $id<=99) {$zero="00";}
	if ($id>=100 and $id<=999) {$zero="0";}
	if ($id>=1000 and $id<=9999) {$zero="";}	
//แสดงผล

if($swap=="#cce9fd"){
$swap="#fafafa";
}
else

{
$swap="#cce9fd";
}
print <<<EOT

<TR bgColor=$swap>
 <TD align=middle width="3%"><FONT color=#000000 size=1>$status</FONT></TD>
    <TD align=middle width="3%"><FONT color=#000000 size=1><input type =checkbox name=del[]></FONT></TD>
    <TD align=middle width="5%"><center><FONT color=#000000 size=1><input type =hidden name=id[] value = $id><input type = text  maxLength=300 size=2  name= catalog[]  value = $catalog  ></FONT></center></TD>
    <TD align=middle width="4%"><FONT color=#000000 size=1><input type =text   maxLength=300  size=2 name=code[] value = $code></FONT></TD>
    <TD align=middle width="35%"><FONT color=#000000 size=1><input type = text maxLength=300  size=60 name= name_book[]  value = $name_book  >  $name_book </FONT></TD>
    <TD align=middle width="20%"><FONT color=#000000 size=1><input type = text maxLength=300  size=32 name= writer[]  value =$writer ><br>$writer</FONT></TD>
    <TD align=middle width="10%"><FONT color=#000000 size=1><input type = text maxLength=300 size=20 name= company[]  value =$company  ><br>$company</FONT></TD>
    <TD align=middle width="6%"><FONT color=#000000 size=1><input type = text maxLength=300 size=5 name= year_print[]  value =$year_print  ><br>$year_print</FONT></TD>
 <TD align=middle width="6%"><FONT color=#000000 size=1><input type = text maxLength=300 size=7  name= isbn[]  value =$isbn ><br>$isbn</FONT></TD>
<TD align=middle width="4%"><FONT color=#000000 size=1><input type = text maxLength=300  size=5  name=price[]  value =$price><br>$price</FONT></TD>
 <TD align=middle width="10%"><FONT color=#000000 size=1><input type = text maxLength=300  size=20 name= name_borrow[]  value =$name_borrow  ><br>$name_borrow</FONT></TD></TR>

EOT;
}
}

	

echo"<input type = submit value = แก้ไข>";
echo"<input type = reset value = ยกเลิก>";
echo"</form>";
//end While
$id=1;
echo "<Font color=blue> แสดงผลการแก้ไขข้อมูลที่คุณได้ทำการเลือกไว้ </Font>";          //<Font color=black>[".$id."] </Font>

echo "&nbsp;&nbsp;<Font color=blue> จำนวน&nbsp;&nbsp;</font><Font color=black><b>[". $i."]</b></font><Font color=blue>&nbsp; &nbsp;เรกคอร์ด</font>";
echo "&nbsp;&nbsp;&nbsp;&nbsp;<A Href="."clearStatus3.php".">กลับไปหน้าแรก </A><br><br>";

mysql_close();	// ปิดการเชื่อมต่อ

?> 
</center></TD></TR></TBODY></TABLE><br><br><IMG 
      src="webboard/line1.gif"><IMG 
      src="webboard/line1.gif"><IMG 
      src="webboard/line1.gif"><IMG 
      src="webboard/line1.gif"><IMG 
      src="webboard/line1.gif"><IMG 
      src="webboard/line1.gif"><IMG 
      src="webboard/line1.gif"> <BR><BR>
				
<br>
<TABLE borderColor=black cellSpacing=0 cellPadding=2 width="100%" border=0>
  <TBODY>
  <TR>
 <TD><b>Ck </b> - 
     Check Box สำหรับเลือกเพื่อทำการแก้ไขหรือทำการลบหนังสือ &nbsp;<BR><br>
</TD><tr><td><center><FONT face=Verdana size=2>ระบบห้องสมุดOnline :: 
      Powered by  นายปัณณวิช สุวัฒนวนิช กับ นายสุรัช วังรัตนชัย :: 2006 All rights reserved. </FONT></center></td></tr></TR></TBODY></TABLE>
<P>
</body></html>