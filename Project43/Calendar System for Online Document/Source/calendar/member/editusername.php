<?php
include("checkauth.inc");
$msg="";
	$link=mysql_connect($host,$user,$pass) or die("ไม่สามารถติดต่อฐานข้อมูลได้");
if(isset($enterpass)&&isset($newname) )
	{
$newname=trim($newname);
	$sql="select  count(*) from member where mem_username='".$newname."'";

	$result=mysql_db_query($db,$sql);
	$data=mysql_fetch_array($result);
	$index=strpos($newname,',');
	if(!($index===false)){$msg="ชื่อผู้ใช้ไม่ถูกต้อง";}
	elseif($data[0]<>'0') {$msg="ชื่อผู้ใช้ซ้ำ";}
	else 
	{
		$sql="select mem_username,mem_password	from 
			member where mem_id='".$user_id."'";
		$result=mysql_db_query($db,$sql);
		$data=mysql_fetch_array($result);
		$password=$data[1];
		if($password<>$enterpass) {$msg="ใส่รหัสผ่านไม่ถูกต้อง";	}
		elseif(strlen($newname)<3){$msg="ความยาวของชื่อผู้ใช้น้อยกว่า 3 ตัวอักษร";}
			else
				{$sql="update member set mem_username='".$newname."' "."where mem_id='".$user_id."'";

                 $result=mysql_db_query($db,$sql);
                 mysql_close($link);
				  header("Location: ./edit_profile.html"); }
		}}
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

<SCRIPT language=JavaScript>

<!--

function MM_swapImgRestore() { //v3.0

  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;

}



function MM_preloadImages() { //v3.0

  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();

    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)

    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}

}



function MM_findObj(n, d) { //v3.0

  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {

    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}

  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];

  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document); return x;

}



function MM_swapImage() { //v3.0

  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)

   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}

}

//-->

</SCRIPT>



<META content="MSHTML 5.50.4134.600" name=GENERATOR></HEAD>

<BODY bgColor=#ffffff 

onload="MM_preloadImages('file:///E|/project/magazine/redpoint.gif','file:///E|/project/magazine/carblue.gif','file:///E|/project/magazine/sendpink.gif','file:///E|/project/magazine/detailblue.gif','file:///E|/project/magazine/logoutorg.gif','file:///E|/project/magazine/docyellow.gif','file:///E|/project/magazine/addresspink.gif')" link="#666666">
<TABLE height=10 width="100%" border=0 cellpadding="0" cellspacing="0">

  <TBODY> 

  <TR>

    <TD height=39>&nbsp;</TD></TR>

  <TR>

    <TD height=8> <img src="../images/label1.gif" width="126" height="54" border="0"> 
      <a href="../welcome.php"><IMG 

      height=33 src="../images/home.gif" width=90 border=0 

      name=Image1></a><a href="../../reader.php"><img name="Image15" border="0" src="../images/document.gif" width="90" height="33"></a><a href="../schedule/sch_add.php"><IMG 

      height=33 src="../images/carlendar.gif" width=90 border=0 

      name=Image2></a><a href="../message/readmessage.php"><IMG 

      height=33 src="../images/message.gif" width=90 border=0 

      name=Image4></a><a href="../address/addressbook.php"><img name="Image14" border="0" src="../images/address.gif" width="90" height="33"></a><a href="./edit_profile.html"><IMG 

      height=33 src="../images/detail.gif" width=90 border=0 

      name=Image5></a><a href="./logout.php"><IMG 

      height=33 src="../images/logout.gif" width=90 border=0 

      name=Image6></a></TD>

  </TR>

  <TR> 

    <TD height="18"><img src="../images/bolder2.gif" width="130" height="18"><img src="../images/bolder1.gif" width="630" height="18"></TD>

  </TR>



  <TR vAlign=top align=left>

    <TD>

      <TABLE height=464 width="100%" border=0>
        <TBODY> 
        <TR align="left" bgcolor="#FFFFFF"> 
          <TD vAlign=top width="169" height="497"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="100"> 
                  <table width="99%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FF9933" align="center" height="96">
                    <tr align="center" bgcolor="#FF9900"> 
                      <td height="20" valign="top"><font size="3" face="MS Sans Serif" color="#000000">แก้ไขข้อมูล</font></td>
                    </tr>
                    <tr> 
                      <td height="75" valign="top"> 
                        <table width="100%" border="1">
                          <tr> 
                            <td align="center"><a href="./editusername.php"><font face="MS Sans Serif" size="2" color="#FF6600">แก้ไขชื่อผู้ใช้</font></a></td>
                          </tr>
                          <tr> 
                            <td align="center"><a href="./editpassword.php"><font face="MS Sans Serif" size="2" color="#000000"><font color="#666666">แก้ไขรหัสผ่าน</font></font></a></td>
                          </tr>
                          <tr> 
                            <td align="center"><a href="./editdetail.php"><font face="MS Sans Serif" size="2" color="#666666">แก้ไขข้อมูลส่วนตัว</font></a></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
              </tr>
            </table>
<? //-----ปุ่มจัดตารางรวดเร็ว และ นัดหมายรวดเร็ว-------- ?>

<table width="180" border="0" cellpadding="0" cellspacing="0">

                      <tr align="left" valign="top"> 

                        <td nowrap colspan="2" height="25"> 

                          <div align="right"><a href="../schedule/sch_add2.php"><img src="../images/sch_quick.gif" width="150" height="20" border="0"></a></div>

                        </td>

                      </tr>

                      <tr align="left" valign="top"> 

                        <td nowrap colspan="2" height="26"> 

                          <div align="right"><a href="app_add1.php?quick_butt=Y"><img src="../images/app_quick.gif" width="150" height="20" border="0"></a></div>

                        </td>

                      </tr>

                      <?

if($user_calendar=="A" || $user_calendar=="W")

{

?> 

                      <tr align="left" valign="top"> 

                        <td nowrap colspan="2" height="26"> 

                          <div align="right"><a href="../../document/edit_article/page_edit.php"><img src="../images/write_column.gif" width="148" height="20" border="0"></a></div>

                        </td>

                      </tr>

                      <?

} //เช็คสิทธ์เขียน

?> <?

if($user_calendar=="A")

{

?> 

                      <tr align="left" valign="top"> 

                        <td nowrap colspan="2" height="2"> 

                          <div align="right"><a href="../admin/adminpage.php"><img src="../images/admin.gif" width="149" height="22" border="0"></a></div>

                        </td>

                      </tr>

                      <tr align="left" valign="top"> 

                        <td nowrap colspan="2" height="2"> 

                          <div align="right">&nbsp;</div>

                        </td>

                      </tr>



                      <?

} //เช็คผู้ดูแลระบบ

?> 

                    </table>

<? //-------------หมดquickbutton------- ?>
          </TD>
          <TD vAlign=top width="678" height="497" align="left"> 
            <div align="left"></div>
            <form name="form1" method="post" action="./editusername.php">
              <table width="325" border="0" cellpadding="0" cellspacing="0" align="center" height="200">
                <tr align="left" valign="top"> 
                  <td nowrap colspan="2" height="18"> 
                    <div align="center"><img src="../images/head_table.gif" width="322" height="20"></div>
                  </td>
                </tr>
                <tr align="left" valign="top"> 
                  <td colspan="2" bgcolor="#FFFFFF" height="185"> 
                    <div align="center"> 
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr> 
                          <td height="193" valign="top"> 
                            <table width="99%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FF9933" align="center" height="170">
                              <tr> 
                                <td height="191" valign="top"> 
                                  <table width="100%" border="0" cellspacing="0" cellpadding="3" height="116">
                                    <tr> 
                                      <td height="19" colspan="3" align="center" valign="middle"><font face="MS Sans Serif"></font></td>
                                    </tr>
                                    <tr> 
                                      <td height="26" colspan="3" align="center" valign="middle"><font size="2" face="MS Sans Serif"><b><font size="3" color="#6666CC">แก้ไขชื่อผู้ใข้</font></b></font></td>
                                    </tr>
                                    <tr> 
                                      <td height="13" colspan="3" align="center" valign="middle"> 
                                        <table width="100%" border="0">
                                          <tr align="left"> 
                                            <td width="53%" height="38"><font size="2"><b><font face="MS Sans Serif" color="#993399">ชื่อผู้ใช้เก่า 
                                              : </font></b></font></td>
                                            <td width="47%" height="38"><font face="MS Sans Serif"><b><font size="2"><?php echo $username ?></font></b></font></td>
                                          </tr>
                                          <tr align="left"> 
                                            <td width="53%"> 
                                              <p><font color="#993399" face="MS Sans Serif" size="2"><b>ชื่อผู้ใช้ใหม่ 
                                                : </b><br>
                                                <font size="1">(ความยาวอย่างน้อย 
                                                3 ตัวอักษร )</font></font></p>
                                            </td>
                                            <td width="47%"><font face="MS Sans Serif"><b><font color="#000000" size="5"> 
                                              <input type="text" name="newname" size="15" maxlength="30">
                                              </font></b></font><font face="MS Sans Serif" size="3"></font></td>
                                          </tr>
                                          <tr align="left"> 
                                            <td width="53%"><font face="MS Sans Serif" size="2"><b><font color="#993399">รหัสผ่าน 
                                              : </font></b></font></td>
                                            <td width="47%"><font face="MS Sans Serif"> 
                                              <input type="password" name="enterpass" size="15" maxlength="40">
                                              </font></td>
                                          </tr>
                                          <tr align="left"> 
                                            <td width="53%">&nbsp;</td>
                                            <td width="47%"><font face="MS Sans Serif"> 
                                              <input type="submit" name="Submit" value="แก้ไขชื่อผู้ใช้">
                                              </font> 
                                              <input type="reset" name="cancle" value="ยกเลิก">
                                            </td>
                                          </tr>
                                          <tr align="left"> 
                                            <td colspan="2" align="center"> 
                                              <div align="center"><font face="MS Sans Serif" size="2" color="#CC0033"><b><?php echo $msg; ?></b></font></div>
                                            </td>
                                          </tr>
                                        </table>
                                        <font face="MS Sans Serif"></font></td>
                                    </tr>
                                    <tr> 
                                      <td height="26" colspan="3" align="center" valign="middle">&nbsp; 
                                      </td>
                                    </tr>
                                  </table>
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                      </table>
                      <font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><img src="../images/login_line.gif" width="322" height="18"></b></font></div>
                  </td>
                </tr>
              </table>
            </form>
            <div align="left"></div>
          </TD>
        </TR>
        </TBODY> 
      </TABLE>
    </TD></TR></TBODY></TABLE>

</BODY>

</HTML>

