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
<?php
	require('./libraries/grab_globals.lib.php'); 
$FONT ="Verdana, Arial, Helvetica, sans-serif";
$FONTSIZE="8";
$FONTCOLOR="#000000";
$BorderColor="#CCCCFF";
$BarColor="#000066";

function WriteMonth($StartDate,$Border_color,$Title_color){
	$WriteMonth="";
	$CurrentDate=date("m/1/y", strtotime ("$StartDate"));
	$setMonth=date("m",strtotime ($CurrentDate));
	$BeginWeek=date("m",strtotime ($CurrentDate));
	$EndWeek=date("m",strtotime ($CurrentDate));
	
	$WriteMonth="
			<table border=0 cellspacing=0 cellpadding=0 bgcolor='$Border_color' width=150 resize=none >
			<tr><td>
			<table border=0 cellspacing=1 cellpadding=2 resize='none' width=100% style='border: 1pt solid $Border_color' >
			<tr>
				<td colspan=7 valign=top BGCOLOR='$Title_color' align=center >
				<a href='cal.php?GoToDay="
				.date("m/1/y", strtotime ("$StartDate -1 months")).
				"'>
				<font color='white'><<<</font></a>
				<b><font color='white'>"
				.date("M",strtotime ($StartDate))." ".date("Y",strtotime ($StartDate)).
				"</font></b>
				<a href='cal.php?GoToDay="
				.date("m/1/y", strtotime ("$StartDate +1 months")).
				"'><font color='white'>>>></font></a>
				</td>
			</tr>
			<tr>
				<td align='center' valign=top bgcolor=white ><B>S</B></td>
				<td align='center' bgcolor=white ><B>M</B></td>
				<td align='center' bgcolor=white ><B>T</B></td>
				<td align='center' bgcolor=white ><B>W</B></td>
				<td align='center' bgcolor=white ><B>T</B></td>
				<td align='center' bgcolor=white ><B>F</B></td>
				<td align='center' bgcolor=white ><B>S</B></td>
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
				if(date("m/d/y",strtotime ("$CurrentDate $DaysToAd[$i]"))==
				date("m/d/y",strtotime($StartDate))){
					$Style="style='border: 1pt solid red'";
				}
				$WriteMonth.="
					<td align=center bgcolor='$BGcolor' $Style >
					<a href='cal.php?GoToDay="
					.date("m/d/y",strtotime ("$CurrentDate $DaysToAd[$i]")).
					"'><font color='$FontColor'>"
					.date("d",strtotime ("$CurrentDate $DaysToAd[$i]")).
					"</font></a></td>";
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
}else{
	if(empty($StartDate)){
		$StartDate=date("m/d/y");
	}
}

print "<html><head>";
print "<style>";
print "A, TD, LI, P{font-family: $FONT;font-size: $FONTSIZE.pt;color: $FONTCOLOR;}
";
print "BODY{font-family: $FONT;font-size: $FONTSIZE.pt;}
";
print "</STYLE></head>";
print "<body>";
print "
	<table width=100% style='border:1pt solid $BorderColor' >
		<tr>
		<td width='100'>"
		.WriteMonth($StartDate,$BorderColor,$BarColor,1).
		"</td>
		<td><font size=1>Today's Date: "
		.date("M d, Y").
		"</font><p><font siz2=4><b>Current View: "
		.date("M d, Y",strtotime($StartDate)).
		"</b></font></td>
		</tr>
	</table>
";
?>
	<!-- InstanceEndEditable --></td>
  </tr>
 </table>
</body>
<!-- InstanceEnd --></html>
