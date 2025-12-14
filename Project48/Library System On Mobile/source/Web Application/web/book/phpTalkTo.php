<?php


$Flag = true;
$FromEmail = trim( $FromEmail );
$ToEmail = trim( $ToEmail );

/* ตรวจสอบการป้อน Email address */
if ( $FromEmail == "" )
	{
		@$msg .= "<li>กรุณาป้อน Email address ผู้ส่ง";
		$button = "<input type=\"button\" value=\"กลับไปแก้ไข\" onclick=\"history.back();\" style=\"font-weight:bold; color:#FFF; background-color:#036; border-style:outset; border-color:#69F; font-family: Tahoma;\">";
		$Flag = false;
	}

if ( $ToEmail == "" )
	{
		@$msg .= "<li>กรุณาป้อน Email address ผู้รับ";
		$button = "<input type=\"button\" value=\"กลับไปแก้ไข\" onclick=\"history.back();\" style=\"font-weight:bold; color:#FFF; background-color:#036; border-style:outset; border-color:#69F; font-family: Tahoma;\">";
		$Flag = false;
	}



if ( $Flag == true )
	{
		@$mFrom = "From: $FromEmail";
		@$mTo = $ToEmail;
		@$mSubject = "$BoardTitle - เข้ามาดูหน่อย";
		@$mBody = "เรียน  $ToEmail\n\n";
		@$mBody .= "กรุณาแวะมาที่ URL : $URL"."phpPickUp.php?id=$id\n\n";
		@$mBody .= "ขอขอบคุณ";
	
		@mail ( $mTo, $mSubject, $mBody, $mFrom ) or print "ไม่สามารถส่ง Email ได้";

		@$msg .= "<li>ระบบจัดส่งไปยัง $ToEmail เรียบร้อยแล้ว";
		@$msg .= "<li>ขอขอบคุณ";
		@$button = "<input notab type=\"reset\" value=\"ปิดหน้าต่าง\" onclick=\"javascript:parent.close();\" style=\"font-weight:bold; color:#FFF; background-color:#036; border-style:outset; border-color:#69F; font-family: Tahoma;\">";
	}

?>
<html>
<head>
<title>:: ระบบห้องสมุดบนมือถือ ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link rel="stylesheet" href="discuss.css" type="text/css">
</head>
<body bgcolor="#052D61" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form>
  <br>
  <table width="90%" border="0" cellspacing="0" cellpadding="2" align="center">
    <tr> 
      <td><span class="Tahoma25"><b><font color="#FFFFFF"></font></b></span></td>
    </tr>
    <tr> 
      <td> 
        <table width="100%" border="1" cellspacing="0" cellpadding="2" align="center" bordercolor="#0B62D9">
          <tr> 
            <td bgcolor="#094AA4" class="Tahoma15"><b><font color="#CCFF00">ระบบแจ้งมาว่า 
              :</font></b></td>
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
