<? 
session_start( );
include('dbconnect.inc');
if ($CatID=="")
	{
		$CatID = 0;
	}			

	function have_sub ($parentid,$dbname)

	{	

		$sql = "select count(*) as num from CATEGORY where ParentID=$parentid";

		$result = mysql_db_query($dbname,$sql );

		$num = mysql_result($result,0,"num");

		return $num;

	}

	function recurprint ($mid,$mname,$dbname)

	{

		$numchild=have_sub($mid,$dbname);

		if ($numchild==0)

		{

			echo    '<option value="'.$mid.'">    - '.$mname.'</option>';

		}else

		{

			$sql = "select CatID,CatName from CATEGORY where ParentID=$mid";

			$result = mysql_db_query($dbname,$sql);

			if (!$result){exit;}

			while ($child = mysql_fetch_array($result))

			{

				recurprint ($child["CatID"],$child["CatName"],$dbname);			

			}

		}

	}

?>



<html>



<head>



<title>Advance Search</title>



<meta http-equiv="Content-Type" content="text/html; charset=windows-874">



<style type="text/css">



<!--



body {  margin: 0px  0px; padding: 0px  0px}



a:link { color: #005CA2; text-decoration: none}



a:visited { color: #005CA2; text-decoration: none}



a:active { color: #0099FF; text-decoration: underline}



a:hover { color: #0099FF; text-decoration: underline}



-->



</style>



</head>



<body background="image/2color2.jpg">



<table width="100%" border="0" cellspacing="0" cellpadding="0" height="80">



  <tr>



    <td width="30%" bgcolor="#FFFFFF" height="86"><img src="image/logo3.gif" width="231" height="77"></td>



    <td width="72%" background="image/2color2.jpg" height="77">&nbsp;</td>



  </tr>



</table>



<table width="100%" border="0" cellspacing="0" cellpadding="0" height="22">
  <tr bgcolor="#999999"> 
    <td width="29%"> 
      <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#FFFFFF"><font color="#999999">.</font> 
        </font></b></font></div>
    </td>
    <td width="1%"> 
      <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#FFFFFF">|</font></b></font></div>
    </td>
    <td width="9%"> 
      <div align="center"><a href="login.php"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#FFFFFF">ล็อกอิน</font></b></font></a></div>
    </td>
    <td width="2%"> 
      <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#FFFFFF">|</font></b></font></div>
    </td>
    <td width="9%"> 
      <div align="center"><a href="index.php"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#FFFFFF">หน้าแรก</font></b></font></a></div>
    </td>
    <td width="2%"> 
      <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#FFFFFF">|</font></b></font></div>
    </td>
    <td width="13%"> 
      <div align="center"><a href="bememberform.php"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#FFFFFF">สมัครสมาชิก</font></b></font></a></div>
    </td>
    <td width="2%"> 
      <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#FFFFFF">|</font></b></font></div>
    </td>
    <td width="17%"> 
      <div align="center"><a href="beexpertform.php"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#FFFFFF">สมัครผู้เชี่ยวชาญ</font></b></font></a></div>
    </td>
    <td width="2%"> 
      <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#FFFFFF">|</font></b></font></div>
    </td>
    <td width="12%"> 
      <div align="center"><a href="about.php"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#FFFFFF"><font color="#FFFFFF">เกี่ยวกับเรา</font> 
        </font></b></font></a></div>
    </td>
    <td width="2%">
      <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#FFFFFF"><font color="#FFFFFF">|</font> 
        </font></b></font></div>
    </td>
  </tr>
</table>



<table width="100%" border="0" cellspacing="0" cellpadding="0" height="476">



  <tr>



    <td width="30%" valign="top" align="center" height="494"> 



      <form method="post" action="search.php">

        <table width="90%" border="0" cellspacing="0" cellpadding="0">



          <tr> 



            <td height="12" width="22%">&nbsp;</td>



            <td height="12" width="57%">&nbsp;</td>



            <td height="12" width="21%">&nbsp;</td>



          </tr>



          <tr bgcolor="#FFFFCC"> 



            <td height="37" width="22%" align="center" valign="middle"><font size="2" face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#CC3300">ค้นหา</font></b></font></td>



            <td height="37" width="57%" align="center" valign="middle"> 



              <input type="text" name="keyword" size="15" maxlength="100">



            </td>



            <td height="37" width="21%" align="center" valign="middle"> 



              <input type="image" border="0" src="image/butt-go-red.gif" width="22" height="22" name="submit">



            </td>



          </tr>



          <tr bgcolor="#FFFFCC"> 



            <td colspan="3" height="33"> 



              <div align="center"><a href="advan_search.php"><font face="MS Sans Serif, Microsoft Sans Serif" size="1" color="#6666FF">Advance 



                SEARCH</font></a></div>



            </td>



          </tr>



        </table>



      </form>



		<?	



			if (session_is_registered("loginname"))



			{



				$sql = "select MemberStatus,SubDate from MEMBER where LoginName= '$loginname'";



				$memresult = mysql_db_query($dbname,$sql);



	            $memarry = mysql_fetch_array($memresult)



		?>



        



      <table width="90%" border="0" cellspacing="0" cellpadding="0">



        <tr bgcolor="#FFFFCC"> 



          <td width="60%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300"><b>&nbsp;&nbsp;ยินดีต้อนรับ</b></font></td>



          <td width="40%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300"><b>&nbsp;คุณ<?echo $loginname;?></b></font></td>



        </tr>



        <tr> 



          <td bgcolor="#FFFFCC" width="60%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2">&nbsp;&nbsp;เป็นสมาชิกเมื่อ</font></td>



          <td bgcolor="#FFFFCC" width="40%"> 



            <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><?echo $memarry['SubDate'];?></font></div>



          </td>



        </tr>



        <tr> 

          <td bgcolor="#FFFFCC" width="60%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2">&nbsp;&nbsp;ตั้งถาม/คำตอบ</font></td>

          <?

				$memasksql = "select count(*) from ASK where LoginName = '$loginname'";

				$memaskresult = mysql_db_query($dbname,$memasksql);

	            $memaskarry = mysql_fetch_array($memaskresult);



				$memanssql = "select count(*) from ASK where LoginName = '$loginname' and AnsStatus = 'Y'";

				$memansresult = mysql_db_query($dbname,$memanssql);

	            $memansarry = mysql_fetch_array($memansresult);

			?> 

          <td bgcolor="#FFFFCC" width="40%"> 

            <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><?echo $memaskarry[0]." / ".$memansarry[0];?></font></div>

          </td>

        </tr>

        <? if ($memarry["MemberStatus"]=="E")



				{



			?> 

        <tr> 

          <td bgcolor="#FFFFCC" width="60%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2">&nbsp;&nbsp;คำถาม/ตอบ</font></td>

          <?

				$memasksql = "select count(*) from ASK where ExpertName = '$loginname'";

				$memaskresult = mysql_db_query($dbname,$memasksql);

	            $memaskarry = mysql_fetch_array($memaskresult);



				$memanssql = "select count(*) from ASK where ExpertName = '$loginname' and AnsStatus = 'Y'";

				$memansresult = mysql_db_query($dbname,$memanssql);

	            $memansarry = mysql_fetch_array($memansresult);

			?> 

          <td bgcolor="#FFFFCC" width="40%"> 

            <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><?echo $memaskarry[0]." / ".$memansarry[0];?></font></div>

          </td>

        </tr>

        <tr> 

          <td bgcolor="#FFFFCC" width="60%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2">&nbsp;&nbsp;</font></td>

          <td bgcolor="#FFFFCC" width="40%">&nbsp;</td>

        </tr>

        <tr>

          <td bgcolor="#FFFFCC" colspan="2">

            <div align="center">&nbsp;&nbsp;<font color="#9999FF"><a href="personal.php?expert=<?echo $loginname;?>"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#6666FF">ดูข้อมูลส่วนตัว</font></a></font></div>

          </td>

        </tr>

        <? } 



			?> 



        <tr> 



          <td bgcolor="#FFFFCC" colspan="2"> 



            <div align="center">&nbsp;&nbsp;<font color="#9999FF"><a href="editprofile.php"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#6666FF">แก้ไขข้อมูลส่วนตัว</font></a></font></div>



          </td>



        </tr>



        <tr> 



          <td bgcolor="#FFFFCC" colspan="2"> 



            <div align="center">&nbsp;&nbsp;<a href="new.php"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#6666FF">ดูคำตอบใหม่</font></a></div>



          </td>



        </tr>



        <? if ($memarry["MemberStatus"]=="E")



				{



			?> 



        <tr> 



          <td bgcolor="#FFFFCC" colspan="2"> 



            <div align="center">&nbsp;&nbsp;<a href="newq.php"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#6666FF">ดูคำถามใหม่</font></a> 



            </div>



          </td>



        </tr>



        <?}  ?> 



        <tr>



          <td bgcolor="#FFFFCC" colspan="2">



            <div align="center"><a href="logout.php"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#6666FF">Log 



              Out</font></a></div>



          </td>



        </tr>



        <tr> 



          <td>&nbsp;</td>



          <td>&nbsp;</td>



        </tr>



      </table>



		



      <? } //end session loginname registered



		?>

    </td>



    <td width="72%" valign="top" height="494"> 



      <table width="100%" border="0" cellspacing="0" cellpadding="0">



        <tr>



          <td background="image/2color2.jpg" align="left" valign="top" width="7" height="6"><img src="image/2color2_6pix.jpg" width="1" height="6"></td>



          <td background="image/2color2.jpg" width="579"><img src="image/2color2_6pix.jpg" width="1" height="6"></td>



        </tr>



        <tr>



          <td width="7" background="image/shadow-topleft.gif" height="5" align="left" valign="top"><img src="image/blackdot.jpg" width="1" height="1"></td>



          <td width="579" height="5" background="image/shadow-top.gif" valign="top" align="left"><img src="image/blackdot.jpg" width="1" height="1"></td>



        </tr>



        <tr>



          <td height="485" background="image/shadow-left.gif" align="left" valign="top"><img src="image/transparent.gif" width="5" height="1"></td>



          <td height="620" bgcolor="#FFFFFF" align="left" valign="top"><p><img src="image/whitedot.jpg" width="1" height="1"> 

            </p><form method="post" action="search.php" name="adv_search">

              <table width="100%" border="0" cellspacing="0" cellpadding="0">

                <tr> 

                  <td width="10%">&nbsp;</td>

                  <td colspan="2" bgcolor="#333399"> 

                    <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="3" color="#FFFFFF">Advance 

                      SEARCH</font></b></div>

                  </td>

                  <td width="10%">&nbsp;</td>

                </tr>

                <tr> 

                  <td width="10%">&nbsp;</td>

                  <td width="30%" bgcolor="#FFFFCC">&nbsp; </td>

                  <td width="50%" bgcolor="#FFFFCC">&nbsp;</td>

                  <td width="10%">&nbsp;</td>

                </tr>

                <tr> 

                  <td width="10%">&nbsp;</td>

                  <td width="30%" bgcolor="#FFFFCC"> 

                    <div align="center"><font color="#333399"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="2">Keyword 

                      :</font></b></font></div>

                  </td>

                  <td width="50%" bgcolor="#FFFFCC"> 

                    <input type="text" name="keyword" size="40" maxlength="100">

                  </td>

                  <td width="10%">&nbsp;</td>

                </tr>

                <tr> 

                  <td width="10%">&nbsp;</td>

                  <td width="30%" bgcolor="#FFFFCC"> 

                    <div align="center"><font color="#333399"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="2">Category 

                      :</font></b></font></div>

                  </td>

                  <td width="50%" bgcolor="#FFFFCC"> 

                    <select name="cat">

                      <option value="0" selected>Any Category</option>

                 <?

			 			$sql = "select CatID,CatName from CATEGORY where ParentID= '0'";

			 			$mainresult = mysql_db_query($dbname,$sql);

			 			while ($maincat = mysql_fetch_array($mainresult))

						{

							$numchild=have_sub($maincat["CatID"],$dbname);

							if ($numchild==0)

							{

					?>

						<option value="<? echo $maincat["CatID"];?>"><?echo $maincat['CatName'];?></option>

					<?

							}else

							{

					?>

						<option value="0"><?echo "<< ".$maincat['CatName'] ." >>";?></option>

					<?

								recurprint ($maincat["CatID"],$maincat["CatName"],$dbname);	

							} //end else

						} //end while $maincat

					?> 

                    </select>

                  </td>

                  <td width="10%">&nbsp;</td>

                </tr>

                <tr> 

                  <td width="10%">&nbsp;</td>

                  <td width="30%" bgcolor="#FFFFCC"> 

                    <div align="center"><font color="#333399"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="2">วันที่ถาม 

                      :</font></b></font></div>

                  </td>

                  <td width="50%" bgcolor="#FFFFCC">&nbsp;</td>

                  <td width="10%">&nbsp;</td>

                </tr>

                <tr> 

                  <td width="10%">&nbsp;</td>

                  <td width="30%" bgcolor="#FFFFCC"> 

                    <div align="center"><font size="1"><font face="MS Sans Serif, Microsoft Sans Serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;From</font></font></div>

                  </td>

                  <td width="50%" bgcolor="#FFFFCC"><font face="MS Sans Serif, Microsoft Sans Serif" size="1"> 

                    <select name="day_ask1">

                      <option value="0" selected>Any</option>

                      <option value="99">Now</option>

                      <option value="01">1</option>

                      <option value="02">2</option>

                      <option value="03">3</option>

                      <option value="04">4</option>

                      <option value="05">5</option>

                      <option value="06">6</option>

                      <option value="07">7</option>

                      <option value="08">8</option>

                      <option value="09">9</option>

                      <option value="10">10</option>

                      <option value="11">11</option>

                      <option value="12">12</option>

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

                    <select name="month_ask1">

                      <option value="0" selected>Any</option>

                      <option value="99">Now</option>

                      <option value="01">JAN</option>

                      <option value="02">FEB</option>

                      <option value="03">MAR</option>

                      <option value="04">APR</option>

                      <option value="05">MAY</option>

                      <option value="06">JUN</option>

                      <option value="07">JUL</option>

                      <option value="08">AUG</option>

                      <option value="09">SEP</option>

                      <option value="10">OCT</option>

                      <option value="11">NOV</option>

                      <option value="12">DEC</option>

                    </select>

                    <select name="year_ask1">

                      <option value="0" selected>Any</option>

                      <option value="99">Now</option>
<?
		$ysql = "select min(AskDate) from QUESTIONS";
		$yresult = mysql_db_query($dbname,$ysql);
		$ynum = mysql_num_rows($yresult);
		if ($ynum != 0)
		{
			$mindate = mysql_fetch_array($yresult);
			$miny = substr($mindate[0],0,4);
			$ysql = "select max(AskDate) from QUESTIONS";
			$yresult = mysql_db_query($dbname,$ysql);
			$maxdate = mysql_fetch_array($yresult);
			$maxy = substr($maxdate[0],0,4);
			for ($i=$miny; $i<=$maxy; $i++)
			{
?>
<option value="<?echo $i;?>"><?echo $i;?></option>
<?
			}
		}
?>
</select>

                    </font></td>

                  <td width="10%">&nbsp;</td>

                </tr>

                <tr> 

                  <td width="10%">&nbsp;</td>

                  <td width="30%" bgcolor="#FFFFCC"> 

                    <div align="center"><font size="1"><font face="MS Sans Serif, Microsoft Sans Serif">To</font></font></div>

                  </td>

                  <td width="50%" bgcolor="#FFFFCC"><font face="MS Sans Serif, Microsoft Sans Serif" size="1"> 

                    <select name="day_ask2">

                      <option value="0" selected>Any</option>

                      <option value="99">Now</option>

                      <option value="01">1</option>

                      <option value="02">2</option>

                      <option value="03">3</option>

                      <option value="04">4</option>

                      <option value="05">5</option>

                      <option value="06">6</option>

                      <option value="07">7</option>

                      <option value="08">8</option>

                      <option value="09">9</option>

                      <option value="10">10</option>

                      <option value="11">11</option>

                      <option value="12">12</option>

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

                    <select name="month_ask2">

                      <option value="0" selected>Any</option>

                      <option value="99">Now</option>

                      <option value="01">JAN</option>

                      <option value="02">FEB</option>

                      <option value="03">MAR</option>

                      <option value="04">APR</option>

                      <option value="05">MAY</option>

                      <option value="06">JUN</option>

                      <option value="07">JUL</option>

                      <option value="08">AUG</option>

                      <option value="09">SEP</option>

                      <option value="10">OCT</option>

                      <option value="11">NOV</option>

                      <option value="12">DEC</option>

                    </select>

                    <select name="year_ask2">

                      <option value="0" selected>Any</option>

                      <option value="99">Now</option>
<?
		$ysql = "select min(AskDate) from QUESTIONS";
		$yresult = mysql_db_query($dbname,$ysql);
		$ynum = mysql_num_rows($yresult);
		if ($ynum != 0)
		{
			$mindate = mysql_fetch_array($yresult);
			$miny = substr($mindate[0],0,4);
			$ysql = "select max(AskDate) from QUESTIONS";
			$yresult = mysql_db_query($dbname,$ysql);
			$maxdate = mysql_fetch_array($yresult);
			$maxy = substr($maxdate[0],0,4);
			for ($i=$miny; $i<=$maxy; $i++)
			{
?>
<option value="<?echo $i;?>"><?echo $i;?></option>
<?
			}
		}
?>
</select>

                    </font></td>

                  <td width="10%">&nbsp;</td>

                </tr>

                <tr> 

                  <td width="10%">&nbsp;</td>

                  <td width="30%" bgcolor="#FFFFCC"> 

                    <div align="center"><font color="#333399"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="2">วันที่ตอบ 

                      :</font></b></font></div>

                  </td>

                  <td width="50%" bgcolor="#FFFFCC">&nbsp;</td>

                  <td width="10%">&nbsp;</td>

                </tr>

                <tr> 

                  <td width="10%">&nbsp;</td>

                  <td width="30%" bgcolor="#FFFFCC"> 

                    <div align="center"><font size="1"><font face="MS Sans Serif, Microsoft Sans Serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;From</font></font></div>

                  </td>

                  <td width="50%" bgcolor="#FFFFCC"><font face="MS Sans Serif, Microsoft Sans Serif" size="1"> 

                    <select name="day_ans1">

                      <option value="0" selected>Any</option>

                      <option value="99">Now</option>

                      <option value="01">1</option>

                      <option value="02">2</option>

                      <option value="03">3</option>

                      <option value="04">4</option>

                      <option value="05">5</option>

                      <option value="06">6</option>

                      <option value="07">7</option>

                      <option value="08">8</option>

                      <option value="09">9</option>

                      <option value="10">10</option>

                      <option value="11">11</option>

                      <option value="12">12</option>

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

                    <select name="month_ans1">

                      <option value="0" selected>Any</option>

                      <option value="99">Now</option>

                      <option value="01">JAN</option>

                      <option value="02">FEB</option>

                      <option value="03">MAR</option>

                      <option value="04">APR</option>

                      <option value="05">MAY</option>

                      <option value="06">JUN</option>

                      <option value="07">JUL</option>

                      <option value="08">AUG</option>

                      <option value="09">SEP</option>

                      <option value="10">OCT</option>

                      <option value="11">NOV</option>

                      <option value="12">DEC</option>

                    </select>

                    <select name="year_ans1">

                      <option value="0" selected>Any</option>

                      <option value="99">Now</option>

<?
		$ysql = "select min(AnswerDate) from ANS";
		$yresult = mysql_db_query($dbname,$ysql);
		$ynum = mysql_num_rows($yresult);
		if ($ynum != 0)
		{
			$mindate = mysql_fetch_array($yresult);
			$miny = substr($mindate[0],0,4);
			$ysql = "select max(AnswerDate) from ANS";
			$yresult = mysql_db_query($dbname,$ysql);
			$maxdate = mysql_fetch_array($yresult);
			$maxy = substr($maxdate[0],0,4);
			for ($i=$miny; $i<=$maxy; $i++)
			{
?>
<option value="<?echo $i;?>"><?echo $i;?></option>
<?
			}
		}
?>
</select>

                    </font></td>

                  <td width="10%">&nbsp;</td>

                </tr>

                <tr> 

                  <td width="10%">&nbsp;</td>

                  <td width="30%" bgcolor="#FFFFCC"> 

                    <div align="center"><font size="1"><font face="MS Sans Serif, Microsoft Sans Serif">To</font></font></div>

                  </td>

                  <td width="50%" bgcolor="#FFFFCC"><font face="MS Sans Serif, Microsoft Sans Serif" size="1"> 

                    <select name="day_ans2">

                      <option value="0" selected>Any</option>

                      <option value="99">Now</option>

                      <option value="01">1</option>

                      <option value="02">2</option>

                      <option value="03">3</option>

                      <option value="04">4</option>

                      <option value="05">5</option>

                      <option value="06">6</option>

                      <option value="07">7</option>

                      <option value="08">8</option>

                      <option value="09">9</option>

                      <option value="10">10</option>

                      <option value="11">11</option>

                      <option value="12">12</option>

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

                    <select name="month_ans2">

                      <option value="0" selected>Any</option>

                      <option value="99">Now</option>

                      <option value="01">JAN</option>

                      <option value="02">FEB</option>

                      <option value="03">MAR</option>

                      <option value="04">APR</option>

                      <option value="05">MAY</option>

                      <option value="06">JUN</option>

                      <option value="07">JUL</option>

                      <option value="08">AUG</option>

                      <option value="09">SEP</option>

                      <option value="10">OCT</option>

                      <option value="11">NOV</option>

                      <option value="12">DEC</option>

                    </select>

                    <select name="year_ans2">

                      <option value="0" selected>Any</option>

                      <option value="99">Now</option>

<?
		$ysql = "select min(AnswerDate) from ANS";
		$yresult = mysql_db_query($dbname,$ysql);
		$ynum = mysql_num_rows($yresult);
		if ($ynum != 0)
		{
			$mindate = mysql_fetch_array($yresult);
			$miny = substr($mindate[0],0,4);
			$ysql = "select max(AnswerDate) from ANS";
			$yresult = mysql_db_query($dbname,$ysql);
			$maxdate = mysql_fetch_array($yresult);
			$maxy = substr($maxdate[0],0,4);
			for ($i=$miny; $i<=$maxy; $i++)
			{
?>
<option value="<?echo $i;?>"><?echo $i;?></option>
<?
			}
		}
?>
</select>

                    </font></td>

                  <td width="10%">&nbsp;</td>

                </tr>

                <tr> 

                  <td width="10%">&nbsp;</td>

                  <td width="30%" bgcolor="#FFFFCC"> 

                    <div align="center"><font color="#333399"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="2">ค้นหาตาม 

                      :</font></b></font></div>

                  </td>

                  <td width="50%" bgcolor="#FFFFCC"> <font size="1" face="MS Sans Serif, Microsoft Sans Serif"> 

                    <input type="checkbox" name="subject" value="and">

                    หัวข้อ 

                    <input type="checkbox" name="question" value="and">

                    คำถาม 

                    <input type="checkbox" name="answer" value="and">

                    คำตอบ</font></td>

                  <td width="10%">&nbsp;</td>

                </tr>

                <tr> 

                  <td width="10%">&nbsp;</td>

                  <td width="30%" bgcolor="#FFFFCC"> 

                    <div align="center"><font color="#333399"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="2">ผู้เชี่ยวชาญ 

                      :</font></b></font></div>

                  </td>

                  <td width="50%" bgcolor="#FFFFCC"> 

                    <input type="text" name="expert" size="20" maxlength="10">

                    <font face="MS Sans Serif, Microsoft Sans Serif" size="1" color="#CC3300">* 

                    ถ้าไม่ใส่จะค้นหาทุกคน</font><font face="MS Sans Serif, Microsoft Sans Serif" size="1"> 

                    </font></td>

                  <td width="10%">&nbsp;</td>

                </tr>

                <tr> 

                  <td width="10%">&nbsp;</td>

                  <td width="30%" bgcolor="#FFFFCC">&nbsp;</td>

                  <td width="50%" bgcolor="#FFFFCC">&nbsp; </td>

                  <td width="10%">&nbsp;</td>

                </tr>

                <tr> 

                  <td width="10%">&nbsp;</td>

                  <td colspan="2" bgcolor="#FFFFCC"> 

                    <div align="center">
                      <input type="submit" name="Submit" value="Submit">
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                      <input type="reset" name="Reset" value="Reset">
                    </div>

                  </td>

                  <td width="10%">&nbsp;</td>

                </tr>

                <tr> 

                  <td width="10%">&nbsp;</td>

                  <td width="30%" bgcolor="#FFFFCC"> 

                    <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#333399"></font></b></font></div>

                  </td>

                  <td width="50%" bgcolor="#FFFFCC"><font face="MS Sans Serif, Microsoft Sans Serif" size="1"> 

                    </font></td>

                  <td width="10%">&nbsp;</td>

                </tr>

              </table>

            </form>

          </td>



        </tr>



      </table>



    </td>



  </tr>



</table>



</body>



</html>



