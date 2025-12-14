<?php
	require('./libraries/grab_globals.lib.php'); 
	session_start(); 
?>
<html>
<head>
<title>การเรียนการสอนผ่านอินเตอร์เน็ต</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
include("./connectDB.php");
//---------------------------------------------------------------function-----------------------------------------------------------//
function insert_date($TID,$Date,$Detail){
	connect_db();
	$sql="INSERT INTO date (TID,Day,Detail) VALUES ($TID,$Date,'$Detail')";
	$result=mysql_query($sql);
	if($result)
	{
	echo "Insert Complete";
	mysql_close();
	}
	else
	{
	mysql_close();
	exit;
	}
}

function del_date($TID,$ID){
									connect_db();
									$sql="delete from date where ID=$ID and TID=$TID"	;
									$result=mysql_query($sql);
									if(!$result)
									{
											echo"<center>";
											echo "ไม่สามารถลบ เหตุการณ์ได้ โปรดตรวจสอบสิทธิ์ของท่านอีกครั้ง";
											echo"</center>";
											mysql_close();
											exit;
									}
									else
									{
									mysql_close();
									}
	}

function datethai($date){ 
	 $day=substr("$date",6,2);
	 $month=substr("$date",4,2);
	 $month=(int)$month-1;
	 $year=substr("$date",0,4);
	 $year=$year+543;
	 $thaimonth=array("  มกราคม  ","  กุมภาพันธ์  ","  มีนาคม  ","  เมษายน  ","  พฤษภาคม  ","  มิถุนายน  ","  กรกฎาคม  ","  สิงหาคม  ","  กันยายน  ","  ตุลาคม  ","  พฤศจิกายน  ","  ธันวาคม  ");
	 $month=$thaimonth[$month];
	 return (int)$day."".$month."".$year;
	}
	
function DaysThai($Day)
{
$thaiWeek=array("อาทิตย์","จันทร์","อังคาร","พุธ","พฤหัสบดี","ศุกร์","เสาร์");
$thaiDay=$thaiWeek[$Day];
return $thaiDay;
}
	
function calendar($Date){
//$StartDate=date("m/d/y");
$StartDate=$Date;
$CurrentDate=date("m/1/y", strtotime ("$StartDate"));
$setMonth=date("m",strtotime ($CurrentDate));
$BeginWeek=date("m",strtotime ($CurrentDate));
$EndWeek=date("m",strtotime ($CurrentDate));
$Week=array( array (),array (),array(),array(),array());
for($j=0;$j<6;$j++){
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
		for($i=0;$i<7;$i++)
			{
			$strTemp="";
			$BGcolor="white";
			$FontColor="#000000";
			$Style="";
			if(date("m",strtotime ("$CurrentDate $DaysToAd[$i]"))!=$setMonth){
				$FontColor="#999999";
			}
			if(date("m/d/y",strtotime("$CurrentDate $DaysToAd[$i]"))==$StartDate){
				$FontColor="#FF0000";
			}
			//print date("m/d/y",strtotime ("$CurrentDate $DaysToAd[$i]"))."&nbsp;";
			//print "<a href='#'><font color='$FontColor'>".date("d",strtotime ("$CurrentDate $DaysToAd[$i]"))."</font></a>";
			$Week[$j][$i]="<a href=calendar.php?CurrentDate=".date("m/d/y",strtotime ("$CurrentDate $DaysToAd[$i]"))."&Zone=D>
			<font color='$FontColor'>".date("d",strtotime ("$CurrentDate $DaysToAd[$i]"))."</font></a>";
			}
			$CurrentDate=date("m/d/y",strtotime("$CurrentDate +1 week"));
			$StartDateofWeek=date("w",strtotime ($CurrentDate));
			$EndofWeek=6 - $StartDateofWeek;
			$BeginWeek=date("m",strtotime ("$CurrentDate -$StartDateofWeek days"));
			$EndWeek=date("m",strtotime ("$CurrentDate +$EndofWeek days"));
			}
	}
	return $Week;
}
//--------------------------------------------------working--------------------------------------------------------------//

?>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
<td valign="top">
<?php
//-------------------------------------------------set default value-----------------------------------------------------//
if($CurrentDate=="")		
$CurrentDate=date("m/d/y");

//------------------------------------------------set netx or preview week or month---------------------------//
if($prev)
{
 switch($Zone)
 		{
			case "W":$CurrentDate=date("m/d/y",strtotime("$CurrentDate -1 week"));break;
			case "M":$CurrentDate=date("m/d/y",strtotime("$CurrentDate -1 month"));break;
			default: ;break;
		}
}
if($next)
{
switch($Zone)
		{
			case"W":$CurrentDate=date("m/d/y",strtotime("$CurrentDate +1 week"));break;
			case"M":$CurrentDate=date("m/d/y",strtotime("$CurrentDate +1 month"));break;
			default: ;break;
		}
}
//------------------------------------get calendar of month---------------------------------------------//
$Week=calendar($CurrentDate);

//------------------------------------ get day of week-------------------------------------------------//
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
//----------------------------------------------working menu page--------------------------------------------------// 
switch ($Zone){
		case "D":
							?>
							<form name="calendar_form" action="calendar.php" method="post">
							<table border="0" cellpadding="5" cellspacing="0" width="100%">
							<tr><td width="100%">
							<table border="0" cellpadding="0" cellspacing="0" class="text" width="100%">
							<tr>
							<td width="100%">
							<input type="hidden" value="<?php echo $CurrentDate; ?>"name="CurrentDate">
							<select name="Zone">
							<option value="D"selected>วัน</option>
							<option value="W" >สัปห์ดา</option>
							<option value="M">เดือน</option>
							<!--option value="Y">ปี</option-->
							</select> <input type="submit" value="เปลี่ยน">
							</td>
							</tr>
							</table>
							</td>
							</tr>
							</table>
							<table border="0" cellpadding="5" cellspacing="0" class="text" width="100%">
							<tr><td colspan="2"><b><?php print  datethai(date("Ymd",strtotime($CurrentDate)));?></b></td></tr>
							<tr>
							<td width="30%">
							<textarea name="Detail" cols="30" rows="5"></textarea>
							</td>
							<td width="70%">
							<?php 
							print "<table border=1 cellpadding=0 cellspacing=0 class='text'>
										<tr bgcolor='#553399'><td align='center' colspan=7>".datethai(date("Ymd",strtotime($CurrentDate)))."</td></tr>
										<tr bgcolor='#637554'><td>อา</td><td>จ</td><td>อ</td><td>พ</td><td>พฤ</td><td>ศ</td><td>ส</td></tr>"; 
							for($j=0;$j<6;$j++)
								{
										print "<tr>";	
										for($i=0;$i<7;$i++)
											{
									 			print "<td>";	
												print $Week[$j][$i];
												print "</td>";
											}
										print "</tr>";
								}
								print "</table>"
							?>
							</td>
							</tr>
							<tr><td  colspan="2">
							 <b>เวลา</b>
							 <select name="houre">
							 	  <option>00</option>
  								  <option>01</option>
								  <option>02</option>
								  <option>03</option>
								  <option>04</option>
								  <option>05</option>
								  <option>06</option>
								  <option>07</option>
								  <option>08</option>
								  <option>09</option>
								  <option>10</option>
								  <option>11</option>
								  <option>12</option>
								  <option>13</option>
								  <option>14</option>
								  <option>15</option>
								  <option>16</option>
								  <option>17</option>
								  <option>18</option>
								  <option>19</option>
								  <option>20</option>
								  <option>21</option>
								  <option>22</option>
								  <option>23</option>
								  <option>24</option>
							</select>
							<b>นาที</b>
							<select name="min">
								  <option>00</option>
  								  <option>01</option>
								  <option>02</option>
								  <option>03</option>
								  <option>04</option>
								  <option>05</option>
								  <option>06</option>
								  <option>07</option>
								  <option>08</option>
								  <option>09</option>
								  <option>10</option>
								  <option>11</option>
								  <option>12</option>
								  <option>13</option>
								  <option>14</option>
								  <option>15</option>
								  <option>16</option>
								  <option>17</option>
								  <option>18</option>
								  <option>19</option>
								  <option>20</option>
								  <option>21</option>
								  <option>22</option>
								  <option>23</option>
								  <option>24</option>
								  <option>25</option>
  								  <option>26</option>
								  <option>27</option>
								  <option>28</option>
								  <option>29</option>
								  <option>30</option>
								  <option>31</option>
								  <option>32</option>
								  <option>33</option>
								  <option>34</option>
								  <option>35</option>
								  <option>36</option>
								  <option>37</option>
								  <option>38</option>
								  <option>39</option>
								  <option>40</option>
								  <option>41</option>
								  <option>42</option>
								  <option>43</option>
								  <option>44</option>
								  <option>45</option>
								  <option>46</option>
								  <option>47</option>
								  <option>48</option>
								  <option>49</option>
								  <option>50</option>
  								  <option>51</option>
								  <option>52</option>
								  <option>53</option>
								  <option>54</option>
								  <option>55</option>
								  <option>56</option>
								  <option>57</option>
								  <option>58</option>
								  <option>59</option>
							</select>
							</td>
							</tr>	
							<tr><td colspan="2"><input type="submit" name="insert" value="ตกลง"></td></tr>	
							</table>
							</form>
							<?php
							break;
		case "W":
							?>	
							<form name="calendar_form" action="calendar.php" method="post">
							<table border="0" cellpadding="5" cellspacing="0" width="100%">
							<tr><td width="100%">
							<table border="0" cellpadding="0" cellspacing="0" class="text" width="100%">
							<tr>
							<td width="100%">
							<select name="Zone">
							<option value="D">วัน</option>
							<option value="W" selected>สัปห์ดา</option>
							<option value="M">เดือน</option>
							<!--option value="Y">ปี</option-->
							</select> <input type="submit" value="เปลี่ยน">
							</td>
							</tr>
							</table>
							</td>
							</tr>
							</table>
							</form>
							<form name="calendar_form1" action="calendar.php" method="get">
							<table border="0" cellpadding="5" cellspacing="0" width="100%">
							<tr>
							<td width="100%">
							<table border="0" cellpadding="0" cellspacing="0" class="text" width="100%">
							<tr>
							<td width="100%">
							<?php 
							print "<b>วันที่&nbsp;".datethai(date("Ymd",strtotime("$CurrentDate $DaysToAd[0]")))."&nbsp;-&nbsp;
									วันที่&nbsp;".datethai(date("Ymd",strtotime("$CurrentDate $DaysToAd[6]")))."</b>"
							?>
							<input type="hidden" value="<?php echo $CurrentDate; ?>"name="CurrentDate">
							<input type="hidden" value="W" name="Zone">
							<input type="submit" value="ก่อนหน้า" name="prev">
							<input type="submit" value="ถัดไป" name="next"><br>
							<br>
							<table border="0" cellpadding="3" cellspacing="1" class="text" width="100%">
							<tr>
							<td class="text"><b>วัน</b></td>
							<td class="text" nowrap="nowrap"><b>วันที่</b></td>
							<td class="text" width="100%"><b>เหตุการณ์</b></td>
							</tr>
							<?php
						$row=array();
						for($i=0;$i<7;$i++)
							{
							print "<tr><td class='text'>".DaysThai($i)."</td><td class='text'>
										<a href='calendar.php?CurrentDate=".date("m/d/y",strtotime ("$CurrentDate $DaysToAd[$i]"))."&Zone=D'>"
										.date("d",strtotime ("$CurrentDate $DaysToAd[$i]"))."</a></td>
										<td width=100% class='text'>";
							connect_db();
							$sql="select  *  from date where TID=$SESSION[id] and Day='".date("Y-m-d",strtotime("$CurrentDate $DaysToAd[$i]"))."'";
							$result=mysql_query($sql);
							if($result)
							{
								while($row=mysql_fetch_row($result))
								if($row[3])
								print "<input type='checkbox' name='del[ ]' value=".$row[0].">".$row[3];
							}
							else
							print "No Result";
							print "</td></tr>";
							}
							?>
							</table>
							<br>
							<input onclick="if (!window.confirm('คุณแน่ใจที่จะลบเหตุการณ์ที่เลือกใช่หรือไม่')) return false;" type="submit" value="ลบเหตุการณ์ที่เลือก" name="Delete">
							</td>
							</tr>
							</table>
							</td>
							</tr>
							</table>
							</form>
							<?php break;
		case "M":	
							?>
							<table border="0" cellpadding="5" cellspacing="0" width="100%">
							<tr><td width="100%">
							<form name="calendar_form" action="calendar.php" method="post">
							<table border="0" cellpadding="0" cellspacing="0" class="text" width="100%">
							<tr>
							<td width="100%">
							<select name="Zone">
							<option value="D">วัน</option>
							<option value="W">สัปห์ดา</option>
							<option value="M" selected>เดือน</option>
							<!--option value="Y">ปี</option-->
							</select> <input type="submit" value="เปลี่ยน">
							</td>
							</tr>
							</table>
							</form>
							</td>
							</tr>
							</table>
							<table border="0" cellpadding="5" cellspacing="0" width="100%" height="100%">
							<tr>
							<td width="100%">
							<form name="calendar_form1" action="calendar.php" method="post">
							<table border="0" cellpadding="0" cellspacing="0" class="text" width="100%" height="100%">
							<tr>
							<td width="100%">
							<?php 
							print "<b>เดือน&nbsp;".substr(datethai(date("Ym1",strtotime("$CurrentDate"))),2)."</b>"
							?>
							<input type="hidden" value="<?php echo $CurrentDate; ?>"name="CurrentDate">
							<input type="hidden" value="M" name="Zone">
							<input type="submit" value="ก่อนหน้า" name="prev">
							<input type="submit" value="ถัดไป" name="next"><br>
							<br>
							<table border="0" cellpadding="2" cellspacing="1" class="text" width="100%">
							<tr  bgcolor="#3366FF"><td width="14%">อาทิตย์</td><td width="14%">จันทร์</td><td width="14%">อังคาร</td>
							<td width="14%">พุธ</td><td width="14%">พฤหัสบดี</td><td width="14%">ศุกร์</td><td width="14%">เสาร์</td></tr>
							<?php
							for($j=0;$j<5;$j++)
							{	print"<tr bgcolor='#33FFCC'>";
								for($i=0;$i<7;$i++)
								{
										
										print "<td class='text'>".$Week[$j][$i]."<br>";
										$Day=substr($Week[$j][$i],strpos($Week[$j][$i],"</font>")-2,2);
										connect_db();
										$sql="select  *  from date where TID=$SESSION[id] and Day='".date("Y-m-$Day",strtotime("$CurrentDate"))."'";
										$result=mysql_query($sql);
										if($result)
											{
											while($row=mysql_fetch_row($result))
											if($row[3])
											print "<input type='checkbox' name='del[ ]' value=".$row[0].">".$row[3]."<br>";
											}
											else
											print "No Result";
											print "</td>";
								}
								print"</tr>";
							}
							?>
							</table>
							<br>
							<input onclick="if (!window.confirm('คุณแน่ใจที่จะลบเหตุการณ์ที่เลือกใช่หรือไม่')) return false;" type="submit" value="ลบเหตุการณ์ที่เลือก" name="Delete">
							</td>
							</tr>
							</table>
							</form>
							</td>
							</tr>
							</table>
							<?php break;				
							
		default :	
							?>	
							<table border="0" cellpadding="5" cellspacing="0" width="100%">
							<tr><td width="100%">
							<form name="calendar_form" action="calendar.php" method="post">
							<table border="0" cellpadding="0" cellspacing="0" class="text" width="100%">
							<tr>
							<td width="100%">
							<select name="Zone">
							<option value="D">วัน</option>
							<option value="W" selected>สัปห์ดา</option>
							<option value="M">เดือน</option>
							<!--option value="Y">ปี</option-->
							</select> <input type="submit" value="เปลี่ยน">
							</td>
							</tr>
							</table>
							</form>
							</td>
							</tr>
							</table>
							<table border="0" cellpadding="5" cellspacing="0" width="100%">
							<tr>
							<td width="100%">
							<form name="calendar_form1" action="calendar.php" method="post">
							<table border="0" cellpadding="0" cellspacing="0" class="text" width="100%">
							<tr>
							<td width="100%">
							<?php 
							print "<b>วันที่&nbsp;".datethai(date("Ymd",strtotime("$CurrentDate $DaysToAd[0]")))."&nbsp;-&nbsp;
									วันที่&nbsp;".datethai(date("Ymd",strtotime("$CurrentDate $DaysToAd[6]")))."</b>"
							?>
							<input type="hidden" value="<?php echo $CurrentDate; ?>"name="CurrentDate">
							<input type="hidden" value="W" name="Zone">
							<input type="submit" value="ก่อนหน้า" name="prev">
							<input type="submit" value="ถัดไป" name="next"><br>
							<br>
							<table border="0" cellpadding="3" cellspacing="1" class="text" width="100%">
							<tr>
							<td class="text"><b>วัน</b></td>
							<td class="text" nowrap="nowrap"><b>วันที่</b></td>
							<td class="text" width="100%"><b>เหตุการณ์</b></td>
							</tr>
							<?php
							for($i=0;$i<7;$i++)
							{
							print "<tr><td class='text'>".DaysThai($i)."</td><td class='text'>
										<a href='calendar.php?CurrentDate=".date("m/d/y",strtotime ("$CurrentDate $DaysToAd[$i]"))."&Zone=D'>"
										.date("d",strtotime ("$CurrentDate $DaysToAd[$i]"))."</a></td>
										<td width=100% class='text'>";
							connect_db();
							$sql="select  *  from date where TID=$SESSION[id] and Day='".date("Y-m-d",strtotime("$CurrentDate $DaysToAd[$i]"))."'";
							$result=mysql_query($sql);
							if($result)
							{
								while($row=mysql_fetch_row($result))
								if($row[3])
								print "<input type='checkbox' name='del[ ]' value=".$row[0].">".$row[3];
							}
							else
							print "No Result";
							print "</td></tr>";
							}
							?>
							</table>
							<br>
							<input onclick="if (!window.confirm('คุณแน่ใจที่จะลบเหตุการณ์ที่เลือกใช่หรือไม่')) return false;" type="submit" value="ลบเหตุการณ์ที่เลือก" name="Delete">
							</td>
							</tr>
							</table>
							</form>
							</td>
							</tr>
							</table>
							<?php break;				
	}
	if($insert)
	{
	 insert_date($SESSION[id],date("Ymd",strtotime($CurrentDate)),$houre.":".$min.$Detail);
	 echo "<meta http-equiv=\"REFRESH\" content=\"1;URL= calendar.php\">";// ให้มัน refresh หน้าจอใหม่ ทุกๆ 3 วินาที
	 }
	if(($del&&$Delete))
	{  
		for($i=0;$i < count($del);$i++)
	    	del_date($SESSION[id],$del[$i]);
		echo "<meta http-equiv=\"REFRESH\" content=\"1;URL= calendar.php\">";// ให้มัน refresh หน้าจอใหม่ ทุกๆ 3 วินาที
	}
	
?>
</td>
</tr>
</table>
</body>
</html>
