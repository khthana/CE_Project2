<? 



	session_start( );

include('dbconnect.inc');

	if (session_is_registered("expert"))
	{
		session_unregister("expert");
	}

	if ($CatID=="")



	{



		$CatID = 0;



	}			



	$sql = "select CatID,CatName from CATEGORY where ParentID= '$CatID'";



	$result = mysql_db_query($dbname,$sql);



	$nrow = mysql_num_rows($result);	



	if ($nrow !=0)



	{



		header ("Location: index.php?CatID=$CatID&CatName=$CatName");  



		exit;



	}



function  ratemax($main,$compare,$index,$catID,$dbname)
{	

	$sql = "select NumVote  from EXPERTIN where CatID= '$catID' and LoginName = '$compare[0]'";

	$result = mysql_db_query($dbname,$sql);

	echo mysql_error();

	$numask = mysql_fetch_array($result);

	if ($numask[0] != 0 )

	{

		$compare[1] = $compare[1]/$numask[0];

	}else

	{

		$compare[1] = 0;

	}

		if ($main[$index][1]<=$compare[1])

		{
		if ($main[$index][1]==$compare[1])
		{
			if ($main[$index][2] < $numask[0])
			{
				$main[$index][0] = $compare[0];
				$main[$index][1]=$compare[1];
				$main[$index][2]=$numask[0];
			}
			}else
			{
				$main[$index][0] = $compare[0];
				$main[$index][1]=$compare[1];
				$main[$index][2]=$numask[0];
			}
		}

}





?>



<html>



<head>



<title>&quot;รายชื่อผู้เชี่ยวชาญในประเภทคำถามนี้&quot;</title>



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



    <td width="30%" bgcolor="#FFFFFF" height="87"><img src="image/logo3.gif" width="231" height="77"></td>



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



    <td width="30%" valign="top" align="center"> 



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



          <tr>



            <td width="22%">&nbsp;</td>



            <td width="57%">&nbsp;</td>



            <td width="21%">&nbsp;</td>



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



      <table width="90%" border="0" cellspacing="0" cellpadding="0">
        <tr bgcolor="#999999"> 
          <td colspan="3"> 
            <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300"><b><font color="#FFFFFF">Top 
              5 Rating in <? echo $CatName;?></font></b></font></div>
          </td>
        </tr>
        <tr bgcolor="#FFFFCC"> 
          <td width="50%"> 
            <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300">Expert 
              Name</font></div>
          </td>
          <td width="30%"><div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300">Number 
              of Voter</font></div></td>
          <td width="20%"> 
            <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300">Rate</font></div>
          </td>
        </tr>
        <?



			$sql  = "select LoginName from EXPERTIN where CatID = '$CatID' ";

			$rateresult = mysql_db_query($dbname,$sql);

			$numexpert = mysql_num_rows($rateresult);

			$maxshow = 5;

			if ($numexpert < 5)

			{ $maxshow = $numexpert; }



			$ratearry[0][0] = -1;

			$ratearry[0][1] = -1;
			$ratearry[0][2] =-1;
			$ratearry[1][0] = -1;

			$ratearry[1][1] = -1;
			$ratearry[1][2] = -1;
			$ratearry[2][0] = -1;

			$ratearry[2][1] = -1;
			$ratearry[2][2] = -1;
			$ratearry[3][0] = -1;

			$ratearry[3][1] = -1;
			$ratearry[3][2] = -1;
			$ratearry[4][0] = -1;

			$ratearry[4][1] = -1;
			$ratearry[4][2] = -1;
			$ratearry[5][0] = -1;

			$ratearry[5][1] = -1;
			$ratearry[5][2] =-1;


			$count=0;

			$used = "";

			while ($count < $maxshow)

			{

				if ($count == 0)

				{

					$sql = "select LoginName,Rate from EXPERTIN  where CatID = '$CatID' order by LoginName";					

				} else

				{

					$sql = "select LoginName,Rate from EXPERTIN where CatID = '$CatID' and LoginName not in ( ".$used.") order by LoginName";

				}

				$allresult = mysql_db_query($dbname,$sql);

				$num = mysql_num_rows($allresult);



				for ($i=0; $i<$num;$i++)

				{

					$allarry=mysql_fetch_array($allresult);

					ratemax(&$ratearry,$allarry,$count,$CatID,$dbname);

				}

				if ($count <> 0)

				{ $used .= "," ; }

				$used .= "'".$ratearry[$count][0]."'" ;

				$pospoint = strpos($ratearry[$count][1],".");

				if(!$pospoint)

				{

					$ratearry[$count][1] .=".00";

				}else

				{

					$numlen = strlen($ratearry[$count][1]);

					if($numlen<$pospoint+3)

					{

						$ratearry[$count][1] .= "0";

					}else

					{

						$ratearry[$count][1] = substr($ratearry[$count][1],0,$pospoint+3);

					}

				}

		?> 
        <tr bgcolor="#FFFFCC"> 
          <td width="50%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="personal.php?expert=<?echo $ratearry[$count][0];?>"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#6666FF" ><? echo $ratearry[$count][0];?></font></a></td>
          <td width="30%"><div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><? echo $ratearry[$count][2];?></font></div></td>
          <td width="20%"> 
            <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><? echo $ratearry[$count][1];?></font></div>
          </td>
        </tr>
        <?



				$count = $count+1;



			}



		?> 
      </table>







      <p>&nbsp;</p>



    </td>



    <td width="72%" valign="top"> 



      <table width="100%" border="0" cellspacing="0" cellpadding="0">



        <tr>



          <td background="image/2color2.jpg" align="left" valign="top" width="7" height="8"><img src="image/2color2_6pix.jpg" width="1" height="6"></td>



          <td background="image/2color2.jpg" width="579" height="8"><img src="image/2color2_6pix.jpg" width="1" height="6"></td>



        </tr>



        <tr>



          <td width="7" background="image/shadow-topleft.gif" height="3" align="left" valign="top"><img src="image/blackdot.jpg" width="1" height="1"></td>



          <td width="579" height="3" background="image/shadow-top.gif" valign="top" align="left"><img src="image/blackdot.jpg" width="1" height="1"></td>



        </tr>



        <tr>



          <td height="485" background="image/shadow-left.gif" align="left" valign="top"><img src="image/transparent.gif" width="5" height="1"></td>



          <td height="485" bgcolor="#FFFFFF" align="center" valign="top"> 



<?



$sql1 = "select LoginName,CatID, Rate, NumVote, ResRate, NumRate, Rate/NumVote  from EXPERTIN where CatID = '$CatID' and NumVote <> '0' order by 7 desc , NumVote desc , LoginName";



$result1 = mysql_db_query($dbname,$sql1);



$count1 = mysql_num_rows($result1);



?> 



            <table width="100%" border="0" cellspacing="0" cellpadding="0" height="119">



              <tr> 



                <td width="6%" height="26">&nbsp;</td>



                <td colspan="2" height="26"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#CC3300">รายชื่อผู้เชี่ยวชาญในประเภท 



                  <? echo $CatName ?></font></b></font></td>



                <td width="6%" height="26">&nbsp;</td>



              </tr>



              <tr> 



                <td width="6%" height="24">&nbsp;</td>



                <td colspan="2" bgcolor="#FFFFFF" height="24">&nbsp;</td>



                <td width="6%" height="24">&nbsp;</td>



              </tr>



              <tr> 



                <td width="6%" height="27">&nbsp;</td>



                <td colspan="2" bgcolor="#FFFFCC" height="27"> 



                  <form method="post" action="selectpost.php?CatName=<? echo $CatName; ?>&CatID=<? echo $CatID ?>" name="expertchoose">



                    <table width="100%" border="0" cellspacing="3" cellpadding="0" bordercolor="#000000">

                      <? if ($count1 == 0)



		{ ?> 

                      <tr> 

                        <td colspan="2" height="25"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#CC3300">ยังไม่มีผู้เชี่ยวชาญในประเภทนี้ 

                          !</font></b></font></td>

                      </tr>

                      <? }



		else



		{ 		
				while  ($result1arr = mysql_fetch_array($result1)) 
				{  	if ($result1arr[3] == 0)
					{ $Rate = $result1arr[2];}
				    else
					{$Rate = $result1arr[2]/$result1arr[3];}
					$pospoint = strpos($Rate,".");
				if(!$pospoint)
				{
					$Rate .=".00";
				}else
				{
					$numlen = strlen($Rate);
					if($numlen<$pospoint+3)
					{
						$Rate .= "0";
					}else
					{
						$Rate = substr($Rate,0,$pospoint+3);
					}
				}
					$x = $result1arr[0];
					$sql2 = "select Detail from MEMBER where LoginName = '$x' ";
					$result2 = mysql_db_query($dbname,$sql2);
					$result2arr = mysql_fetch_array($result2);
				?> 
                      <tr> 
                        <td width="9%" height="55"> 
                          <div align="center"> 
                            <input type="checkbox" name="expertlist[]" value="<? echo $result1arr[0] ?>">
                          </div>
                        </td>
                        <td width="91%" height="55"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#3399CC">
                            <tr bgcolor="#CCCCFF"> 

                              <td width="21%" bgcolor="#99CCCC"><a href="personal.php?expert=<?echo $result1arr[0];?>&CatName=<? echo $CatName; ?>&CatID=<? echo $CatID ?>"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#CC3300"><?echo $result1arr[0]?></font></b></font></a></td>

                              <td width="50%" bgcolor="#99CCCC">&nbsp;</td>

                              <td width="23%" bgcolor="#99CCCC"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#FFFFFF"><b><font color="#000000" size="1">Rate</font><font color="#000000"> 
                                </font><font face="MS Sans Serif, Microsoft Sans Serif" size="1" color="#FFFFFF"><b><font color="#000000"><?echo $Rate?></font></b></font></b></font></td>

                              <td width="6%" bgcolor="#FFFFCC">&nbsp;</td>

                            </tr>

                            <tr bgcolor="#CCCCFF"> 

                              <td colspan="2" bgcolor="#99CCCC"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font size="1">รายละเอียด 
                                : </font></b></font><font face="MS Sans Serif, Microsoft Sans Serif" size="1"><?echo $result2arr[0]?></font></td>

                              <td width="23%" bgcolor="#99CCCC">&nbsp;</td>

                              <td width="6%" bgcolor="#FFFFCC">&nbsp;</td>

                            </tr>

                          </table>

                        </td>

                      </tr>

                     <?	} 
$sql1 = "select LoginName,CatID, Rate, NumVote, ResRate, NumRate, Rate/NumVote  from EXPERTIN where CatID = '$CatID' and NumVote = '0' order by LoginName";



$result1 = mysql_db_query($dbname,$sql1);



$count1 = mysql_num_rows($result1);


				while  ($result1arr = mysql_fetch_array($result1)) 
				{  	if ($result1arr[3] == 0)
					{ $Rate = $result1arr[2];}
				    else
					{$Rate = $result1arr[2]/$result1arr[3];}
					$pospoint = strpos($Rate,".");
				if(!$pospoint)
				{
					$Rate .=".00";
				}else
				{
					$numlen = strlen($Rate);
					if($numlen<$pospoint+3)
					{
						$Rate .= "0";
					}else
					{
						$Rate = substr($Rate,0,$pospoint+3);
					}
				}
					$x = $result1arr[0];
					$sql2 = "select Detail from MEMBER where LoginName = '$x' ";
					$result2 = mysql_db_query($dbname,$sql2);
					$result2arr = mysql_fetch_array($result2);
				?> 
                      <tr> 
                        <td width="9%" height="55"> 
                          <div align="center"> 
                            <input type="checkbox" name="expertlist[]" value="<? echo $result1arr[0] ?>">
                          </div>
                        </td>
                        <td width="91%" height="55"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#3399CC">
                            <tr bgcolor="#CCCCFF"> 

                              <td width="21%" bgcolor="#99CCCC"><a href="personal.php?expert=<?echo $result1arr[0];?>&CatName=<? echo $CatName; ?>&CatID=<? echo $CatID ?>"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#CC3300"><?echo $result1arr[0]?></font></b></font></a></td>

                              <td width="50%" bgcolor="#99CCCC">&nbsp;</td>

                              <td width="23%" bgcolor="#99CCCC"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#FFFFFF"><b><font color="#000000" size="1">Rate</font><font color="#000000"> 
                                </font><font face="MS Sans Serif, Microsoft Sans Serif" size="1" color="#FFFFFF"><b><font color="#000000"><?echo $Rate?></font></b></font></b></font></td>

                              <td width="6%" bgcolor="#FFFFCC">&nbsp;</td>

                            </tr>

                            <tr bgcolor="#CCCCFF"> 

                              <td colspan="2" bgcolor="#99CCCC"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font size="1">รายละเอียด 
                                : </font></b></font><font face="MS Sans Serif, Microsoft Sans Serif" size="1"><?echo $result2arr[0]?></font></td>

                              <td width="23%" bgcolor="#99CCCC">&nbsp;</td>

                              <td width="6%" bgcolor="#FFFFCC">&nbsp;</td>

                            </tr>

                          </table>

                        </td>

                      </tr>

                     <?	} ?> 
					    <tr>

                        <td colspan="2" height="15">&nbsp;</td>

                      </tr>

                      <tr> 

                        <td colspan="2" height="25"><font face="MS Sans Serif, Microsoft Sans Serif" size="2">กรุณาเลือกผู้เชี่ยวชาญที่ต้องการจะถาม 

                          </font> 

                          <input type="submit" name="Submit" value="Ok">

                        </td>

                      </tr>

                      <?	} ?> 

                    </table>



                  </form>



                </td>



                <td width="6%" height="27">&nbsp;</td>



              </tr>



            </table>



            <font size="4" face="MS Sans Serif, Microsoft Sans Serif" color="#CC3300"><b> 



            </b></font></td>



        </tr>



      </table>



    </td>



  </tr>



</table>



</body>



</html>



