<?php 
include "interface.inc.php"; 
include "accesscontrol.php";  
include "outputlib.php";
logo_leftmenu("Information Security Advisory Group (ISAG)");
curve_open();
//------------------------------------------------------------------------------------------------------------------------------------------------------------------
if(isset($HTTP_GET_VARS["IDNews"]))
{
		$IDNews=$HTTP_GET_VARS["IDNews"];
		$query = "								
				select accesslist.Fullname AS Name,Headline,Detail,Files,date_format(Date_post,'%e %M %Y') AS postdate,time_format(Times,'%H:%i') AS posttime,Links
				from accesslist,add_news 
				where Type='d' and IDNews='$IDNews' and accesslist.Username=add_news.IDUser ";
				$result = mysql_query($query);
				if(mysql_num_rows($result)==1)
				{
						print "<center><B>&nbsp;<font size=3>ISAG :- ข่าวประกาศภายใน</font></B><br><br>";
						print "<table border=1 cellpadding=5 cellspacing=0 width=95% bordercolor='#9088B0'><tr><td>";
						$row=mysql_fetch_array($result);									
						$Name = $row['Name'];
						$Headline	=$row['Headline'];
						$Detail	=$row['Detail'];
						$Files	=$row['Files'];
						$postdate=$row['postdate'];
						$posttime=$row['posttime'];
						$Links=$row['Links'];
						print "<CENTER><B>$Headline </B></CENTER><br>";
						print_output($Detail);  print "<br><br>";	
						print_output($Links); print "<br>";								
						if ($Files!="")  
								{
									print "&nbsp; <img src='../image/icon.gif'> <B> $Files 
									<a href='../file/news_file/$Files'>Download</a></B><br> ";
								}							
						print " <br><B>ประกาศเมื่อวันที่</B> $postdate เวลา $posttime  <br><B>โดย</B> $Name ";
						print "</td></tr></table><br>";
?>
						<a href="<?=$HTTP_SERVER_VARS['PHP_SELF']?>"><b> << กลับไปหน้า Staff News</b></a></center>
<?
				}
				else
				{
						print "<center>ไม่พบข้อมูล</center>";
				}
}
else
{
?>
<!--------------------------------------------------------------------------------------------------------------------------------------------------------------------->		
<!-- <center><font size=3 color=red><b>ให้แต่ละกลุ่มต้องเข้าไป Add Project และ Update Profile ของแต่ละคนด้วยครับ  ส่วนอื่นๆ ก็สามารถทดสอบการใช้งานได้</b></font><br><br></center> -->


				<B>&nbsp; <font size=3>ISAG :- ข่าวประกาศภายใน</font></B>
				<hr color="<?=$hr_color?>" width=90% align=center> 
<?	 
				$query = "select IDNews,Headline,date_format(Date_post,'%e/%c') AS postdate 
				from add_news where Type='d' and Date_until>now()  order by  IDNews DESC";
				$result = mysql_query($query);
				if ($result)   
				{
						while ($row=mysql_fetch_array($result))
						{
							$IDNews	=$row['IDNews'];
							$Headline	=($row['Headline']);
							$postdate	=($row['postdate']);
							print "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src='../image/bullet.gif'  height=10 width=10>[$postdate] ";
?>
							<a href="<?=$HTTP_SERVER_VARS["PHP_SELF"]?>?IDNews=<?=$IDNews?>"><?=$Headline?></a><br> 
<?
						}
				} 
}
curve_close();
staffmenu_5();
?>








<!-- <font size=3 color="black"><b><center>Staff โปรดอ่านก่อนครับ</center></b></font>
<hr color="<?=$hr_color?>" width=90% align=center><br>
<B><font size=3 color="black">ส่วนที่ให้ Staff กรอกข้อมูลให้ครบครับ (Menu ด้านขวามือ)</font></B><br>
<ul>
	<li><B><U>Add Projects</U></B>  ให้กรอกข้อมูลรายละเอียดเกี่ยวกับโครงงานที่ทำในปีนี้  สำหรับเผยแพร่ให้แก่ผู้ที่สนใจ (กลุ่มละ 1 โครงงานนะครับ อย่ากรอกซ้ำกัน)
	<li><B><U>Update Profile</U></B> กรอกข้อมูลรายละเอียด ที่อยู่ ของ Staff แต่ละคน เพื่อเก็บประวัติของ Staff แต่ละรุ่น ให้ติดต่อถึงกันได้
</ul>
<B><font size=3 color="black">ส่วนนี้เป็น Option  ถ้าใส่ได้ก็จะดีมากตรับ (Menu ด้านขวามือ)</font></B><br>
<ul>
	<li><B><U>Add Articles</U></B>  สามารถเพิ่มบทความต่างๆ ทางด้าน Security ลงไปได้ โดยแบ่งแยกเป็นหมวดหมู่  สามารถสร้างหมวดขึ้นเองได้
	<li><B><U>Add links</U></B>  เพิ่ม link ที่น่าสนใจลงในเว็บ โดยแบ่งแยกเป็นหมวดหมู่ สามารถสร้างหมวดขึ้นมาเองได้
</ul>
<CENTER><font size=3 color="red"><a href='http://161.246.5.16/webboard/view.php?ID=32' target='_new_'><B>ถ้าพบ Bug ช่วยแจ้งด้วยครับ Click!!!</B></a></font></CENTER><br>

<B><font size=3 color="black">ส่วนที่เหลือยังมีอีกเยอะมากครับ จะทยอยมาเพิ่มตอนหลัง <br> </font></B><br>
 -->