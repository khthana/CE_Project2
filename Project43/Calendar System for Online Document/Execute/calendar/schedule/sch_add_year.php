<?
session_start();
include("../checkauth.inc");
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
onload="MM_preloadImages('../redpoint.gif','../carblue.gif','../sendpink.gif','../detailblue.gif','../logoutorg.gif','../docyellow.gif','../addresspink.gif','../images/docyellow.gif','../images/carblue.gif')">
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
      href="sch_add.php"><IMG 
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
      <TABLE height=464 width="100%" border=0 cellpadding="0" cellspacing="0">
        <TBODY> 
        <TR> 
          <TD vAlign=top align=left width="21%" rowspan="4"> 
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
                                      <div align="left"><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFCC" size="2"><b>วันนี้ 
                                        :</b> <a href="sch_add.php?schday=<? echo date("w"); ?>&schdate=<? echo date("j"); ?>&schmonth=<? echo date("m"); ?>&schyear=<? echo date("Y"); ?>"> 
                                        <font color="#FFFFCC" size="2"> <? echo date("j")," ",$thaimonth[date("m")-1]," ",date("Y")+543;    
?> </font></a> </font></div>
                                    </td>
                                  </tr>
                                  <tr bgcolor=#ffffff> 
                                    <td align=middle bgcolor=#FFFFFF width="25%" height="12"><a href="sch_add.php?schday=<? echo $schday; ?>&schdate=<? echo $schdate; ?>&schmonth=<? echo $schmonth; ?>&schyear=<? echo $schyear; ?>"><font color="#009900">&nbsp;<font face="MS Sans Serif, Microsoft Sans Serif" size="2">วัน</font></font></a></td>
                                    <td align=middle bgcolor=#ffffff width="25%" height="12"><a href="sch_add_week.php?schday=<? echo $schday; ?>&schdate=<? echo $schdate; ?>&schmonth=<? echo $schmonth; ?>&schyear=<? echo $schyear; ?>">&nbsp;<font face="MS Sans Serif, Microsoft Sans Serif" size="2"><font color="#009900">สัปดาห์</font></font></a></td>
                                    <td align=middle bgcolor=#FFFFFF width="25%" height="12"><a href="sch_add_month.php?schday=<? echo $schday; ?>&schdate=<? echo $schdate; ?>&schmonth=<? echo $schmonth; ?>&schyear=<? echo $schyear; ?>"><font color="#009900">&nbsp;<font face="MS Sans Serif, Microsoft Sans Serif" size="2">เดือน</font></font></a></td>
                                    <td align=middle bgcolor=#FFCC99 width="25%" height="12"><a href="sch_add_year.php?schday=<? echo $schday; ?>&schdate=<? echo $schdate; ?>&schmonth=<? echo $schmonth; ?>&schyear=<? echo $schyear; ?>"><font color="#FF0000">&nbsp;<font face="MS Sans Serif, Microsoft Sans Serif" size="2">ปี</font></font></a></td>
                                  </tr>
                                  <tr> 
                                    <td noWrap align=middle bgcolor=#dcdcdc colspan=4 height="32"> 
                                      <table cellspacing=0 cellpadding=1 border=0>
                                        <tbody> 
                                        <tr> <?
//แสดงเป็นปีๆและมีรายชื่อเดือน
include("sch_day_of_month.inc");//$day_of_month[0-34] or [0-42] ,$num_week
?> 
                                          <td><a 
                  href="sch_add_year.php?schday=<? echo "$pr_day"; ?>&schdate=<? echo "1"; ?>&schmonth=<? echo "1"; ?>&schyear=<? echo $schyear-1; ?>"> 
                                            <img height=10 src="../images/left4.gif" width=11 
                  border=0></a> </td>
                                          <td valign=center noWrap><tt><b> <font face="MS Sans Serif,Microsoft Sans Serif" size="2" color="#FF6600"> 
                                            <?
	echo " ",$schyear+543;
?> </font></b></tt> </td>
                                          <td><a 
                  href="sch_add_year.php?schday=<? echo "$nx_day"; ?>&schdate=<? echo "1"; ?>&schmonth=<? echo "1"; ?>&schyear=<? echo $schyear+1; ?>"> 
                                            <img height=11 src="../images/right4.gif" width=11 
                  border=0></a> </td>
                                        </tr>
                                        </tbody> 
                                      </table>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td align=middle colspan=4> <?
// ปฏิทินด้านขวา***************
include("sch_day_of_month.inc");//$day_of_month[0-34] or [0-42] ,$num_week
?> 
                                      <table width= 100% cellspacing=1 cellpadding=1 bgcolor=#ffffff border=0>
                                        <tbody> 
											<tr>
<?
		$tmpyear=$schyear-1;		
		for($j=0;$j<3;$j++)
		{
			$tmp_day=mktime(1,1,0,1,1,$tmpyear);
			$tmp_day2=(int) date("w",$tmp_day);

?>
						                  <td width=33%><a href="sch_add_year.php?schday=<? echo $tmp_day2; ?>&schdate=<? echo "1"; ?>&schmonth=<? echo "1"; ?>&schyear=<? echo $tmpyear; ?>">
										<font face="MS Sans Serif, Microsoft Sans Serif" size="1" color="#0000FF"><? echo $tmpyear+543; ?></font>
										</a></td>
<?
				$tmpyear=$tmpyear+1;
		}

?> 
										 </tr>
                                        </tbody> 
                                      </table>
                                      <? //หมดปฏิทินด้านขวา 
?> </td>
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
                          <div align="right"><a href="sch_add2.php"><img src="../images/sch_quick.gif" width="150" height="20" border="0"></a></div>
                        </td>
                      </tr>
                      <tr align="left" valign="top"> 
                        <td nowrap colspan="2" height="25"> 
                          <div align="right"><a href="../appointment/app_add1.php?quick_butt=Y"><img src="../images/app_quick.gif" width="150" height="20" border="0"></a></div>
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
                        <td nowrap colspan="2" height="22"> 
                          <div align="center"><img src="../images/mess_remindhead.gif" width="188" height="21"></div>
                        </td>
                      </tr>
                      <tr align="left" valign="top"> 
                        <td colspan="2" bgcolor="#FFFFFF" height="120"> 
                          <div align="center"> 
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr> 
                                <td height="88"> 
                                  <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FAAB34">
                                    <tr> 
                                      <td height="85"> 
                                        <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                          <tr> 
                                            <td height="34" colspan="2"><font size="2"><b><font color="#0066FF" face="AngsanaUPC, Angsana New, MS Serif"><?php include("../checkmessage.inc"); ?></font></b></font></td>
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
                        <td colspan="2" height="88"> 
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
                        <td colspan="2" height="16">&nbsp;</td>
                      </tr>
                      <? //------------หมด เตือน ตาราง------------ ?> 
                      <tr align="left" valign="top"> 
                        <td colspan="2" height="9"><img src="../images/app_remindhead.gif" width="188" height="20"></td>
                      </tr>
                      <tr align="left" valign="top"> 
                        <td colspan="2" height="126"> 
                          <div align="center"> 
                            <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FF9933">
                              <tr> 
                                <td height="127"> 
                                  <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                    <tr> 
                                      <td height="34" colspan="2"><font size="1"><font color="#0066FF" face="MS Sans Serif, Microsoft Sans Serif"><?php include("../remind/app_messbeside.inc"); ?></font></font></td>
                                    </tr>
                                    <tr> 
                                      <td height="31" colspan="2"><font size="1"><font color="#0066FF" face="MS Sans Serif, Microsoft Sans Serif"><?php include("../remind/app_mess_tosenderbeside.inc"); ?></font></font></td>
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
            <table width="80%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
<?
$host="localhost";

$usersql="magazine";

$password="magazine";

$table="schedule";

$db="magazine";

$link=mysql_connect($host,$usersql,$password) or

die("ไม่สามารถติดต่อฐานข้อมูลได้");

mysql_select_db("magazine") or die("ไม่สามารถติดต่อแฟ้มข้อมูลได้"); 


$tmp_day=mktime(1,1,0,1,1,$schyear-1);
$pr_day=(int) date("w",$tmp_day);
$tmp_day=mktime(1,1,0,1,1,$schyear+1);
$nx_day=(int) date("w",$tmp_day);
?>

                <td width="30%"> 
                  <div align="right"><a href="sch_add_year.php?schday=<? echo $pr_day; ?>&schdate=<? echo "1"; ?>&schmonth=<? echo "1"; ?>&schyear=<? echo $schyear-1; ?>"><img src="../images/left_butt.gif" width="14" height="27" border="0"></a></div>
                </td>
                <td> 
                  <div align="center"> <?
		echo "<b><font size=5 font face=MS Sans Serif, Microsoft Sans Serif  color=#999933>";

		echo " ",$schyear+543;

		echo "</font></b>";

	?> &nbsp;</div>
                </td>
                <td width="40%"> 
                  <div align="left"><a href="sch_add_year.php?schday=<? echo $nx_day; ?>&schdate=<? echo "1"; ?>&schmonth=<? echo "1"; ?>&schyear=<? echo $schyear+1; ?>"><img src="../images/right_butt.gif" width="14" height="27" border="0"></a></div>
                </td>
              </tr>
            </table>
          </TD>
        </TR>
        <TR> 
          <TD width="79%" height="2"><img src="../images/sch_dayline.gif" width="85%" height="10"></TD>
        </TR>
        <TR> 
          <TD width="79%" height="2">&nbsp;</TD>
        </TR>
        <TR>
          <TD width="79%"> <font color="#669900" face="MS Sans Serif, Microsoft Sans Serif" size="1"></font>
            <table width="100%" border="0" cellpadding="3">
              <tr> 
                <td width="2%">
                  <table width="10%" border="0" cellspacing="0" cellpadding="0" height="100">
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                </td>
                <td width="98%"> 
<? // ----------------ปฏิทินด้านซ้าย ทั้งปี ------------?>
                  <table width="75%" border="1" cellspacing="0" cellpadding="0">
                    <?
$tmp_nummonth=0;
$tmpmonth2=0;
for($a=0;$a<4;$a++)
{
			$first_day1=(int) date("w",mktime(1,1,0,$tmp_nummonth+1,1,$schyear));
			$first_day2=(int) date("w",mktime(1,1,0,$tmp_nummonth+2,1,$schyear));
			$first_day3=(int) date("w",mktime(1,1,0,$tmp_nummonth+3,1,$schyear));		

?> 
                    <tr bgcolor="#669900"> 
                      <td height="10" width="25%"> 
                        <div align="center"><b><font size="1" face="MS Sans Serif, Microsoft Sans Serif" color="#CCFFCC"> 
							<a  href="sch_add_month.php?schday=<? echo $first_day1; ?>&schdate=<? echo "1"; ?>&schmonth=<? echo $tmp_nummonth+1; ?>&schyear=<? echo $schyear; ?>">  
                          <font color="#CCFF99"><? echo $thaimonth[$tmp_nummonth]; 
								$tmp_nummonth=$tmp_nummonth+1;
						?> </font></a></font></b></div>
                      </td>
                      <td height="10" width="25%"> 
                        <div align="center"><b><font size="1" face="MS Sans Serif, Microsoft Sans Serif"> 
							<a  href="sch_add_month.php?schday=<? echo $first_day2; ?>&schdate=<? echo "1"; ?>&schmonth=<? echo $tmp_nummonth+1; ?>&schyear=<? echo $schyear; ?>">  
							<font color="#CCFF99">
                          <? echo $thaimonth[$tmp_nummonth]; 
								$tmp_nummonth=$tmp_nummonth+1;
						?></font></a></font></b></div>
                      </td>
                      <td height="10" width="25%"> 
                        <div align="center"><b><font size="1" face="MS Sans Serif, Microsoft Sans Serif" color="#CCFF99"> 
							<a  href="sch_add_month.php?schday=<? echo $first_day3; ?>&schdate=<? echo "1"; ?>&schmonth=<? echo $tmp_nummonth+1; ?>&schyear=<? echo $schyear; ?>">  
							<font color="#CCFF99">
                          <? echo $thaimonth[$tmp_nummonth]; 
								$tmp_nummonth=$tmp_nummonth+1;
						?></font></a></font></b></div>
                      </td>
                    </tr>
                    <tr bgcolor="#FFFFCC"> <? 
			for($b=0;$b<3;$b++)
  		{
?> 
                      <td> <?
				$num_week=0;
				$tmpmonth2=$tmpmonth2+1;
				include("sch_day_of_year.inc");
// all day in each month of the year
// day_of_year[0-34] or [0-42] ,$num_week
//---------------ตารางแสดงปฏิทิน แต่ละเดือน-------------------
?> 
                        <table width= 100% cellspacing=3 cellpadding=1 bgcolor=#FFFFCC border=0>
                          <tbody> 
                          <tr> 
                            <td valign=top align=right>
<?
			$start=0;
			$num_show=0;
			for($c=0;$c<$num_week;$c++)//week
			{
					  $tmp_date=(int) substr($day_of_year[$num_show],0,2);
					  $tmp_month=(int) substr($day_of_year[$num_show],3,2);
					  $tmp_year=(int) substr($day_of_year[$num_show],6,4);

?> 
<a href="sch_add_week.php?schday=<? echo "0"; ?>&schdate=<? echo $tmp_date; ?>&schmonth=<? echo $tmp_month; ?>&schyear=<? echo $tmp_year; ?>">
                              <?
					for($d=0;$d<7;$d++)
				    {
					  $show_date1=(int) substr($day_of_year[$num_show],0,2);
					  $show_date2= substr($day_of_year[$num_show],0,2);
					  $tmp_month=(int) substr($day_of_year[$num_show],3,2);
						$tmp_year_job= substr($day_of_year[$num_show],6,4);
                     $tmp_datejob2=$tmp_year_job."-".$tmp_month."-".$show_date2;
		     		$sql_job_day="select sch_id from schedule where mem_id=$user_id and sch_date='$tmp_datejob2'";
			    	$result=mysql_db_query("magazine",$sql_job_day);
			    	$numrow=@mysql_num_rows($result);

?> <font face="MS Sans Serif,Microsoft Sans Serif" size="2" color="#000000">	
                              <?
                  if($numrow>0)
                  { echo "<b>";
                   }
					if($tmp_month<>$tmpmonth2)
					{
							echo "<font color=#999999>";
		    				 echo $show_date2,"  ";

					}else
					{
							echo "<font color=#0000FF>";
		    				 echo $show_date2,"  ";
					}
				  $num_show=$num_show+1;	
                  if($numrow>0)
                  { echo "</b>";
                  }
?> </font> <?
					} //for $d
?></a>
<?
					echo "<br>";
			} //for $c

?> 
</td></tr>
                          </tbody> 
                        </table>
                        <? //หมดในการแสดงวันในแต่ละเดือน
?> </td>
                      <?
		}//for $b
?> </tr>
                    <?
} //for $a
?> 
                  </table>
                </td>
              </tr>
            </table>

            <table width="95%" height="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td>&nbsp;</td>
              </tr>
            </table>
          </TD>
        </TR>
        </TBODY> 
      </TABLE>
    </TD></TR></TBODY></TABLE>
</BODY>
</HTML>
<?
mysql_close();
?>

