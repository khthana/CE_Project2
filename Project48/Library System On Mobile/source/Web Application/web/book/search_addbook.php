
<HTML><HEAD><TITLE>:: ระบบห้องสมุดงบนมือถือ ::</TITLE>


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
$sql_search = "select * from $tblname where $type like '%$search%' order by catalog,code";	// กำหนดคำสั่ง SQL เพื่อแสดงข้อมูล
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
  <img src="picture/head1.gif" border="0" align="right" >
   <TR bgColor=#f0f0f0>
   <DIV align=right><!-- <b>วันนี้วันที่:</b> --> <?  

@setlocale("LC_TIME","th");	//ใช้เวลาแบบไทย (ดูตัวอย่างในบทที่ 7)
	$a = date("j");	 // วันที่
	$b = strftime("%B");	 // เดือนเต็ม
	$c = strftime("%Y")+543;	 // ปี พ.ศ.
	$d = date("H:i:s");	 // เวลา

	$a_date = "$a $b $c";
	//echo"$a_date";

?>  <!-- <b>เวลา:</b><?echo"$d";?><b>น.</b> --></DIV>
	</TR>
	<TR>
    <TD><BR>
    [  <A href="list.php" target=_blank>Home</A> ] [ <A 
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
	// ถ้า $page ไม่มีค่า กำหนดให้เท่ากับ 1
	if (empty($page)){
		$page=1;
	}   


$q_sql = "select * from book where $type like '%$search%'";
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

	$sql = "select * from book order by id ASC limit $goto,$pagesize";
	$db_query = mysql_db_query ($dbname, $sql);
		if (!$db_query)
			{ 
				echo("เอ็กซิคิวต์คำสั่ง SQL ไม่ได้ " . mysql_error() ); 
				exit;
			}
		else	 
			{
				$nums_rows = mysql_num_rows($db_query);	 
			}
$sql_online = "select status2  from member where login_name='admin'";
$db_query_online = mysql_db_query ($dbname, $sql_online);
$result_online = mysql_fetch_array($db_query_online);
@$status2 = $result_online[status2];

?>


         <TD>ค้นพบทั้งหมด: <B><?echo"$num_rows\n";?></B> เล่ม      <IMG 
            src="webboard/icon_online.gif" 
            border=0>UserOnline : <B><?echo"$status2\n";?></B> คน<BR>   	
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
    <TD align=middle width="20%"><FONT color=#000000 size=1><B>ชื่อผู้แต่ง</B></FONT></TD>
    <TD align=middle width="10%"><FONT color=#000000 size=1><B>สัมนักพิมพ์ </B></FONT></TD>
 <TD align=middle width="6%"><FONT color=#000000 size=1><B>ปี</B></FONT></TD>
 <TD align=middle width="6%"><FONT color=#000000 size=1><B>ISBN</B></FONT></TD>
<TD align=middle width="4%"><FONT color=#000000 size=1><B>ราคา</B></FONT></TD>
<TD align=middle width="10%"><FONT color=#000000 size=1><B>ยืมโดย</B></FONT></TD>
</TR>
<form name = "edit" action = "addCk.php" method="post">
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
    <TD align=middle width="3%"><FONT color=#000000 size=1><input type="checkbox" name="name[]" value="$id"><input type ="hidden" name="id" value="$id">  </FONT></TD>
    <TD align=middle width="5%"><FONT color=#000000 size=1>$catalog</FONT></TD>
    <TD align=middle width="4%"><FONT color=#000000 size=1>$code</FONT></TD>
    <TD align=middle width="35%"><FONT color=#000000 size=1><A href=view_addmin.php?id=$id target=_blank> $name_book</A> </FONT></TD>
    <TD align=middle width="20%"><FONT color=#000000 size=1>$writer</FONT></TD>
    <TD align=middle width="10%"><FONT color=#000000 size=1>$company</FONT></TD>
    <TD align=middle width="6%"><FONT color=#000000 size=1>$year_print</FONT></TD>
 <TD align=middle width="6%"><FONT color=#000000 size=1>$isbn</FONT></TD>
<TD align=middle width="4%"><FONT color=#000000 size=1>$price</FONT></TD>
 <TD align=middle width="10%"><FONT color=#000000 size=1>$name_borrow</FONT></TD></TR>

EOT;
	}
echo"<input type = submit value = แก้ไข>";
echo"<input type = reset value = Cleare>";
echo"</form>";
//end While

echo "<Font color=blue> แสดงผลการค้นหาข้อมูลที่มีคำว่า </Font><Font color=black>[".$search."] </Font>";

echo "&nbsp;&nbsp;&nbsp;&nbsp;<Font color=blue> ค้นพบ </font><Font color=black><b>". $i."</b></font><Font color=blue> เรกคอร์ด</font>";
echo "&nbsp;&nbsp;&nbsp;&nbsp;<A Href="."list_addmin.php".">กลับไปค้นหาใหม่ </A> &nbsp;&nbsp;&nbsp;&nbsp;<A Href="."search_addbook.php?search=$search&type=$type".">เพิ่มหนังสือ </A><br><br>";

mysql_close();	// ปิดการเชื่อมต่อ

?> 
<FORM  name=addcomment onsubmit="return check()" action=addboard.php
method=post encType=multipart/form-data><INPUT type=hidden value=tips name=user> 
<INPUT type=hidden value=765 name=id> 

<TR bgColor=#ffffff>
 <TD align=middle width="3%"><FONT color=#000000 size=1>เพิ่ม</FONT></td>
    <TD align=middle width="3%"><input type =hidden name=del>หนังสือ</FONT></TD>
    <TD align=middle width="5%"><center><FONT color=#000000 size=1><input type =hidden name=id value = $id><input type = text  maxLength=300 size=2  name= catalog   ></FONT></center></TD>
    <TD align=middle width="4%"><FONT color=#000000 size=1><input type =text   maxLength=300  size=2 name=unitOne></FONT></TD>
    <TD align=middle width="35%"><FONT color=#000000 size=1><input type = text maxLength=300  size=60 name= name_book  >  </FONT></TD>
    <TD align=middle width="20%"><FONT color=#000000 size=1><input type = text maxLength=300  size=32 name= writer   ><br></FONT></TD>
    <TD align=middle width="10%"><FONT color=#000000 size=1><input type = text maxLength=300 size=20 name= company  ><br></FONT></TD>
    <TD align=middle width="6%"><FONT color=#000000 size=1><input type = text maxLength=300 size=5 name= year    ><br></FONT></TD>
 <TD align=middle width="6%"><FONT color=#000000 size=1><input type = text maxLength=300 size=7  name= isbn   ><br></FONT></TD>
<TD align=middle width="4%"><FONT color=#000000 size=1><input type = text maxLength=300  size=5  name=priceOne  ><br></FONT></TD>
 <TD align=middle width="10%"><FONT color=#000000 size=1><input type = text maxLength=300  size=20 name= name_borrow  ><br></FONT></TD></TR>


</center></TD></TR></TBODY></TABLE>

<TR  align=middle ><center><input type="hidden" name="MAX_FILE_SIZE" value="24000000">	 
<TD>ใส่ภาพประกอบ และคำอธิบายหนังสือ ข้างล่าง</td></tr>
<TR  align=middle ><td><INPUT type=file  name=picture size = 38></TD></center></tr>
 <TD align=middle ><TEXTAREA name=detail rows=8 cols=50></TEXTAREA> * <BR>
<TR  align=middle ><td><input type = submit value = เพิ่ม><input type = reset value = ลบ></td></tr>
</form></td>



				

<TABLE borderColor=black cellSpacing=0 cellPadding=2 width="100%" border=0>
  <TBODY>

  <TR>
 <TD><b>Ck </b> - 
     Check Box สำหรับเลือกเพื่อทำการแก้ไขหรือทำการลบหนังสือ &nbsp;<BR><br>
</TD><tr><td><center><FONT face=Verdana size=2>ระบบห้องสมุดบนมือถือ :: 
      Powered by  นายปัณณวิช สุวัฒนวนิช กับ นายสุรัช วังรัตนชัย :: 2006 All rights reserved. </FONT></center></td></tr></TR></TBODY></TABLE>
<P>
</body></html>