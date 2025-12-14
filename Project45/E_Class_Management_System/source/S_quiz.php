<?php 
	require('./libraries/grab_globals.lib.php');
	include('./connectDB.php');
	session_start(); 
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><!-- InstanceBegin template="/Templates/student.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>การเรียนการสอนผ่านอินเตอร์เน็ท</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link rel="stylesheet" href="style.css" >
</head>
<body leftmargin="0" rightmargin="0" topmargin="0">
<?php 
	 if(session_is_registered("SESSION")){  
			include("./config.inc.php");
		 	$sql = "select member.EMAIL FROM member,courses ";
			$sql .= "where courses.ID = $CID AND member.ID = courses.TID ";
			$query = mysql_query($sql,$con);
			$row = mysql_fetch_array($query);
?>
<table width="780" border="0" cellspacing="0" cellpadding="0"  align="center">
  <tr> 
    <td width="100%" align="right"><img src="./Picture/logo.jpg" width="100%" height="81"></td>
  </tr>
  <tr> 
    <td><table  width="100%" border="0" cellpadding="0" cellspacing="1"   bgcolor="#000000"  class="text">
        <tr bgcolor="#336699" class="text" valign="top"> 
          <td width = "14%" align="center"><strong><a href="index.php" class="nav">Home</a></strong></td>
          <td width = "14%" align="center"><strong><a href="Course1.php" target="_parent" class="nav">Course</a></strong></td>
          <td width = "13%" align="center"><strong><a href="Headline.php?status=all" target="_parent" class="nav">News</a></strong></td>
          <td width="14%" align="center"><strong><a href="FrmSearch.php" target="_parent" class="nav">Search</a></strong></td>
          <td width="16%" align="center"><strong><a href="MeansUse.php" target="_blank" class="nav">FAQ</a></strong></td>
          <td width = "12%" align="center"><strong><a href="about.php" class="nav">About</a></strong></td>
          <td width = "17%" align="center"><strong><a href="index.php?LogOut=yes" class="nav">Logout</a></strong></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="100%" width="780" valign="top">
	
	<table border="0" cellpadding="0" cellspacing="8" height="100%" width="100%" class="text">
	<tr>
	<td width="14%" valign="top" >
	   <table border="0" cellpadding="5" cellspacing="0" class="text">
	   <tr><td bgcolor="#0099FF" width="136" valign="top">
	   		<table border="0" cellpadding="0" cellspacing="0" height="100" class="text">
	   		<tr>
			<td width="129" bgcolor="#99CCCC" nowrap="nowrap" class="text">
	   		<?php  echo"<a href='FrmStu.php'>&nbsp;หน้าหลัก</a>"; ?>

	   		<hr>
	   		<b>&nbsp;สื่อการสอน</b><br>
	   		<?php echo"<a href='EnterCourse.php?CID=$CID'>&nbsp;บทเรียน</a><br>";
	   		      //echo"<a href='externallink.php?'>&nbsp;ลิงก์</a>"; 
			?>
	   		<hr>
	   		<b>&nbsp;ห้องเรียนจำลอง</b><br>
	   		<?php echo "<a href=\"JAVASCRIPT:%20void%20window.open('calendar.php','e','menubar=no,toolbar=no,location=no,scrollbars=no,status=no,width=600,height=400,top=100,left=100');\">&nbsp;ปฏิทิน</a><br>";
			 	   echo "<a href='Webboard.php?CID=$CID' target=_parent>&nbsp;กระดานสนทนา</a><br>";
   	         	  echo  "<a href=\"mailto: $row[0] \" >&nbsp;เมล์หาอาจารย์</a>" ;
			?>
	   		<hr>
	   		<b>&nbsp;ประเมินผล</b><br>
	   		<?php echo "<a href='S_questionlib.php?CID=$CID'>&nbsp;คำถามทดสอบความเข้าใจ</a><br>";
	   			  echo "<a href='S_homework.php?CID=$CID'> &nbsp;การบ้าน</a><br>"; 
				  echo "<a href='questionaire.php?CID=$CID'>&nbsp;ประเมินผลการสอน</a>";
	   		?>	   
	   		<hr>
	   		<b>&nbsp;ข้อมูล</b><br>
	   		<?php echo"<a href='FrmStu_Update.php?id=$SESSION[id]&CID=$CID '>&nbsp;ข้อมูลส่วนตัว</a><br>";?>	   
	   		<hr>
	   		<?php echo"<a href='index.php?LogOut=yes'>&nbsp; ออกจากระบบ</a>"; ?>
			</td></tr></table>
	</td></tr></table>
</td>
          <td  valign="top"><!-- InstanceBeginEditable name="data" -->
		  <?php
//--------------------------------------------------------------------- Function Space --------------------------------------------------------//

		  function random($NQW,$NQH)//$NFW => Number Of  Question,You  Want
		  {																//$NQH => Number Of Question,In Your Hand
		  		global $temp;
		  		$random[$NQW];
				for($i=0;$i<$NQW;$i++) //initialize  all	 $random =0
				$random[$i]=0;
						
				for($j=0;$j<$NQW;$j++)//Loop random equal length of array
				{
					$temp=rand(1,$NQH);
						
					for($k=0;$k<$NQW;$k++)//Loop check  for if it same number
					{
						if(($temp==$random[$k])&&($random[$k]!=0))
						{
							$temp=rand(1,$NQH);
							$k=-1;
						}
						elseif(($temp!=$random[$k])&&($random[$k]==0))
						{										
							$random[$k]=$temp;
							$k=$NQW;
						}
					}
				}
				return $random;
		  }
	
	function Show_quiz($CID,$Chapter){
		 					connect_db();
							$sql="select count(*) from questionTF".$CID;
							$result=mysql_query($sql);											
							$QuestionTF=mysql_fetch_row($result);
							
							$sql="select count(*) from questionCH".$CID;
							$result=mysql_query($sql);											
							$QuestionCH=mysql_fetch_row($result);
							
							$sql="select TF from chapters where Chapter='$Chapter'";
							$result=mysql_query($sql);											
							$TF=mysql_fetch_row($result);
							
							$sql="select CH from chapters where Chapter='$Chapter'";
							$result=mysql_query($sql);											
							$CH=mysql_fetch_row($result);
													
							$sql="select Pass from chapters where Chapter='$Chapter'";
							$result=mysql_query($sql);											
							$Pass=mysql_fetch_row($result);
							mysql_close();
								
							//For True Fault Question
							$TF_random=random($TF[0],$QuestionTF[0]);
							for($i=0;$i<$TF[0];$i++)
							{
										connect_db();
										$sql="select Question,Answer,Correct_answer from questionTF".$CID." where ID=$TF_random[$i]";
										$result=mysql_query($sql);
										while($row=mysql_fetch_row($result))
										{
											echo ($i+1).".".$row[0]."<br>";
											$answer=explode("\n",$row[1]);
											for($j=0;$j<count($answer);$j++)
													echo "<input type='radio' name='TF_Answer".($i+1)."' value=".$answer[$j].">". $answer[$j]."<br>";														
											
											echo "<input type='hidden' name='TF_correct[ ]' value=$row[2]><br><br>";//Keep Correct Answer to check it
										}
										echo "<input type='hidden' name='Pass' value=Pass[0]>";
										mysql_close();
							}
							
		  					//For Choise question					
							$CH_random=random($CH[0],$QuestionCH[0]);
							for($i=0;$i<$CH[0];$i++)
							{
										connect_db();
										$sql="select Question,Answer,Correct_answer from questionCH".$CID." where ID=$CH_random[$i]";
										$result=mysql_query($sql);
										while($row=mysql_fetch_row($result))
										{
											echo ($i+1).".".$row[0]."<br>";
											$answer=explode("\n",$row[1]);
											for($j=0;$j<count($answer)-1;$j++)
													echo "<input type='radio' name='CH_Answer".($i+1)."' value=".($j+1).">". $answer[$j]."<br>";														
											
											echo "<input type='hidden' name='CH_correct[ ]' value=$row[2]><br><br>";//Keep Correct Answer to check it
										}
										echo "<input type='hidden' name='Pass' value=Pass[0]>";
										mysql_close();
							}
			}

//--------------------------------------------------------------------- work space --------------------------------------------------------//
			?>
			<form action="check_quiz.php" method="get" name="check">
			<?php
			Show_quiz($CID,$Chapter);
			?>
			<table align="center" border="0" cellpadding="0" cellspacing="0" class="text" >
			<tr>
			<td align="center">
			<input name="ok" type="submit" value="ตกลง" >
			<?php
			
			echo"<input name='CID'  type='hidden' value=$CID>";
			echo"<input name='Chapter'  type='hidden' value='$Chapter'>";
			?>
			</td>
			</tr>
			</table>
			</form>
				<!-- InstanceEndEditable --> 
          </td>
</tr>
</table>
	</td>
	<td>
	</td>
  </tr>
 </table>
 <?php
	 }
	 else
	 {
	 	//include("ChkErr.inc.php");
		//ShowErr("กรุณา LOGIN ก่อนเข้าใช้งาน");
	 print "<center><font color='#FF0000'><b>กรุณา LOGIN ก่อนเข้าใช้งานด้วยครับ</b></font></center><br>
				<center><a href='index.php'>LOGIN </a></center>";
	}
?>
</body>
<!-- InstanceEnd --></html>
