<?

include("../checkauth.inc");
	Include("time.inc");
 	Include("thaidate.inc");
$schedule=array
(
"7" =>"Free",
"8" =>"Free",
"9" =>"Free",
"10" =>"Free",
"11" =>"Free",
"12" =>"Free",
"13" =>"Free",
"14" =>"Free",
"15" =>"Free",
"16" =>"Free",
"17" =>"Free",
"18" =>"Free",
"19" =>"Free",
"20" =>"Free",
"21" =>"Free",
"22" =>"Free",
);

$link=mysql_connect($host,$user,$pass) or die("ไม่สามารถติดต่อฐานข้อมูลได้");
//if((!(isset($friend_id)))||(!(isset($group_id)))||(!(isset($schdate)))||(!(isset($schday)))||(!(isset($lastpage)))||(!(isset($schmonth)))||(!(isset($schyear))))
//header("Location:./app_add1.php?time=$time&schday=$schday&schdate=$schdate&schmonth=$schmonth&schyear=$schyear");

if(($lastpage=='app_add_all_list')&&($group_id=='all'))
{
$return_page="./app_add_all_list.php?time=$time&schday=$schday&schdate=$schdate&schmonth=$schmonth&schyear=$schyear&&grp_num=all";
$sql="select  count(*) from  contact  where mem_id=$user_id&&friend_id=$friend_id";
$result=mysql_db_query($db,$sql);
$data=mysql_fetch_array($result);
if($data[0]==0) header("Location:./app_add_all_list.php?time=7&schday=$schday&schdate=$schdate&schmonth=$schmonth&schyear=$schyaear");
$sql1="select mem_username,mem_fname,mem_lname from member where mem_id=$friend_id";
$result1=mysql_db_query($db,$sql1);
$data1=mysql_fetch_array($result1);
$name="ของคุณ<b> $data1[0] ( $data1[1] $data1[2] ) </b>";
}
elseif($lastpage=='app_add_all_list')
{
$return_page="./app_add_all_list.php?time=$time&schday=$schday&schdate=$schdate&schmonth=$schmonth&schyear=$schyear&grp_num=$group_id";
$sql="select  count(*) from  contact  where mem_id=$user_id&&grp_id=$group_id&&friend_id=$friend_id";
$result=mysql_db_query($db,$sql);
$data=mysql_fetch_array($result);
if($data[0]==0) header("Location:./app_add1.php?time=7&schday=$schday&schdate=$schdate&schmonth=$schmonth&schyear=$schyaear");
$sql1="select mem_username,mem_fname,mem_lname from member where mem_id=$friend_id";
$result1=mysql_db_query($db,$sql1);
$data1=mysql_fetch_array($result1);
$name="ของคุณ<b> $data1[0] ( $data1[1] $data1[2] ) </b>";
}
else
{
$return_page="./app_add1.php?time=$time&schday=$schday&schdate=$schdate&schmonth=$schmonth&schyear=$schyear&group1=$group_id";
$sql="select  count(*) from  contact  where mem_id=$user_id&&grp_id=$group_id&&friend_id=$friend_id";
$result=mysql_db_query($db,$sql);
$data=mysql_fetch_array($result);
if($data[0]==0) header("Location:./app_add1.php?time=7&schday=$schday&schdate=$schdate&schmonth=$schmonth&schyear=$schyaear");
$sql1="select mem_username,mem_fname,mem_lname from member where mem_id=$friend_id";
$result1=mysql_db_query($db,$sql1);
$data1=mysql_fetch_array($result1);
$name="ของคุณ<b> $data1[0] ( $data1[1] $data1[2] ) </b>";
}

$year=$schyear+543;
$month=$thaimonth[$schmonth-1];
if(substr($schdate,0,1)=='0') $date=substr($schdate,1,1);
else$date=$schdate;
$datethai="วัน$thaiday[$schday]ที่  $date $month $year  ";
$checkdate="$schyear-$schmonth-$schdate";
$sql2="select  sch_time,sch_duration from schedule where mem_id=$friend_id &&sch_date='$checkdate' order by sch_time asc";
$result2=mysql_db_query($db,$sql2);
$rows=mysql_num_rows($result2);
for($j=0;$j<$rows;$j++)
{$data2=mysql_fetch_array($result2);
$hour=substr($data2[0],0,2);
if(substr($hour,0,1)=='0') $hour=substr($hour,1,1);
$hournext=$hour;
$count=$data2[1];
while(($hournext<23)&&($count>0))
{
$schedule[$hournext]='NoFree';
$hournext++;
$count--;
}
}

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

    <TD height=55> <img src="../images/label1.gif" width="126" height="54" border="0"> 
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



								&nbsp; </td>

                              </tr>

                            </table>

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

          <TD width="79%" align="left" valign="top"> 
            <form method="post" action="./<? echo$return_page;?>">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="4%" height="37">&nbsp;</td>
                  <td width="52%" align="center" height="37" bgcolor="#3333FF"><font size="2" face="MS Sans Serif" color="#FFFFFF"><b>ตารางเวลาประจำ 
                    <?echo $datethai;?>
                    </b></font></td>
                  <td width="44%" height="37">&nbsp;</td>
                </tr>
                <tr> 
                  <td width="4%" height="27">&nbsp;</td>
                  <td width="52%" align="center" height="27" bgcolor="#CCCCCC"><font size="2" face="MS Sans Serif" color="#000099"> 
                    <? echo$name;?>
                    </font></td>
                  <td width="44%" height="27">&nbsp;</td>
                </tr>
                <tr> 
                  <td width="5%" height="156">&nbsp;</td>
                  <td width="52%" height="156" align="left" valign="top"> <br>
                    <table width="56%" border="1" cellspacing="0" cellpadding="0" bgcolor="#99CCFF">
                      <tr align="center" bgcolor="#33CCCC"> 
                        <td width="46%" height="25"><font color="#FFFFFF"><b><font face="MS Sans Serif" size="2">เวลา</font></b></font></td>
                        <td width="54%" height="25"><font color="#FFFFFF"><b><font face="MS Sans Serif" size="2">สถานะ</font></b></font></td>
                      </tr>

<?
$i=7;
foreach($schedule as $status)
{
	if(($status=='Free')&&($i<>23))
		{	echo'                      <tr> ';
	echo'                        <td width="46%" height="22" align="center" bgcolor="#FFFFFF"><font color="#0066CC" size="1" face="MS Sans Serif">'.$i.':00 ';
	echo'                          น.</font></td>';
		echo'                        <td width="54%" height="22" align="center" bgcolor="#FFFFFF"><font size="1" color="#0000FF"><b><font face="MS Sans Serif">ว่าง</font></b></font></td>';
		echo'                      </tr>';
		}
elseif(($status=='NoFree')&&($i<>23))
		{	echo'                      <tr> ';
	echo'                        <td width="46%" height="22" align="center" bgcolor="#FFFFFF"><font color="#0066CC" size="1" face="MS Sans Serif">'.$i.':00 ';
	echo'                          น.</font></td>';
		echo'             <td width="54%" height="22" align="center" bgcolor="#CCCCCC"><b><font face="MS Sans Serif" size="1" color="#333333">ไม่ว่าง</font></b></td>';
		echo'                      </tr>';
		}
$i++;
}
?>
                    </table>
                  </td>
                  <td width="44%" height="156">&nbsp;</td>
                </tr>
                <tr> 
                  <td width="4%">&nbsp;</td>
                  <td width="52%"><br>
                    <input type="submit" name="Submit" value="กลับไปหน้าที่แล้ว">
                  </td>
                  <td width="44%">&nbsp;</td>
                </tr>
                <tr> 
                  <td width="4%">&nbsp;</td>
                  <td width="52%">&nbsp;</td>
                  <td width="44%">&nbsp;</td>
                </tr>
              </table>
            </form>
          </TD>

        </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>

</BODY>

</HTML>

