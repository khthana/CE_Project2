<?php

/*เรียกแฟ้มข้อมูล phpConfig.php*/
include("phpConfig.php");

	// เริ่มติดต่อฐานข้อมูล
	mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

	mysql_query("SET NAMES 'tis620'");

	$sql_status = "select * from book where id='$qID'";
	$db_query_status= mysql_db_query ($dbname, $sql_status);
	$result_status = mysql_fetch_array($db_query_status);
	@$status_old = $result_status[status];
	// เลือกฐานข้อมูล
	mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");
	
if ( $FlagType == "question" )
	{
		if ( !isset( $Session["qMarkAssign"][$qID] ) )
			{
			@$sql = "update book  set status = $status_old+$qMark where id='$qID'";
	$db_query = mysql_db_query ($dbname, $sql);
		
				@setcookie ( "Session[qMarkAssign][$qID]", $qMark, time()+3600 );
				@$msg .= "<li>หนังสือเล่มนี้ได้รับ $qMark คะแนน";
				@$msg .= "<li>ขอบคุณครับนักเรียนที่เสียเวลา.................!";
			}
		else
			{
				@$msg .= "<li>รอก่อนนะคับ !!! แล้วค่อยโหวตใหม่";
				@$msg .= "<li>รออีก 1 ชั่วโมงถึงจะให้คะแนนได้อีกครั้งหนึ่ง";
				@$msg .= "<li>Thank you..................!";
			}
	}





	


$button = "<input notab type=\"reset\" value=\"ปิดหน้าต่าง\" onclick=\"javascript:parent.close();\" style=\"font-weight:bold; color:#FFF; background-color:#036; border-style:outset; border-color:#69F; font-family: Tahoma;\">";				

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
