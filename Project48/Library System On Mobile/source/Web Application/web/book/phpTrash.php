<?php
include( "inc/phpConfig.php" );
include( "inc/phpFunctionDB.php" );
include( "inc/phpFunction.php" );

Conn2DB();
$Flag = true;
$LoginName = trim( $LoginName );
$Password = trim( $Password );

/* ตรวจสอบการป้อน Login Name */
if ( $LoginName == "" )
	{
		$msg .= "<li>กรุณาป้อน Login Name";
		$button = "<input type=\"button\" value=\"กลับไปแก้ไข\" onclick=\"history.back();\" style=\"font-weight:bold; color:#FFF; background-color:#036; border-style:outset; border-color:#69F; font-family: Tahoma;\">";
		$Flag = false;
	}

/* ตรวจสอบการป้อน Password */
if ( $Password == "" )
	{
		$msg .= "<li>กรุณาป้อน Password";
		$button = "<input type=\"button\" value=\"กลับไปแก้ไข\" onclick=\"history.back();\" style=\"font-weight:bold; color:#FFF; background-color:#036; border-style:outset; border-color:#69F; font-family: Tahoma;\">";
		$Flag = false;
	}

if ( $Flag == true )
	{
		if ( CheckUserSystemLogin( $LoginName, $Password, 1 ) )
			{
				if ( $FlagType == "Question" )
					{
						$strSQL = "SELECT aFile, aImage ";
						$strSQL .= "FROM tbl_answer ";
						$strSQL .= "WHERE qID=$qID ";

						$result = mysql_query( $strSQL );
						while ( $rs = mysql_fetch_array( $result ) )
							{
								$aFile = $rs[aFile];
								$aImage = $rs[aImage];
								if ( $aFile != "" )
									unlink( $PathUploadFiles . $aFile );
									
								if ( $aImage != "" )
									unlink( $PathUploadImages . $aImage );
							}

						DeleteQuestion( $qID );
						DeleteAnswer( $qID );

						if ( $qFile != "" )
							unlink( $PathUploadFiles . $qFile );
							
						if ( $qImage != "" )
							unlink( $PathUploadImages . $qImage );

						$msg .= "<li>ระบบทำการลบเรียบร้อยแล้ว";
						$button = "<input notab type=\"reset\" value=\"ปิดหน้าต่าง\" onclick=\"javascript:parent.close();\" style=\"font-weight:bold; color:#FFF; background-color:#036; border-style:outset; border-color:#69F; font-family: Tahoma;\">";				
					}

				if ( $FlagType == "Answer" )
					{
						DeleteAnswerSingle( $aID, $aDateIn );
						if ( $aFile != "" )
							unlink( $PathUploadFiles . $aFile );
							
						if ( $aImage != "" )
							unlink( $PathUploadImages . $aImage );

						$msg .= "<li>ระบบทำการลบเรียบร้อยแล้ว";
						$button = "<input notab type=\"reset\" value=\"ปิดหน้าต่าง\" onclick=\"javascript:parent.close();\" style=\"font-weight:bold; color:#FFF; background-color:#036; border-style:outset; border-color:#69F; font-family: Tahoma;\">";				
					}
			}
		else
			$msg .= "<li>อย่ามามั่วนิ่ม รหัสผ่านไม่ถูกต้อง";
	}

CloseDB();
?>
<html>
<head>
<title>:: discuss-board ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link rel="stylesheet" href="discuss.css" type="text/css">
</head>
<body bgcolor="#052D61" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form>
  <br>
  <table width="90%" border="0" cellspacing="0" cellpadding="2" align="center">
    <tr> 
      <td><span class="Tahoma25"><b><font color="#FFFFFF">:: discuss-board ::</font></b></span></td>
    </tr>
    <tr> 
      <td> 
        <table width="100%" border="1" cellspacing="0" cellpadding="2" align="center" bordercolor="#0B62D9">
          <tr> 
            <td bgcolor="#094AA4" class="Tahoma15"><b><font color="#CCFF00">ระบบแจ้งมาว่า :</font></b></td>
          </tr>
          <tr> 
            <td> 
              <table width="90%" border="0" cellspacing="0" cellpadding="2" align="center">
                <tr> 
                  <td class="Tahoma13"><ul><font color="#FFFFFF"><?php echo $msg; ?></font></ul></td>
                </tr>
              </table>
            </td>
          </tr>
          <tr> 
            <td bgcolor="#094AA4" class="Tahoma11" align="right"><?php echo $button; ?></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <br>
</form>
</body>
</html>
