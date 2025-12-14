<?
session_start();
include("../checkauth.inc");

//------------------------------------------
function sendmail($friend,$mail_date,$mail_time,$title,$mem_id)
{
		$sql_user="select mem_username,mem_fname from member where mem_id=$mem_id ";
		$result_user= mysql_db_query("magazine",$sql_user);
		$row_user=mysql_fetch_array($result_user);
		$mem_username=$row_user[0];
		$mem_fname=$row_user[1];
		$title=stripslashes($title);
		//สร้างข้อความ
			$subject="การนัดหมายใหม่ จาก :$mem_username ( $mem_fname )";
			$message= "จาก : $mem_username ( $mem_fname ) \n";
			$message.="วันที่นัด : $mail_date    เวลา : $mail_time \n";
			$message.="เรื่อง : $title \n";
			$message.="รายละเอียดการนัดอ่านได้ที่ http://document.ce.kmitl.ac.th/ \n ";
			$message.="กรุณาเข้าไปในระบบปฏิทินนัดหมายเพื่อทำการตอบการนัดหมายด้วยค่ะ \n";
			$message.="------------------------------------- \n";	
			$message.="ระบบปฏิทินนัดหมายใน http://document.ce.kmitl.ac.th/ \n";
			$header="From : magazine@olala05.ce.kmitl.ac.th \n";

		$sql_email="select mem_username,mem_fname,mem_lname,mem_email from member where mem_id=$friend ";
		$result_email= mysql_db_query("magazine",$sql_email);
		$numrow=@mysql_num_rows($result_email);
		$row_email=mysql_fetch_array($result_email);
		$fr_username=$row_email[0];
		$fr_fname=$row_email[1];
		$fr_lname=$row_email[2];
		$fr_email=trim($row_email[3]);
		$message2= "ถึง : $fr_fname  $fr_lname \n";
		$message2=$message2.$message;
		mail($fr_email,$subject,$message2,$header);
	return 1;
} //function
//----------------------------------------------------------------


if ($edit_butt=="กลับไปแก้ไข")
{
		$app_title=trim($title);
		$app_note=trim($note);
		$app_duration=$app_duration;
		$app_remind_before=$app_remind_before;
		$app_remind_before_hour=$app_remind_before_hour;	
		$app_remind_mail=$app_remind_mail;
		header("Location:../appointment/app_add_group.php?time=$time&schday=$schday&schdate=$schdate&schmonth=$schmonth&schyear=$schyear&edit_butt=Y");
}elseif ($appoint=="ยืนยันการนัดหมาย")
{
	$host="localhost";

	$usersql="magazine";

	$password="magazine";

	$table="schedule";

	$db="magazine";

	$link=mysql_connect($host,$usersql,$password) or

	die("ไม่สามารถติดต่อฐานข้อมูลได้");

	mysql_select_db("magazine") or die("ไม่สามารถติดต่อแฟ้มข้อมูลได้"); 
//	echo "year=",$year,"  month=",$month," date =",$bddate;

		$app_title=trim($title);
		$app_note=trim($note);
		$app_duration=$app_duration;
		$app_remind_before=$app_remind_before;
		$app_remind_before_hour=$app_remind_before_hour;	
		$app_remind_mail=$app_remind_mail;

$tmp_year=$schyear+543;
$tmpmonth=$schmonth-1;
$maildate=$schdate." $thaimonth_short[$tmpmonth] ".$tmp_year;
$mailtime=$time.":00 น.";
	
$appdate2=$schyear."-".$schmonth."-".$schdate;
$apptime2=$time.":00:00";
if($app_remind_mail=="yes")
{ $tmp_remind_mail="Y";
}else
{
	$tmp_remind_mail="N";
}
	 $sqlinsert="insert into appointment(mem_id,app_date,app_time, app_title,app_note,app_duration,app_remind_before,app_remind_before_hour,app_remind_mail)  values($user_id,'$appdate2','$apptime2','$app_title','$app_note','$app_duration','$app_remind_before','$app_remind_before_hour','$tmp_remind_mail')";
   mysql_db_query("magazine",$sqlinsert);
	$sqlselect="select app_id from appointment where mem_id=$user_id and app_date='$appdate2' and app_time='$apptime2' and app_title='$app_title' order by app_id desc";
$result= mysql_db_query("magazine",$sqlselect);
$row=mysql_fetch_array($result);
$app_id=$row[0];
//เอาชื่อเพื่อนกับid มาทำเป็นตัวแปรเที่ยบกับที่ส่งมา
$listgroup=split("/",$list_group_id);
$numgroup_chk=count($listgroup);

for($grp=1;$grp<$numgroup_chk;$grp++)
{
			$sql_friend="select friend_id,mem_username from member m1,contact c1 where m1.mem_id=c1.friend_id and c1.mem_id=$user_id and grp_id=$listgroup[$grp] order by c1.friend_id";
			$resultfriend=mysql_db_query("magazine",$sql_friend);
			$numfriend=@mysql_num_rows($resultfriend);
			if($numfriend<1)
			{  //ไม่มีเพื่อนในกลุ่ม
			}else
			{
				for($j=0;$j<$numfriend;$j++)
				{
					$rowfriend=mysql_fetch_array($resultfriend);
					$friend_id=$rowfriend[0];
					//ใส่ข้อมูลเพื่อนลง appoint_receiver	
					$sqlinsert="insert into appoint_receiver(app_id,sender_id,friend_id,apr_status) values($app_id,$user_id,$friend_id,'NE')";
					mysql_db_query("magazine",$sqlinsert);				
					// ฟังก์ชันส่งเมล์แจ้งนัดหมายใหม่
					sendmail($friend_id,$maildate,$mailtime,$app_title,$user_id);

				} //for 
			} //else numfriend

} // for numgroup

	session_unregister(list_group_id);
	session_unregister(from_sch);
	session_unregister(app_title);
	session_unregister(app_note);
	session_unregister(app_duration);
	session_unregister(app_remind_before);
	session_unregister(app_remind_before_hour);
	session_unregister(app_remind_mail);
mysql_close();
header("Location:../appointment/app_add3.php?schday=$schday&schdate=$schdate&schmonth=$schmonth&schyear=$schyear");
$num_chk="T";
	} // if $appoint

if ($num_chk<>"T")
{
?>

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
onload="MM_preloadImages('../redpoint.gif','../carblue.gif','../sendpink.gif','../detailblue.gif','../logoutorg.gif','../docyellow.gif','../addresspink.gif','../image/detailblue.gif')">
<?

	Include("time.inc");
 	Include("thaidate.inc");

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
<TABLE width="120%" border=0 cellpadding="0" cellspacing="0">
  <TBODY> 
  <TR>
    <TD height=39>&nbsp;</TD></TR>
  <TR>
    <TD height=8> <img src="../images/label1.gif" width="126" height="54" border="0"> 
      <A onmouseover="MM_swapImage('Image1','','../images/redpoint.gif',1)" 
      onmouseout=MM_swapImgRestore() 
      href="../welcome.php"><IMG 
      height=33 src="../images/home.gif" width=90 border=0 
      name=Image1></A><a href="../../reader.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image15','','../images/docyellow.gif',1)"><img name="Image15" border="0" src="../images/document.gif" width="90" height="33"></a><A onmouseover="MM_swapImage('Image2','','../images/carblue.gif',1)" 
      onmouseout=MM_swapImgRestore() 
      href="../schedule/sch_add.php"><IMG 
      height=33 src="../images/carlendar.gif" width=90 border=0 
      name=Image2></A><A 
      onmouseover="MM_swapImage('Image4','','../images/messagegreen.gif',1)" 
      onmouseout=MM_swapImgRestore() 
      href="../message/readmessage.php"><IMG 
      height=33 src="../images/message.gif" width=90 border=0 
      name=Image4></A><a href="../address/addressbook.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image14','','../images/addresspink.gif',1)"><img name="Image14" border="0" src="../images/address.gif" width="90" height="33"></a><A 
      onmouseover="MM_swapImage('Image5','','../images/detailblue.gif',1)" 
      onmouseout=MM_swapImgRestore() 
      href="../member/edit_profile.html"><IMG 
      height=33 src="../images/detail.gif" width=90 border=0 
      name=Image5></A><A 
      onmouseover="MM_swapImage('Image6','','../images/logoutorg.gif',1)" 
      onmouseout=MM_swapImgRestore() 
      href="../member/logout.php"><IMG 
      height=33 src="../images/logout.gif" width=90 border=0 
      name=Image6></A></TD>
  </TR>
  <TR> 
    <TD height="18"><img src="../images/bolder2.gif" width="130" height="18"><img src="../images/bolder1.gif" width="630" height="18"></TD>
  </TR>

  <TR vAlign=top align=left>
    <TD>
      <TABLE height=464 width="100%" border=0>
        <TBODY>
        <TR>
          <TD vAlign=top align=left width="21%"> 

              <table width="98%" border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  
                <td nowrap colspan="2"> 
                  <div align="center"></div>
                  </td>
                </tr>
                <tr> 
                  <td colspan="2" bgcolor="#FFFFFF" nowrap> 
                    <div align="center"> 
                      <table width="180" border="0" cellspacing="0" cellpadding="0">
                        <tr> 
                          <td height="109"> 
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" bordercolor="">
                              <tr>
                                
                              <td>
                                <table cellspacing=0 cellpadding=1 width="100%" border=1 bordercolor="#FF9900">
                                  <tbody> 
                                  <tr bgcolor="#FF9900"> 
          <td noWrap align=middle colspan=4> 
            <div align="left"><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFCC" size="2"><b>วันนี้ :</b>
 <a href="../schedule/sch_add.php?schday=<? echo date("w"); ?>&schdate=<? echo date("j"); ?>&schmonth=<? echo date("m"); ?>&schyear=<? echo date("Y"); ?>">
<font color="#FFFFCC" size="2">

<? echo date("j")," ",$thaimonth[date("m")-1]," ",date("Y")+543;    
?>
		 </font></a>
     </font></div></td>
        </tr>

        <tr bgcolor=#ffffff> 
          <td align=middle bgcolor=#FFCC99 width="25%" height="12"><a href="../schedule/sch_add.php?schday=<? echo $schday; ?>&schdate=<? echo $schdate; ?>&schmonth=<? echo $schmonth; ?>&schyear=<? echo $schyear; ?>">&nbsp;<font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#FF0000">วัน</font></a></td>
          <td align=middle bgcolor=#ffffff width="25%" height="12"><a href="../schedule/sch_add_week.php?schday=<? echo $schday; ?>&schdate=<? echo $schdate; ?>&schmonth=<? echo $schmonth; ?>&schyear=<? echo $schyear; ?>">&nbsp;<font face="MS Sans Serif, Microsoft Sans Serif" size="2"><font color="#009900">สัปดาห์</font></font></a></td>
          <td align=middle bgcolor=#ffffff width="25%" height="12"><a href="../schedule/sch_add_month.php?schday=<? echo $schday; ?>&schdate=<? echo $schdate; ?>&schmonth=<? echo $schmonth; ?>&schyear=<? echo $schyear; ?>"><font color="#009900">&nbsp;<font face="MS Sans Serif, Microsoft Sans Serif" size="2">เดือน</font></font></a></td>
          <td align=middle bgcolor=#ffffff width="25%" height="12"><a href="../schedule/sch_add_year.php?schday=<? echo $schday; ?>&schdate=<? echo $schdate; ?>&schmonth=<? echo $schmonth; ?>&schyear=<? echo $schyear; ?>"><font color="#009900">&nbsp;<font face="MS Sans Serif, Microsoft Sans Serif" size="2">ปี</font></font></a></td>
        </tr>
        <tr> 
          <td noWrap align=middle bgcolor=#dcdcdc colspan=4 height="32"> 
            <table cellspacing=0 cellpadding=1 border=0>
              <tbody> 
              <tr>
<?
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
                  href="../schedule/sch_add.php?schday=<? echo $pr_day; ?>&schdate=<? echo $pr_date; ?>&schmonth=<? echo $pr_month; ?>&schyear=<? echo $pr_year; ?>"> 
                                            <img height=10 src="../images/left4.gif" width=11 
                  border=0></a> </td>
                <td valign=center noWrap><tt><b>
				<font face="MS Sans Serif,Microsoft Sans Serif" size="2" color="#FF6600">
<?
	echo $thaimonth[$schmonth-1]," ",$schyear+543;
?>
				</font></b></tt> </td>
                                          <td><a 
                  href="../schedule/sch_add.php?schday=<? echo $nx_day; ?>&schdate=<? echo $nx_date; ?>&schmonth=<? echo $nx_month; ?>&schyear=<? echo $nx_year; ?>"> 
                                            <img height=11 src="../images/right4.gif" width=11 
                  border=0></a> </td>
              </tr>
              </tbody> 
            </table>
          </td>
        </tr>
        <tr> 
          <td align=middle colspan=4> 
<?

// ปฏิทินด้านขวา***************
include("sch_day_of_month.inc");//$day_of_month[0-34] or [0-42] ,$num_week
?> 
            <table width= 100% cellspacing=3 cellpadding=1 bgcolor=#ffffff border=0>
        <tbody>
        <tr>
<?
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
?></font> <a href="../schedule/sch_add.php?schday=<? echo $i; ?>&schdate=<? echo $show_date; ?>&schmonth=<? echo $tmp_month; ?>&schyear=<? echo $tmp_year; ?>"> 
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
?>
        </tr>
        </tbody> 
      </table>                
<? //หมดปฏิทินด้านขวา 
?>
          </td>
        </tr>
        <tr bgcolor="#CCCCCC"> 
          <td noWrap align=middle colspan=4 height="10">&nbsp;</td>
        </tr>
        </tbody> 
      </table>

								&nbsp; <? //--------------  หมดปฏิทินด้านขวา     -------------------- ?></td>
                              </tr>
                            </table>
                          </td>
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
                        <td colspan="2" bgcolor="#FFFFFF" height="150"> 
                          <div align="center"> 
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr> 
                                <td height="72"> 
                                  <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FAAB34" height="91">
                                    <tr> 
                                      <td height="97"> 
                                        <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                          <tr> 
                                            <td height="34" colspan="2"><font size="2"><font color="#0066FF" face="AngsanaUPC, Angsana New, MS Serif"><?php include("../checkmessage.inc"); ?></font></font></td>
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
                        <td colspan="2" height="69"> 
                          <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FFB038">
                            <tr> 
                              <td height="83"> 
                                <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                  <tr> 
                                    <td height="34" colspan="2"><font size="1"><font color="#0066FF" face="MS Sans Serif, Microsoft Sans Serif"><?php include("../remind/sch_remindside.inc"); ?></font></font></td>
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
                        <td colspan="2" height="2">&nbsp;</td>
                      </tr>
                      <? //------------หมด เตือน ตาราง------------ ?> 
                      <tr align="left" valign="top"> 
                        <td colspan="2" height="9"><img src="../images/app_remindhead.gif" width="188" height="20"></td>
                      </tr>
                      <tr align="left" valign="top"> 
                        <td colspan="2"> 
                          <div align="center"> 
                            <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FF9933">
                              <tr> 
                                <td height="88"> 
                                  <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                    <tr> 
                                      <td height="34" colspan="2"><font size="1"><font color="#0066FF" face="MS Sans Serif, Microsoft Sans Serif"><?php include("../remind/app_messbeside.inc"); ?></font></font></td>
                                    </tr>
                                    <tr> 
                                      <td height="31" colspan="2"><font size="1"><font color="#0066FF" face="MS Sans Serif, Microsoft Sans Serif"><?php include("../remind/app_mess_tosenderbeside.inc"); ?></font></font></td>
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
                  </div>
                  </td>
                </tr>
                <tr> 
                  <td colspan="2">
                    
                  <div align="center"></div>
                  </td>
                </tr>
                <tr> 
                  <td colspan="2" height="35"> 
                    
                  <div align="center"></div>
                  </td>
                </tr>
              </table>
          </TD>
          <TD width="79%"> 
      <form method="post" action="app_add_group2.php?time=<? echo $time; ?>&schday=<? echo $schday; ?>&schdate=<? echo $schdate; ?>&schmonth=<? echo $schmonth; ?>&schyear=<? echo $schyear; ?>">
<?
$host="localhost";

$usersql="magazine";

$password="magazine";

$table="schedule";

$db="magazine";

$link=mysql_connect($host,$usersql,$password) or

die("ไม่สามารถติดต่อฐานข้อมูลได้");

mysql_select_db("magazine") or die("ไม่สามารถติดต่อแฟ้มข้อมูลได้"); 

?>
              <table width="90%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="10%">&nbsp;</td>
                  <td colspan="2">&nbsp;</td>
                </tr>
                <tr> 
                  <td width="10%">&nbsp;</td>
                  <td colspan="2"><b><font color="#0066FF" size="2" face="MS Sans Serif, Microsoft Sans Serif">คุณต้องการส่งการนัดหมาย 
                    &gt;&gt; </font></b></td>
                </tr>
                <tr> 
                  <td width="10%">&nbsp;</td>
                  <td colspan="2"><font size="1"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#666666">ถึง 
                    : </font></b><br>
                    <font face="MS Sans Serif, Microsoft Sans Serif" color="#0033CC"> 
                    <?
$listgroup=split("/",$list_group_id);
$numgroup_chk=count($listgroup);
for($grp=1;$grp<$numgroup_chk;$grp++)
{
	$sqlgroup="select grp_name from group_name where grp_id=$listgroup[$grp] and mem_id=$user_id";
	$resultgroup= mysql_db_query("magazine",$sqlgroup);	
  $rowgroup=mysql_fetch_array($resultgroup);
	$grp_name=$rowgroup[0];		
	$tmptxt=$grp_name." ( ";
	$sqlfriend="select friend_id,mem_username,mem_fname from member,contact ";
	$sqlfriend=$sqlfriend."where member.mem_id=contact.friend_id and contact.mem_id=$user_id and grp_id=$listgroup[$grp] order by mem_username";
	$result= mysql_db_query("magazine",$sqlfriend);
	$numrow=@mysql_num_rows($result);
	if ($numrow<1)
	{ $tmptxt=$tmptxt."ไม่มีรายชื่อบุคคล";
	}else
	{
		for($i=0;$i<$numrow;$i++)
		{
		   $row=mysql_fetch_array($result);		
			$tmptxt=$tmptxt.$row[1].",";
		} //for $numrow

	} //else
	$tmptxt=$tmptxt.")";
	echo "&nbsp;&nbsp;&nbsp;&nbsp; $tmptxt <br>";
} //for $grp

$app_title=stripslashes($app_title);
$app_title=str_replace('"','&quot;',$app_title);

$app_note=stripslashes($app_note);
$app_note=str_replace('"','&quot;',$app_note);

?> </font></font></td>
                </tr>
                <tr> 
                  <td width="10%">&nbsp;</td>
                  <td colspan="2"><font color="#666666"><b><font size="1" face="MS Sans Serif, Microsoft Sans Serif">วันนัดหมาย 
                    : </font></b><font  face="MS Sans Serif, Microsoft Sans Serif" color="#0033CC" size="2">&nbsp; 
                    <? echo $schdate," ",$thaimonth[$schmonth-1]," ",$schyear+543; ?><b><font size="1" color="#666666">&nbsp;&nbsp;เวลา 
                    :</font></b><font  face="MS Sans Serif, Microsoft Sans Serif" color="#0033CC" size="2">&nbsp;<? echo $time.":00น."; ?></font></font></font></td>
                </tr>
                <tr> 
                  <td width="10%">&nbsp;</td>
                  <td colspan="2"><b><font color="#666666" size="1" face="MS Sans Serif, Microsoft Sans Serif">เรื่อง 
                    : </font></b><font  face="MS Sans Serif, Microsoft Sans Serif" color="#0033CC" size="2">&nbsp;<? echo $app_title; ?></font></td>
                </tr>
                <tr> 
                  <td width="10%" height="27">&nbsp;</td>
                  <td colspan="2"><b><font color="#666666" size="1" face="MS Sans Serif, Microsoft Sans Serif">ข้อความ 
                    : </font></b></td>
                </tr>
                <tr> 
                  <td width="10%">&nbsp;</td>
                  <td width="55%"> <font color="#0033CC" size="1" face="MS Sans Serif, Microsoft Sans Serif"> 
                    <? echo $app_note; ?> </font> </td>
                  <td width="25%">&nbsp;</td>
                </tr>
                <tr> 
                  <td width="10%">&nbsp;</td>
                  <td colspan="2"><font size="1" face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#666666">ระยะเวลาที่นัด 
                    : </font></b><font color="#0033CC" size="2">&nbsp; <? echo $app_duration; ?></font></font> 
                    <font size="1" face="MS Sans Serif, Microsoft Sans Serif" color="#666666"><b>ชม. 
                    &nbsp;&nbsp;&nbsp;&nbsp; </b></font></td>
                </tr>
                <tr>
                  <td width="10%">&nbsp;</td>
                  <td colspan="2"><font size="1" face="MS Sans Serif, Microsoft Sans Serif" color="#666666"><b>กำหนดให้มีการเตือนการนัดก่อน 
                    : </b><font color="#0033CC" size="2">&nbsp; <? echo $app_remind_before; ?></font></font> 
                    <b><font size="1" face="MS Sans Serif, Microsoft Sans Serif" color="#666666">วัน</font></b> 
                <font face="MS Sans Serif, Microsoft Sans Serif" size="1" color="#666666"><font color="#0033CC" size="2">&nbsp; <? echo $app_remind_before_hour; ?></font><b>ชม.</b></font>
                  </td>
                </tr>
                <tr> 
                  <td width="10%">&nbsp;</td>
<?
if($app_remind_mail=="yes")
{
	$tmp_remind_mail="ใช่";
}else
{
	$tmp_remind_mail="ไม่ใช่";
}
?>
                  <td colspan="2"><font face="MS Sans Serif, Microsoft Sans Serif" size="1" color="#666666"><b>เตือนงานผ่านอีเมล์ 
                    : &nbsp; </b><font color="#0033CC" size="2"><? echo $tmp_remind_mail; ?></font></font></td>
                </tr>
                <tr> 
                  <td width="10%">&nbsp;</td>
                  <td colspan="2">
                    <input type="hidden" name="title" value="<? echo $app_title; ?>">
                    <input type="hidden" name="note" value="<? echo $app_note; ?>">
                  </td>
                </tr>
                <tr> 
                  <td width="10%">&nbsp;</td>
                  <td> 
                    <div align="center"> 
                      <input type="submit" name="edit_butt" value="กลับไปแก้ไข">
                      &nbsp;&nbsp; 
                      <input type="submit" name="appoint" value="ยืนยันการนัดหมาย">
                    </div>
                  </td>
                  <td>&nbsp;</td>
                </tr>
                <tr> 
                  <td width="10%">&nbsp;</td>
                  <td colspan="2">&nbsp; </td>
                </tr>
              </table>
            </form>
<table width="95%" height="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>&nbsp;</td>
                </tr>
              </table>
            

          </TD>
        </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
</BODY>
</HTML>
<?
}
?>