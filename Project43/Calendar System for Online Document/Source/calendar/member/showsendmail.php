<?
$msg='';
$username=trim($username);
$email=trim($email);
$host="localhost";
$user='magazine';
$pass='magazine';
$db='magazine';
session_start();
$link=mysql_connect($host,$user,$pass) or die("ไม่สามารถติดต่อฐานข้อมูลได้");

$sql1="select mem_username,mem_fname,mem_lname  from member where mem_id=$userid";
	$result1=mysql_db_query($db,$sql1);
	$data1=mysql_fetch_array($result1);

mysql_close($link);

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

              <form method="post" action="../../index.php">
                <table width="60%" border="1" cellspacing="0" cellpadding="0" bordercolorlight="#CCCCCC" bordercolordark="#FF6600">

					<tr><td>

                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr> 
                          <td width="5%" bgcolor="#FF9900">&nbsp;</td>
                          <td colspan="2"> 
                            <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="3" color="#FF9900">ยืนยันการส่งรหัสผ่านทางอี-เมล์</font></div>
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
                            <div align="center"> </div>
                          </td>
                          <td width="5%" height="20">&nbsp;</td>
                        </tr>
                        <tr> 
                          <td width="5%" height="38">&nbsp;</td>
                          <td colspan="2" height="38" align="center"> 
                            <div align="center"><b><font face="MS Sans Serif"><font face="MS Sans Serif"><font size="1"><font size="1"><font color="#666666">ได้ทำการส่งรหัสผ่านทางอี-เมล์ไปหาคุณ
<? echo" $data1[1] $data1[2] ";?> 
                              เรียบร้อยแล้ว </font></font></font></font></font></b></div>
                          </td>
                          <td width="5%" height="38">&nbsp;</td>
                        </tr>
                        <tr> 
                          <td width="5%">&nbsp;</td>
                          <td colspan="2" rowspan="2" height="20" align="center"> 
                            <input type="submit" name="Submit" value="กลับหน้าจอเข้าสู่ระบบ">
                          </td>
                          <td width="5%">&nbsp;</td>
                        </tr>
                        <tr> 
                          <td width="5%" height="2">&nbsp;</td>
                          <td width="5%" height="2">&nbsp;</td>
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

