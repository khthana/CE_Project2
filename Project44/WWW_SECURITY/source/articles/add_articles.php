<?
include "interface.inc.php"; 
include "accesscontrol.php";  
include "outputlib.php"; 

$uid=$HTTP_SESSION_VARS["uid"];
$group_select = $HTTP_POST_VARS["group_select"]; //เอาไว้ลบกลุ่ม หรือคงค่ากลุ่มที่ได้เลือกไว้
?> 
<!-- 
ลบกลุ่มแล้วลบ บทความ all ด้วย ถ้ามีค้างฟ้องก็ได
ลบบทความต้องลบรูปด้วยนะ
- - รูป copy จาก temp ไปไว้จริงๆ แล้ว แต่ยังเก็บแบบ temp อยู่

สร้างตัวกลับมาแก้ไข
ทำตรงลบ แต่ละ articles ด้วย
ไอ้ width=390 or  410 เนี่ย มันก็ขึ้นกับซีกซ้ายหรือขวาด้วยว่าจะมีการเปล่ยนแปลงไปไง
-->
<?  
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------
//ป้องกัน code แปลกปลอมจากช่องรับ อินพุตและกัน / \ ' " ได้
if (isset($HTTP_POST_VARS['new_group'])) 
{
	$new_group=htmlspecialchars(stripslashes(trim($HTTP_POST_VARS['new_group'])));
}
if (isset($HTTP_POST_VARS['keyword_articles'])) 
{
	$keyword_articles=htmlspecialchars(stripslashes(trim($HTTP_POST_VARS['keyword_articles'])));
}
if (isset($HTTP_POST_VARS['name_articles'])) 
{
	$name_articles=htmlspecialchars(stripslashes(trim($HTTP_POST_VARS['name_articles'])));
}
//ตรวจสอบ ip 
$ip = $HTTP_SERVER_VARS["HTTP_X_FORWARDED_FOR"];
$ip = $ip." (".gethostbyaddr($ip).")";
//ทำการเช็ครูปว่าถูกต้องหรือเปล่าและทำการ upload รูปไปไว้ใน Directory
$allowed_types = array('image/gif', 'image/jpeg', 'image/pjpeg', 'image/png');
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="Upload") //ถ้ามีการคลิกเพื่อ upload ไฟล์เข้ามา
{           
		if (is_uploaded_file($HTTP_POST_FILES["userfile"]["tmp_name"]))
		{
			$userfile=$HTTP_POST_FILES["userfile"]["tmp_name"]; 
			$userfile_name=$HTTP_POST_FILES["userfile"]["name"];
			$userfile_type=$HTTP_POST_FILES["userfile"]["type"];  
			$userfile_size=$HTTP_POST_FILES["userfile"]["size"];
		}	

		if ($userfile_type=="image/gif") $filename = $uid."".time().".gif";  
		if (($userfile_type=="image/pjpeg") or ($userfile_type=="image/pjpeg")) $filename = $uid."".time().".jpg";  

		if($userfile_size > 0) 
		{
			if(in_array($userfile_type, $allowed_types)) 
			{
				if(copy($userfile,$temp_pic_articles.$filename)) 	{ $error = "นำ code นี้ไปวางเพื่อแทรกรูป  ";  }
				else {$error = "ไม่สามารถ Upload รูปได้";  }    
			}
			else 
			{ $error = "Please upload only images"; }
		}
		else {$error ="Please select image before upload"; }
}        
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="new group") //ถ้ามีการคลิกเพื่อสร้างหมวดใหม่
{		
	$Error=0;
		$new_group = htmlspecialchars(trim($HTTP_POST_VARS["new_group"]));
		if (!ereg("^.{1,}$",$new_group))
			{
					$Error2=1;
					$error ="Please type group name";					
			}
		if ($Error2 == 0)
			{		// query เอาชื่อของผู้ใช้ก่อน จากตัวแปร session ที่ได้กำหนดไว้
					$sql0="select fullname from accesslist where username='$uid'";
					$result0=mysql_query($sql0);
					if(mysql_num_rows($result0)==1)
					{
							$row=mysql_fetch_array($result0);
							$username=$row['fullname'];

					$sql1 = "insert into articles_group values('','$new_group',now(),'$username','$ip') ";
					$result = mysql_query($sql1);
					if ($result) {
								$error="สร้างหมวด <font color='#336699'>\"$new_group\"</font> เรียบร้อยแล้ว";
						}     else { //ตารางเซ็ตไว้ว่าเป็น unique
								$error="ไม่สามารถสร้างหมวดนี้ได้ ชื่ออาจจะซ้ำ";
						}	
					}
					else $error="error";
			}		
}
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="del group")  //ถ้ามีการคลิกเพื่อลบกลุ่ม
{
	$sql1 = "select * from articles_group";
	$result = mysql_query($sql1);
	$number = mysql_num_rows($result);
	if($number==0) $error="ยังไม่มีหมวดที่จะให้ลบเลย";
	else  //เช็คก่อนว่าที่จะลบน่ะมีหรือเปล่าหรือว่าว่างอยู่ถ้าไม่ว่างค่อยให้ไปลบ
	{
		$sql2 = "delete from articles_group where id_group='$group_select' ";
		$result2 = mysql_query($sql2);
		if($result2) $error="ลบหมวดเรียบร้อยแล้ว";
		else $error="ไม่สามารถลบหมวดนี้ได้";
	}	
}
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="Add articles")  //ถ้ามีการคลิกเพื่อ Add บทความเข้าฐานข้อมูล
{
		$all = format_output($HTTP_POST_VARS['content']); 
		if(($all=="") or ($HTTP_POST_VARS['keyword_articles']=="") or ($HTTP_POST_VARS['name_articles']=="")) 
		{   // เช็คว่าเนื้อหา ชื่อบทความ คีย์เวิร์ด ใส่ครบหมดยัง
			$error = "คุณยังใส่ข้อมูลไม่ครบ กรุณาตรวจสอบ ชื่อบทความ คีย์เวิร์ดและเนื้อหาให้ครบทุกช่องก่อน";
		} //ถ้าว่างบอกว่ายังไม่ได้ใส่อะไรเลย
		 elseif (!isset($HTTP_POST_VARS['group_select'])) //ถ้าไม่มีชื่อกลุ่มใน Database ยัง add ไม่ได้
		{ 
			$error = "ตอนนี้ยังไม่มีชื่อกลุ่มในฐานข้อมูล ต้องสร้างชื่อกลุ่มใหม่ก่อน";
		}			
		else //ถ้ามีการใส่ข้อมูลในเนื้อหาครบแล้ว
		{ 
				$findpic = htmlspecialchars(stripslashes($HTTP_POST_VARS['content']));
				$findpic = preg_replace("/&quot;/", "\"", $findpic);
				preg_match_all("/\[pic=\"([^\"]+)\"\]/", $findpic, $images);
				$errorcopy=0;
				if(count($images[1]) != 0) // ถ้ามีการใส่รูปภาพเข้าไปไว้ในเนื้อหาของเวบด้วย
				{ //---------------------------------------->
					
					foreach($images[1] as $key => $val) 
					{ 
						//copy จาก folder temp ไปไว้ใช้ใน folder จริงๆ และ add ลง db ด้วยเน้อ
						if(!copy($temp_pic_articles.$val,$real_pic_articles.$val)) 
							{
								$error="ไม่สามารถ copy รูปไปไว้ใน Directory ได้";
								$errorcopy=1;
							}
						else //ถ้า copy รูปจาก temp ไป 2001 ได้ก็มา Query ไฟล์ภาพลง db ด้วย
						   {
								$sql="insert into articles_picture values('$group_select','$val')";
								$result=mysql_query($sql);
								if(!$result) 
									{
										$error=$error."<br>ไม่สามารถ Query ไฟล์ภาพลง Database ได้";
										$errorcopy=1;
									}
						   }
					}												
				}	//---------------------------------------->			
				//ส่วนนี้จะ add ข้อมูล	จากฟอร์มเข้า database แล้วนะ 
				if($errorcopy==0) //ต้องไม่มี error จากการ copy รูปจาก temp ไป 2001ถึงจะ add เข้า database
				{
					// query เอาชื่อของผู้ใช้ก่อน จากตัวแปร session ที่ได้กำหนดไว้
					$sql0="select fullname from accesslist where username='$uid'";
					$result0=mysql_query($sql0);
					if(mysql_num_rows($result0)==1)
					{
							$row=mysql_fetch_array($result0);
							$username=$row['fullname'];
					
					$sql1 = "insert into articles_each values('','$group_select','$HTTP_POST_VARS[name_articles]','$HTTP_POST_VARS[keyword_articles]',
					'$all',now(),'$username','$ip') ";
					$result = mysql_query($sql1);
					if ($result) {
								$error="add complete";
						}     else { 
								$error="Cannot add articles";
						}	
					}
					else { $error="Cannot add articles";};
				}
		}
}
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------
?>
<html><head><title>Information Security Advisory Group (ISAG)</title>
<LINK REL=STYLESHEET TYPE="text/css" HREF="styles.css"></head>
<body bgcolor="#DDDDEE"> 

<?  //ถ้าคลิก add ข้างบน OK ก็ print ว่า OK แล้ว
		if(($error=="add complete") && ($HTTP_POST_VARS['submit']=="Add articles"))
		{
			 print "<center><font size=3><b>เพิ่มบทความเรียบร้อยแล้ว<br>";
			 print "<a href='add_articles.php'> เขียนบทความใหม่ </a><br>";
			 print "<a href='../staff/isagstaff.php'> กลับไปหน้า Staff </a><br></b></font></center>";
		} 
		else  //นอกจากนี้อยู่ใน โหมด Preview
		{ //---------------------------------- ส่วนแสดง error ต่างๆ  วงเล็บปิดอยู่ท้ายสุด @@@@@@@@@@@@
?>
		<CENTER><font color=red><b><?=$error?> </font>&nbsp;&nbsp;
		<font color="#336699"><? if($filename)  print "[pic='$filename'] (แต่ละรูป code ห่างกัน 1 space)"; ?> </b></font></CENTER>
<? 
			
		// query ชื่อหมวดของบทความเพื่อแสดงข้างบนสุดของ Preview
		$sql1 ="select group_name from articles_group where id_group='$group_select' ";
		$result = mysql_query($sql1);
		while ($row=mysql_fetch_array($result))
		$group_name=$row['group_name'];
?>
<? // ถ้ามีการพิพม์เนื้อหาเข้ามาก็จะไปแสดงส่วน Preview ทั้งหมด
	if (isset($HTTP_POST_VARS['content'])) 
	{
		print "<b><font color='red'>Preview </font><font color='#003366'> บทความนี้อยู่ในหมวด [ $group_name ] </font></b><br><br><table border=0 cellpadding=0 cellspacing=2 width=100% bgcolor='#9088B0'>
		<tr><td><table border=0 cellpadding=0 cellspacing=0 width=100% bgcolor='#9088B0'>
		<tr><td style='background-color:#ffffff;'>&nbsp;</td><td style='background-color:#ffffff;'><br> \n \n \n";

		print "<b><center><font color=red>";
		if (isset($HTTP_POST_VARS['name_articles']) and $HTTP_POST_VARS['name_articles']!="") 
			{ 
				print "<font color=black size=3>".$HTTP_POST_VARS['name_articles']."</font><br>"; 
			}
		if ($HTTP_POST_VARS['name_articles']=="")
			{ 
				print "คุณยังไม่ได้ใส่ชื่อบทความ<br>"; 
			}
		if ($HTTP_POST_VARS['keyword_articles']=="")
			{ 
				print "คุณยังไม่ได้ใส่ keyword ของบทความ<br>"; 
			}
		print "</font></center></b><br>";

		print_output(stripslashes($HTTP_POST_VARS['content'])); 
		print "<br><br></td></tr></table></td></tr></table>";
	} 
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------
//------------------------------------------                     ORIGINAL FORM		
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------
?>	
	<form  name=vbform method="post" action="<?=$HTTP_SERVER_VARS['PHP_SELF']?>" enctype="multipart/form-data">	
	<table border=0 cellpadding=2 cellspacing=1 width=100% bgcolor="#9088B0">
	<tr> <!-- ---------------------------------------------- TR แถวแรกของฟอร์ม-------------------------------------------------------------- -->
			<td>หมวดของบทความ</td>
			<td>
<?  //select หมวดของบทความเพื่อแสดงให้ list  box เพื่อให้ผู้ใช้เลือกว่าจะ Add บทความในหมวดไหน
	$sql1 = "select  articles_group.group_name AS groupname, articles_group.id_group AS idgroup,
	count(articles_each.ar_name) AS numgroup from articles_group LEFT join articles_each on   articles_group.id_group=articles_each.id_group group by articles_group.group_name";	

	$result = mysql_query($sql1);
	print "<select name='group_select' onmousemove=\"stat('listgroup')\">";
	while ($row=mysql_fetch_array($result))
			{
				$id_group=$row['idgroup'];
				$group_name=stripslashes($row['groupname']);			
				$numgroup=$row['numgroup'];	
				print "<option value='$id_group' ";
				if($id_group==$group_select) echo " SELECTED"; //ให้แสดงค่า select อันเก่า
				print ">$group_name [$numgroup] </option> ";				
			}
	print "</select>";	
//ต่อไปแสดงปุ่ม Delete เพื่อให้สามารถลบกลุ่มได้
?>
&nbsp;<!-- <input type="submit" name="submit" value="del group" onmousemove="stat('delgroup')" 
onclick="return confirm('คุณต้องการที่จะลบชื่อกลุ่มนี้ออกจากฐานข้อมูล?')"> -->
			</td>
			<td>บทความเรื่อง </td>
			<td><input type=text size=40 name="name_articles" onmouseover="stat('name')"
					value="<?=$HTTP_POST_VARS['name_articles']?>"><br></td>
	</tr>
	<tr>  <!-- ---------------------------------------------- TR แถวที่สองของฟอร์ม-------------------------------------------------------------- -->
			<td>สร้างหมวดใหม่</td>
			<td><input type=text name="new_group" onmousemove="stat('newgroup')"> &nbsp;
			<input type="submit" name="submit" value="new group" onmousemove="stat('submitnewgroup')" onclick="return confirm('คุณต้องการสร้างหมวดขึ้นมาใหม่?')"></td>
			<td>คีย์เวิร์ดที่ใช้ในการค้นหา</td>
			<td><input type=text size=40 name="keyword_articles" onmouseover="stat('key')"
					value="<?=$HTTP_POST_VARS['keyword_articles']?>"><br></td>
	</tr>
	<tr>  <!-- ---------------------------------------------- TR แถวที่สามของฟอร์ม-------------------------------------------------------------- -->
			<td colspan=4>

           <TABLE cellSpacing=1 cellPadding=4 width="100%" border=0 bordercolor=red>
            
              <SCRIPT language=Javascript  src="vbcode.js"></SCRIPT>
			  <SCRIPT language=Javascript src="vbcode_language.js"></SCRIPT>

			<STYLE>#codebuttons INPUT {
					FONT-SIZE: 11px; FONT-FAMILY: verdana, arial, helvetica
			}
			#codebuttons SELECT {
					FONT-SIZE: 11px; FONT-FAMILY: verdana, arial, helvetica
			}
			.smilieTable {
			BORDER-RIGHT: 2px outset; BORDER-TOP: 2px outset; BORDER-LEFT: 2px outset; BORDER-BOTTOM: 2px outset
			}
			</STYLE>

            <TR id=codebuttons>
			<TD noWrap><FONT face=verdana,arial,helvetica size=1>
			<!-- เริ่มแสดงปุ่มตัวหนา  ตัวเอียง ต่างๆ  -->		  
		
			<INPUT class=bginput onmouseover="stat('b')" title="BOLD (alt+b)" accessKey=b onclick="vbcode(this.form,'B','')" type=button value=" B ">

			<INPUT class=bginput onmouseover="stat('i')" title="ITALIC (alt+i)" accessKey=i onclick="vbcode(this.form,'I','')" type=button value=" I ">

			<INPUT class=bginput onmouseover="stat('u')" title="UNDERLINE (alt+u)" accessKey=u onclick="vbcode(this.form,'U','')" type=button value=" U "> 
  					
			<INPUT class=bginput onmouseover="stat('url')" title="Insert Hyperlink" onclick="namedlink(this.form,'URL')" type=button value=http://>

			<INPUT class=bginput onmouseover="stat('email')" title="Insert Email Address"  type=button value=" @ "> 
						  
			<INPUT class=bginput onmouseover="stat('list')" title="Ordered List" accessKey=l onclick=dolist(this.form) type=button value=List>
			<!-- ปุ่มที่ใช้ในการ upload ไฟล์ -->			
			<input type=file name="userfile"  onmouseover="stat('selectfile')">  <!--  onclick="return confirm('r u ok?')" -->
			<input type="submit" name="submit" value="Upload" onmouseover="stat('uploadfile')">

			<!-- ปุ่มที่ใช้เพิ่มและลดขนาด font -->
			<input type="button" value=' ++font' onClick='document.vbform.content.style.fontSize = 16' onmouseover="stat('ifont')">
			<input type="button" value='- -font' onClick='document.vbform.content.style.fontSize = 14' onmouseover="stat('dfont')">  

			</FONT></TD>
			 </TR>
			 <TR>
			 <TD vAlign=top >

				<TABLE cellSpacing=0 cellPadding=0 border=0>
				<TR><TD>

					<!-- แสดง Code Mode มี 2 Mode -->
				  <FONT face="verdana, arial, helvetica" size=2><B>Code Mode</B></FONT>                    
                  <FONT face=verdana,arial,helvetica size=1><BR>

				  <INPUT onmouseover="stat('norm')" title="Normal Mode: (alt+n)" accessKey=n                   
                  onclick=setmode(this.value) type=radio CHECKED value=0 name=mode> Normal Mode <BR>
                  
				  <INPUT onmouseover="stat('enha')" title="Enhanced Mode: (alt+e)" accessKey=e                   
                  onclick=setmode(this.value) type=radio  value=1 name=mode> Enhanced Mode 
                  				  
				  </FONT>
				</TD>
				<TD>&nbsp;</TD>
				<TD>
				<FONT face=verdana,arial,helvetica size=1>
						<INPUT class=bginput onmouseover="stat('closecurrent')" title="Close Current Tag (alt+c)" style="FONT-WEIGHT: bold; COLOR: red" accessKey=c onclick=closetag(this.form) type=button value=" x "> 
                        ปิด Tag ปัจจุบัน<BR>
						<INPUT class=bginput onmouseover="stat('closeall')" title="Close All Open Tags (alt+x)" style="FONT-WEIGHT: bold; COLOR: red" accessKey=x onclick=closeall(this.form) type=button value=" x "> 
                        ปิด Tag ทั้งหมด 
				</FONT>
				</TD>
				<TD>&nbsp;</TD>
				<TD>
						<textarea class=bginput style="FONT-SIZE: 10pt; background-color:#ffffff;" size=50 name=status cols=70 rows=2 readonly>
                        เลื่อน Mouse Pointer ไปในแต่ละส่วน เพื่อแสดงข้อมูลเพิ่มเติม และตัวอย่างการใช้งาน</textarea><br>					 
				</TD></TR>         
        </TABLE>
		</TD></TR></TABLE>
	</td></tr>
	<tr>  <!-- ---------------------------------------------- TR แถวที่สี่ของฟอร์ม-------------------------------------------------------------- -->
		<td colspan=4 width=100%>
		<textarea name="content" cols="120" rows="15"><? //? ต้องติดกับตัวปิด ของ textarea ตัวแรก
			if (isset($HTTP_POST_VARS['content'])) echo trim(htmlSpecialChars(stripslashes($HTTP_POST_VARS['content'])));
			?></textarea><br>
		</td>
	</tr>
	<tr>  <!-- ---------------------------------------------- TR แถวที่ห้าของฟอร์ม-------------------------------------------------------------- -->
			<td colspan=4>
			<CENTER>
				<input type="submit" name="Preview" value="Preview" onmouseover="stat('preview')">&nbsp;
				<input type="submit" name="submit" value="Add articles" onmouseover="stat('add')">
			</CENTER>
			</td>
	</tr>  <!-- ---------------------------------------------- END ROW-------------------------------------------------------------- -->
	</table>
	</form>
<?
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------
//------------------------------------------                     END ORIGINAL FORM		
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------
		}
?>
	</body>
	</html>