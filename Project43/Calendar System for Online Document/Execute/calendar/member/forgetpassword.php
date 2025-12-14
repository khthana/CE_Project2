<?
$msg='';
$username=trim($username);
$email=trim($email);
$host="localhost";
$user='magazine';
$pass='magazine';
$db='magazine';

if($lastpage=='forgot')
{
	$link=mysql_connect($host,$user,$pass) or die("ไม่สามารถติดต่อฐานข้อมูลได้");

	$sql="select count(*) from member where mem_username='$username'";
$result=mysql_db_query($db,$sql);
$data=mysql_fetch_array($result);

if($data[0]==0){$msg='ไม่พบชื่อผู้ใช้ในฐานข้อมูล ';}
else
{	$sql1="select count(*),max(mem_password),max(mem_fname),max(mem_lname),max(mem_id)  from member where mem_username='$username' &&mem_email='$email'";
	$result1=mysql_db_query($db,$sql1);
	$data1=mysql_fetch_array($result1);
	if($data1[0]==0){$msg='ผู้ใช้ไม่ตรงกับชื่ออี-เมล์ ';}
	else
	{$subject="รหัสผ่านของคุณจากระบบปฏิทินนัดหมาย";
	$message="รหัสผ่านของคุณ $data1[2] $data1[3]  \n\n";
	$message.="ชื่อผู้ใช้	:	$username \n";
	$message.="รหัสผ่าน	:	$data1[1] \n\n";
	$message.="---------------------------------------------------\n\n";
	$message.="ระบบปฏิทินนัดหมายใน http://document.ce.kmitl.ac.th\n";
	$header="From : magazine@olala05.ce.kmitl.ac.th\n";
mail($email,$subject,$message,$header);
session_start();
session_register("userid");
$userid=$data1[4];
header("Location:./showsendmail.php");
}
}
mysql_close($link);
}
?>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<!-- saved from url=(0062)http://olala05.ce.kmitl.ac.th/magazines/testphp/tempwhite.html -->

<HTML><HEAD><TITLE>Calendar</TITLE>

<style type="text/css">



<!--



body {  margin: 0px  0px; padding: 0px  0px}



a:link { color: #ccffcc; text-decoration: none}



a:visited { color: #CCFFCC; text-decoration: none}



a:active { color: #CCFFCC; text-decoration: underline}



a:hover { color: #CCFFCC; text-decoration: underline}



-->



</style>

<META http-equiv=Content-Type content="text/html; charset=Windows-874">

<META content="MSHTML 5.50.4134.600" name=GENERATOR></HEAD>

<BODY bgColor=#ffffff 

onload="MM_preloadImages('../backup/carblue.gif','../backup/sendpink.gif','../backup/detailblue.gif','../backup/logoutorg.gif','../backup/docyellow.gif','../backup/addresspink.gif')">

<TABLE width="120%" border=0 cellpadding="0" cellspacing="0">

  <TBODY> 

  <TR>

    <TD height=39>&nbsp;</TD></TR>

  <TR>

    <TD height=8> <img src="../images/label1.gif" width="126" height="54" border="0"> 

      <IMG 

      height=33 src="../images/home.gif" width=90 border=0 

      name=Image1><img name="Image15" border="0" src="../images/document.gif" width="90" height="33"><IMG 

      height=33 src="../images/carlendar.gif" width=90 border=0 

      name=Image2><IMG 

      height=33 src="../images/send.gif" width=90 border=0 

      name=Image4><img name="Image14" border="0" src="../images/address.gif" width="90" height="33"><IMG 

      height=33 src="../images/detail.gif" width=90 border=0 

      name=Image5><IMG 

      height=33 src="../images/logout.gif" width=90 border=0 

      name=Image6></TD>

  </TR>

  <TR> 

    <TD height="18"><img src="../images/bolder2.gif" width="130" height="18"><img src="../images/bolder1.gif" width="630" height="18"></TD>

  </TR>



  <TR vAlign=top align=left>

    <TD>

      <TABLE height=464 width="100%" border=0>

        <TBODY>

        <TR>

          <TD vAlign=top align=left width="15%"> </TD>

          <TD width="79%"> 

            <div align="left">

              <form method="post" action="forgetpassword.php">
                <table width="60%" border="1" cellspacing="0" cellpadding="0" bordercolorlight="#CCCCCC" bordercolordark="#FF6600">

					<tr><td>

                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr> 
                          <td width="5%" bgcolor="#FF9900">&nbsp;</td>
                          <td colspan="2"> 
                            <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="3" color="#FF9900">ลืมรหัสผ่าน</font></div>
                          </td>
                          <td width="5%" bgcolor="#FF9900">&nbsp;</td>
                        </tr>
                        <tr> 
                          <td width="5%">&nbsp;</td>
                          <td colspan="2"> 
                            <div align="center"><img src="../images/login_line.gif" width="300" height="5"> 
                            </div>
                          </td>
                          <td width="5%">&nbsp;</td>
                        </tr>
                        <tr> 
                          <td width="5%" height="20">&nbsp;</td>
                          <td colspan="2"> 
                            <div align="center"><font color="#666666" size="3" face="MS Sans Serif">กรุณาใส่ชื่อผู้ใช้ 
                              และชื่ออี-เมล์ </font> </div>
                          </td>
                          <td width="5%" height="20">&nbsp;</td>
                        </tr>
                        <tr> 
                          <td width="5%" height="31">&nbsp;</td>
                          <td width="44%" height="31"> 
                            <div align="center"><b><font color="#FF9900" size="2" face="MS Sans Serif, Microsoft Sans Serif">ชื่อผู้ใช้ 
                              : </font></b></div>
                          </td>
                          <td width="46%" height="31"> 
                            <input type="text" name="username" size="20" maxlength="40"value="<? echo$username;?>"

				>
                          </td>
                          <td width="5%" height="31">&nbsp;</td>
                        </tr>
                        <tr> 
                          <td width="5%">&nbsp;</td>
                          <td width="44%"> 
                            <div align="center"><b><font size="2" face="MS Sans Serif, Microsoft Sans Serif" color="#FF9900">ชื่ออี-เมล์ 
                              : </font><font size="2" face="MS Sans Serif, Microsoft Sans Serif" color="#FF6633"> 
                              </font></b></div>
                          </td>
                          <td width="46%"> 
                            <input type="text" name="email" size="25" maxlength="80" value="<? echo$email;?>">
                          </td>
                          <td width="5%">&nbsp;</td>
                        </tr>
                        <tr> 
                          <td width="5%" height="36">&nbsp;</td>
                          <td colspan="2" height="36" valign="middle" align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#FF3333"><? echo$msg; ?></font></td>
                          <td width="5%" height="36">&nbsp;</td>
                        </tr>
                        <tr> 
                          <td width="5%">&nbsp;</td>
                          <td width="44%">&nbsp;</td>
                          <td width="46%"> 
                            <input type="hidden" name="lastpage" value=forgot>
                            <input type="submit" name="Submit" value="ตกลง">
                          </td>
                          <td width="5%">&nbsp;</td>
                        </tr>
                        <tr> 
                          <td width="5%" bgcolor="#FF9900">&nbsp;</td>
                          <td width="44%">&nbsp;</td>
                          <td width="46%">&nbsp;</td>
                          <td width="5%" bgcolor="#FF9900">&nbsp;</td>
                        </tr>
                      </table>

					</td></tr>

					</table>

      </form>



              <table width="95%" height="100%" cellspacing="0" cellpadding="0" >

                <tr>

                  <td>&nbsp;</td>

                </tr>

              </table>

            </div>

          </TD>

        </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>

</BODY>
<? $username='';
$email='';
?>
</HTML>

