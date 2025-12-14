<?php
include( "inc/phpConfig.php" );
include( "inc/phpFunctionDB.php" );
include( "inc/phpFunction.php" );

Conn2DB();

if ( $Flag == "Question" )
	{
		if ( ! isset( $Session["qMark"][$qID] ) )
			{
				Update_qVote( $qID );
				setcookie ( "Session[qMark][$qID]", $qID, time()+3600 );
				$msg .= "<li>คำถามนี้ ได้รับการโหวต 1 คะแนน";
				$msg .= "<li>ขอขอบคุณ";
			}
		else
			{
				$msg .= "<li>ระบบของสงวนสิทธิ์ ดังกล่าว";
				$msg .= "<li>รออีก 1 ชั่วโมงถึงจะโหวตใหม่ได้อีกครั้งหนึ่ง";
				$msg .= "<li>ขอขอบคุณ";
			}
	}

if ( $Flag == "Answer" )
	{
		if ( ! isset( $Session["aMark"][$aID] ) )
			{
				Update_aVote( $aID );
				setcookie ( "Session[aMark][$aID]", $aID, time()+3600 );
				$msg .= "<li>คำตอบนี้ ได้รับการโหวต 1 คะแนน";
				$msg .= "<li>ขอขอบคุณ";
			}
		else
			{
				$msg .= "<li>ระบบของสงวนสิทธิ์ ดังกล่าว";
				$msg .= "<li>รออีก 1 ชั่วโมงถึงจะโหวตใหม่ได้อีกครั้งหนึ่ง";
				$msg .= "<li>ขอขอบคุณ";
			}
	}

CloseDB();

$button = "<input notab type=\"reset\" value=\"ปิดหน้าต่าง\" onclick=\"javascript:parent.close();\" style=\"font-weight:bold; color:#FFF; background-color:#036; border-style:outset; border-color:#69F; font-family: Tahoma;\">";
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
