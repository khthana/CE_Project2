<?php 
include "interface.inc.php";
include "accesscontrol.php";
include "fn.php";
include "outputlib.php"; 
logo_leftmenu("Information Security Advisory Group (ISAG)");
curve_open();
$uid=$HTTP_SESSION_VARS["uid"];
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
if (($HTTP_POST_VARS["submit"] == "preview") or ($HTTP_POST_VARS["submit"] == "post")) //check input
{
	$Error=0;
	if (is_uploaded_file($HTTP_POST_FILES["Files"]["tmp_name"]))
		{
			$Files=$HTTP_POST_FILES["Files"]["tmp_name"]; 
			$Files_name=$HTTP_POST_FILES["Files"]["name"];
		}
	$Type=$HTTP_POST_VARS["Type"];
	$Headline = htmlspecialchars(trim(stripslashes($HTTP_POST_VARS["Headline"])));
	$Detail = trim(stripslashes($HTTP_POST_VARS["Detail"]));
	$Date_until=$HTTP_POST_VARS["Date_until"];
	$Day_until=$HTTP_POST_VARS["Day_until"];
	$Month_until=$HTTP_POST_VARS["Month_until"];
	$Year_until=$HTTP_POST_VARS["Year_until"];
	$Links = trim($HTTP_POST_VARS["Links"]);

		if (($Type!="b") and ($Type!="c") and ($Type!="d"))
			{
				$Error=1; 
				print "<font color='#FF0000'>&nbsp; ยังไม่ได้เลือกประเภทของข่าว</font><BR>";
			}
		if (!ereg("^.{5,}$",$Headline) and isset($Headline))
			{
				$Error=1;  
				print "<font color='#FF0000'>&nbsp; เช็คหัวข้อข่าวให้ถูกต้อง</font><BR>";
			}
		if (!ereg(".+",$Detail))
			{
				$Error=1; 
				print "<font color='#FF0000'>&nbsp; เช็คเนื้อหารายละเอียดข่าวให้ถูกต้อง</font><BR>";
			}
		if (($Date_until !="1") and  ($Date_until!="2"))
			{
				$Error=1; 
				print "<font color='#FF0000'>&nbsp; ยังไม่ได้เลือกว่าประกาศถึงวันไหน</font><BR>";
			}
		if (($Date_until == "2") and (($Day_until=="0") or ($Month_until=="0")))
			{
				$Error=1; 
				print "<font color='#FF0000'>&nbsp; ยังไม่ได้เลือกวันที่ว่าประกาศถึงวันไหน</font><BR>";
			}
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if (($HTTP_POST_VARS["submit"] == "preview") and ($Error==0)) //if no error can preview news
{		
		if (is_uploaded_file($Files))
			{ 
				$Filename = time()."_$Files_name";  
				//if (!copy($Files,"$tempfile/$Filename")) print ("ไม่สามารถ upload file <br>"); 
			}
?>
		<center>
		<table cellpadding=2 cellspacing=1 width=98%>
		<tr ID=table3><td> &nbsp;Preview :  <?=$Headline?></td></tr>
		<tr ID=table1><td> <br>
		
		<? print_output($Detail); ?>

		<?  if ($Links!= "") 
		       {	print "<br><br>";
				print_output($Links);
				print "<br>";
			}
		?>
				</td></tr>
		<? if($Files_name) { ?>

		<tr ID=table1><td> &nbsp; 
					<img src='<?=$path_web_img?>icon.gif'> <B><? print "$Files_name ( ".getsize($Files)." )"; ?>
					<a href='<?=$filedir?>/<?=$Filename?>'> Download </a></B> <font color='red'><br> (กรณี Preview ไม่สามารถ Download ได้) </font><br> 
					<font color='red'>ก่อน Post ข่าวจริงๆ ให้คลิก Browse เพื่อเลือกไฟล์ใหม่อีกครั้ง  </font>   </td></tr>
		
		<? }?>

		<tr ID=table1><td> &nbsp;  <img src="../image/bullet.gif"> <B>ประกาศเมื่อวันที่</B>  <? print date("j/m/Y")?> &nbsp;&nbsp; <B>เวลา</B>  <? echo date("H:i"); ?> </td></tr>
		<tr ID=table1><td> &nbsp;  <img src="../image/bullet.gif"> <B>ผู้ประกาศ</B> <?=$HTTP_POST_VARS["Name_indb"]?> </td></tr>

		</table>

		
		</center>
<?php
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if (($HTTP_POST_VARS["submit"] == "post") and ($Error==0)) // if no error can post news
{
		if ($Date_until==1) $Date_until="9999-12-31";
		if ($Date_until==2) $Date_until="$Year_until-$Month_until-$Day_until";

		if (is_uploaded_file($Files))
			{ 
				$Filename = time()."_$Files_name";  
				if (!copy($Files,"$file_news/$Filename"))  print "ไม่สามารถ upload file ได้<br>"; 
			}	
	
	$sql_update = "insert into add_news values 
			('','$uid','$Type','$Headline','$Detail','$Filename',now(),now(),'$Date_until','$Links','1') ";					

	$result_update=mysql_query($sql_update);
			
	if ($result_update)
		print "<CENTER><B><font size=3>Post ข่าวเรียบร้อยแล้ว</font></B></CENTER>";		
	else
		print "<CENTER><B><font size=3>ไม่สามารถ Post ข่าวได้ </font></B></CENTER>".mysql_error();		
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if ((($HTTP_POST_VARS["submit"]!="post") and ($HTTP_POST_VARS["submit"]!="preview")) or ($Error==1) or ($HTTP_POST_VARS["submit"]=="preview")) //show form
{
			$query = "select Name from staff_profile where Staffuser='$uid' ";
			$result = mysql_query($query);
			if(($result) and mysql_num_rows($result)==1)
			{
				$row = mysql_fetch_array($result);
				$Name_indb = $row['Name'];
			}
			else { print "ไม่พบ User นี้ในฐานข้อมูล"; exit; }
?>

	<center>
	<form enctype = "multipart/form-data" method=post action="<?=$HTTP_SERVER_VARS['PHP_SELF']?>" >
	<input type="hidden" name="MAX_FILE_SIZE" value="30000000">
	<table cellpadding=2 cellspacing=1 width=98% border=0 bordercolor=black>
	<tr ID=table3>
			<td colspan=4><CENTER>ประกาศข่าว</CENTER></td></tr>
	<tr>	
			<td ID=table1>&nbsp;ประเภทข่าว <font color=red>*</font></td>
			<td ID=table1 colspan=3>		
					<select name="Type">
					<option value="a" <? if ($Type=="a") print "SELECTED"; ?>>&nbsp;</option>
					<option value="b" <? if ($Type=="b") print "SELECTED"; ?>>ข่าวความเคลื่อนไหวทั่วไปด้าน security</option>
					<option value="c" <? if ($Type=="c") print "SELECTED"; ?>>ข่าวกิจกรรม งานประชุม บรรยาย สัมนา นิทรรศการ ต่างๆ </option>
					<option value="d" <? if ($Type=="d") print "SELECTED"; ?>>ข่าวประกาศภายใน (สำหรับสมาชิกเท่านั้น)</option>
					</select>
			</td></tr>
	<tr>
			<td ID=table1>&nbsp;หัวข้อข่าว <font color=red>*</font></td>
			<td ID=table1 colspan=3>							
			<input type=text size=45 name="Headline" value="<?=stripslashes($Headline)?>"></td></tr>
	<tr>
			<td ID=table1>&nbsp;เนื้อหาข่าว <font color=red>*</font></td>
			<td ID=table1 colspan=3>
		
			<textarea cols=57 rows=5 name="Detail"><? print htmlspecialchars(stripslashes($Detail)); ?></textarea></td></tr>
	<tr>
			<td ID=table1>&nbsp;ไฟล์ประกอบข่าว <br>(Maximum 30 MB)</td>
			<td ID=table1 colspan=3>
			<input type=file size=30 name="Files"> &nbsp;(ถ้าไม่มีเว้นไว้)</td></tr><!----********ยัง----->
	
	<tr>
			<td ID=table1 rowspan=2 >&nbsp;ประกาศถึงวันที่ <font color=red>*</font></td>
			<td ID=table1 colspan=3>
		
					<input type="radio" name="Date_until" value="1"  <? if($Date_until=="1") echo "CHECKED";					
					 ?>> ไม่กำหนด </td></tr>
	<tr>
			<td ID=table1 colspan=3>
	
					<input type="radio" name="Date_until" value="2" <? if($Date_until=="2") echo "CHECKED" ?>>
					ประกาศข่าวจนถึงวันที่ 
					<select name="Day_until">
					<option value="00" <? if ($Day_until=="00") print "SELECTED"; ?>></option>
					<option value="01" <? if ($Day_until=="01") print "SELECTED"; ?>>1</option>
					<option value="02" <? if ($Day_until=="02") print "SELECTED"; ?>>2</option>
					<option value="03" <? if ($Day_until=="03") print "SELECTED"; ?>>3</option>
					<option value="04" <? if ($Day_until=="04") print "SELECTED"; ?>>4</option>
					<option value="05" <? if ($Day_until=="05") print "SELECTED"; ?>>5</option>
					<option value="06" <? if ($Day_until=="06") print "SELECTED"; ?>>6</option>
					<option value="07" <? if ($Day_until=="07") print "SELECTED"; ?>>7</option>
					<option value="08" <? if ($Day_until=="08") print "SELECTED"; ?>>8</option>
					<option value="09" <? if ($Day_until=="09") print "SELECTED"; ?>>9</option>
					<option value="10" <? if ($Day_until=="10") print "SELECTED"; ?>>10</option>
					<option value="11" <? if ($Day_until=="11") print "SELECTED"; ?>>11</option>
					<option value="12" <? if ($Day_until=="12") print "SELECTED"; ?>>12</option>
					<option value="13" <? if ($Day_until=="13") print "SELECTED"; ?>>13</option>
					<option value="14" <? if ($Day_until=="14") print "SELECTED"; ?>>14</option>
					<option value="15" <? if ($Day_until=="15") print "SELECTED"; ?>>15</option>
					<option value="16" <? if ($Day_until=="16") print "SELECTED"; ?>>16</option>
					<option value="17" <? if ($Day_until=="17") print "SELECTED"; ?>>17</option>
					<option value="18" <? if ($Day_until=="18") print "SELECTED"; ?>>18</option>
					<option value="19" <? if ($Day_until=="19") print "SELECTED"; ?>>19</option>
					<option value="20" <? if ($Day_until=="20") print "SELECTED"; ?>>20</option>
					<option value="21" <? if ($Day_until=="21") print "SELECTED"; ?>>21</option>
					<option value="22" <? if ($Day_until=="22") print "SELECTED"; ?>>22</option>
					<option value="23" <? if ($Day_until=="23") print "SELECTED"; ?>>23</option>
					<option value="24" <? if ($Day_until=="24") print "SELECTED"; ?>>24</option>
					<option value="25" <? if ($Day_until=="25") print "SELECTED"; ?>>25</option>
					<option value="26" <? if ($Day_until=="26") print "SELECTED"; ?>>26</option>
					<option value="27" <? if ($Day_until=="27") print "SELECTED"; ?>>27</option>
					<option value="28" <? if ($Day_until=="28") print "SELECTED"; ?>>28</option>
					<option value="29" <? if ($Day_until=="29") print "SELECTED"; ?>>29</option>
					<option value="30" <? if ($Day_until=="30") print "SELECTED"; ?>>30</option>
					<option value="31" <? if ($Day_until=="31") print "SELECTED"; ?>>31</option>
					</select>
					
					<select name="Month_until">
					<option value="00" <? if ($Month_until=="00") print "SELECTED"; ?>></option>
					<option value="01" <? if ($Month_until=="01") print "SELECTED"; ?>>มกราคม</option>
					<option value="02" <? if ($Month_until=="02") print "SELECTED"; ?>>กุมภาพันธ์</option>
					<option value="03" <? if ($Month_until=="03") print "SELECTED"; ?>>มีนาคม</option>
					<option value="04" <? if ($Month_until=="04") print "SELECTED"; ?>>เมษายน</option>
					<option value="05" <? if ($Month_until=="05") print "SELECTED"; ?>>พฤษภาคม</option>
					<option value="06" <? if ($Month_until=="06") print "SELECTED"; ?>>มิถุนายน</option>
					<option value="07" <? if ($Month_until=="07") print "SELECTED"; ?>>กรกฏาคม</option>
					<option value="08" <? if ($Month_until=="08") print "SELECTED"; ?>>สิงหาคม</option>
					<option value="09" <? if ($Month_until=="09") print "SELECTED"; ?>>กันยายน</option>
					<option value="10" <? if ($Month_until=="10") print "SELECTED"; ?>>ตุลาคม</option>
					<option value="11" <? if ($Month_until=="11") print "SELECTED"; ?>>พฤศจิกายน</option>
					<option value="12" <? if ($Month_until=="12") print "SELECTED"; ?>>ธันวาคม</option>
					</select>

					<input type=text size=4 name="Year_until" 
					value="<? if($Year_until=="") print date("Y"); else print "$Year_until"; ?>"> 
					<br> (สำหรับข่าวที่มีกำหนดวันสิ้นสุดแน่นอน)
					</td></tr>					
	 <tr>
			<td ID=table1>&nbsp;Links ที่เกี่ยวข้อง <br>(ถ้าไม่มีเว้นไว้)</td>
			<td ID=table1 colspan=3><textarea cols=57 rows=5 name="Links"><? print htmlspecialchars(stripslashes($Links)); ?></textarea></td>
	</tr>	
	 <tr>
			<td ID=table1 width=120>&nbsp;วันที่ประกาศข่าว</td>
			<td ID=table1 width=110>&nbsp;&nbsp;<? print date(" j/m/Y "); ?></td>
			<td ID=table1 width=120>&nbsp;เวลาประกาศข่าว</td>
			<td ID=table1 width=140>&nbsp;&nbsp;<? echo date("H:i"); ?></td></tr>
	<tr>
			<td ID=table1>
					
			&nbsp;ผู้ประกาศข่าว</td>
			<td ID=table1 colspan=3>&nbsp;<? echo $Name_indb; ?></td></tr>
			<input type=hidden name="Name_indb" value="<? echo $Name_indb; ?>"> <!-- ส่งชื่อผู้ประกาศข่าวไปอีกหน้า -->
	<tr>
			<td ID=table1 colspan=4><CENTER>
						<input type=submit  name="submit" value="preview">&nbsp;
						<input type=submit  name="submit" value="post"></CENTER></td></tr>
	
</table>
</form>
</center>
	<font size=3><B>คำแนะนำ</B></font>
	<ul>
	<li>ในช่อง <u>เนื้อหาข่าว</u> และ <u>Links ที่เกี่ยวข้อง</u> สามารถเว้นบรรทัดได้ ด้วยการกดปุ่ม Enter
	<li> ตัวอย่างการใส่ข้อความภายในช่อง  <u>Links ที่เกี่ยวข้อง</u> สมมุติว่าเราต้องการให้แสดงผลลิงค์เป็นดังนี้ <br><br>

	<table border=1 cellpadding=5 cellspacing=0 bordercolor=<?=$bg_box?>><tr><td>
	<b>เอกสารอื่นๆ ที่เกี่ยวข้อง</b><br><br>
	<a href="http://www.ce.kmitl.ac.th"> Kmitl Computer Engineering </a><br>
	<a href="http://www.cnn.com"> CNN News 24 hours a day </a>
	</td></tr></table><br> จะต้องพิมพ์ข้อความในช่อง <u>Links ที่เกี่ยวข้อง</u>  ดังนี้<br><br>

	<table border=1 cellpadding=5 cellspacing=0 bordercolor=<?=$bg_box?>><tr><td>
	[b] เอกสารอื่นๆ ที่เกี่ยวข้อง [/b]<br><br>
	[url=http://www.ce.kmitl.ac.th] Kmitl Computer Engineering [/url]<br>
	[url=http://www.cnn.com] CNN News 24 hours a day [/url]
	</td></tr></table>

	</ul>


<?
}
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
curve_close();
staffmenu_5();
?>