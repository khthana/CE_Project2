<?php 
include("checkauth.inc");
$link=mysql_connect($host,$user,$pass) or die("ไม่สามารถติดต่อฐานข้อมูลได้");
function sendmessage($send_id,$rec_id,$msg_id)
{

$sql22="insert into message_receiver(msg_id,friend_id,msr_status) values($msg_id,$rec_id,'new')";
$result22=mysql_db_query('magazine',$sql22);

}

if (sizeof($checkbox)==0){ mysql_close($link);header("Location:./findfriend.php");}
if($lastpage=='checkpageok')
{
if($grouptype=='new'){

	$sql="select max(grp_id) from group_name where mem_id=$user_id";

	$result=mysql_db_query($db,$sql);

	$data=mysql_fetch_array($result);

	$next_id=$data[0]+1;


	$sql1="insert into group_name(grp_id,mem_id,grp_name) values ($next_id,$user_id,'$newgroupname')";

	$result1=mysql_db_query($db,$sql1);


}

else{

$sql="select grp_id from group_name where mem_id=$user_id&&grp_name='$oldgroupname'";

	$result=mysql_db_query($db,$sql);

	$data=mysql_fetch_array($result);

	$next_id=$data[0];


}
$date=date('Y-m-d');
$time=date('H:i:s');
$title="คุณ $username ได้ทำการเพิ่มชื่อคุณเข้าไปใน contact List  เรียบร้อยแล้ว";
$message="คุณ $username ได้ทำการเพิ่มชื่อคุณเข้าไปใน contact List เรียบร้อยแล้ว";
$sql20="insert into message(mem_id,msg_date,msg_time,msg_title,msg_message) values ($user_id,'$date','$time','$title','$message')";
$result20=mysql_db_query('magazine',$sql20);


$sql21="select msg_id from message where mem_id=$user_id&&msg_date='$date'&&msg_time='$time'";

$result21=mysql_db_query('magazine',$sql21);
$data21=mysql_fetch_array($result21);
$msg_id=$data21[0];


foreach($checkbox as $friend_id)

{$sql2="insert into contact(grp_id,mem_id,friend_id,con_note,con_remind_bd) values ($next_id,$user_id,$friend_id,'','Y')";

	$result2=mysql_db_query($db,$sql2);
sendmessage($user_id,$friend_id,$msg_id);

}
mysql_close($link);
header('Location:./addressbook.php');
}

if ($grouptype=="old"){ 
	$msg='คุณต้องการเพิ่มรายชื่อจำนวน  '.count($checkbox).' รายชื่อเข้าไปในกลุ่มที่มีอยู่แล้ว ชื่อ <b>'.$oldgroupname.'</b>';
	$msg=$msg.'<input type="hidden" name="lastpage" value="checkpageok">';
	}
elseif($grouptype=='new')
{
$newgroupname=trim($newgroupname);
if($newgroupname=='')$msg='<font color="#FF0000"><b>ใส่ชื่อกลุ่มใหม่ไม่ถูกต้อง </b></font>กรุณาใส่ชื่อกลุ่มใหม่&nbsp;<input type="text" name="newgroupname" size="20" maxlength="30">';
else
	{$sql="select count(*) from group_name where mem_id=$user_id && grp_name='$newgroupname'";
	  $result=mysql_db_query($db,$sql);
	$data=mysql_fetch_array($result);
if($data[0]==1)$msg='<font color="#FF0000"><b>ชื่อกลุ่มใหม่ซ้ำกับกลุ่มที่มีอยู่แล้ว</b></font> กรุณาใส่ชื่อกลุ่มใหม่&nbsp;<input type="text" name="newgroupname" size="20" maxlength="30">';
	else {
$msg='คุณต้องการเพิ่มรายชื่อจำนวน  '.count($checkbox).' รายชื่อเข้าไปในกลุ่มที่สร้างขึ้นใหม่ ชื่อ <b>'.$newgroupname.'</b><input type="hidden" name="newgroupname" value="'.$newgroupname.'">';
	$msg=$msg.'<input type="hidden" name="lastpage" value="checkpageok">';
}
	}
}
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
<form name="form1" method="post" action="./addfriend.php">
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
                  <td> 
                    <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FF9933" align="center" height="96">
                      <tr align="center" bgcolor="#FF9900"> 
                        <td height="20" valign="top"><font size="3" face="MS Sans Serif" color="#000000">เมนู</font></td>
                      </tr>
                      <tr> 
                        <td height="75" valign="top"> 
                          <table width="100%" border="1">
                            <tr> 
                              <td align="center"><font size="2"><a href="./addressbook.php"><font face="MS Sans Serif" color="#666666" size="1">รายชื่อเพื่อน</font></a></font></td>
                            </tr>
                            <tr> 
                              <td align="center"><font size="2"><a href="./findfriend.php"><font face="MS Sans Serif" color="#FF6600" size="1">ค้นหา/เพิ่มชื่อเพื่อน</font></a></font></td>
                            </tr>
                            <tr> 
                              <td align="center" height="21"><a href="./adddelgroup.php"><font face="MS Sans Serif" color="#666666" size="1">เพิ่ม/ลบ/แก้ไขชื่อกลุ่ม</font></a></td>
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

            <TD vAlign=top width="727" height="497"><font color="#333333" face="MS Sans Serif" size="2"> 
              </font> 
              <table width="100%" border="0">
                <tr> 
                  <td height="68" align="left" valign="top"> 
                    <div align="center"> 
                      <table width="100%" border="1" height="14%">
                        <tr bgcolor="#0066FF"> 
                          <td height="32"> 
                            <div align="center"><font color="#FFFFFF"><b><font face="MS Sans Serif"><font face="MS Sans Serif"><font size="2">ชื่อผู้ใช้</font></font></font></b></font></div>
                          </td>
                          <td height="32"> 
                            <div align="center"><font color="#FFFFFF"><b><font face="MS Sans Serif"><font face="MS Sans Serif"><font size="2">ชื่อ-นามสกุล</font></font></font></b></font></div>
                          </td>
                          <td height="32"> 
                            <div align="center"><font color="#FFFFFF"><b><font face="MS Sans Serif"><font face="MS Sans Serif"><font size="2">ชื่อเล่น</font></font></font></b></font></div>
                          </td>
                        </tr>
                        <?
$link=mysql_connect($host,$user,$pass) or die("ไม่สามารถติดต่อฐานข้อมูลได้");

foreach($checkbox as $id){

$sql="select mem_id,mem_username,mem_fname,mem_lname,mem_nickname,mem_show_status from member where mem_id=".$id;

$result=mysql_db_query($db,$sql);

$data=mysql_fetch_array($result);

echo'                      <tr>';

					if ($data[5]=='Y') {echo '<td width="25%"><div align="center"><a href="./viewdetail.php?view_mem_id='.$data[0].'"><font color="#910000" size="2" face="MS Sans Serif"><b>'.$data[1].'&nbsp;</b></font></a></div></td>';}

					else {echo '<td width="25%"><div align="center">&nbsp;<font color="#000000" size="2" face="MS Sans Serif"><b>'.$data[1].'</b></font></div></td>';}

echo'                        <td height="31"> ';

echo'                          <div align="center"><font face="MS Sans Serif" size="2" color=#000000><b>'.$data[2].' '.$data[3].'&nbsp;</b></font></div>';

echo'                        </td>';

echo'                        <td height="31"> ';

echo'                          <div align="center"><font face="MS Sans Serif" size="2" color=#000000><b>'.$data[4].'&nbsp;</b></font></div>';

echo'                        </td>';

echo'                      </tr>';

echo '<input type="hidden" name="checkbox['.$data[0].']" value="'.$data[0].'">';

}

?> 
                      </table>
                    </div>
                  </td>
                </tr>
                <tr> 
                  <td height="200" align="center" valign="top"> 
                    <table width="100%" border="0">
                      <tr> 
                        <td width="6%">&nbsp;</td>
                        <td align="center" valign="top" width="80%"><font face="MS Sans Serif" size="1" color="#000000"> 
                          <?
echo $msg;
?> </font><font size="2" face="MS Sans Serif"></font></td>
                        <td width="6%">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="6%">&nbsp;</td>
                        <td align="center" valign="top" width="80%">&nbsp;</td>
                        <td width="6%">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td width="6%">&nbsp;</td>
                        <td align="center" valign="top" width="80%"><font size="2" face="MS Sans Serif"> 
                          <input type="submit" name="insert" value="ยืนยันการเพิ่มรายชื่อเพื่อนเข้ากลุ่ม">
                          <input type="hidden" name="grouptype" value="<?  echo $grouptype; ?>">
                          <input type="hidden" name="oldgroupname" value="<? echo $oldgroupname; ?>">
                                            </font></td>
                        <td width="6%">&nbsp;</td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
              <font color="#333333" face="MS Sans Serif" size="2"> </font></TD>

        </TR>

        </TBODY> 

      </TABLE>

    </TD></TR></TBODY></TABLE>

                  </form>

</BODY>
<?
$lastpage='';
mysql_close($link);
?>
</HTML>