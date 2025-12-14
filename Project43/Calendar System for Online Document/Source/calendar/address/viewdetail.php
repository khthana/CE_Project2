<?php

include("checkauth.inc");

include("thaidate.inc");
function sendmessage($send_id,$rec_id,$msg_id)
{

$sql22="insert into message_receiver(msg_id,friend_id,msr_status) values($msg_id,$rec_id,'new')";
$result22=mysql_db_query('magazine',$sql22);

}
$msg='';

$link=mysql_connect($host,$user,$pass) or die("ไม่สามารถติดต่อฐานข้อมูลได้");
$accept=1;
if ($view_mem_id=='')		header('Location:./findfriend.php');

if ($lastpage=='viewdetail')
{

$newgroupname=trim($newgroupname);
if ($grouptype=='new')
	{
	if($newgroupname==''){$msg='ใส่ชื่อกลุ่มไม่ถูกต้อง กรุณาใส่ชื่อกลุ่มใหม่อีกครั้งหนึ่ง';echo"error1"; $accept=0;}
	else{
			$sql="select  count(*),max(grp_id) from group_name where grp_name='$newgroupname' && mem_id=$user_id";
			$result=mysql_db_query($db,$sql);

			$data=mysql_fetch_array($result);
			if ($data[0]<>0)

				{$msg='ชื่อกลุ่มใหม่ซ้ำกับกลุ่มที่มีอยู่แล้ว กรุณาใส่ชื่อกลุ่มใหม่อีกครั้งหนึ่ง';$accept=0;

				}
			}
	}
if($accept==1)
{
		if($grouptype=='old')
		{$sql1="insert into contact(grp_id,mem_id,friend_id) values($oldgroupname,$user_id,$view_mem_id)";
		$result1=mysql_db_query($db,$sql1);

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

sendmessage($user_id,$view_mem_id,$msg_id);

		mysql_close($link);
		header("Location:./addressbook.php");
		}
		if($grouptype=='new')
		{
		$sql1="select max(grp_id) from group_name where mem_id=$user_id";
		$result1=mysql_db_query($db,$sql1);
		$data1=mysql_fetch_array($result1);
		$next_id=$data1[0]+1;


		$sql2="insert into group_name(grp_id,mem_id,grp_name) values ($next_id,$user_id,'$newgroupname')";
		$result2=mysql_db_query($db,$sql2);


		$sql3="insert into contact(grp_id,mem_id,friend_id) values ($next_id,$user_id,$view_mem_id)";
		$result3=mysql_db_query($db,$sql3);

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

sendmessage($user_id,$view_mem_id,$msg_id);

		mysql_close($link);
		header("Location:./addressbook.php");
		}
}
}

$sql="select mem_username,mem_id,mem_fname,mem_lname,mem_nickname

,mem_address,mem_zipcode,mem_birthday,mem_email,mem_icq,mem_tel,mem_gender

,mem_pager,mem_occupation,mem_income,mem_show_status ,mem_id

from member where mem_id='".$view_mem_id."'";



$result=mysql_db_query($db,$sql);

$data=mysql_fetch_array($result);



$friendname=$data[0];

$fname=$data[2];

$lname=$data[3];

$nickname=$data[4];

$address=$data[5];

$zipcode=$data[6];

$birthday=$data[7];

$year=substr($data[7],0,4)+543;

$month=$thaimonth[substr($data[7],5,2)-1];

$birthday=substr($data[7],8,2).' '.$month.' '.$year;

$email=$data[8];

$icq=$data[9];

$tel=$data[10];
if($data[11]=='m') $gender='ชาย';
elseif($data[11]=='f')$gender='หญิง';

$pager=$data[12];

$occupation=$data[13];

$income=$data[14];

$showstatus=$data[15];

if($showstatus=='N'){		mysql_close($link);header('Location:./addressbook.php');}
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



      name=Image1></a><a href="../../index.php"><img name="Image15" border="0" src="../images/document.gif" width="90" height="33"></a><a href="../schedule/sch_add.php"><IMG 



      height=33 src="../images/carlendar.gif" width=90 border=0 



      name=Image2></a><a href="../message/readmessage.php"><IMG 



      height=33 src="../images/message.gif" width=90 border=0 



      name=Image4></a><a href="../address/addressbook.php"><img name="Image14" border="0" src="../images/address.gif" width="90" height="33"></a><a href="../member/edit_profile.html"><IMG 



      height=33 src="../images/detail.gif" width=90 border=0 



      name=Image5></a><a href="../member/logout.php"><IMG 



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
                            <td align="center"><font size="2"><a href="./addressbook.php"><font face="MS Sans Serif" color="#FF6600" size="1">รายชื่อเพื่อน</font></a></font></td>
                          </tr>
                          <tr> 
                            <td align="center"><font size="2"><a href="./findfriend.php"><font face="MS Sans Serif" color="#666666" size="1">ค้นหา/เพิ่มชื่อเพื่อน</font></a></font></td>
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

          <TD vAlign=top width="727" height="497"> <font color="#000000" face="MS Sans Serif" size="2"> 

            </font>

            <form name="form1" method="post" action="./viewdetail.php">
              <table width="405" border="0" cellpadding="0" cellspacing="0" align="center" height="200">

                <tr align="left" valign="top"> 

                  <td nowrap colspan="2" height="18"> 

                    <div align="center"><img src="../images/head_table.gif" width="409" height="20"></div>

                  </td>

                </tr>

                <tr align="left" valign="top"> 

                  <td colspan="2" bgcolor="#FFFFFF" height="185"> 

                    <div align="center"> 

                      <table width="100%" border="0" cellspacing="0" cellpadding="0">

                        <tr> 

                          <td height="193" valign="top"> 

                            <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FF9933" align="center" height="170">

                              <tr> 

                                <td height="191" valign="top"> 

                                  <table width="98%" border="0" cellspacing="0" cellpadding="3" height="116">

                                    <tr> 

                                      <td height="19" colspan="3" align="center" valign="middle"><font face="MS Sans Serif"></font></td>

                                    </tr>

                                    <tr> 

                                      <td height="53" colspan="3" align="center" valign="middle"><font size="2" face="MS Sans Serif"><b><font size="3" color="#6666CC">ข้อมูลส่วนตัวของคุณ 

                                        </font><font color="#000000"><b><font face="MS Sans Serif" size="2"> 

                                        <? echo $friendname; ?>

                                        </font></b></font></b></font></td>

                                    </tr>

                                    <tr> 

                                      <td height="13" colspan="3" align="center" valign="middle"> 

                                        <table width="100%" border="0">

                                          <tr align="left"> 

                                            <td width="42%"><b><font face="MS Sans Serif" size="2"><font color="#993399">ชื่อจริง 

                                              : </font></font></b></td>

                                            <td width="58%"><b><font face="MS Sans Serif" color="#333333" size="2"> 

                                              <? echo $fname; ?>

                                              </font></b></td>

                                          </tr>

                                          <tr align="left"> 

                                            <td width="42%"><b><font face="MS Sans Serif" size="2"><font color="#993399">นามสกุล 

                                              : </font></font></b></td>

                                            <td width="58%"><b><font face="MS Sans Serif" color="#333333" size="2"> 

                                              <? echo $lname; ?>

                                              </font></b></td>

                                          </tr>

                                          <tr align="left"> 

                                            <td width="42%"> 

                                              <p><font face="MS Sans Serif" size="2"><b><font color="#993399">ชื่อเล่น 

                                                : </font></b></font></p>

                                            </td>

                                            <td width="58%"><b><font face="MS Sans Serif" size="2" color="#333333"> 

                                              <? echo $nickname; ?>

                                              </font></b></td>

                                          </tr>

                                          <tr align="left"> 

                                            <td width="42%"><b><font face="MS Sans Serif" size="2"><font color="#993399">เพศ 

                                              : </font></font></b></td>

                                            <td width="58%"> <b><font face="MS Sans Serif" color="#333333" size="2"> 

                                              <? echo $gender; ?>

                                              </font></b></td>

                                          </tr>

                                          <tr align="left"> 

                                            <td width="42%"><b><font face="MS Sans Serif" size="2"><font color="#993399">วันเกิด 

                                              : </font></font></b></td>

                                            <td width="58%"> <b><font face="MS Sans Serif" color="#333333" size="2"> 

                                              <? echo $birthday; ?>

                                              </font></b></td>

                                          </tr>

                                          <tr align="left"> 

                                            <td width="42%"><b><font face="MS Sans Serif" size="2"><font color="#993399">ที่อยู่ 

                                              :</font></font></b></td>

                                            <td width="58%"><b><font face="MS Sans Serif" color="#333333" size="2"> 

                                              <? echo $address; ?>

                                              </font></b></td>

                                          </tr>

                                          <tr align="left"> 

                                            <td width="42%"><b><font face="MS Sans Serif" size="2"><font color="#993399">รหัสไปรษณีย์ 

                                              :</font></font></b></td>

                                            <td width="58%"><b><font face="MS Sans Serif" color="#333333" size="2"> 

                                              <? echo $zipcode; ?>

                                              </font></b></td>

                                          </tr>

                                          <tr align="left"> 

                                            <td width="42%"><b><font face="MS Sans Serif" size="2"><font color="#993399">อีเมล์ 

                                              : </font></font></b></td>

                                            <td width="58%"><b><font face="MS Sans Serif" color="#333333" size="2"> 

                                              <? echo $email; ?>

                                              </font></b></td>

                                          </tr>

                                          <tr align="left"> 

                                            <td width="42%"><b><font face="MS Sans Serif" size="2"><font color="#993399">เบอร์โทรศัพท์ 

                                              :</font></font></b></td>

                                            <td width="58%"><b><font face="MS Sans Serif" color="#333333" size="2"> 

                                              <? echo $tel; ?>

                                              </font></b></td>

                                          </tr>

                                          <tr align="left"> 

                                            <td width="42%"><b><font face="MS Sans Serif" size="2"><font color="#993399">เบอร์ไอซีคิว 

                                              :</font></font></b></td>

                                            <td width="58%"><b><font face="MS Sans Serif" color="#333333" size="2"> 

                                              <? echo $icq; ?>

                                              </font></b></td>

                                          </tr>

                                          <tr align="left"> 

                                            <td width="42%"><b><font face="MS Sans Serif" size="2"><font color="#993399">เบอร์เพจน์ 

                                              :</font></font></b></td>

                                            <td width="58%"><b><font face="MS Sans Serif" color="#333333" size="2"> 

                                              <? echo $pager; ?>

                                              </font></b></td>

                                          </tr>

                                          <tr align="left"> 

                                            <td width="42%"><b><font face="MS Sans Serif" size="2"><font color="#993399">อาชีพ 

                                              :</font></font></b></td>

                                            <td width="58%"><b><font face="MS Sans Serif" color="#333333" size="2"> 

                                              <? echo $occupation; ?>

                                              </font> </b></td>

                                          </tr>

                                          <tr align="left"> 

                                            <td width="42%"><b><font face="MS Sans Serif" size="2"><font color="#993399">รายได้ 

                                              :</font></font></b></td>

                                            <td width="58%"><b><font face="MS Sans Serif" color="#333333" size="2"> 

                                              <? echo $income; ?>

                                              </font> </b></td>

                                          </tr>

                                          <tr align="left">

                                            <td colspan="2" align="center" valign="middle">&nbsp;</td>

                                          </tr>

                                          <tr align="left"> 

                                            <td colspan="2" align="center" valign="middle"><b><font face="MS Sans Serif" size="2" color="#000000"> 
                                              <input type="radio" name="grouptype" value="old" checked>
                                              </font></b><font face="MS Sans Serif" size="2" color="#000000"> 
                                              <font size="1"> ต้องการเพิ่มรายชื่อในกลุ่ม</font></font><font size="1"><font face="MS Sans Serif" color="#000000">ที่มีอยู่แล้ว 
                                              ชื่อ</font></font><font face="MS Sans Serif" size="2" color="#000000"></font><b><font face="MS Sans Serif" size="2" color="#000000"> 
                                              </font><font size="2" face="MS Sans Serif"> 
                                              <select name="oldgroupname">
                                                <? 
$link=mysql_connect($host,$user,$pass) or die("ไม่สามารถติดต่อฐานข้อมูลได้");
		$sql4="select grp_name,grp_id  from group_name where mem_id=".$user_id.' order by grp_id';

		$result4=mysql_db_query($db,$sql4);

		$row=mysql_num_rows($result4);



		for($i=0;$i<$row;$i++){

					$data4=mysql_fetch_array($result4);

                            echo'<option value="'.$data4[1].'"><font face="MS Sans Serif" size="2" color="#000000">'.$data4[0].'</font></option>';

		}

?>
                                              </select>
                                              </font></b></td>

                                          </tr>

                                          <tr align="left"> 

                                            <td colspan="2" align="center" valign="middle"><b><font face="MS Sans Serif" size="2" color="#000000"> 
                                              <input type="radio" name="grouptype" value="new">
                                              </font></b><font face="MS Sans Serif" size="2" color="#000000"> 
                                              <font size="1">สร้างกลุ่มใหม่ ชื่อ</font></font><b><font face="MS Sans Serif" size="2" color="#000000"> 
                                              <input type="text" name="newgroupname" size="20" maxlength="30">
                                              <input type="hidden" name="view_mem_id" value="<? echo $view_mem_id;?>">
                                              <input type="hidden" name="lastpage" value="viewdetail">
                                              <input type="hidden" name="checkbox[<?echo$view_mem_id;?>]" value="<? echo $view_mem_id;?>">
                                              </font></b></td>

                                          </tr>

                                          <tr align="left"> 

                                            <td colspan="2" align="center" valign="middle"><b><font face="MS Sans Serif" size="2"></font></b><font face="MS Sans Serif"> 

<? if($data[16]<>$user_id) echo  '                                            <input type="submit" name="Submit" value="เพิ่มรายชื่อ">';mysql_close($link);?>

                                              </font></td>

                                          </tr>

                                          <tr align="left"> 

                                            <td colspan="2" align="center"> 

                                              <div align="center"><font face="MS Sans Serif" size="1" color="#CC0033"><? echo$msg;?></font></div>

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

                      <font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><img src="../images/login_line.gif" width="409" height="18"></b></font></div>

                  </td>

                </tr>

              </table>

            </form>

            <font color="#000000" face="MS Sans Serif" size="2"> </font></TD>

        </TR>

        </TBODY> 

      </TABLE>

    </TD></TR></TBODY></TABLE>



</BODY>



</HTML>



