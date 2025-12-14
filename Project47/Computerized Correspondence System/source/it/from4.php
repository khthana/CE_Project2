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

<body bgcolor="#FFFFFF" >
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
							$re_position  =$result[POSITION_USER];
							mysql_close(); 
			$nowdate=datethai("$re_year $re_month$re_DATE");
	  		//echo "$nowdate";
 ?>
  <tr> 
    <td align="left" valign="top"><form action="g_from4.php?data_date=<?=$data_date;?>"  method="post" target="_blank">
	<input type="hidden"  name="user_name" value="<? echo "$re_yos $re_username $re_sername";?>" >
	<input type="hidden"  name="position_user" value="<?=$re_position;?>" >
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
            <td height="38" bgcolor="#990000">&nbsp;<img src="images/icon2/ico416.gif" width="16" height="21" align="absmiddle">&nbsp;<span class="style8"><strong>ขออนุญาติใช้รถส่วนกลาง</strong></span></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="5" cellspacing="1">
          <tr align="center" bgcolor="cccccc" class="style4"> 
            <td height="43" colspan="2" class="title"><strong>ขออนุญาติใช้รถส่วนกลาง</strong></td>
          </tr>
          <tr align="center" class="style4"> 
            <td width="30%" bgcolor="eeeeee">&nbsp;</td>
            <td width="70%" align="left" bgcolor="eeeeee">ข้าพเจ้า<? echo "$re_yos $re_username $re_sername";?> 
              ตำแหน่ง 
              <?=$re_position;?>
            </td>
          </tr>
          <tr align="left" class="style4"> 
            <td align="right" bgcolor="eeeeee" class="style4">ขอใช้รถ(ไปที่ใหน) </td>
            <td bgcolor="eeeeee"><input name="d50" type="text" id="d50"></td>
          </tr>
          <tr align="left" class="style4"> 
            <td align="right" bgcolor="eeeeee" class="style4">เพื่อ (ไปทำอะไร) </td>
            <td bgcolor="eeeeee"><input name="d51" type="text" id="d51">
              มีคนนั่ง 
              <input name="d52" type="text" id="d52" size="2">
              คน </td>
          </tr>
          <tr align="left" class="style4"> 
            <td align="right" bgcolor="eeeeee" class="style4">ในวันที่</td>
            <td bgcolor="eeeeee">
<select  
                        name=d53 size="0" id="select2">
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
                         name=d54 id="select3">
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
                         name=d55 id="select4">
                <option value="2548">2548</option>
                <option value="2549">2549</option>
                <option value="2550">2550</option>
                <option value="2551">2551</option>
              </select>
              เวลา 
              <input name="d56" type="text" id="d56" size="8"></td>
          </tr>
          <tr align="left" class="style4"> 
            <td align="right" bgcolor="eeeeee" class="style4">ถึงวันที่&nbsp;</td>
            <td bgcolor="eeeeee"> 
              <select  
                        name=d57 id="select9">
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
                         name=d58 id="select10">
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
                         name=d59 id="select11">
                <option value="2548">2548</option>
                <option value="2549">2549</option>
                <option value="2550">2550</option>
                <option value="2551">2551</option>
              </select>
              เวลา 
              <input name="d60" type="text" id="d60" size="8"></td>
          </tr>
          <tr align="left" class="style4"> 
            <td align="right" valign="top" bgcolor="eeeeee" class="style4">ความประสงค์ของผู้ใช้รถ</td>
            <td bgcolor="eeeeee"> <input name="d2" type="radio" value="1" checked>
              ส่งเที่ยวเดียว 
              <input type="radio" name="d2" value="2">
              ส่งแล้วรอรับกลัีบ <br> <input type="radio" name="d2" value="3">
              ส่งแล้วให้ไปรับเวลา 
              <input name="d61" type="text" id="d61" size="8"></td>
          </tr>
          <tr align="center" class="style4"> 
            <td colspan="2" align="left">&nbsp; </td>
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
