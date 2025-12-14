<?php
include("checkauth.inc");

$msg="";

$link=mysql_connect($host,$user,$pass) or die("ไม่สามารถติดต่อฐานข้อมูลได้");

if($last_page=="sendmessage"){

$rec_name=trim($rec_name);

$title=stripslashes($title);
$message=stripslashes($message);
$title=str_replace('"','&quot;',$title);
$message=str_replace('"','&quot;',$message);
$send_name=$rec_name;
$retitle=$title;
$remessage=$message;
if(!(strpos($rec_name,',')===false)&&(strpos($rec_name,',')==0)){	$rec_name=substr_replace($rec_name,'',0,1);}
if ($rec_name==''){$msg='ใส่ชื่อผู้ใช้ไม่ถูกต้อง';}
elseif(strpos($rec_name,',,')){$msg='ใส่ชื่อผู้ใช้ไม่ถูกต้อง';
}
elseif($title==''){$msg='ไม่ได้ใส่หัวเรื่อง';
}
elseif($message==''){$msg='ไม่ได้ใส่ข้อความ';
}
else{
$temp='';
$count=0;
$boo=1;
$tok = strtok ($rec_name,",");
while (($tok)&&($boo==1)) {
	$tok=trim($tok);
	$index=strstr($temp,$tok);
	if (!$index){
		$temp="$temp,$tok";
		$count++;
		$sql="select count(*),min(mem_username) from member where mem_username='$tok'";
		$result=mysql_db_query($db,$sql);
		$data=mysql_fetch_array($result);
		if($data[0]==0){$boo=0;$msg="ไม่พบชื่อ คุณ ".$tok;}
	}
	$tok = strtok (",");
}
	if($boo==1){
	$temp=substr_replace($temp,'',0,1);
		session_start();

		session_register("rec_name2");

		session_register("title");

		session_register("message");

		session_register("count");

		$rec_name2=$temp;


		mysql_close($link);
		header("Location: ./confirm_send.php"); 

	}

	else{mysql_close($link);

	}

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



onload="MM_preloadImages('file:///E|/project/magazine/redpoint.gif','file:///E|/project/magazine/carblue.gif','file:///E|/project/magazine/sendpink.gif','file:///E|/project/magazine/detailblue.gif','file:///E|/project/magazine/logoutorg.gif','file:///E|/project/magazine/docyellow.gif','file:///E|/project/magazine/addresspink.gif','../images/homered.gif','../images/docyellow.gif','../images/carblue.gif','../images/messagegreen.gif','../images/addresspink.gif','../images/detailblue.gif','../images/logoutorg.gif')" link="#666666">
<TABLE height=10 width="100%" border=0 cellpadding="0" cellspacing="0">



  <TBODY> 



  <TR>



    <TD height=39>&nbsp;</TD></TR>



  <TR>



    <TD height=8> <img src="../images/label1.gif" width="126" height="54" border="0"> 
      <a href="../welcome.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','../images/homered.gif',1)"><IMG 



      height=33 src="../images/home.gif" width=90 border=0 



      name=Image1></a><a href="../../reader.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image15','','../images/docyellow.gif',1)"><img name="Image15" border="0" src="../images/document.gif" width="90" height="33"></a><a href="../schedule/sch_add.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','../images/carblue.gif',1)"><IMG 



      height=33 src="../images/carlendar.gif" width=90 border=0 



      name=Image2></a><a href="../message/readmessage.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','../images/messagegreen.gif',1)"><IMG 



      height=33 src="../images/message.gif" width=90 border=0 



      name=Image4></a><a href="../address/addressbook.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image14','','../images/addresspink.gif',1)"><img name="Image14" border="0" src="../images/address.gif" width="90" height="33"></a><a href="../member/edit_profile.html" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','../images/detailblue.gif',1)"><IMG 



      height=33 src="../images/detail.gif" width=90 border=0 



      name=Image5></a><a href="../member/logout.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image6','','../images/logoutorg.gif',1)"><IMG 



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

          <TD vAlign=top width="163" height="497"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="100"> 
                  <table width="99%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FF9933" align="center" height="96">
                    <tr align="center" bgcolor="#FF9900"> 
                      <td height="20" valign="top"><font size="3" face="MS Sans Serif" color="#000000">เมนู</font></td>
                    </tr>
                    <tr> 
                      <td height="75" valign="top"> 
                        <table width="100%" border="1" bordercolor="#CCCCCC">
                          <tr bgcolor="#FFFFFF"> 
                            <td align="center" height="27"><font size="2"><a href="./readmessage.php"><font face="MS Sans Serif" color="666666">อ่านข้อความ</font></a></font></td>
                          </tr>
                          <tr bgcolor="#FFFFFF"> 
                            <td align="center" height="32"><font size="2"><a href="./sendmessage.php"><font face="MS Sans Serif" color="FF6600">ส่งข้อความ</font></a></font></td>
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
            <table width="120" border="0" cellpadding="0" cellspacing="0">
              <tr align="left" valign="top"> 
                <td nowrap colspan="2"> 
                  <div align="center"><img src="../images/mess_remindhead.gif" width="188" height="21"></div>
                </td>
              </tr>
              <tr align="left" valign="top"> 
                <td colspan="2" bgcolor="#FFFFFF" height="133"> 
                  <div align="center"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td height="72"> 
                          <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FAAB34" height="91">
                            <tr> 
                              <td height="97"> 
                                <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                  <tr> 
                                    <td height="34" colspan="2"><font size="2"><font color="#0066FF" face="AngsanaUPC, Angsana New, MS Serif">
                                      <?php include("../checkmessage.inc"); ?>
                                      </font></font></td>
                                  </tr>
                                  <tr> 
                                    <td height="31" colspan="2">&nbsp;</td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </table>
                          <? //----------หมด เตือนข้อความ ---------- ?>
                        </td>
                      </tr>
                    </table>
                    <font face="MS Sans Serif, Microsoft Sans Serif" size="2"></font></div>
                </td>
              </tr>
              <tr align="left" valign="top"> 
                <td colspan="2" height="16"><img src="../images/sch_remindhead.gif" width="188" height="20"></td>
              </tr>
              <tr align="left" valign="top"> 
                <td colspan="2" height="101"> 
                  <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FFB038">
                    <tr> 
                      <td height="83"> 
                        <table width="100%" border="0" cellspacing="0" cellpadding="3">
                          <tr> 
                            <td height="34" colspan="2"><font size="1"><font color="#0066FF" face="MS Sans Serif, Microsoft Sans Serif">
                              <?php include("../remind/sch_remindside.inc"); ?>
                              </font></font></td>
                          </tr>
                          <tr> 
                            <td height="31" colspan="2">&nbsp;</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr align="left" valign="top"> 
                <td colspan="2" height="16">&nbsp;</td>
              </tr>
              <? //------------หมด เตือน ตาราง------------ ?>
              <tr align="left" valign="top"> 
                <td colspan="2" height="9"><img src="../images/app_remindhead.gif" width="188" height="20"></td>
              </tr>
              <tr align="left" valign="top"> 
                <td colspan="2" height="108"> 
                  <div align="center"> 
                    <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FF9933">
                      <tr> 
                        <td height="127"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="3">
                            <tr> 
                              <td height="34" colspan="2"><font size="1"><font color="#0066FF" face="MS Sans Serif, Microsoft Sans Serif">
                                <?php include("../remind/app_messbeside.inc"); ?>
                                </font></font></td>
                            </tr>
                            <tr> 
                              <td height="31" colspan="2"><font size="1"><font color="#0066FF" face="MS Sans Serif, Microsoft Sans Serif">
                                <?php include("../remind/app_mess_tosenderbeside.inc"); ?>
                                </font></font></td>
                            </tr>
                            <tr> 
                              <td colspan="2">&nbsp;</td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                    <? //---------------- หมด เตือน นัดหมาย -------------- ?>
                  </div>
                </td>
              </tr>
            </table>
          </TD>

          <TD vAlign=top width="727" height="497"> 
            <form name="sendmessage" method="post" action="sendmessage.php">
              <table width="450" border="0" cellpadding="0" cellspacing="0" align="center" height="408">
                <tr align="left" valign="top"> 
                  <td nowrap colspan="2" height="22"> 
                    <div align="center"><img src="../images/head_table.gif" width="450" height="23"></div>
                  </td>
                </tr>
                <tr align="left" valign="top"> 
                  <td colspan="2" bgcolor="#FFFFFF" height="185"> 
                    <div align="center"> 
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr> 
                          <td height="365"> 
                            <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FF9933" align="center" height="361">
                              <tr> 
                                <td height="364"> 
                                  <table width="100%" border="0" cellspacing="0" cellpadding="3" height="336">
                                    <tr> 
                                      <td height="22" colspan="2" align="center" valign="middle"><font size="2" face="MS Sans Serif"><b><font color="#0099FF" size="3">ส่งข้อความ</font></b></font></td>
                                    </tr>
                                    <tr> 
                                      <td height="31" align="left" valign="middle" width="19%"><font face="MS Sans Serif"><b><font size="2" color="#666666">จาก 
                                        :</font></b></font></td>
                                      <td height="31" align="left" valign="middle" width="81%"><b><font size="2" face="MS Sans Serif, Microsoft Sans Serif" color="#666666"> 
                                        <? echo $username ?> </font></b></td>
                                    </tr>
                                    <tr> 
                                      <td align="left" valign="middle" width="19%" height="11"><a href="./createaddress.php"><font face="MS Sans Serif" color=#000000"><b><font size="2" color="#666666">ถึง 
                                        : </font></b></font></a></td>
                                      <td align="left" valign="middle" width="81%" height="11"><font face="MS Sans Serif, Microsoft Sans Serif"> 
                                        </font> 
                                        <table width="100%" border="0">
                                          <tr> 
                                            <td width="45%"><font face="MS Sans Serif, Microsoft Sans Serif"> 
                                              <input type="text" name="rec_name" size="20" maxlength="30" value="<? echo$send_name?>">
                                              </font></td>
                                            <td width="55%"><a href="createaddress.php"><font face="MS Sans Serif" size="2" color="#3366CC"><b>เพิ่มจากรายชื่อกลุ่ม</b></font></a></td>
                                          </tr>
                                        </table>
                                      </td>
                                    </tr>
                                    <tr> 
                                      <td align="left" valign="middle" width="19%" height="38"><font face="MS Sans Serif"><b><font size="2" color="#666666">หัวเรื่อง 
                                        : </font></b></font></td>
                                      <td align="left" valign="middle" width="81%" height="38"><font face="MS Sans Serif, Microsoft Sans Serif"> 
                                        <input type="text" name="title" size="20" maxlength="40" value="<?echo$retitle;?>">
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td align="left" valign="top" width="19%" height="156"><font face="MS Sans Serif"><b><font size="2" color="#666666">ข้อความ 
                                        : </font></b></font></td>
                                      <td align="left" valign="top" width="81%" height="156"><font face="MS Sans Serif, Microsoft Sans Serif"> 
                                        <textarea name="message" cols="35" rows="7" wrap="VIRTUAL"><? echo$remessage;?></textarea>
                                        </font></td>
                                    </tr>
                                    <tr align="center"> 
                                      <td valign="middle" colspan="2"><font face="MS Sans Serif, Microsoft Sans Serif"> 
                                        <input type="submit" name="Submit" value="ส่งข้อความ">
                                        <input type="reset" name="cancel" value="ยกเลิกข้อความ">
                                        <input type="hidden" name="last_page" value="sendmessage">
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td align="left" valign="middle" colspan="2"> 
                                        <div align="center"><font size="2" face="MS Sans Serif"><b><font color="#FF3333"><font size="2" face="MS Serif" color="#FF0033"><? echo $msg; ?></font></font></b></font></div>
                                      </td>
                                    </tr>
                                    <tr> 
                                      <td align="left" valign="middle" colspan="2"><b><font face="MS Sans Serif" size="2"></font></b></td>
                                    </tr>
                                  </table>
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                      </table>
                      <font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><img src="../images/login_line.gif" width="450" height="18"></b></font></div>
                  </td>
                </tr>
              </table>
            </form>
            <font color="#FFFFFF"> </font></TD>

        </TR>

        </TBODY> 

      </TABLE>

    </TD></TR></TBODY></TABLE>



</BODY>



</HTML>



