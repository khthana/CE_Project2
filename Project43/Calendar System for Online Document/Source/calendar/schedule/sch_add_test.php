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
onload="MM_preloadImages('../redpoint.gif','../carblue.gif','../sendpink.gif','../detailblue.gif','../logoutorg.gif','../docyellow.gif','../addresspink.gif','../images/messagegreen.gif','../images/logoutorg.gif')">
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
      name=Image1></A><a href="../../create_document/index.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image15','','../images/docyellow.gif',1)"><img name="Image15" border="0" src="../images/document.gif" width="90" height="33"></a><A onmouseover="MM_swapImage('Image2','','../images/carblue.gif',1)" 
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
      href="../../member/edit_profile.html"><IMG 
      height=33 src="../images/detail.gif" width=90 border=0 
      name=Image5></A><A 
      onmouseover="MM_swapImage('Image6','','../images/logoutorg.gif',1)" 
      onmouseout=MM_swapImgRestore() 
      href="../member/logout.php"><IMG 
      height=33 src="../images/logout.gif" width=90 border=0 
      name=Image6></A><a 
      onMouseOver="MM_swapImage('Image61','','../images/logoutorg.gif',1)" 
      onMouseOut=MM_swapImgRestore() 
      href="../member/logout.php"><img 
      height=33 src="../images/logout.gif" width=90 border=0 
      name=Image61></a></TD>
  </TR>
  <TR> 
    <TD height="18"><img src="../images/bolder2.gif" width="130" height="18"><img src="../images/bolder1.gif" width="730" height="18"></TD>
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
                <td colspan="2" bgcolor="#FFFFFF" nowrap height=""> 
                  <div align="center"> 
                    <table width="180" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td height="109"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="0" bordercolor="">
                            <tr> 
                              <td> <tt><b></b></tt> 
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
                                    <td align=middle bgcolor=#FFCC99 width="25%" height="12"><a href="sch_add.php?schday=<? echo $schday; ?>&schdate=<? echo $schdate; ?>&schmonth=<? echo $schmonth; ?>&schyear=<? echo $schyear; ?>">&nbsp;<font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#FF0000">วัน</font></a></td>
                                    <td align=middle bgcolor=#ffffff width="25%" height="12"><a href="sch_add_week.php?schday=<? echo $schday; ?>&schdate=<? echo $schdate; ?>&schmonth=<? echo $schmonth; ?>&schyear=<? echo $schyear; ?>">&nbsp;<font face="MS Sans Serif, Microsoft Sans Serif" size="2"><font color="#009900">สัปดาห์</font></font></a></td>
                                    <td align=middle bgcolor=#ffffff width="25%" height="12"><a href="sch_add_month.php?schday=<? echo $schday; ?>&schdate=<? echo $schdate; ?>&schmonth=<? echo $schmonth; ?>&schyear=<? echo $schyear; ?>"><font color="#009900">&nbsp;<font face="MS Sans Serif, Microsoft Sans Serif" size="2">เดือน</font></font></a></td>
                                    <td align=middle bgcolor=#ffffff width="25%" height="12"><a href="sch_add_year.php?schday=<? echo $schday; ?>&schdate=<? echo $schdate; ?>&schmonth=<? echo $schmonth; ?>&schyear=<? echo $schyear; ?>"><font color="#009900">&nbsp;<font face="MS Sans Serif, Microsoft Sans Serif" size="2">ปี</font></font></a></td>
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
                  href="sch_add.php?schday=<? echo $pr_day; ?>&schdate=<? echo $pr_date; ?>&schmonth=<? echo $pr_month; ?>&schyear=<? echo $pr_year; ?>"> 
                                            <img height=10 src="../images/left4.gif" width=11 
                  border=0></a> </td>
                                          <td valign=center noWrap><tt><b> <font face="MS Sans Serif,Microsoft Sans Serif" size="2" color="#FF6600"> 
<tt><b><font face="MS Sans Serif,Microsoft Sans Serif" size="2" color="#FF6600"><?
	echo $thaimonth[$schmonth-1]," ",$schyear+543;
?></font></b></tt>
                                            </font></b></tt> </td>
                                          <td><a 
                  href="sch_add.php?schday=<? echo $nx_day; ?>&schdate=<? echo $nx_date; ?>&schmonth=<? echo $nx_month; ?>&schyear=<? echo $nx_year; ?>"> 
                                            <img height=11 src="../images/right4.gif" width=11 
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
include("sch_day_of_month.inc");//$day_of_month[0-34] or [0-42] ,$num_week
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
?></font> <a href="sch_add.php?schday=<? echo $i; ?>&schdate=<? echo $show_date; ?>&schmonth=<? echo $tmp_month; ?>&schyear=<? echo $tmp_year; ?>"> 
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
                                      <? //หมดปฏิทินด้านขวา 
?> </td>
                                  </tr>
                                  <tr bgcolor="#CCCCCC"> 
                                    <td noWrap align=middle colspan=4 height="10">&nbsp;</td>
                                  </tr>
                                  </tbody> 
                                </table>
                                &nbsp; <? //--------------  หมดปฏิทินด้านขวา     -------------------- ?> 
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>

                    <table width="120" border="0" cellpadding="0" cellspacing="0">
                      <tr align="left" valign="top"> 
                        <td nowrap colspan="2" height="22"> 
                          <div align="center"><img src="../images/mess_remindhead.gif" width="188" height="21"></div>
                        </td>
                      </tr>
                      <tr align="left" valign="top"> 
                        <td colspan="2" bgcolor="#FFFFFF" height="160"> 
                          <div align="center"> 
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr> 
                                <td> 
                                  <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FAAB34">
                                    <tr> 
                                      <td height="125"> 
                                        <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                          <tr> 
                                            <td height="34" colspan="2"><font size="2"><b><font color="#0066FF" face="AngsanaUPC, Angsana New, MS Serif"><?php include("../checkmessage.inc"); ?></font></b></font></td>
                                          </tr>
                                          <tr> 
                                            <td height="31" colspan="2">&nbsp;</td>
                                          </tr>
                                          <tr> 
                                            <td colspan="2">&nbsp;</td>
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
                        <td colspan="2"> 
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
          <TD width="79%" height="32"> 
            <table width="80%" border="0" cellspacing="0" cellpadding="0">
              <tr> <?
$host="localhost";

$usersql="magazine";

$password="magazine";

$table="schedule";

$db="magazine";

$link=mysql_connect($host,$usersql,$password) or

die("ไม่สามารถติดต่อฐานข้อมูลได้");

mysql_select_db("magazine") or die("ไม่สามารถติดต่อแฟ้มข้อมูลได้"); 


//-----next day
	$next_day= date("d/m/Y",mktime(1,1,0,$schmonth,$schdate+1,$schyear));
	$nx_day=(int) date("w",mktime(1,1,0,$schmonth,$schdate+1,$schyear));
	$nx_date=(int) substr($next_day,0,2);
	$nx_month=(int) substr($next_day,3,2);
	$nx_year= substr($next_day,6,4);
//----previous day
	$pre_day= date("d/m/Y",mktime(1,1,0,$schmonth,$schdate-1,$schyear));
	$pr_day=(int) date("w",mktime(1,1,0,$schmonth,$schdate-1,$schyear));
	$pr_date=(int) substr($pre_day,0,2);
	$pr_month=(int) substr($pre_day,3,2);
	$pr_year= substr($pre_day,6,4);


?> 
                <td> 
                  <div align="right"><a href="sch_add.php?schday=<? echo $pr_day; ?>&schdate=<? echo $pr_date; ?>&schmonth=<? echo $pr_month; ?>&schyear=<? echo $pr_year; ?>"><img src="../images/left_butt.gif" width="14" height="27" border="0"></a></div>
                </td>
                <td width="70%"> 
                  <div align="center"> <?
		echo "<b><font size=5 font face=MS Sans Serif, Microsoft Sans Serif  color=#999933>";

		echo $thaiday[$schday]," ",$schdate," ",$thaimonth[$schmonth-1]	," ",$schyear+543;
		echo "</font></b>";

	?> &nbsp;</div>
                </td>
                <td> 
                  <div align="left"><a href="sch_add.php?schday=<? echo $nx_day; ?>&schdate=<? echo $nx_date; ?>&schmonth=<? echo $nx_month; ?>&schyear=<? echo $nx_year; ?>"><img src="../images/right_butt.gif" width="14" height="28" border="0"></a></div>
                </td>
              </tr>
            </table>
          </TD>
        </TR>
        <TR> 
          <TD width="79%" height="2" bgcolor="#FFFFFF"><img src="../images/sch_dayline.gif" width="80%" height="10"></TD>
        </TR>
        <TR> 
          <TD width="79%" height="10" bgcolor="#FFFFFF">&nbsp;</TD>
        </TR>
        <TR>
          <TD width="79%"> 
            <table width="90%" border="0" cellspacing="0" cellpadding="1" bordercolor="#FFFFFF">
              <tr bgcolor="#FFFFFF"> 
                <td width="5%">&nbsp;</td>
                <td width="95%"> 
                  <table width="95%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FFFFFF" bordercolorlight="#99CC00" bordercolordark="#669966">
                    <?
$tmpdate=$schyear."-".$schmonth."-".$schdate;

$chk_colspan=1;

		for ($i=0;$i<16;$i++)

		{

?> 
                    <tr> 
                      <td width="15%" bgcolor="#669966"> 
                        <div align="center"><font color="#CCFFCC" size="2" font face=Angsana New, AngsanaUPC> 
                          <a href="sch_add2.php?time=<? echo $schvalue[$i] ?>&schday=<? echo $schday; ?>&schdate=<? echo $schdate ?>&schmonth=<? echo $schmonth ?>&schyear=<? echo $schyear  ?>"> 
                          <? echo $schtime[$i] ?> </a> </font></div>
                      </td>
                      <?

$tmptime=$schvalue[$i].":00:00";
 $sql_sch="select sch_duration,sch_time,sch_title,sch_id from schedule where mem_id = $user_id and sch_date='$tmpdate' and sch_time = '$tmptime' order by sch_duration desc";
$result=mysql_db_query("magazine",$sql_sch);
$numrow=@mysql_num_rows($result);
if($numrow<1)
{
		if($chk_colspan>1)
		{
			$chk_colspan=$chk_colspan-1;
?> <? //                <td  bgcolor="#FFFFFF">&nbsp;</td>			?> <?
		}else
		{
?> 
                      <td width="80%" colspan="8" bgcolor="#FFFFFF">&nbsp;</td>
                      <?
			}//chk_colspan
}else
{
		if($chk_colspan>1)
		{
			$chk_colspan=$chk_colspan-1;
		}
		$tmpcolspan=1;
		$tmpwidth="0";
		if($chk_colspan==1)
		{
			if($numrow==1)
			{
				$tmpcolspan=8;
				$tmpwidth="80%";
			}elseif($numrow==2)
			{
				$tmpcolspan=4;
				$tmpwidth="40%";
			}	
		}
		for($j=0;$j<$numrow;$j++)
		{
		   $row=mysql_fetch_array($result);
?> 
                      <td
<? 
			if($tmpwidth<>"0" and $row[0]=="1")
			{ echo " width=",$tmpwidth," ";
			}
			if($row[0]<>"")
			{
				echo " rowspan=",$row[0]," ";//duration
				$tmp_duration=(int) $row[0];

				if($tmp_duration>$chk_colspan)
				{
					$chk_colspan=$tmp_duration;
				}
			}
			if($tmpcolspan<>1 and $tmp_duration==1)
			{
				echo " colspan=",$tmpcolspan," ";
			}			

?>
			bgcolor="#FFFFFF"> <font size="2" face="MS Sans Serif, Microsoft Sans Serif" color="#666666"> 
                        <?
		$tmp_time= (int) substr($row[1],0,2);
		$tmp_timeuntil=$tmp_time+$tmp_duration;
		$tmp_id=$row[3];
		echo "(",$tmp_time,":00-",$tmp_timeuntil,":00น.)   ";
		echo "<a href=sch_edit1.php?time=$tmp_time&schday=$schday&schdate=$schdate&schmonth=$schmonth&schyear=$schyear&sch_id=$tmp_id>";
		echo "<font color=#0000FF>",$row[2],"</font></a></td>";

?> </font></td>
                      <?
		}//for
}//else
?> </tr>
                    <? 

		}

?> 
                  </table>
                </td>
              </tr>
            </table>
            <table width="80%" border="0" cellspacing="0" cellpadding="0" height="100%">
              <tr bgcolor="#FFFFFF"> 
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

