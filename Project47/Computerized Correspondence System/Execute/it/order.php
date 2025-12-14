<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style5 {
	color: #FFFFFF;
	font-weight: bold;
	font-size: 12px;
	font-family: Tahoma, Verdana, Arial;
}
-->
</style>
</head>

<body>
<form name="form1" method="post" action="/it/index2.php?data=save3&username=<?=$username;?>&pwd=<?=$pwd;?>&data1=<?=$data1;?>">
  <table width="100%" border="0" cellpadding="5" cellspacing="0">
    <?php
				require("config.php");
				//$tbname = "book";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "select  * from book where ID_BOOKS='$data1'";
				$dbquery = mysql_db_query($dbname,$sql);
				//หาจำนวลเรกคอร์ดข้อมูลในตาราง
				$num_rows = mysql_num_rows($dbquery);
				//หาจำนวลฟิลด์ในตาราง
	 			$num_fields= mysql_num_fields($dbquery);
			//วนลูปแสดงข้อมูล
	 			$i=0;
	 			while($i<$num_rows)
	 			{
		 				$result = mysql_fetch_array($dbquery);
							$re_r_date   = $result[R_DATE];
							$re_r_month   = $result[R_MONTH];
							$re_r_year   = $result[R_YEAR];
							$re_r_topic  =$result[R_TOPIC];
							$re_r_to  =$result[R_TO];
							$i++;
				}
	 			mysql_close();
	 		?>
    <tr> 
      <td colspan="3" bgcolor="#990000"><p><font color="#FF0000" size="2"><br>
          <img src="images/icon2/ico559.gif" width="15" height="16" border="0">&nbsp;&nbsp;<span class="style5">สั่งการ 
          <br>
          </span></font></p></td>
      <td colspan="3" bgcolor="#990000">&nbsp;</td>
    </tr>
    <tr> 
      <td class="title">วันที่</td>
      <td colspan="2" class="style4"> 
        <? echo "$re_r_date $re_r_month $re_r_year";?>
      </td>
      <td width="43%" colspan="3">&nbsp;</td>
    </tr>
    <tr> 
      <td class="title">เรื่อง</td>
      <td colspan="2" class="style4"> 
        <?=$re_r_topic;?>
      </td>
      <td colspan="3">&nbsp;</td>
    </tr>
    <tr> 
      <td class="title">เรียน</td>
      <td colspan="2" class="style4"> 
        <?=$re_r_to;?>
      </td>
      <td colspan="3">&nbsp;</td>
    </tr>
    <tr> 
      <td width="8%" rowspan="3" align="left" valign="top" class="title">สั่งการ</td>
      <td width="41%" rowspan="3" align="left" valign="top"><textarea name="d20" wrap="VIRTUAL" id="d20"></textarea></td>
      <td width="8%" rowspan="3" align="left" valign="top" class="title">ประเภท</td>
      <td> <input name="type_order" type="checkbox" id="type_order5" value="order_to"> 
        <span class="style4"> ประกาศระบุuser&nbsp; </span></td>
    </tr>
    <tr> 
      <td> <input name="type_order" type="checkbox" id="type_order6" value="order_and_sent"> 
        <span class="style4">ประกาศ/แจ้งเตือน </span></td>
    </tr>
    <tr> 
      <td> <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
          <?php
				require("config.php");
				//$tbname = "book";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "select USER_NAME,SERNAME,POSITION from users where POSITION='user'";
				$dbquery = mysql_db_query($dbname,$sql);
				//หาจำนวลเรกคอร์ดข้อมูลในตาราง
				$num_rows = mysql_num_rows($dbquery);
				//หาจำนวลฟิลด์ในตาราง
	 			$num_fields= mysql_num_fields($dbquery);
			//วนลูปแสดงข้อมูล
	 			$i=0;
	 			while($i<$num_rows)
	 			{
		 				$result = mysql_fetch_array($dbquery);
							$re_user   = $result[USER_NAME];
							$re_sername  = $result[SERNAME];
							$re_position  =$result[POSITION ];
							$i++;
	 		?>
          <tr align="center" valign="top" bgcolor="#999999"> 
            <td height="28" align="left" bgcolor="#CCCCCC"> <p><span class="style1"> 
                &nbsp;&nbsp;&nbsp;&nbsp; 
                <input name="checkbox[]" type="checkbox" value="<?=$re_user;?>">
                </span> <span class="style4"> 
                <?=$re_user.'    '.$re_sername;?>
                </span></p></td>
          </tr>
          <?
				  			}
	 			mysql_close();
		?>
        </table></td>
    </tr>
    <tr> 
      <td align="left" valign="top" class="title">ระยะเวลา</td>
      <td align="left" valign="top"><span class="style1"> 
        <input name="order" type="radio" value="order_alltime" checked>
        </span><span class="style4">ไม่จำกัดเวลา</span><span class="style1"><br>
        <input type="radio" name="order" value="30day">
        </span><span class="style4"> เป็นเวลา 30 วัน</span><span class="style1"><br>
        <input name="order" type="radio" value="order_intime">
        </span><span class="style4">ตั้งแต</span><span class="style1">่ 
        <select  
                        name=st_date size="0" id="select2">
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
        <select 
                         name=st_month id="st_month">
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
        <select 
                         name=st_year id="st_year">
          <option value="2548">2548</option>
          <option value="2549">2549</option>
          <option value="2550">2550</option>
          <option value="2551">2551</option>
        </select>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="style4">ถึง</span><span class="style1"> 
        <select  
                        name=end_date id="end_date">
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
        <select 
                         name=end_month id="select3">
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
        <select 
                         name=end_year id="select4">
          <option value="2548">2548</option>
          <option value="2549">2549</option>
          <option value="2550">2550</option>
          <option value="2551">2551</option>
        </select>
        </span></td>
      <td align="left" valign="top">&nbsp;</td>
      <td><span class="style1"> </span></td>
    </tr>
    <tr> 
      <td colspan="4" align="center"> <input type="submit" name="Submit" value="Submit" ></td>
    </tr>
  </table>
</form>
</body>
</html>
