<? 
	session_start( );
include('dbconnect.inc');
	if ($CatID=="")
	{
		$CatID = 0;
	}			
	$sql = "select *  from MEMBER where LoginName = '$expert'";
	$result = mysql_db_query($dbname,$sql);
	$resexpert = mysql_fetch_array($result);
	$status = $resexpert['MemberStatus'];
	if ($status <> 'E')
	{
		header ("Location: index.php");  
		exit;		
	}

function  avg_rate($avgtmp,$e_rate,$divider)
{	
	if ($divider != 0 )
	{
		$avgtmp= $e_rate/$divider;
	}else
	{
		$avgtmp = 0;
	}
}

?>



<html>



<head>



<title>ดูรายละเอียดของผู้เชี่ยวชาญ</title>



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



    <td width="30%" bgcolor="#FFFFFF"><img src="image/logo3.gif" width="231" height="77"></td>



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



          <td height="620" bgcolor="#FFFFFF" align="left" valign="top">



            <p><img src="image/whitedot.jpg" width="1" height="1"> </p>



            <div align="center">



              <table width="80%" border="0" cellspacing="0" cellpadding="0">

                <tr bgcolor="#999999"> 

                  <td colspan="2"> 

                    <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="4" color="#CC3300"><b><font color="#FFFFFF">รายละเอียดของผู้เชี่ยวชาญ 

                      : <?echo $resexpert['LoginName'];?></font></b></font></div>

                  </td>

                </tr>

                <tr> 

                  <td width="26%">&nbsp;</td>

                  <td width="74%">&nbsp;</td>

                </tr>

                <tr> 

                  <td width="26%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300">ชื่อ 

                    - นามสกุล :</font></td>

                  <td width="74%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2">&nbsp;<?echo $resexpert['FirstName']."   ".$resexpert['LastName']; ?></font></td>

                </tr>

                <tr> 

                  <td width="26%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300">E-mail 

                    :</font></td>

                  <td width="74%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2">&nbsp;<?echo $resexpert['Email']; ?></font></td>

                </tr>

                <tr> 

                  <td width="26%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300">URL 

                    :</font></td>

                  <td width="74%"> <?



					if (!empty($resexpert['Link']))



					{



						echo '<a href="http://'.$resexpert['Link'].'" target="_blank"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#6666FF">&nbsp;http://'.$resexpert['Link'].'</font></a>';



					}else



					{



                     	echo '<font face="MS Sans Serif, Microsoft Sans Serif" size="2">&nbsp; not include</font>';



					}



					?> </td>

                </tr>

                <tr>

                  <td width="26%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300">Detail 

                    :</font></td>

                  <td width="74%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><? echo $resexpert['Detail'];?></font></td>

                </tr>

                <tr> 

                  <td width="26%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300">Picture 

                    :</font></td>

                  <td width="74%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2">&nbsp;</font> 

                    <?



					if (!empty($resexpert['Picture']))



					{



						echo '<img src="showblob.php?loginname='.$expert.'"  width="150" height="150">';



					}else



					{



                     	echo '<font face="MS Sans Serif, Microsoft Sans Serif" size="2">&nbsp; not include</font>';



					}



				?> </td>

                </tr>

              </table>



              <p>&nbsp;</p>



				<?



					$sql = "select CatName, Rate,ResRate,C.CatID  from EXPERTIN E,CATEGORY C  where LoginName = '$expert' and C.CatID = E.CatID";



					$result = mysql_db_query($dbname,$sql);



				?>



              <table width="80%" border="0" cellspacing="0" cellpadding="0">
                <tr bgcolor="#999999"> 
                  <td colspan="2"> 
                    <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#FFFFFF">รายละเอียดด้านความถนัดของ 
                      <?echo $resexpert['LoginName'];?> </font></b></font></div>
                  </td>
                </tr>
                <tr> 
                  <td width="45%">&nbsp;</td>
                  <td width="55%">&nbsp;</td>
                </tr>
                <?

					$i =0;

					while ($catres = mysql_fetch_array($result))

					{
						$sql = "select NumVote  from EXPERTIN  where CatID= '$catres[3]' and LoginName = '$expert'";
						$sqlresult = mysql_db_query($dbname,$sql);
						echo mysql_error();
						$numask = mysql_fetch_array($sqlresult);
						avg_rate(&$avgrate[$i],$catres['Rate'],$numask[0]);
						$numshow[$i] = $numask[0];
						$sql = "select NumRate  from EXPERTIN  where CatID= '$catres[3]' and LoginName = '$expert'";
						$sqlresult = mysql_db_query($dbname,$sql);
						echo mysql_error();
						$numa = mysql_fetch_array($sqlresult);
						avg_rate(&$avgresrate[$i],$catres['ResRate'],$numa[0]);

						$pospoint = strpos($avgrate[$i],".");
						if(!$pospoint)
						{
							$avgrate[$i] .=".00";
						}else
						{
							$numlen = strlen($avgrate[$i]);
							if($numlen<$pospoint+3)
							{
								$avgrate[$i] .= "0";
							}else
							{
								$avgrate[$i] = substr($avgrate[$i],0,$pospoint+3);
							}
						}

						$pospoint = strpos($avgresrate[$i],".");
						if(!$pospoint)
						{
							$avgresrate[$i] .=".00";
						}else
						{
							$numlen = strlen($avgresrate[$i]);
							if($numlen<$pospoint+3)
							{
								$avgresrate[$i] .= "0";
							}else
							{
								$avgresrate[$i] = substr($avgresrate[$i],0,$pospoint+3);
							}
						}

				?> 
                <tr> 
                  <td width="45%"><font size="2" face="MS Sans Serif, Microsoft Sans Serif" color="#CC3300">ประเภทของคำถาม 
                    : </font></td>
                  <td width="55%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><?echo $catres['CatName'];?></font></td>
                </tr>
                <tr> 
                  <td width="45%"><font size="2" face="MS Sans Serif, Microsoft Sans Serif" color="#CC3300">Total 
                    Rate : </font></td>
                  <td width="55%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><?echo $catres['Rate'];?></font></td>
                </tr>
                <tr>
                  <td width="45%"><font size="2" face="MS Sans Serif, Microsoft Sans Serif" color="#CC3300">Total 
                    Number of Voter : </font></td>
                  <td width="55%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><?echo $numshow[$i];?></font></td>
                </tr>
                <tr> 
                  <td width="45%"><font size="2" face="MS Sans Serif, Microsoft Sans Serif" color="#CC3300">AVG 
                    Rate : </font></td>
                  <td width="55%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><?echo $avgrate[$i];?></font></td>
                </tr>
                <tr> 
                  <td width="45%"><font size="2" face="MS Sans Serif, Microsoft Sans Serif" color="#CC3300">AVG 
                    Response Rate : </font></td>
                  <td width="55%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><?echo $avgresrate[$i];?></font></td>
                </tr>
                <tr> 
                  <td width="45%">&nbsp;</td>
                  <td width="55%">&nbsp;</td>
                </tr>
                <?

						$i=$i+1;

					} //end while cat

					$sql = "select sum(Rate) from EXPERTIN where LoginName = '$expert' ";

					$sumresult = mysql_db_query($dbname,$sql);

					$sumrate = mysql_fetch_array($sumresult);

					$sql = "select sum(NumVote) from EXPERTIN where LoginName = '$expert' ";

					$numresult = mysql_db_query($dbname,$sql);

					$numcat = mysql_fetch_array($numresult);

					if ($numcat[0] != 0 )

					{

						$overall = $sumrate[0] / $numcat[0];

					}else

					{

						$overall = 0;

					}

					$pospoint = strpos($overall,".");

					if(!$pospoint)

					{

						$overall .=".00";

					}else

					{

						$numlen = strlen($overall);

						if($numlen<$pospoint+3)

						{

							$overall .= "0";

						}else

						{

							$overall= substr($overall,0,$pospoint+3);

						}

					}

				?> 
                <tr bgcolor="#999999"> 
                  <td width="45%" height="23"><font size="2" face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">Over 
                    All Rate : </font></td>
                  <td width="55%" height="23"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#FFFFFF"><?echo $overall ;?></font></td>
                </tr>
                <?
					$sql = "select sum(ResRate) from EXPERTIN where LoginName = '$expert' ";

					$sumresult = mysql_db_query($dbname,$sql);

					$sumrate = mysql_fetch_array($sumresult);

					$sql = "select sum(NumRate) from EXPERTIN where LoginName = '$expert' ";

					$numresult = mysql_db_query($dbname,$sql);

					$numcat = mysql_fetch_array($numresult);

					if ($numcat[0] != 0 )

					{

						$overallres = $sumrate[0] / $numcat[0];

					}else

					{

						$overallres = 0;

					}

					$pospoint = strpos($overallres,".");

					if(!$pospoint)

					{

						$overallres .=".00";

					}else

					{

						$numlen = strlen($overallres);

						if($numlen<$pospoint+3)

						{

							$overallres .= "0";

						}else

						{

							$overallres= substr($overallres,0,$pospoint+3);

						}

					}

				?> 
                <tr bgcolor="#999999"> 
                  <td width="45%" height="23"><font size="2" face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">Over 
                    All Response Rate : </font></td>
                  <td width="55%" height="23"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#FFFFFF"><?echo $overallres ;?></font></td>
                </tr>
              </table>



              <p>&nbsp;</p>



            </div>



          </td>



        </tr>



      </table>



    </td>



  </tr>



</table>



</body>



</html>



