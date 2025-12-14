<?php
/*เรียกแฟ้มข้อมูล phpConfig.php*/
include("phpConfig.php")

	// เริ่มติดต่อฐานข้อมูล
	mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

		mysql_query("SET NAMES 'tis620'");

	// เลือกฐานข้อมูล
	mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");

	$sql_mem = "select * from member where login_name = '$login_name' AND  login_password = '$login_password'"; 
	$db_query_mem = mysql_db_query ($dbname, $sql_mem);
	
			$result_mem = mysql_fetch_array($db_query_mem);
							$login_name = $result_mem[login_name];
if(isset($Session[login_name]))
	$login_name=$Session[login_name];	
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
  <TR>
    <TD bgColor=#f0f0f0><FONT face=Verdana size=2><B>3How Board -
       ยินดีต้อนรับคุณ <?
	 if($login_name==""){
	 echo"gest";
	 }
	 else{
	 echo"[$login_name]";
	 }?> กรุณาใช้คำพูดที่สุภาพด้วยค่ะ.</B></FONT></TD></TR>
  <TR>
    <TD><BR>
      <TABLE width="100%" align=center border=0>
        <TBODY>
        <TR>
          <TD>
            <FORM  action=search.php method=post><IMG 
            src="webboard/icon_mini_search.gif"> 
            ค้นหาคำว่า : <INPUT size=30 name=search> 
			
				จาก : <SELECT  name=type>
			<OPTION value = q_topic >ไม่กำหนด!!</OPTION>
  			<OPTION  value = q_datetime>วันที่!!</OPTION>
 			<OPTION  value = q_topic>หัวข้อกระทู้!!</OPTION>
  			<OPTION  value = q_message>รายละเอียด!!</OPTION>
   			<OPTION  value = q_name>ใช้ชื่อคน!!</OPTION>
			<OPTION  value = q_pic>กระทู้ที่มีรูป!!</OPTION>
			 </SELECT>
			
			
			
			<INPUT type=submit value=Search> </FORM></TD>
          <TD>
  <FORM name=limit > 
 <DIV align=right>จำนวนกระทู้ ต่อหน้า <SELECT onchange="MM_jumpMenu('parent',this,0)" name=menu>
  <OPTION value=list2.php?menu=5&login_name=<?echo"$login_name";?>&login_password=<?echo"$login_password";?>>ไม่กำหนด!!</OPTION>
 <OPTION value=list2.php?menu=10&login_name=<?echo"$login_name";?>&login_password=<?echo"$login_password";?>>10</OPTION> 
 <OPTION  value=list2.php?menu=25&login_name=<?echo"$login_name";?>&login_password=<?echo"$login_password";?>>25</OPTION> 
 <OPTION  value=list2.php?menu=50&login_name=<?echo"$login_name";?>&login_password=<?echo"$login_password";?>>50</OPTION>
 <OPTION  value=list2.php?menu=100&login_name=<?echo"$login_name";?>&login_password=<?echo"$login_password";?>>100</OPTION></SELECT></form></TD></TR></TBODY></TABLE><IMG 
      src="webboard/line1.gif"> <BR>[ 
      <A href="index.html" target=_blank>Home</A> ] 
	  <? echo"[ <A href=formaddboard2.htm?memu=$menu&login_name=$login_name&login_password=$login_password>ตั้งกระทู้ใหม่</A>] ";?>
	 
[ <A  href="formmember.htm">สมัครสมาชิกใหม่</A>] [ <A  href="login.htm">เข้าสู่ระบบ</A>] [ <A  href="logout.php">ออกจากระบบ</A>] [ <A  href="addmin.htm">สำหรับผู้ดูแลระบบ</A>] 
      &nbsp; 
      <DIV align=right><!-- <b>วันนี้วันที่:</b> --> <?  

	setlocale("LC_TIME","th");	//ใช้เวลาแบบไทย (ดูตัวอย่างในบทที่ 7)
	$a = date("j");	 // วันที่
	$b = strftime("%B");	 // เดือนเต็ม
	$c = strftime("%Y")+543;	 // ปี พ.ศ.
	$d = date("H:i:s");	 // เวลา

	$a_date = "$a $b $c";
	//echo"$a_date";

?>  <!-- <b>เวลา:</b><?echo"$d";?><b>น.</b> --></DIV><BR>
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


$q_sql = "select * from question1";
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

	$sql = "select * from question1 order by q_id desc limit $goto,$pagesize";
	$db_query = mysql_db_query ($dbname, $sql);
		if (!$db_query)
			{ 
				echo("เอ็กซิคิวต์คำสั่ง SQL ไม่ได้ " . mysql_error() ); 
				exit;
			}
		else	 
			{
				$nums_rows = mysql_num_rows($db_query);	 // จำนวนเรกคอร์ดของกระทู้ทั้งหมด



?>
          <TD>จำนวนกระทู้ที่แสดง : <B><FONT color=#3399cc><?echo"$pagesize\n";?></FONT></B> 
            กระทู้/หน้า -  กระทู้ทั้งหมด : <B><?echo"$num_rows\n";?></B> กระทู้ <IMG 
            src="webboard/icon_online.gif" 
            border=0>UserOnline : <B>1</B><BR>
   <?php


echo "<table border=0 bordercolor=black cellspacing=0 cellpadding=2>\n";
					echo "<tr>\n <td><BR>แสดงหน้าที่ :  ";

					// วนรอบแสดงเลขหน้าทั้งหมด
					for($i=1 ; $i<$page ; $i++) 
						{
							echo "<a href=$PHP_SELF?page=$i&menu=$menu>$i</a> ";
						}

					echo "<font size=2  color=#cc0000><b>$page</b></font> ";
					for($i=$page+1 ; $i<=$totalpage ; $i++) 
						{
							echo "<a href=$PHP_SELF?page=$i&menu=$menu>$i</a> ";
						}
	
					echo "</font></td>\n</tr>\n";
					echo "</table>\n";



?>


 </TD></TR></TBODY></TABLE>



<!-- <BR><A 
      href="view.php?q_id=2 " target=_blank>:: 
     <font color=bule> ประกาศวัน ที่16 ธค.47 จะมีการแข่งขันแบดมินตันที่โรงยิมลาดกระบัง เวลา 13.00 น. เป็นต้นไป</font></A> - <? echo"<IMG  src=$status1>\n";?> ข่าวประกาศ
  <BR><BR> --></TD></TR></TBODY></TABLE>
<TABLE borderColor=#cccccc cellSpacing=0 cellPadding=2 width="100%" border=1>
  <TBODY>
  <TR bgColor=#cce9fd>
    <TD align=middle width="10%"><FONT color=#000000 size=2><B>คำถามที่ </B></FONT></TD>
    <TD align=middle width="50%"><FONT color=#000000 size=2><B>หัวข้อคำถาม </B></FONT></TD>
    
    <TD align=middle width="10%"><FONT color=#000000 size=2><B>ตอบกลับ </B></FONT></TD>
    <TD align=middle width="20%"><FONT color=#000000 size=2><B>ตอบครั้งล่าสุด </B></FONT></TD></TR>
  

<?php
	
	
	



					for ($i=0;$i<$nums_rows;$i++)	// อ่านข้อมูลแต่ละเรกคอร์ด
						{
							$result = mysql_fetch_array($db_query);
							$q_id = $result[q_id];
							$q_topic = $result[q_topic];
							$q_name = $result[q_name];
							$q_email = $result[q_email];
							$q_ip = $result[q_ip];
							$q_date = $result[q_datetime];
							$q_tell = $result[q_tell];
							$q_pic = $result[q_pic];
	
setlocale("LC_TIME","th");	//ใช้เวลาแบบไทย (ดูตัวอย่างในบทที่ 7)
	$a = date("j");	 // วันที่
	$b = strftime("%B");	 // เดือนเต็ม
	$c = strftime("%Y")+543;	 // ปี พ.ศ.
	#$d = date("H:i:s");	 // เวลา

	

	$q_today = "$a $b $c  ";

		 
	
							
							$new=$q_name;
							
							

							$sql1 = "select * from answer1 where a_qid ='$q_id'";
							$db_query1 = mysql_db_query ($dbname, $sql1);
							$num_rows1 = mysql_num_rows($db_query1);	// จำนวนเรกคอร์ดของผู้ที่ตอบกระทู้

							$sql2 = "select a_name,a_datetime from answer1  where a_qid ='$q_id' order by a_qid desc,a_id desc";
							$db_query2 = mysql_db_query ($dbname, $sql2);
							$num_rows2 = mysql_num_rows($db_query2);	
							

							$result1 = mysql_fetch_array($db_query2);
							
							
							
							$a_name = $result1[a_name];
							$a_datetime = $result1[a_datetime];
							
							
							$sql_str = "select login_name from member where login_name ='$a_name'";
							$db_query_str = mysql_db_query ($dbname, $sql_str);
							$result_str = mysql_fetch_array($db_query_str);
							
							
						$status = "<img src =\"webboard/icon_new.gif \" border =\"0\">";
						if($num_rows2 > 0 && $num_rows2 < 5 )
							$status = "<img src =\"webboard/icon_reply.gif\" border =\"0\">";
								
							if($num_rows2 >= 5)
							$status = " <IMG  src =\" webboard/icon_hot.gif\" border =\"0\">";
							#$hot= " <IMG  src =\" webboard/icon_img.gif\" border =\"0\">";
							#$hot ="<font size=1 color=red> - hot >></font>"; // Update topic
							#$hotpic =" - <img src =\"webboard/icon_mini_post.gif \" border =\"0\">";
							
							
							if($q_pic==1){
											   $statusimg = " <IMG  src =\" webboard/icon_img.gif\" border =\"0\">";
											   $status_addmin="";
							}
							else{
								 			    $statusimg="";
							}
							
							if($new == "admin"){
							$status_addmin1 = "<img src =\"webboard/icon_pin.gif \" border =\"0\">";
							$status_addmin = "- ข่าวประกาศ - $status_addmin1";
							}
							
							
							
	if ($q_id<=9) {$zero="000";}
	if ($q_id>=10 and $q_id<=99) {$zero="00";}
	if ($q_id>=100 and $q_id<=999) {$zero="0";}
	if ($q_id>=1000 and $q_id<=9999) {$zero="";}											
							

echo"<TABLE borderColor=#cccccc cellSpacing=0 cellPadding=0 width=100% border=1>\n";
 echo" <TBODY>\n";
echo"<TR bgColor=#fafafa><TD width=10%><DIV align=center>\n";
echo"$status - $zero$q_id</DIV></TD>\n";
echo"<TD width=50%>&nbsp; <A href=view.php?q_id=$q_id target=_blank>$q_topic  $statusimg </A> <BR>\n";
echo"&nbsp; โดย : <FONT  color=#cc0000> $q_name  </FONT>\n";
echo"เมื่อ : ($q_date)$status_addmin</TD>\n";
echo"<TD width=10%> <DIV align=center>$num_rows1</DIV></TD>\n"; 
echo"<TD width=20%>เมื่อวันที่: $a_datetime<BR>โดย: $a_name \n";

	 if($result_str==""){
	 echo"[status: <i>gest]</i>";
	 }
	 else{
	 echo"[status: <i>member</i>]";
	 }
echo"<DIV></DIV></TD></TR></TBODY></TABLE>\n";


							
						}	// จบ for
					} // จบ else
				?>

 












<TABLE borderColor=black cellSpacing=0 cellPadding=2 width="100%" border=0>
  <TBODY>
  <TR>
    <TD><IMG 
      src="webboard/icon_pin.gif"> - 
      ข่าวประกาศ &nbsp;<IMG 
      src="webboard/icon_new.gif"> - 
      คำถามที่ไม่มีคนสนใจ &nbsp;<IMG 
      src="webboard/icon_reply.gif"> - 
      คำถามที่มีคนตอบแล้ว &nbsp;<IMG 
      src="webboard/icon_hot.gif"> - 
      คำถามที่มีคนตอบมาก &nbsp;<IMG 
      src="webboard/icon_img.gif"> - 
      คำถามที่มีรูป <BR><BR><A 
      href="http://t.extreme-dm.com/?login=212cafe" target=_blank><IMG height=1 
      alt="" src="webboard/i.gif" 
      width=1 border=0></A>
      <SCRIPT language=javascript1.2><!--
EXs=screen;EXw=EXs.width;navigator.appName!="Netscape"?
EXb=EXs.colorDepth:EXb=EXs.pixelDepth;//-->
</SCRIPT>

      <SCRIPT language=javascript><!--
EXd=document;EXw?"":EXw="na";EXb?"":EXb="na";
EXd.write("<img src=\"http://t0.extreme-dm.com",
"/0.gif?tag=samharv.cjb.net&j=y&srw="+EXw+"&srb="+EXb+"&",
"l="+escape(EXd.referrer)+"\" height=1 width=1>");//-->
</SCRIPT>
      <NOSCRIPT><IMG height=1 alt="" 
      src="webboard/0.gif" 
      width=1></NOSCRIPT> </FONT></TD></TR></TBODY></TABLE>
<P>
<?
print <<<EOT


EOT;
?>
</BODY></HTML>
