<html>
<head>
<title>create pdf </title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style9 {
	color: #006699;
	font-weight: bold;
}
-->
</style>
</head>

<body >
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="eeeeee">
  <?
				include "datethai.php";
				$now_date=$data_date;
				require("config.php");
				$tbname = "users";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "SELECT * FROM `users`  WHERE USER_NAME='$username' LIMIT 0 , 30";
				$dbquery = mysql_db_query($dbname,$sql);
				//หาจำนวลเรกคอร์ดข้อมูลในตาราง
				$num_rows = mysql_num_rows($dbquery);
				//หาจำนวลฟิลด์ในตาราง
	 			$num_fields= mysql_num_fields($dbquery);
		 					$result = mysql_fetch_array($dbquery);  
							$re_yos=$result[YOS];
							$re_username  =$result[USER_NAME ];
							$re_sername  =$result[SERNAME ];
							$re_positionuser  =$result[POSITION_USER];
							$re_level   =$result[LEVEL_USER   ];
							$re_last  =$result[LAST_USE];
							$re_count=$result[COUNT_DAY];
							mysql_close(); 
			$tbname = "la";
			mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
			mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
			$sql2= "SELECT * FROM `la`  WHERE USER_NAME='$username' and TYPE='ลากิจ'";
			$dbquery2 = mysql_db_query($dbname,$sql2);
		 	$result2 = mysql_fetch_array($dbquery2);  
							$re_ldate=$result2[L_DATE];
							$re_lmonth=$result2[L_MONTH];
							$re_lyear=$result2[L_YEAR];
							$re_tdate=$result2[T_DATE];
							$re_tmonth=$result2[T_MONTH];
							$re_num=$result2[NUM];
							$re_tyear=$result2[T_YEAR];
 			mysql_close(); 
			$nowdate=datethai("$re_year $re_month$re_DATE");
	  		//echo "$nowdate";
 ?>
  <tr> 
    <td align="left" valign="top"><form action="g_from1.php?data_date=<?=$data_date;?>"  method="post" target="_blank">
	<input type="hidden"  name="user_name" value="<? echo "$re_yos $re_username $re_sername";?>" >
	<input type="hidden"  name="position_user" value="<?=$re_positionuser;?>" >
	<input type="hidden"  name="re_level" value="<?=$re_level;?>" >
	<input type="hidden"  name="re_last" value="<?=$re_last;?>" >
	<input type="hidden"  name="re_count" value="<?=$re_count;?>" >
	<input type="hidden"  name="d11" value="<?=$re_ldate;?>" >
	<input type="hidden"  name="d12" value="<?=$re_lmonth;?>" >
	<input type="hidden"  name="d13" value="<?=$re_lyear;?>" >
	<input type="hidden"  name="d14" value="<?=$re_tdate;?>" >
	<input type="hidden"  name="d15" value="<?=$re_tmonth;?>" >
	<input type="hidden"  name="d16" value="<?=$re_tyear;?>" >
	<input type="hidden"  name="d17" value="<?=$re_tyear;?>" >
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="38" bgcolor="#990000">&nbsp;<img src="images/icon2/ico416.gif" width="16" height="21" align="absmiddle">&nbsp;<span class="style8"><strong>หนังสือลาป่วย/ลากิจ/ลาคลอดบุตร</strong></span></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="5" cellspacing="0" bgcolor="eeeeee">
          <tr align="center" class="style4"> 
            <td height="43" colspan="2" class="title">ใบลาป่วย ลากิจส่วนตัว ลาคลอดบุตร</td>
          </tr>
          <tr align="left" class="style4"> 
            <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ข้าพเจ้า<? echo "$re_yos $re_username $re_sername";?> 
              ตำแหน่ง 
              <?=$re_positionuser;?>
              ระดับ 
              <?=$re_level;?>
              ภาควิชาวิศวกรรมคอมพิวเตอร์ คณะวิศวกรรมศาสตร์ </td>
          </tr>
          <tr align="center" class="style4"> 
            <td width="12%" align="right">ขอลา</td>
            <td width="88%" align="left"><input name="d2" type="radio" value="ขอลาป่วย" checked>
              ขอลาป่วย 
              <input type="radio" name="d2" value="ลากิจส่วนตัว">
              ลากิจส่วนตัว 
              <input type="radio" name="d2" value="ลาคลอดบุตร">
              ลาคลอดบุตร</td>
          </tr>
          <tr align="center" class="style4"> 
            <td align="right" valign="top">&nbsp;</td>
            <td valign="top">&nbsp;</td>
          </tr>
          <tr align="center" class="style4"> 
            <td align="right" valign="top">เนื่องจาก</td>
            <td align="left" valign="top"><textarea name="d3" cols="60" rows="7" wrap="VIRTUAL" id="textarea3"></textarea></td>
          </tr>
          <tr align="left" class="style4"> 
            <td colspan="2">&nbsp;&nbsp;ตั้งแตวันที่ 
              <select  
                        name=d4 size="0" id="select">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12" selected>12</option>
                <option value="13">13</option>
                <option value="14">14</option>
                <option value="15">15</option>
                <option value="16">16</option>
                <option value="17">17</option>
                <option value="18">18</option>
                <option value="19">19</option>
                <option value="20">20</option>
                <option value="21">21</option>
                <option value="22">22</option>
                <option value="23">23</option>
                <option value="24">24</option>
                <option value="25">25</option>
                <option value="26">26</option>
                <option value="27">27</option>
                <option value="28">28</option>
                <option value="29">29</option>
                <option value="30">30</option>
                <option value="31">31</option>
              </select>
              เดือน 
              <select 
                         name=d5 id="select5">
                <option value="มกราคม">มกราคม</option>
                <option value="กุมภาพันธ์">กุมภาพันธ์</option>
                <option value="มีนาคม" selected>มีนาคม</option>
                <option value="เมษายน">เมษายน</option>
                <option value="พฤษภาคม">พฤษภาคม</option>
                <option value="มิถุนายน">มิถุนายน</option>
                <option value="กรกฎาคม">กรกฎาคม</option>
                <option value="สิงหาคม">สิงหาคม</option>
                <option value="กันยายน">กันยายน</option>
                <option value="ตุลาคม">ตุลาคม</option>
                <option value="พฤศจิกายน">พฤศจิกายน</option>
                <option value="ธันวาคม">ธันวาคม</option>
              </select>
              พ.ศ. 
              <select 
                         name=d6 id="select6">
                <option value="2548">2548</option>
                <option value="2549">2549</option>
                <option value="2550">2550</option>
                <option value="2551">2551</option>
              </select> </td>
          </tr>
          <tr align="left" class="style4"> 
            <td colspan="2">&nbsp;&nbsp;ถึงวันที่&nbsp;&nbsp;&nbsp; <select  
                        name=d7 id="d7">
                <option value=1>1</option>
                <option 
                          value=2>2</option>
                <option value=3>3</option>
                <option 
                          value=4>4</option>
                <option value=5>5</option>
                <option 
                          value=6>6</option>
                <option value=7>7</option>
                <option 
                          value=8>8</option>
                <option value=9>9</option>
                <option 
                          value=10>10</option>
                <option value=11>11</option>
                <option value=12 selected>12</option>
                <option 
                          value=13>13</option>
                <option value=14>14</option>
                <option value=15>15</option>
                <option 
                          value=16>16</option>
                <option value=17>17</option>
                <option value=18>18</option>
                <option 
                          value=19>19</option>
                <option value=20>20</option>
                <option value=21>21</option>
                <option 
                          value=22>22</option>
                <option value=23>23</option>
                <option value=24>24</option>
                <option 
                          value=25>25</option>
                <option value=26>26</option>
                <option value=27>27</option>
                <option 
                          value=28>28</option>
                <option value=29>29</option>
                <option value=30>30</option>
                <option 
                          value=31>31</option>
              </select>
              เดือน 
              <select 
                         name=d8 id="select7">
                <option value="มกราคม">มกราคม</option>
                <option value="กุมภาพันธ์">กุมภาพันธ์</option>
                <option value="มีนาคม" selected>มีนาคม</option>
                <option value="เมษายน">เมษายน</option>
                <option value="พฤษภาคม">พฤษภาคม</option>
                <option value="มิถุนายน">มิถุนายน</option>
                <option value="กรกฎาคม">กรกฎาคม</option>
                <option value="สิงหาคม">สิงหาคม</option>
                <option value="กันยายน">กันยายน</option>
                <option value="ตุลาคม">ตุลาคม</option>
                <option value="พฤศจิกายน">พฤศจิกายน</option>
                <option value="ธันวาคม">ธันวาคม</option>
              </select>
              พ.ศ. 
              <select 
                         name=d9 id="select8">
                <option value="2548">2548</option>
                <option value="2549">2549</option>
                <option value="2550">2550</option>
                <option value="2551">2551</option>
              </select>
              เป็นเวลา 
              <input name="d10" type="text" id="d10" size="2">
              วันทำการ </td>
          </tr>
          <tr align="left" class="style4"> 
            <td colspan="2">&nbsp;&nbsp;ในระหว่างลาจะติดต่อข้าพเจ้าได้ที่ 
              <input name="d18" type="text" id="d18" size="10"></td>
          </tr>
          <tr align="center" class="style4"> 
            <td align="left">&nbsp;&nbsp;ลงชื่อ</td>
            <td align="left"> <input name="d19" type="text" id="menu22" value="<? echo "$re_yos $re_username $re_sername";?>" size="20"></td>
          </tr>
          <tr align="center" class="style4"> 
            <td colspan="2"><input type="submit" name="Submit" value="ส่งแบบฟอร์ม"></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
</body>
</html>
