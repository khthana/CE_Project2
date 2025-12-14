<?php
session_start();
include("checkauth.inc");

$link=mysql_connect($host,$user,$pass);



$sql="select mem_fname,mem_lname from member where mem_id='".$user_id."'";



$result=mysql_db_query($db,$sql);

$data=mysql_fetch_array($result);

$row=mysql_num_rows($result);



$firstname=$data[0];

$lastname=$data[1];

mysql_close($link);
//------------เช็คเพื่อมีเซสชั่นค้างอยู่----------------
		if($app_title<>"")
		{ session_unregister(app_title);
		}	
		if($app_note<>"")
		{ session_unregister(app_note);
		}
		if($app_duration<>"")
		{ session_unregister(app_duration);
		}	
		if($app_remind_before<>"")
		{ session_unregister(app_remind_before);
		}
		if($app_remind_before_hour<>"")
		{ session_unregister(app_remind_before_hour);
		}		
		if($app_remind_mail<>"")
		{ session_unregister(app_remind_mail);
		}
		if($list_friend_id<>"")
		{ session_unregister(list_friend_id);
		}
		if($list_group_id<>"")
		{ session_unregister(list_group_id);
		}
//-----------------------------------
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



onload="MM_preloadImages('../redpoint.gif','../carblue.gif','../sendpink.gif','../detailblue.gif','../logoutorg.gif','../docyellow.gif','../addresspink.gif','images/redpoint.gif','images/docyellow.gif','images/carblue.gif','images/messagegreen.gif','images/addresspink.gif','images/detailblue.gif','images/logoutorg.gif')">

<TABLE height=10 width="100%" border=0 cellpadding="0" cellspacing="0">



  <TBODY> 



  <TR>



    <TD height=39>&nbsp;</TD></TR>



  <TR>



    <TD height=8> <img src="./images/label1.gif" width="126" height="54" border="0"> 
      <a href="welcome.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','images/redpoint.gif',1)"><IMG 



      height=33 src="images/home.gif" width=90 border=0 



      name=Image1></a><a href="../reader.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image15','','images/docyellow.gif',1)"><img name="Image15" border="0" src="images/document.gif" width="90" height="33"></a><a href="schedule/sch_add.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','images/carblue.gif',1)"><IMG 



      height=33 src="images/carlendar.gif" width=90 border=0 



      name=Image2></a><a href="message/readmessage.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','images/messagegreen.gif',1)"><IMG 



      height=33 src="images/message.gif" width=90 border=0 



      name=Image4></a><a href="address/addressbook.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image14','','images/addresspink.gif',1)"><img name="Image14" border="0" src="images/address.gif" width="90" height="33"></a><a href="member/edit_profile.html" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','images/detailblue.gif',1)"><IMG 



      height=33 src="images/detail.gif" width=90 border=0 



      name=Image5></a><a href="member/logout.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image6','','images/logoutorg.gif',1)"><img 



      height=33 src="images/logout.gif" width=90 border=0 



      name=Image6></a></TD>



  </TR>



  <TR> 



    <TD height="18"><img src="./images/bolder2.gif" width="140" height="18"><img src="./images/bolder1.gif" width="630" height="18"></TD>



  </TR>







  <TR vAlign=top align=left>



    <TD>



      <TABLE height=464 width="100%" border=0>

        <TBODY> 

        <TR align="center" bgcolor="#FFFFFF"> 

          <TD vAlign=top width="22%" align="left"> 

            <div align="right"> </div>

            <div align="left">

<? //ปฏิทินด้านขวา--------------------------- ?>

<?



	Include("schedule/time.inc");

 	Include("schedule/thaidate.inc");



if(!isset($schday))

{

	$schday=date("w");

}

if(!isset($schdate))

{

	$schdate=date("j");

}

if(!isset($schmonth))

{

	$schmonth=date("m");

}

if(!isset($schyear))

{

	$schyear=date("Y");

}



?>







              <table cellspacing=0 cellpadding=1 width="98%" border=1 bordercolor="#FF9900">
                <tbody> 
                <tr bgcolor="#FF9900"> 

                                    <td noWrap align=middle colspan=4> 

                                      <div align="left"><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFCC" size="2"><b>วันนี้ 

                                        :</b> <a href="schedule/sch_add.php?schday=<? echo date("w"); ?>&schdate=<? echo date("j"); ?>&schmonth=<? echo date("m"); ?>&schyear=<? echo date("Y"); ?>"> 

                                        <font color="#FFFFCC" size="2"> <? echo date("j")," ",$thaimonth[date("m")-1]," ",date("Y")+543;    

?> </font></a> </font></div>

                                    </td>

                                  </tr>

                                  <tr bgcolor=#ffffff> 

                                    <td align=middle bgcolor=#FFCC99 width="25%" height="12"><a href="schedule/sch_add.php?schday=<? echo $schday; ?>&schdate=<? echo $schdate; ?>&schmonth=<? echo $schmonth; ?>&schyear=<? echo $schyear; ?>">&nbsp;<font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#FF0000">วัน</font></a></td>

                                    <td align=middle bgcolor=#ffffff width="25%" height="12"><a href="schedule/sch_add_week.php?schday=<? echo $schday; ?>&schdate=<? echo $schdate; ?>&schmonth=<? echo $schmonth; ?>&schyear=<? echo $schyear; ?>">&nbsp;<font face="MS Sans Serif, Microsoft Sans Serif" size="2"><font color="#009900">สัปดาห์</font></font></a></td>

                                    <td align=middle bgcolor=#ffffff width="25%" height="12"><a href="schedule/sch_add_month.php?schday=<? echo $schday; ?>&schdate=<? echo $schdate; ?>&schmonth=<? echo $schmonth; ?>&schyear=<? echo $schyear; ?>"><font color="#009900">&nbsp;<font face="MS Sans Serif, Microsoft Sans Serif" size="2">เดือน</font></font></a></td>

                                    <td align=middle bgcolor=#ffffff width="25%" height="12"><a href="schedule/sch_add_year.php?schday=<? echo $schday; ?>&schdate=<? echo $schdate; ?>&schmonth=<? echo $schmonth; ?>&schyear=<? echo $schyear; ?>"><font color="#009900">&nbsp;<font face="MS Sans Serif, Microsoft Sans Serif" size="2">ปี</font></font></a></td>

                                  </tr>

                                  <tr> 

                                    <td noWrap align=middle bgcolor=#dcdcdc colspan=4 height="32"> 

                                      <table cellspacing=0 cellpadding=1 border=0>

                                        <tbody> 

                                        <tr> <?

//-----next month

	$next_month= date("d/m/Y",mktime(1,1,0,$schmonth+1,1,$schyear));

	$nx_day=(int) date("w",mktime(1,1,0,$schmonth+1,1,$schyear));

	$nx_date=(int) substr($next_month,0,2);

	$nx_month=(int) substr($next_month,3,2);

	$nx_year= substr($next_month,6,4);

//----previous month

	$pre_month= date("d/m/Y",mktime(1,1,0,$schmonth-1,1,$schyear));

	$pr_day=(int) date("w",mktime(1,1,0,$schmonth-1,1,$schyear));

	$pr_date=(int) substr($pre_month,0,2);

	$pr_month=(int) substr($pre_month,3,2);

	$pr_year= substr($pre_month,6,4);





?> 

                                          

                        <td><a 

                  href="schedule/sch_add.php?schday=<? echo $pr_day; ?>&schdate=<? echo $pr_date; ?>&schmonth=<? echo $pr_month; ?>&schyear=<? echo $pr_year; ?>"> 

                          <img height=11 src="images/left4.gif" width=11 

                  border=0></a> </td>

                                          <td valign=center noWrap><tt><b> <font face="MS Sans Serif,Microsoft Sans Serif" size="2" color="#FF6600"> 

                                            <?

	echo $thaimonth[$schmonth-1]," ",$schyear+543;

?> </font></b></tt> </td>

                                          

                        <td><a 

                  href="schedule/sch_add.php?schday=<? echo $nx_day; ?>&schdate=<? echo $nx_date; ?>&schmonth=<? echo $nx_month; ?>&schyear=<? echo $nx_year; ?>"> 

                          <img height=11 src="images/right4.gif" width=11 

                  border=0></a> </td>

                                        </tr>

                                        </tbody> 

                                      </table>

                                    </td>

                                  </tr>

                                  <tr> 

                                    <td align=middle colspan=4> <?

$host="localhost";



$usersql="magazine";



$password="magazine";



$table="schedule";



$db="magazine";



$link=mysql_connect($host,$usersql,$password) or



die("ไม่สามารถติดต่อฐานข้อมูลได้");



mysql_select_db("magazine") or die("ไม่สามารถติดต่อแฟ้มข้อมูลได้"); 



// ปฏิทินด้านขวา***************

include("schedule/sch_day_of_month.inc");//$day_of_month[0-34] or [0-42] ,$num_week

?> 

                                      <table width= 100% cellspacing=3 cellpadding=1 bgcolor=#ffffff border=0>

                                        <tbody> 

                                        <tr> <?

$start=0;

for($i=0;$i<7;$i++)//week

{

?> 

                                          <td valign=top align=right><font face="MS Sans Serif,Microsoft Sans Serif" size="2" color="#000000"> 

                                            <?

	$num_show=$start+$i;

    echo $thaiday_short[$i],"<br>";

	for($j=0;$j<$num_week;$j++)

    {

	  $show_date=(int) substr($day_of_month[$num_show],0,2);

	  $tmp_month=(int) substr($day_of_month[$num_show],3,2);

	  $tmp_year=(int) substr($day_of_month[$num_show],6,4);

?></font> <a href="schedule/sch_add.php?schday=<? echo $i; ?>&schdate=<? echo $show_date; ?>&schmonth=<? echo $tmp_month; ?>&schyear=<? echo $tmp_year; ?>"> 

                                            <font face="MS Sans Serif,Microsoft Sans Serif" size="2" color="#000000">	

                                            <?

// เช็ควันที่อยู่ในปฏิทินแต่เป็นของเดือนก่อนกับเดือนหน้า

$last_week=$num_week-1;

	  if(($j==0 and $show_date>7) || ($j==$last_week and $show_date<7))

	  { 

		echo "<font color=#999999>";

//แสดงตัวหนา

		    if($show_date==$schdate and $tmp_month==$schmonth) 

			{ echo "<b>",$show_date,"</b><br></font>";

			}else

			{ echo $show_date,"<br></font>";

			}

	  }else

	  {

		echo "<font color=#0000FF>";

		    if($show_date==$schdate and $tmp_month==$schmonth) 

			{ echo "<b>",$show_date,"</b><br></font>";

			}else

			{ echo $show_date,"<br></font>";

			}

	  }		

	  $num_show=$num_show+7;	

	} 

?> </font></a></td>

                                          <?

}

?> </tr>

                                        </tbody> 

                                      </table>

 </td>

                                  </tr>

                                  <tr bgcolor="#CCCCCC"> 

                                    <td noWrap align=middle colspan=4 height="10">&nbsp;</td>

                                  </tr>

                                  </tbody> 

                                </table>

 <? //หมดปฏิทินด้านขวา -------------------------------------?>                                

              <table width="98%" border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td>&nbsp;</td>
                </tr>
                <tr align="left" valign="top">
                  <td nowrap colspan="2" height="25"> 
                    <div align="right"><a href="schedule/sch_add2.php"><img src="images/sch_quick.gif" width="150" height="20" border="0"></a></div>
                  </td>
                </tr>
                <tr align="left" valign="top"> 
                  <td nowrap colspan="2" height="25"> 
                    <div align="right"><a href="appointment/app_add1.php?quick_butt=Y"><img src="images/app_quick.gif" width="150" height="20" border="0"></a></div>
                  </td>
                </tr>
<?
$host="localhost";

$usersql="magazine";

$password="magazine";

$table="schedule";

$db="magazine";

$link=mysql_connect($host,$usersql,$password) or

die("ไม่สามารถติดต่อฐานข้อมูลได้");

mysql_select_db("magazine") or die("ไม่สามารถติดต่อแฟ้มข้อมูลได้"); 

 $sql_writer="select mem_id from writer where mem_id = $user_id";
$result_aw=mysql_db_query("magazine",$sql_writer);
$num_aw=@mysql_num_rows($result_aw);
if($num_aw>0)
{
	$user_calendar="W";
	$num_aw=0;
}
 $sql_admin="select mem_id from admin where mem_id = $user_id";
$result_aw=mysql_db_query("magazine",$sql_admin);
$num_aw=@mysql_num_rows($result_aw);
if($num_aw>0)
{
		$user_calendar=="A";
		$num_aw=0;
}
mysql_close();

if($user_calendar=="A" || $user_calendar=="W")
{
?>
                <tr align="left" valign="top"> 
                  <td nowrap colspan="2" height="25"> 
                    <div align="right"><a href="../document/edit_article/page_edit.php"><img src="images/write_column.gif" width="148" height="20" border="0"></a></div>
                  </td>
                </tr>
<?
} //เช็คสิทธ์เขียน
?>
<?
if($user_calendar=="A")
{
?>
                <tr align="left" valign="top"> 
                  <td nowrap colspan="2" height="25"> 
                    <div align="right"><a href="admin/adminpage.php"><img src="images/admin.gif" width="149" height="22" border="0"></a></div>
                  </td>
                </tr>
<?
} //เช็คผู้ดูแลระบบ
?>
                <tr align="left" valign="top"> 
                  <td colspan="2" height="100">&nbsp; </td>
                </tr>
                <? //------------หมด เตือน ตาราง------------ ?> 
              </table>

            </div>

          </TD>

          <TD vAlign=top width="78%" align="left"> 

            <div align="left">

              <table width="100%" border="0" cellspacing="0" cellpadding="0">

                <tr> 

                  <td width="5%">&nbsp;</td>

                  <td colspan="3" bgcolor="#FFFFFF"> <font size="2" color="#0066FF" face="AngsanaUPC, Angsana New, MS Serif"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#999933">สวัสดีครับ 

                    คุณ</font></b></font><font face="MS Sans Serif, Microsoft Sans Serif" color="#999933"><b><font size="2"> 

                    <?php echo ' '.$firstname.' '.$lastname; ?></font> </b></font> 

                  </td>

                </tr>

                <tr> 

                  <td width="5%">&nbsp;</td>

                  <td colspan="3"><img src="images/welcomeline.gif" width="500" height="10"></td>

                </tr>

                <tr> 

                  <td width="5%">&nbsp;</td>

                  <td colspan="3">&nbsp;</td>

                </tr>

                <tr> 

                  <td width="7%">&nbsp;</td>

                  <td width="45%"> 

                    <table width="100%" border="0" cellspacing="1" cellpadding="1" bordercolorlight="#FFFF33">

                      <tr bgcolor="#FFFFFF"> 

                        <td height="31"> 

                          <div align="left"><font size="2" face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#FF9900">เตือนงานผ่านเว็บ 

                            : </font></b></font></div>

                        </td>

                      </tr>

                      <tr bgcolor="#FFFFFF">

                        <td><img src="images/remindline.gif" width="170" height="15"></td>

                      </tr>
						

                      <tr bgcolor="#FFFFFF"> 

                        <td> <font face="MS Sans Serif, Microsoft Sans Serif" size="1"> 

                          <? include("schedule/sch_remind1.inc"); ?> &nbsp;</font></td>

                      </tr>
						<tr><td>&nbsp;
						</td></tr>

                      <tr> 

                        <td>
                          <table width="80%" border="1" cellspacing="0" cellpadding="0">
                            <tr bgcolor="#FFCC99"> 
                              <td> 
                                <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#666666">ข้อความ</font></b></font></div>
                              </td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td>
                                <div align="center"><? include("checkmessage.inc"); ?> &nbsp;</div>
                              </td>
                            </tr>
                          </table>
                        </td>

                      </tr>

                    </table>

<? // empty table ?>

					<table width="10%" height="100%" cellpadding="0" cellspacing="0" border="0">

                      <tr><td>&nbsp;</td></tr></table>



                  </td>

                  <td width="5" background="images/hline.gif"><font color=#FFFFFF>&nbsp;..</font></td>

                  <td width="50%"> 

                    <table width="100%" border="0" cellspacing="1" cellpadding="1" bordercolorlight="#FFCC00">

                      <tr bgcolor="#FFFFFF"> 

                        <td><a href="appointment/app_list.php"><font size="1" face="MS Sans Serif, Microsoft Sans Serif" color="#FF6600">&lt;&lt;ดูการนัดหมายทั้งหมด&gt;&gt;</font></a></td>

                      </tr>

                      <tr> 

                        <td bgcolor="#FF9900"> 

                          <div align="left"><font size="2" face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#FFFFFF">การนัดหมายใหม่:</font></b></font></div>

                        </td>

                      </tr>

                      <tr> 

                        <td> <font face="MS Sans Serif, Microsoft Sans Serif" size="1"> 

                          <? //การนัดหมายใหม่

							 include("appointment/app_message1.inc"); ?> &nbsp; 

                          </font> </td>

                      </tr>

                      <tr> 

                        <td bgcolor="#FF9933"> 

                          <div align="left"><font color="#FF6600"><b><font size="2" face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">การตอบรับการนัดหมาย 

                            <font color="#FFFF00">New !!</font></font></b></font></div>

                        </td>

                      </tr>

                      <tr> 

                        <td><font face="MS Sans Serif, Microsoft Sans Serif" size="1"> 

                          <?  //การตอบรับการนัดหมาย

							include("appointment/app_mess_tosender.inc"); 

							// การตอบจากadmingเมื่อเลยนัด

							include("appointment/app_not_ans.inc"); //สถานะเพื่อนยังเป็นNE and PS

							?> &nbsp;</font></td>

                      </tr>

                      <tr> 

                        <td bgcolor="#FF9933"> 

                          <div align="left"><font size="2" face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#FFFFFF">นัดหมายที่ขอคิดดูก่อน</font></b></font></div>

                        </td>

                      </tr>

                      <tr> 

                        <td><font face="MS Sans Serif, Microsoft Sans Serif" size="1"> 

                          <?  //ขอคิดดูก่อน

							include("appointment/app_postpone.inc");

							 ?> &nbsp;</font></td>

                      </tr>

                      <tr> 

                        <td bgcolor="#FF9933"> 

                          <div align="left"><font size="2" face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#FFFFFF">นัดหมายที่รอการตอบรับ</font></b></font></div>

                        </td>

                      </tr>

                      <tr> 

                        <td bgcolor="#F2F2F2"><font face="MS Sans Serif, Microsoft Sans Serif" size="1"> 

                          <?  //นัดหมายที่รอการตอบรับ

							include("appointment/app_waitapp.inc");

							?>&nbsp;</font></td>

                      </tr>

                    </table>

                  </td>

                </tr>

                <tr> 

                  <td width="5%">&nbsp;</td>

                  <td colspan="3">&nbsp;</td>

                </tr>

              </table>

            </div>

          </TD>

        </TR>

        </TBODY> 

      </TABLE>

    </TD></TR></TBODY></TABLE>



</BODY>



</HTML>



