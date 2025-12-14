<?php

include("checkauth.inc");

include('thaidate.inc');

$link=mysql_connect($host,$user,$pass) or die("ไม่สามารถติดต่อฐานข้อมูลได้");



$sql='select count(*) from message,message_receiver where message.msg_id=message_receiver.msg_id 

			&& message_receiver.msg_id='.$message_id.'&&message_receiver.friend_id='.$user_id;

$result=mysql_db_query($db,$sql);

$data=mysql_fetch_array($result);

if ($data[0]==0){header("Location:./readmessage.php");}



$sql='select t2.msg_id,t1.mem_username,t2.msg_date,t2.msg_time,t2.msg_title,t2.msg_message 

from member t1,message t2,message_receiver t3 where t2.msg_id=t3.msg_id &&t1.mem_id=t2.mem_id&&t3.friend_id='.$user_id.' &&t3.msg_id='.$message_id;



$result=mysql_db_query($db,$sql);

$data=mysql_fetch_array($result);



$msg_id=$data[0];

$sendname=$data[1];

$year=substr($data[2],0,4)+543;

$month=$thaimonth[substr($data[2],5,2)-1];

$date=substr($data[2],8,2).' '.$month.' '.$year;

$time=$data[3];

$title=$data[4];

$message=$data[5];
$sql1="update message_receiver set msr_status='rea' where msg_id=$message_id &&friend_id=$user_id";
$result1=mysql_db_query($db,$sql1);

$sql2="select max(msg_id) ,count(*) from message_receiver where  msg_id<$message_id && friend_id=$user_id";
$result2=mysql_db_query($db,$sql2);
$data2=mysql_fetch_array($result2);
$prev_msg=$data2[0];
$prev_boo=$data2[1];


$sql3="select min(msg_id) ,count(*) from message_receiver where  msg_id>$message_id && friend_id=$user_id";
$result3=mysql_db_query($db,$sql3);
$data3=mysql_fetch_array($result3);
$next_msg=$data3[0];
$next_boo=$data3[1];

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
                            <td align="center" height="27"><font size="2"><a href="./readmessage.php"><font face="MS Sans Serif" color="#FF6600">อ่านข้อความ</font></a></font></td>
                          </tr>
                          <tr bgcolor="#FFFFFF"> 
                            <td align="center" height="32"><font size="2"><a href="./sendmessage.php"><font face="MS Sans Serif" color="#666666">ส่งข้อความ</font></a></font></td>
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
            <table width="400" border="0" cellpadding="0" cellspacing="0" align="center" height="408">
              <tr align="left" valign="top"> 
                <td nowrap colspan="2" height="22"> 
                  <div align="center"><img src="../images/head_table.gif" width="381" height="23"></div>
                </td>
              </tr>
              <tr align="left" valign="top"> 
                <td colspan="2" bgcolor="#FFFFFF" height="185"> 
                  <div align="center"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td height="365"> 
                          <table width="95%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FF9933" align="center" height="361">
                            <tr> 
                              <td height="364"> 
                                <table width="100%" border="0" cellspacing="0" cellpadding="3" height="336">
                                  <tr> 
                                    <td height="22" colspan="2" align="center" valign="middle"><font size="2" face="MS Sans Serif"><b></b></font></td>
                                  </tr>
                                  <tr> 
                                    <td height="31" align="left" valign="middle" colspan="2"><font size="3" face="MS Sans Serif, Microsoft Sans Serif" color="#666666"><? echo 'วันที่ '.$date.' เวลา '.$time ?></font></td>
                                  </tr>
                                  <tr> 
                                    <td height="31" align="left" valign="middle" width="27%"><font face="MS Sans Serif"><b><font size="2" color="#333333">จาก 
                                      :</font></b></font></td>
                                    <td height="31" align="left" valign="middle" width="73%"><font size="3" face="MS Sans Serif, Microsoft Sans Serif" color="#666666"><? echo $sendname ?></font><font size="3" face="MS Sans Serif" color="#666666"> 
                                      </font></td>
                                  </tr>
                                  <tr> 
                                    <td align="left" valign="middle" width="27%" height="38"><font face="MS Sans Serif"><b><font size="2">ถึง 
                                      : </font></b></font></td>
                                    <td align="left" valign="middle" width="73%" height="38"><font size="3" face="MS Sans Serif, Microsoft Sans Serif" color="#666666"><? echo $username ?></font><font face="MS Sans Serif, Microsoft Sans Serif"> 
                                      </font></td>
                                  </tr>
                                  <tr> 
                                    <td align="left" valign="middle" width="27%" height="38"><font face="MS Sans Serif"><b><font size="2">หัวเรื่อง 
                                      : </font></b></font></td>
                                    <td align="left" valign="middle" width="73%" height="38"><font size="3" face="MS Sans Serif, Microsoft Sans Serif" color="#666666"><? echo $title ?></font><font face="MS Sans Serif, Microsoft Sans Serif"> 
                                      </font></td>
                                  </tr>
                                  <tr> 
                                    <td align="left" valign="top" width="27%" height="33"><font face="MS Sans Serif"><b><font size="2">ข้อความ 
                                      : </font></b></font></td>
                                    <td align="left" valign="top" width="73%" height="33"><font size="3" face="MS Sans Serif, Microsoft Sans Serif" color="#666666"><? echo $message ?></font><font face="MS Sans Serif, Microsoft Sans Serif"> 
                                      </font></td>
                                  </tr>
                                  <tr align="left" valign="top"> 
                                    <td colspan="2" height="65"> 
                                      <div align="left"> 
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" height="20">
                                          <tr align="center" valign="top"> 
                                            <td height="34" width="50%"> 
                                              <form method="post" action="./viewmessage.php?message_id=<?echo$prev_msg;?>">
<?if($prev_boo<>0)echo'                                        <input type="submit" name="Submit" value="ข้อความก่อนหน้า">'?>
                                              </form>
                                            </td>
                                            <td height="34" width="50%"> 
                                              <form method="post" action="./viewmessage.php?message_id=<?echo$next_msg;?>">
<?if($next_boo<>0)echo'                                                <input type="submit" name="Submit2" value="ข้อความต่อไป">';?>
                                              </form>
                                            </td>
                                          </tr>
                                        </table>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td width="50%"> 
                                              <form method="post" action="./sendmessage.php?send_name=<?echo$sendname;?>">
                                                <div align="center"> 
                                                  <input type="submit" name="reply" value="ตอบกลับ">
                                                  <input type="hidden" name="retitle" value="<?php echo'ตอบกลับ : '.$title;?>">
                                                </div>
                                              </form>
                                            </td>
                                            <td width="50%"> 
                                              <form method="post" action="./deletemessage.php">
                                                <div align="center"> 
                                                  <input type="submit" name="delete" value="ลบข้อความ">
                                                  <input type="hidden" name="<?php echo $message_id; ?>" value="<?php echo $message_id; ?>">
                                                </div>
                                              </form>
                                            </td>
                                          </tr>
                                        </table>
                                        <font face="MS Sans Serif, Microsoft Sans Serif"> 
                                        </font> </div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td align="left" valign="middle" colspan="2" height="147"><b></b></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                    <font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><img src="../images/login_line.gif" width="380" height="18"></b></font></div>
                </td>
              </tr>
            </table>
            <font color="#FFFFFF">

            </font></TD>

        </TR>

        </TBODY> 

      </TABLE>

    </TD></TR></TBODY></TABLE>



</BODY>



</HTML>



