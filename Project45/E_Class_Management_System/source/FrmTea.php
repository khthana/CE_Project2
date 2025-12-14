<?php
	require('./libraries/grab_globals.lib.php'); 
	session_start(); 	
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><!-- InstanceBegin template="/Templates/logo.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>การเรียนการสอนผ่านอินเตอร์เน็ท</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link rel="stylesheet" href="style.css" >
</head>

<body leftmargin="0" topmargin="0" >
<table width="780" border="0" cellspacing="0" cellpadding="0"  align="center">
  <tr>
    <td width="100%" align="right" valign="top"><img src="./Picture/logo.jpg" width="100%" height="85" align="baseline"></td>
  </tr>
  <tr> 
    <td  valign="top"><table  width="100%" border="0" cellpadding="0" cellspacing="1"   bgcolor="#000000"  class="text">
        <tr bgcolor="#336699" class="text" valign="top"> 
          <td width = "14%" align="center"><strong><a href="index.php" class="nav">Home</a></strong></td>
          <td width = "14%" align="center"><strong><a href="Course1.php" target="_parent" class="nav">Course</a></strong></td>
          <td width = "13%" align="center"><strong><a href="Headline.php?status=all" target="_parent" class="nav">News</a></strong></td>
          <td width="14%" align="center"><strong><a href="FrmSearch.php" target="_parent" class="nav">Search</a></strong></td>
          <td width="16%" align="center"><strong><a href="MeansUse.php" target="_blank" class="nav">FAQ</a></strong></td>
          <td width = "12%" align="center"><strong><a href="about.php" class="nav">About</a></strong></td>
          <td width = "17%" align="center"><strong><a href="index.php?LogOut=yes" class="nav">Logout</a></strong></td>
        </tr>
      </table></td>
  </tr>
  <tr valign="top">
    <td width="100%"  valign="top" height="100%"><!-- InstanceBeginEditable name="data" --> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="30%"><table width="100%" border="0" cellpadding="0" cellspacing="8">
              <tr> 
                <td > <table width="95%" border="0" cellpadding="0" cellspacing="8" bgcolor="#99AAFF">
                    <tr> 
                      <td> <table width="202" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr> 
                            <td width="21"><img src="Picture/ic_myprofile_stu.gif" width="21" height="20"></td>
                            <td width="91" bgcolor="#8397C4"  align="right" class="header"> 
                              <strong>ข้อมูลส่วนตัว</strong></td>
                            <td bgcolor="#8397C4" align="right" width="80">&nbsp;</td>
                            <td width="10"><img src="Picture/cn_student.gif" width="10" height="20"></td>
                          </tr>
                          <tr> 
                            <td colspan="4" align="center"> <table cellspacing=0 cellpadding=0 width=100% border=0>
                                <tbody>
                                  <tr bgcolor=#ffffff> 
                                    <td colspan=3><img height=1 src="images/dot.gif" 
            width=1></td>
                                  </tr>
                                  <tr> 
                                    <td width=1 bgcolor=#ffffff><img height=1 
            src="images/dot.gif" width=1></td>
                                    <td> <table cellspacing=0 cellpadding=4 width=100% border=0>
                                        <tbody>
                                          <tr bgcolor=#ececec> 
                                            <td  colspan=2 align="center" bgcolor="#ececec"><?php echo "<img  src=\"$SESSION[picture]\"   width=\"100\" height=\"120\" border=\"1\" align=\"absbottom\" > " ?> 
                                            </td>
                                          </tr>
                                        </tbody>
                                      </table>
                                      <table width="100%" border="0" cellpadding="3" cellspacing="0">
                                        <tr> 
                                          <td bgcolor="#ececec" class="text"><b><font color="#6655CC">ชื่อ: 
                                            </font></b> <?php echo $SESSION[name];   ?> 
                                          </td>
                                        </tr>
                                        <tr> 
                                          <td bgcolor="#ececec" class="text"><b><font color="#6655CC">สถานะ: 
                                            </font></b><?php echo $SESSION[status]; ?></td>
                                        </tr>
                                        <tr> 
                                          <td bgcolor="#ececec"><b><font color="#2B387B"><span class="left_menu"> 
                                            </span></font></b></td>
                                        </tr>
                                        <tr> 
                                          <td bgcolor="#ececec"> <table cellspacing=0 cellpadding=0 width=100% border=0>
                                              <tbody>
                                                <tr bgcolor=#ffffff> 
                                                  <td colspan=3><img height=1 src="images/dot.gif" 
            width=1></td>
                                                </tr>
                                                <tr> 
                                                  <td width=1 bgcolor=#ffffff><img height=1 
            src="images/dot.gif" width=1></td>
                                                  <td> <table cellspacing=0 cellpadding=4 width=100% border=0>
                                                      <tbody>
                                                        <tr bgcolor=#ececec> 
                                                          <td colspan=2 bgcolor="#DDE1EE" class="text"> 
                                                            <b>ข้อมูลติดต่อ</b> 
                                                          </td>
                                                        </tr>
                                                      </tbody>
                                                    </table></td>
                                                  <td width=1 bgcolor=#9EAAC9><img height=1 
            src="images/dot.gif" width=1></td>
                                                </tr>
                                                <tr bgcolor=#9EAAC9> 
                                                  <td colspan=3><img height=1 src="images/dot.gif" 
            width=1></td>
                                                </tr>
                                              </tbody>
                                            </table></td>
                                        </tr>
                                        <tr> 
                                          <td bgcolor="#ececec" class ="text"><b><font color="#6655CC"> 
                                            Email:</font></b> <?php echo $SESSION[email]; ?> 
                                          </td>
                                        </tr>
                                        <tr> 
                                          <td height="26" bgcolor="#ececec" class="text"><font color="#6655CC"><strong>ICQ:</strong></font> 
                                            <?php echo $SESSION[icq]; ?></td>
                                        </tr>
                                        <tr>
                                          <td height="26" bgcolor="#ececec" class="text"><table cellspacing=0 cellpadding=0 width=100% border=0>
                                              <tbody>
                                                <tr bgcolor=#ffffff> 
                                                  <td colspan=3><img height=1 src="images/dot.gif" 
            width=1></td>
                                                </tr>
                                                <tr> 
                                                  <td width=1 bgcolor=#ffffff><img height=1 
            src="images/dot.gif" width=1></td>
                                                  <td> <table cellspacing=0 cellpadding=4 width=100% border=0>
                                                      <tbody>
                                                        <tr bgcolor=#ececec> 
                                                          <td colspan=2 bgcolor="#DDE1EE" class="text"> 
                                                            <b>ตารางนัดหมาย</b> 
                                                          </td>
                                                        </tr>
                                                      </tbody>
                                                    </table></td>
                                                  <td width=1 bgcolor=#9EAAC9><img height=1 
            src="images/dot.gif" width=1></td>
                                                </tr>
                                                <tr bgcolor=#9EAAC9> 
                                                  <td colspan=3><img height=1 src="images/dot.gif" 
            width=1></td>
                                                </tr>
                                              </tbody>
                                            </table></td>
                                        </tr>
                                        <tr> 
                                          <td height="26" bgcolor="#ececec" class="text" align="center">
                                            <?php //date
	function datethai1($date){
	//echo $date;
	 $day=substr("$date",6,2);
	 $month=substr("$date",4,2);
	 $month=(int)$month-1;
	 $year=substr("$date",0,4);
	 $year=$year+543;
	 $thaimonth=array("  มกราคม  ","  กุมภาพันธ์  ","  มีนาคม  ","  เมษายน  ","  พฤษภาคม  ","  มิถุนายน  ","  กรกฎาคม  ","  สิงหาคม  ","  กันยายน  ","  ตุลาคม  ","  พฤศจิกายน  ","  ธันวาคม  ");
	 $month=$thaimonth[$month];
	 return (int)$day."".$month."".$year;
	}
$FONT ="Verdana, Arial, Helvetica, sans-serif";
$FONTSIZE="8";
$FONTCOLOR="#000000";
$BorderColor="#99CCCC";
$BarColor="#000066";

function WriteMonth($StartDate,$Border_color,$Title_color){
	$WriteMonth="";
	$CurrentDate=date("m/1/y", strtotime ("$StartDate"));
	$setMonth=date("m",strtotime ($CurrentDate));
	$BeginWeek=date("m",strtotime ($CurrentDate));
	$EndWeek=date("m",strtotime ($CurrentDate));
	
	$WriteMonth="
			<table border=0 cellspacing=0 cellpadding=0 bgcolor='$Border_color' width=150 resize=none class='text'>
			<tr>
			<td>
			<table border=0 cellspacing=1 cellpadding=2 resize='none' width=100% style='border: 1pt solid $Border_color' class='text'>
			<tr>
				<td colspan=7 valign=top BGCOLOR='$Title_color' align=center >
				<a href='cal.php?GoToDay=".date("m/1/y", strtotime ("$StartDate -1 months"))."'>
				</a>
				<b><font color='white'>"
				.datethai1(date(Ymd)).//.date("M",strtotime ($StartDate))." ".date("Y",strtotime ($StartDate)).
				"</font></b>
				<a href='cal.php?GoToDay=".date("m/1/y", strtotime ("$StartDate +1 months"))."'>
				</a>
				</td>
			</tr>
			<tr>
				<td align='center' valign=top bgcolor=white ><B>อา</B></td>
				<td align='center' bgcolor=white ><B>จ</B></td>
				<td align='center' bgcolor=white ><B>อ</B></td>
				<td align='center' bgcolor=white ><B>พ</B></td>
				<td align='center' bgcolor=white ><B>พฤ</B></td>
				<td align='center' bgcolor=white ><B>ศ</B></td>
				<td align='center' bgcolor=white ><B>ส</B></td>
			</tr>
	";
	for($j=1;$j<6;$j++){
		if($BeginWeek==$setMonth||$EndWeek==$setMonth){	
			switch(date("w",strtotime($CurrentDate))){
			case 0:
				$DaysToAd=array("","+1 days","+2 days","+3 days","+4 days","+5 days","+6 days");
				break;
			case 1:
				$DaysToAd=array("-1 days","","+1 days","+2 days","+3 days","+4 days","+5 days");
				break;
			case 2:
				$DaysToAd=array("-2 days","-1 days","","+1 days","+2 days","+3 days","+4 days");
				break;
			case 3:
				$DaysToAd=array("-3 days","-2 days","-1 days","","+1 days","+2 days","+3 days");
				break;
			case 4:
				$DaysToAd=array("-4 days","-3 days","-2 days","-1 days","","+1 days","+2 days");
				break;
			case 5:
				$DaysToAd=array("-5 days","-4 days","-3 days","-2 days","-1 days","","+1 days");
				break;
			case 6:
				$DaysToAd=array("-6 days","-5 days","-4 days","-3 days","-2 days","-1 days","");
				break;
			}	
			$WriteMonth.="<tr>";
			for($i=0;$i<7;$i++){
				$strTemp="";
				$BGcolor="white";
				$FontColor="#000000";
				$Style="";
				if(date("m",strtotime ("$CurrentDate $DaysToAd[$i]"))!=$setMonth){
					$FontColor="#999999";
				}
				if(date("m/d/y",strtotime ("$CurrentDate $DaysToAd[$i]"))==date("m/d/y",strtotime($StartDate))){
					$Style="style='border: 1pt solid red'";
				}
				$WriteMonth.="
					<td align=center bgcolor='$BGcolor' $Style >
					<a href=\"JAVASCRIPT:%20void%20window.open('calendar.php?CurrentDate=".date("m/d/y",strtotime ("$CurrentDate $DaysToAd[$i]"))."&Zone=D','e','menubar=no,toolbar=no,location=no,scrollbars=no,status=no,width=600,height=400,top=100,left=100');\">
					<font color='$FontColor'>".date("d",strtotime ("$CurrentDate $DaysToAd[$i]"))."</font></a></td>";
			}
			$WriteMonth.="</tr>";
			$CurrentDate=date("m/d/y",strtotime("$CurrentDate +1 week"));
			$StartDateofWeek=date("w",strtotime ($CurrentDate));
			$EndofWeek=6 - $StartDateofWeek;
			$BeginWeek=date("m",strtotime ("$CurrentDate -$StartDateofWeek days"));
			$EndWeek=date("m",strtotime ("$CurrentDate +$EndofWeek days"));
		}
	}
	$WriteMonth.="</table></td></tr></table>";
	return $WriteMonth;
}

	if(!empty($GoToDay)){
	$StartDate=date("m/d/y",strtotime ("$GoToDay"));
	}
	else{
		if(empty($StartDate)){
			$StartDate=date("m/d/y");
			}
	}
print WriteMonth($StartDate,$BorderColor,$BarColor,1);
?>
                                            <?php
		/*@$db=mysql_connect("localhost","northboy","");//DB Connect
		if(!$db)
		{
			echo"<center>";
			echo"ไม่สามารถติดต่อฐานข้อมูลได้";
			echo"</center>";
			exit;
		}
		mysql_select_db("e_learning");*/
		include("./config.inc.php");
		$sql="select  *  from date where TID=$SESSION[id] and Day='".date("Y-m-d")."'";
		$result=mysql_query($sql);
		if($result)
		{
		while($row=mysql_fetch_row($result))
				if($row[3])
					print "<br><b><font color='#FF1100'>".$row[3]."</font></b>";
					//print "<input type='checkbox' name='del[ ]' value=".$row[0].">".$row[3];
		}
?>
                                          </td>
                                        </tr>
                                      </table></td>
                                    <td width=1 bgcolor=#cccccc><img height=1 
            src="images/dot.gif" width=1></td>
                                  </tr>
                                  <tr bgcolor=#cccccc> 
                                    <td colspan=3><img height=1 src="images/dot.gif" 
            width=1></td>
                                  </tr>
                                </tbody>
                              </table></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td width="70%" valign="top" ><table width="100%" border="0" cellpadding="8" cellspacing="0" >
              <tr> 
                <td height="22"><table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td valign="middle" class="title">สร้างวิชา</td>
                    </tr>
                    <tr> 
                      <td height="24" valign="middle" class="title">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td width="100%" valign="middle" class="title">
                        <?php include "show_courses.php"; ?>
                      </td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table>
      <!-- InstanceEndEditable --></td>
  </tr>
 </table>
</body>
<!-- InstanceEnd --></html>
