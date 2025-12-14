<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>

<body>
<form name="form1" method="post" action="index2.php?data=confirm_order&username=<?=$username;?>&pwd=<?=$pwd;?>">
  <table width="100%" border="0">
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
							$re_r_topic  =$result[R_TOPIC];
							$re_r_to  =$result[R_TO];
							$i++;
				}
	 			mysql_close();
	 		?>
    <tr> 
      <td>วันที่</td>
      <td colspan="2"><?=$re_r_date;?></td>
    </tr>
    <tr> 
      <td>เรื่อง</td>
      <td colspan="2"><?=$re_r_topic;?></td>
    </tr>
    <tr> 
      <td>เรียน</td>
      <td colspan="2"><?=$re_r_to;?></td>
    </tr>
    <tr> 
      <td rowspan="3" align="left" valign="top"><span class="style1">หัวข้อ </span></td>
      <td><input type="radio" name="radiobutton" value="radiobutton"></td>
      <td><input type="radio" name="radiobutton" value="radiobutton"></td>
    </tr>
    <tr> 
      <td><input type="radio" name="radiobutton" value="radiobutton"></td>
      <td><input type="radio" name="radiobutton" value="radiobutton"></td>
    </tr>
    <tr> 
      <td><input type="radio" name="radiobutton" value="radiobutton"></td>
      <td><input type="radio" name="radiobutton" value="radiobutton">
        <select name="menu1" onChange="MM_jumpMenu('parent',this,0)">
          <option selected>unnamed1</option>
        </select></td>
    </tr>
    <tr> 
      <td width="59" align="left" valign="top">สั่งการ</td>
      <td width="347" align="left" valign="top"><span class="style1"> 
        <input name="order" type="radio" value="order_alltime" checked>
        ประกาศตลอด <br>
        <input type="radio" name="radiobutton" value="radiobutton">
        ประกาศ 30 วัน<br>
        <input name="order" type="radio" value="order_intime">
        ประกาศ 
        <SELECT  
                        name=st_date size="0" id="select3">
          <OPTION value=1>1</OPTION>
          <OPTION 
                          value=2>2</OPTION>
          <OPTION value=3>3</OPTION>
          <OPTION 
                          value=4>4</OPTION>
          <OPTION value=5>5</OPTION>
          <OPTION 
                          value=6>6</OPTION>
          <OPTION value=7>7</OPTION>
          <OPTION 
                          value=8>8</OPTION>
          <OPTION value=9>9</OPTION>
          <OPTION 
                          value=10>10</OPTION>
          <OPTION value=11>11</OPTION>
          <OPTION value=12 selected>12</OPTION>
          <OPTION 
                          value=13>13</OPTION>
          <OPTION value=14>14</OPTION>
          <OPTION value=15>15</OPTION>
          <OPTION 
                          value=16>16</OPTION>
          <OPTION value=17>17</OPTION>
          <OPTION value=18>18</OPTION>
          <OPTION 
                          value=19>19</OPTION>
          <OPTION value=20>20</OPTION>
          <OPTION value=21>21</OPTION>
          <OPTION 
                          value=22>22</OPTION>
          <OPTION value=23>23</OPTION>
          <OPTION value=24>24</OPTION>
          <OPTION 
                          value=25>25</OPTION>
          <OPTION value=26>26</OPTION>
          <OPTION value=27>27</OPTION>
          <OPTION 
                          value=28>28</OPTION>
          <OPTION value=29>29</OPTION>
          <OPTION value=30>30</OPTION>
          <OPTION 
                          value=31>31</OPTION>
        </SELECT>
        <SELECT 
                         name=st_month id="select4">
          <OPTION 
                          value=1>มกราคม</OPTION>
          <OPTION 
                          value=2>กุมภาพันธ์</OPTION>
          <OPTION value=3 
                          selected>มีนาคม</OPTION>
          <OPTION 
                          value=4>เมษายน</OPTION>
          <OPTION 
                          value=5>พฤษภาคม</OPTION>
          <OPTION 
                          value=6>มิถุนายน</OPTION>
          <OPTION 
                          value=7>กรกฎาคม</OPTION>
          <OPTION 
                          value=8>สิงหาคม</OPTION>
          <OPTION 
                          value=9>กันยายน</OPTION>
          <OPTION 
                          value=10>ตุลาคม</OPTION>
          <OPTION 
                          value=11>พฤศจิกายน</OPTION>
          <OPTION 
                          value=12>ธันวาคม</OPTION>
        </SELECT>
        <SELECT 
                         name=st_year id="select5">
          <OPTION 
                          value=1989>2532</OPTION>
          <OPTION 
                          value=1988>2531</OPTION>
          <OPTION 
                          value=1987>2530</OPTION>
          <OPTION 
                          value=1986>2529</OPTION>
          <OPTION 
                          value=1985>2528</OPTION>
          <OPTION 
                          value=1984>2527</OPTION>
          <OPTION 
                          value=1983>2526</OPTION>
          <OPTION 
                          value=1982>2525</OPTION>
          <OPTION 
                          value=1981>2524</OPTION>
          <OPTION value=1980 
                          selected>2523</OPTION>
          <OPTION 
                          value=1979>2522</OPTION>
          <OPTION 
                          value=1978>2521</OPTION>
          <OPTION 
                          value=1977>2520</OPTION>
          <OPTION 
                          value=1976>2519</OPTION>
          <OPTION 
                          value=1975>2518</OPTION>
          <OPTION 
                          value=1974>2517</OPTION>
          <OPTION 
                          value=1973>2516</OPTION>
          <OPTION 
                          value=1972>2515</OPTION>
          <OPTION 
                          value=1971>2514</OPTION>
          <OPTION 
                          value=1970>2513</OPTION>
          <OPTION 
                          value=1969>2512</OPTION>
          <OPTION 
                          value=1968>2511</OPTION>
          <OPTION 
                          value=1967>2510</OPTION>
          <OPTION 
                          value=1966>2509</OPTION>
          <OPTION 
                          value=1965>2508</OPTION>
          <OPTION 
                          value=1964>2507</OPTION>
          <OPTION 
                          value=1963>2506</OPTION>
          <OPTION 
                          value=1962>2505</OPTION>
          <OPTION 
                          value=1961>2504</OPTION>
          <OPTION 
                          value=1960>2503</OPTION>
          <OPTION 
                          value=1959>2502</OPTION>
          <OPTION 
                          value=1958>2501</OPTION>
          <OPTION 
                          value=1957>2500</OPTION>
          <OPTION 
                          value=1956>2499</OPTION>
          <OPTION 
                          value=1955>2498</OPTION>
          <OPTION 
                          value=1954>2497</OPTION>
          <OPTION 
                          value=1953>2496</OPTION>
          <OPTION 
                          value=1952>2495</OPTION>
          <OPTION 
                          value=1951>2494</OPTION>
          <OPTION 
                          value=1950>2493</OPTION>
          <OPTION 
                          value=1949>2492</OPTION>
          <OPTION 
                          value=1948>2491</OPTION>
          <OPTION 
                          value=1947>2490</OPTION>
          <OPTION 
                          value=1946>2489</OPTION>
          <OPTION 
                          value=1945>2488</OPTION>
          <OPTION 
                          value=1944>2487</OPTION>
          <OPTION 
                          value=1943>2486</OPTION>
          <OPTION 
                          value=1942>2485</OPTION>
          <OPTION 
                          value=1941>2484</OPTION>
          <OPTION 
                          value=1940>2483</OPTION>
          <OPTION 
                          value=1939>2482</OPTION>
          <OPTION 
                          value=1938>2481</OPTION>
          <OPTION 
                          value=1937>2480</OPTION>
          <OPTION 
                          value=1936>2479</OPTION>
        </SELECT>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ถึง 
        <SELECT  
                        name=end_date id="select6">
          <OPTION value=1>1</OPTION>
          <OPTION 
                          value=2>2</OPTION>
          <OPTION value=3>3</OPTION>
          <OPTION 
                          value=4>4</OPTION>
          <OPTION value=5>5</OPTION>
          <OPTION 
                          value=6>6</OPTION>
          <OPTION value=7>7</OPTION>
          <OPTION 
                          value=8>8</OPTION>
          <OPTION value=9>9</OPTION>
          <OPTION 
                          value=10>10</OPTION>
          <OPTION value=11>11</OPTION>
          <OPTION value=12 selected>12</OPTION>
          <OPTION 
                          value=13>13</OPTION>
          <OPTION value=14>14</OPTION>
          <OPTION value=15>15</OPTION>
          <OPTION 
                          value=16>16</OPTION>
          <OPTION value=17>17</OPTION>
          <OPTION value=18>18</OPTION>
          <OPTION 
                          value=19>19</OPTION>
          <OPTION value=20>20</OPTION>
          <OPTION value=21>21</OPTION>
          <OPTION 
                          value=22>22</OPTION>
          <OPTION value=23>23</OPTION>
          <OPTION value=24>24</OPTION>
          <OPTION 
                          value=25>25</OPTION>
          <OPTION value=26>26</OPTION>
          <OPTION value=27>27</OPTION>
          <OPTION 
                          value=28>28</OPTION>
          <OPTION value=29>29</OPTION>
          <OPTION value=30>30</OPTION>
          <OPTION 
                          value=31>31</OPTION>
        </SELECT>
        <SELECT 
                         name=end_month id="select7">
          <OPTION 
                          value=1>มกราคม</OPTION>
          <OPTION 
                          value=2>กุมภาพันธ์</OPTION>
          <OPTION value=3 
                          selected>มีนาคม</OPTION>
          <OPTION 
                          value=4>เมษายน</OPTION>
          <OPTION 
                          value=5>พฤษภาคม</OPTION>
          <OPTION 
                          value=6>มิถุนายน</OPTION>
          <OPTION 
                          value=7>กรกฎาคม</OPTION>
          <OPTION 
                          value=8>สิงหาคม</OPTION>
          <OPTION 
                          value=9>กันยายน</OPTION>
          <OPTION 
                          value=10>ตุลาคม</OPTION>
          <OPTION 
                          value=11>พฤศจิกายน</OPTION>
          <OPTION 
                          value=12>ธันวาคม</OPTION>
        </SELECT>
        <SELECT 
                         name=end_year id="select8">
          <OPTION 
                          value=1989>2532</OPTION>
          <OPTION 
                          value=1988>2531</OPTION>
          <OPTION 
                          value=1987>2530</OPTION>
          <OPTION 
                          value=1986>2529</OPTION>
          <OPTION 
                          value=1985>2528</OPTION>
          <OPTION 
                          value=1984>2527</OPTION>
          <OPTION 
                          value=1983>2526</OPTION>
          <OPTION 
                          value=1982>2525</OPTION>
          <OPTION 
                          value=1981>2524</OPTION>
          <OPTION value=1980 
                          selected>2523</OPTION>
          <OPTION 
                          value=1979>2522</OPTION>
          <OPTION 
                          value=1978>2521</OPTION>
          <OPTION 
                          value=1977>2520</OPTION>
          <OPTION 
                          value=1976>2519</OPTION>
          <OPTION 
                          value=1975>2518</OPTION>
          <OPTION 
                          value=1974>2517</OPTION>
          <OPTION 
                          value=1973>2516</OPTION>
          <OPTION 
                          value=1972>2515</OPTION>
          <OPTION 
                          value=1971>2514</OPTION>
          <OPTION 
                          value=1970>2513</OPTION>
          <OPTION 
                          value=1969>2512</OPTION>
          <OPTION 
                          value=1968>2511</OPTION>
          <OPTION 
                          value=1967>2510</OPTION>
          <OPTION 
                          value=1966>2509</OPTION>
          <OPTION 
                          value=1965>2508</OPTION>
          <OPTION 
                          value=1964>2507</OPTION>
          <OPTION 
                          value=1963>2506</OPTION>
          <OPTION 
                          value=1962>2505</OPTION>
          <OPTION 
                          value=1961>2504</OPTION>
          <OPTION 
                          value=1960>2503</OPTION>
          <OPTION 
                          value=1959>2502</OPTION>
          <OPTION 
                          value=1958>2501</OPTION>
          <OPTION 
                          value=1957>2500</OPTION>
          <OPTION 
                          value=1956>2499</OPTION>
          <OPTION 
                          value=1955>2498</OPTION>
          <OPTION 
                          value=1954>2497</OPTION>
          <OPTION 
                          value=1953>2496</OPTION>
          <OPTION 
                          value=1952>2495</OPTION>
          <OPTION 
                          value=1951>2494</OPTION>
          <OPTION 
                          value=1950>2493</OPTION>
          <OPTION 
                          value=1949>2492</OPTION>
          <OPTION 
                          value=1948>2491</OPTION>
          <OPTION 
                          value=1947>2490</OPTION>
          <OPTION 
                          value=1946>2489</OPTION>
          <OPTION 
                          value=1945>2488</OPTION>
          <OPTION 
                          value=1944>2487</OPTION>
          <OPTION 
                          value=1943>2486</OPTION>
          <OPTION 
                          value=1942>2485</OPTION>
          <OPTION 
                          value=1941>2484</OPTION>
          <OPTION 
                          value=1940>2483</OPTION>
          <OPTION 
                          value=1939>2482</OPTION>
          <OPTION 
                          value=1938>2481</OPTION>
          <OPTION 
                          value=1937>2480</OPTION>
          <OPTION 
                          value=1936>2479</OPTION>
        </SELECT>
        </span></td>
      <td width="366" align="left" valign="top"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr align="center" valign="top" bgcolor="#999999"> 
            <td height="20" align="left"><input type="checkbox" name="checkbox" value="checkbox">
              ประกาศทุคน</td>
          </tr>
          <?php
				require("config.php");
				//$tbname = "book";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "select USER_NAME,POSITION from users where POSITION='user'";
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
							$re_position  =$result[POSITION ];
							$i++;
	 		?>
          <tr align="center" valign="top" bgcolor="#999999"> 
            <td height="20" align="left"> <span class="style3"><span class="style1"> 
              </span></span><span class="style3"><span class="style3"><span class="style1"> 
              </span></span></span><span class="style1"><a href="index.php?data=deleteuser&username=<?=$username;?>&data1=<?=$re_user;?>"> 
              </a> 
              <input name="order<?=$i;?>" type="checkbox" id="select" value="<?=$re_user;?>">
              <span class="style3"><span class="style3"><span class="style1"> 
              <?=$re_user;?>
              </span></span></span> </span></td>
          </tr>
          <?
				  			}
	 			mysql_close();
		?>
        </table></td>
    </tr>
    <tr> 
      <td colspan="3">&nbsp;</td>
    </tr>
    <tr> 
      <td colspan="3" align="center"> <input type="submit" name="Submit" value="Submit" i=<?=$i;?>></td>
    </tr>
  </table>
</form>
</body>
</html>
