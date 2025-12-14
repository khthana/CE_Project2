<?php
	require('./libraries/grab_globals.lib.php'); 
	session_start(); 
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><!-- InstanceBegin template="/Templates/logo.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>การเรียนการสอนผ่านอินเตอร์เน็ท</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link rel="stylesheet" href="style.css" >
</head>

<body leftmargin="0" topmargin="0" >
<table width="780" border="0" cellspacing="0" cellpadding="0"  align="center">
  <tr>
    <td width="100%" align="right" valign="top"><img src="./Picture/logo.jpg" width="100%" height="85" align="baseline"></td>
  </tr>
  <tr> 
    <td  valign="top"><table  width="100%" border="0" cellpadding="0" cellspacing="1"   bgcolor="#000000"  class="text">
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
  <tr valign="top">
    <td width="100%"  valign="top" height="100%"><!-- InstanceBeginEditable name="data" -->
<script language="JavaScript" type="text/JavaScript">
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
</script>

    <table bgcolor="#FFCCFF" border="0" cellpadding="0" cellspacing="0" class="text" width="100%" height="100%">
    <tr>
	<td width="13%" valign="top" >
	   <table border="0" cellpadding="5" cellspacing="0" height="100%">
	   <tr><td   bgcolor="#0099FF" width="120" valign="top">
	   		<table border="0" cellpadding="0" cellspacing="0" height="100" class="text">
	   		<tr>
			<td  bgcolor="#99CCCC" nowrap="nowrap" class="text" valign="top">
	   		<?php echo"<a href='show_courses.php?TID=$TID'>&nbsp;หน้าหลัก</a>";?>

	   		<hr>
	   		<b>&nbsp;สื่อการสอน</b><br>
	   		<?php echo"<a href='course_content.php?ID=$ID&TID=$TID'>&nbsp;บทเรียน</a><br>";
	   		       echo"<a href='externallink.php3?'>&nbsp;ลิงก์</a>"; 
			?>
	   		<hr>
	   		<b>&nbsp;ห้องเรียนจำลอง</b><br>
	   		<?php echo"<a href='course_detail.php?ID=$ID&TID=$TID'>	&nbsp;รายละเอียดวิชา</a><br>";
				   echo"<a href=\"JAVASCRIPT:%20void%20window.open('calendar.php','e','menubar=no,toolbar=no,location=no,scrollbars=no,status=no,width=600,height=400,top=100,left=100');\">&nbsp;ปฏิทิน</a><br>";
	   		 	   echo"<a href='news.php'>&nbsp;ประกาศ</a><br>"; 
	   		       echo"<a href='webboard.php?ID=$ID'>&nbsp;กระดานสนทนา</a><br>";
	   		       echo "<a href=# onclick=open('chatroom.php3?HTTP_REFERER=1','','toolbar=no,scrollbar=yes,width=700,height=500')>&nbsp;ห้องสนทนา</a>";
			?>
	   		<hr>
	   		<b>&nbsp;ประเมินผล</b><br>
	   		<?php echo"<a href='questionlib.php?ID=$ID&TID=$TID'>&nbsp;คลังข้อสอบ</a><br>";
	   			   echo"<a href='quiz.php?ID=$ID&TID=$TID'>&nbsp;คำถามทดสอบความเข้าใจ</a><br>";
	   			   echo"<a href='homework.php?'> &nbsp;การบ้าน</a><br>"; 
	   			   //echo" <a href='test.php?'>&nbsp;ข้อสอบวัดผล</a>";
			?>	   
	   		<hr>
	   		<b>&nbsp;ข้อมูล</b><br>
	   		<?php echo"<a href='profile.php?'>&nbsp;ข้อมูลส่วนตัว</a><br>";
	   			   echo"<a href='course_detail.php?ID=$ID&TID=$TID'>&nbsp;รายละเอียดวิชา</a><br>";
	   		       echo"<a href='stdmgr.php?'>&nbsp;จัดการข้อมูลนักเรียน</a><br>";
	   		       echo"<a href='filemgr.php?'>&nbsp;จัดการแฟ้มข้อมูล</a><br>";
			?>	   
	   		<hr>
	   		<?php echo"<a href='index.php?LogOut=yes'>&nbsp; ออกจากระบบ</a>"; ?>
			</td></tr></table>
	</td></tr></table>
</td>
    <td width="20%" height="100%" align="center" valign="top">
    <form action="make_question.php" method="post" name="question">
	<input  name="ID" type="hidden" value="<?php echo $ID ?>">
	<input name='Subject'  type='hidden'value="<?php echo $Subject ?>">
        <b>รูปแบบของคำถาม</b><br>
        <select name="type" size="2">
            <option selected>แบบหลายตัวเลือก</option>
            </select>
		<br>
		<input name="OK" type="submit" value="OK">
      </form>
      </td>
      <td  width="100%" height="100%" valign="top">
	  <?php
	  	switch($type)
		{
			case "แบบหลายตัวเลือก" : 
															//echo "M";break;?>
															<Table border="0" cellpadding="3" cellspacing="0" class="text">
															<tr>
															<td>
																<a href="make_question.php?type1=1&ID=<?php echo $ID ?>&Subject=<?php echo $Subjecton ?>"onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','TF.gif',1)"><img src="TF_1.gif" name="Image1" width="100" height="100" border="0"></a> 
															</td>
															<td>
																<a href="make_question.php?type1=2&ID=<?php echo $ID ?>&Subject=<?php echo $Subject ?>"onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','CH.gif',1)"><img src="CH_1.gif" name="Image2" width="100" height="100" border="0"></a> 
															</td>
															<td>
																
															</td>
															</tr>
															</Table>
															<?php
															break;
			default :
															?>
															<Table border="0" cellpadding="3" cellspacing="0" class="text">
															<tr>
															<td>
																<a href="make_question.php?type1=1&ID=<?php echo $ID ?>&Subject=<?php echo $Subjecton ?>"onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','TF.gif',1)"><img src="TF_1.gif" name="Image1" width="100" height="100" border="0"></a> 
															</td>
															<td>
																<a href="make_question.php?type1=2&ID=<?php echo $ID ?>&Subject=<?php echo $Subject ?>"onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','CH.gif',1)"><img src="CH_1.gif" name="Image2" width="100" height="100" border="0"></a> 
															</td>
															<td>
																
															</td>
															</tr>
															</Table>
															<?php	break;
			}
			switch($type1)
			{
				case 1: ?>	
						<form action="keep_question" method="post" name="question_tf">
						<input  name="TF" type="hidden" value="<?php echo $TF=1 ?>">
						<input  name="ID" type="hidden" value="<?php echo $ID ?>">
						<input name='TID'  type='hidden'value="<?php echo $SESSION[id] ?>">
						<table border="0" cellpadding="0" cellspacing="0" class="text">
						 <?php
									echo "<tr><td>คำถาม<input name='q".$i ."' type='text' size=30 maxlength=50></td></tr>";
									echo "<tr><td><input name='ch".$i ."'type='radio' value='True'>True</td></tr>";
									echo "<tr><td><input name='ch".$i ."'type='radio' value='False'>False</td></tr>";
							?>
								<tr><td align="center">
								<input name="TF_OK" type="submit" value="ADD">
								</td></tr>
								</table>
								</form>
				 				<?php
								break;
				case 2:  
								?>
								<table border="0" cellpadding="0" cellspacing="0" class="text">
								<form action="make_question.php" method="post" name="keep_question">
								<input  name="ID" type="hidden" value="<?php echo $ID ?>">
								<input name='Subject'  type='hidden'value="<?php echo $Subject ?>">
								<tr>
								<td align="center">
								<!--b>จำนวนข้อ </b--><input name="CH"  type="hidden" size="5" maxlength="5" value="1">
								<b>จำนวนตัวเลือก </b><input name="CH_N" type="text" size="5" maxlength="5">
																	  <input name="OK" type="submit" value="OK">
								</td>
								</tr>
								</form>
								</table>
				 				<?php
								break;
					default: break;
				}
			if($CH) // Create CH Question Form
				{
				?>	
				<form action="keep_question" method="post" name="question_ch">
				<input name="CH" type="hidden" value="<?php echo $CH; ?>">
				<input name="CH_N" type="hidden" value="<?php echo $CH_N;?>">
				<input  name="ID" type="hidden" value="<?php echo $ID ?>">
				<input name='TID'  type='hidden'value="<?php echo $SESSION[id] ?>">
				<!--input name='ID'  type='hidden'value=$ID-->
				<table border="0" cellpadding="0" cellspacing="0" class="text">
				<?php
					for($i=1;$i<=$CH;$i++)
						{
							echo "<tr><td>คำถาม<input name='q".$i."' type='text' size=40 maxlength=60></td></tr>";
							for($j=1;$j<=$CH_N;$j++)
							{
							echo "<tr><td><input name='ch".$i ."'type='radio' value=$j>".$j."&nbsp;<input name='ans".$i.$j."' type='text' size=30 maxlength=60></td></tr>";
							}
						}
				?>
				<tr><td align="center">
				<input name="TF_OK" type="submit" value="ADD">
				</td></tr>
				</table>
				</form>
				<?php		
				}
	  ?>
	  </td>
	  </tr>
      </table>
	<!-- InstanceEndEditable --></td>
  </tr>
 </table>
</body>
<!-- InstanceEnd --></html>
