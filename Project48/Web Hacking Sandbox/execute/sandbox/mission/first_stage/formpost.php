<?php
 $DBName="allmission";
$link=@mysql_pconnect("localhost","player","player");
@mysql_select_db($DBName,$link);


$ciper=$HTTP_COOKIE_VARS['passkey'];

//decyption
$len_ciper=(strlen($ciper)/2);

$plantext=decypt($ciper,$len_ciper);

for($i=0;$i<=($len_ciper);$i++){
 $planstr{$i}=chr($plantext{$i});
}

$planstring = implode("", $planstr);
$plan=trim($planstring);

$row=mysql_query("SELECT * FROM profile WHERE email='$plan' ");
$rownum=mysql_num_rows($row);

if($rownum ==0){
header("Location:../first_stage/home.php");
}

//decyption function
function decypt($ciper,$len_ciper){
for($i=0;$i<$len_ciper;$i++){
 $buffer1=$ciper{$i+$i};
$buffer2=$ciper{$i+$i+1};
$todec= hexdec($buffer1);

$first_ascii=$todec;
 $encypt= $first_ascii ^ 10;
$hex1=dechex($encypt);
$todec2= hexdec($buffer2);
 $second_ascii=$todec2;
 $encypt2= $second_ascii ^ 10;
$hex2=dechex($encypt2);

$concat="$hex1"."$hex2";
$plantext{$i}=hexdec($concat);
}
return $plantext;
}
?>
<html>
<head>
<title>Post</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="../smf.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style0 {
	                   font-family: "MS Sans Serif";
					   font-size: 14px;
					   color:#333333;
        }
-->
</style>
</head>
<body background="pic/line.gif" link="#000000" vlink="#330000"  bgproperties="fixed" >

<table width="95%" height="95%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr bgcolor="#657889"> 
    <td height="132" colspan="3" valign="top"><div align="left"><img src="pic/name01.jpg" width="741" height="141"><img src="pic/name02.jpg" width="128" height="141"></div></td>
  </tr>
  <tr align="left"> 
    <td height="20" colspan="3"> <div align="left"> 
        <table width="100%" border="0">
          <tr bgcolor="#657889"> 
            <td class="style0"><div align="center"><strong><a href="home.php">HOME</a></strong></div></td>
            <td class="style0"><div align="center"><strong><a href="product_.php">Product</a></strong></div></td>
            <td class="style0"><div align="center"><strong><a href="download.php">Download</a></strong></div></td>
            <td class="style0"><div align="center"><strong><a href="member.php">Member</a></strong></div></td>
            <td class="style0"><div align="center"><strong><a href="webboard.php">Webboard</a></strong></div></td>
            <td class="style0"><div align="center"><strong><a href="logout.php">Logout</a></strong></div></td>
          </tr>
        </table>
      </div></td>
  </tr>
  <tr> 
    <td width="3%" valign="bottom"> <div align="left"> 
        <div align="left"> </div>
      </div></td>
    <td width="93%" valign="top"> 
            <div align="center">
        <table width="100%" height=154 border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#333333">
          <TR> 
            <TD width="100%" bgcolor="#657889" > <div align="center"><a href="webboard.php"><font color="#FFFFFF">Webboard</font></a></div></TD>
          </TR>
          <tr> 
            <TD align=left width="100%" height="58" > <table border="0" cellspacing="0" width="100%" height="52">
                <tr bgcolor="#F8C4AC"> </tr>
                <tr> 
                  <TD >&nbsp; </TD>
                  <TD align=middle height=126 style="color: #000000; font-family: MS Sans Serif; font-size: 10pt" width="425"> 
                    <Form name=myForm action="question.php" Method="post">
                      <table width="100%" border="0" cellspacing="0">
                        <tr> 
                          <td colspan="2" bgcolor="#657889"  class="style0"><font color="#FF0000">
                            <marquee>
                            </marquee>
                            </font></td>
                        </tr>
                        <tr> 
                          <td width="31%" class="style0"> <div align="right"><font  style="font-size: 11pt"><b> 
                              หัวข้อ* :: </b></font></div></td>
                          <td width="69%" > <input type="text" name="q_topic" size="34"  > 
                          </td>
                        </tr>
                        <tr> 
                          <td  valign="top" width="31%" class="style0"> <div align="right"><font  style="font-size: 11pt"> 
                              <b> รายละเอียด * :: </b></font></div></td>
                          <td width="69%"  > <TEXTaREa  cols=35 name="q_message" rows=5></TEXTaREa> 
                          </td>
                        </tr>
                        <tr> 
                          <td  valign="top" width="31%" class="style0"> <div align="right"> <b><font  style="font-size: 11pt">ชื่อ 
                              * :: </font></b></div></td>
                          <td width="69%" > <input type="text" name="q_name" size="34" > 
                          </td>
                        </tr>
                        <tr> 
                          <td width="31%" class="style0"> <div align="right"><font  style="font-size: 11pt"><b> 
                              E-mail :: </b></font></div></td>
                          <td width="69%" > <input type="text" name="q_email" size="34" > 
                          </td>
                        </tr>
                        <tr> 
                          <td width="31%" class="style0"> <div align="right"><font  style="font-size: 11pt"><b> 
                              MSN :: </b></font></div></td>
                          <td width="69%" > <input type="text" name="q_icq" size="34" > 
                          </td>
                        </tr>
                        <tr> 
                          <td width="31%">&nbsp; </td>
                          <td width="69%" > <input name="submit" type="submit"  class="style0"value=" ตั้งกระทู้" size="8"> 
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; 
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                            <FONT face="MS Sans Serif, Microsoft Sans Serif" size=-7> 
                            <input name="reset" type="reset"  value="ยกเลิก" size="8">
                            </font></td>
                        </tr>
                        <tr> 
                          <td colspan="2" class="style0"><marquee>
                            </marquee></td>
                        </tr>
                      </table>
                    </form></TD>
                  <TD >&nbsp; </TD>
                </tr>
              </table></TD>
          </tr>
          <tr> 
            <TD width="100%" height="16" align=center bgcolor="#657889"> <div align="center"> 
                <font color="#FFFFFF" face="MS Sans Serif, Tahoma, sans-serif" style="font-size: 11pt">. 
                All Rights Reseved. 2002-2005</font></div></TD>
          </tr>
        </table>
      </div></td>
    <td width="4%" valign="top">&nbsp;</td>
  </tr>
  <tr bgcolor="#657889"> 
    <td height="20" colspan="3">&nbsp;</td>
  </tr>
</table>
</body>
</html>

