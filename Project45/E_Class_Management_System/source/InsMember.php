<html>
<head>
<title>Insert data to Student</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>
<?php
	require('./libraries/grab_globals.lib.php');
	include("./config.inc.php");
	/*
	include("service/EmailValidate.php");
	$email = 	CheckEmail($mail);
	if($email == false) {
		include("ChkErr.inc.php");
		ShowErr("Plase change email because incorrect email" ) ;
	}*/
	
	$user = trim($user);
	if(ChkUser($user) == true) {
		include("./ChkErr.inc.php");
		ShowErr("Plase Change Username because this username used." ) ;
		//$email = 0;
		exit;
	}
	else {
		require("./UpPicture.php");
		
		$adds =  $addr." ".$city." ".$state." ".$zip ;
		$birthday = $year."-".$date."-".$month ;
	
		while (list($key, $value) = each($HTTP_POST_VARS)) {
				$$key = $value;
		}
			
		while (list($key, $value) = each($HTTP_GET_VARS)) {
			$$key = '';
		}
//	$pw  =  sha1( $pw);
		 $pw = GenPwd( );
		 $com = "^.+@.+\..+$";
		 if(ereg($com,$mail)) {
			 include("./mail.php");
			$sender ="learnig@ce.kmitl.ac.th";
			$subject = "รหัสผ่านของคุณ";
			$message = "username : $user\r\n<br>";
			$message .= "password : $pw";
			$email = sendmail($sender,$mail,$subject,$message) ;
			if($email == false) {
				include("./ChkErr.inc.php");
				ShowErr("Plase change email because incorrect email" ) ;
				exit;
			}
		} else {
				include("./ChkErr.inc.php");
				ShowErr("Plase change email because Syntax Error " ) ;
				exit;
		}
		//echo $email;
	if($email == true) 	{
		if( $status == "student")
		 { 
				$sql =  "insert into member(STATUS,FULLNAME,LASTNAME,SEX,BIRTHDAY,EDUCATE,PICTURE,ICQ,ADDRESS,EMAIL,PHONE,USERNAME,PASSWORD,QUESTION,ANSWER) values('$status','$fname','$lname','$sex','$birthday','$edu','$picture','$icq','$adds','$mail','$tel','$user','$pw','$ask','$ans' )";
	
		}
		else  if($status == "teacher")
		{
				$sql =  "insert into member(STATUS,FULLNAME,LASTNAME,SEX,BIRTHDAY,EDUCATE,BRANCH,PICTURE,ICQ,TEACHING,TRAINING,WORKING,WORKSHOP,ADDRESS,EMAIL,PHONE,USERNAME,PASSWORD,QUESTION,ANSWER,LEVEL) values('$status','$fname','$lname','$sex','$birthday','$edu','$branch','$picture','$icq','$teach','$train','$work','$workshop','$adds','$mail','$tel','$user','$pw','$ask','$ans' ,'0')";
		}
		$rs = mysql_query($sql,$con);
	
		if(!$rs)
		{
		?>
		<!--
			  <table width="60%" border="1" align="center" cellpadding="0" cellspacing="0">
				<tr> 
				  <td bgcolor="#33AAFF">&nbsp;</td>
				</tr>
				<tr> 
				  <td bgcolor="#99AAFF" class="header"><div align="center"><strong>username( 
					  <?// echo $user; ?> ) ได้มีคนใช้งานแล้ว</strong></div></td>
				</tr>
				<tr> 
				  <td bgcolor="#33AAFF"><div align="center"> 
					  <input name="back2" type="submit" id="back2" onClick="history.back()" value="กลับ">
					  &nbsp;&nbsp;
					  <input name="close2" type="button" id="close2" value="ปิด" onClick="window.close()">
					</div></td>
				</tr>
			  </table>
	-->
		<?php
			
			die("ไม่สามารถ insert ข้อมูลได้");
			//mysql_close($con);	
			Closed();
		}
		else {  
		?>
		<form name="form1" method="post" action="" onSubmit="window.close()">
			<table width="60%" border="1" align="center" cellpadding="0" cellspacing="0">
				<tr> 
				  <td bgcolor="#33AAFF">&nbsp;</td>
				</tr>
				<tr> 
				  <td bgcolor="#99AAFF"   class="header"><div align="center"><strong>คุณได้ลงทะเบียนเสร็จเรียบร้อยแล้ว</strong></div></td>
				</tr>
				<tr> 
				  <td bgcolor="#33AAFF" ><div align="center"><input type="submit" name="Submit" value="ตกลง"></div></td>
				</tr>
			  </table>
			</form>
		<?php
			//mysql_close($con);
			Closed();
			}	
		}
	}
	?>

</body>
</html>
