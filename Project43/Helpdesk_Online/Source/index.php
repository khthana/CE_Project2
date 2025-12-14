<? 
	session_start( );
include('dbconnect.inc');

	if ($CatID=="")



	{



		$CatID = 0;



	}			
	$sql = "select CatID,CatName from CATEGORY where ParentID= '$CatID'";
$result = mysql_db_query($dbname,$sql);



function  ratemax($main,$compare,$index,$dbname)

{	

	$sql = "select sum(NumVote)  from EXPERTIN  where LoginName = '$compare[0]'";

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



<title>CE- helpdesk &quot; ทุกคำถามมีคำตอบที่นี่ &quot;</title>



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



    <td width="29%" bgcolor="#FFFFFF" height="77"><img src="image/logo3.gif" width="231" height="77"></td>



    <td width="71%" background="image/2color2.jpg" height="77">&nbsp;</td>



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



      <form method="post" action="search.php" name="">

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



      <table width="90%" border="0" cellspacing="0" cellpadding="0">
        <tr bgcolor="#FFFFCC"> 
          <td colspan="3"> 
            <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300"><b>Top 
              5 Rating</b></font></div>
          </td>
        </tr>
        <tr bgcolor="#FFFFCC"> 
          <td width="50%"> 
            <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300">Expert 
              Name</font></div>
          </td>
          <td width="30%">
            <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300">Number 
              of Voter</font></div>
          </td>
          <td width="20%"> 
            <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300">Rate</font></div>
          </td>
        </tr>
        <?



			$sql  = "select LoginName from EXPERTIN group by LoginName";



			$rateresult = mysql_db_query($dbname,$sql);



			$numexpert = mysql_num_rows($rateresult);



			$maxshow = 5;



			if ($numexpert < 5)



			{ $maxshow = $numexpert; }







			$ratearry[0][0] = -1;



			$ratearry[0][1] = -1;
			$ratearry[0][2] = -1;


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
			$ratearry[5][2] = -1;


			$count=0;



			$used = "";







			while ($count < $maxshow)



			{



				if ($count == 0)



				{



					$sql = "select LoginName,sum(Rate) from EXPERTIN  group by LoginName order by LoginName";					



				} else



				{



					$sql = "select LoginName,sum(Rate) from EXPERTIN where LoginName not in ( ".$used.") group by LoginName order by LoginName";



				}



				$allresult = mysql_db_query($dbname,$sql);



				$num = mysql_num_rows($allresult);



				for ($i=0; $i<$num;$i++)



				{



					$allarry=mysql_fetch_array($allresult);



					ratemax(&$ratearry,$allarry,$count,$dbname);



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



          <td height="620" bgcolor="#FFFFFF" align="left" valign="top"><img src="image/whitedot.jpg" width="1" height="1"> 



            <table width="100%" border="0" cellspacing="0" cellpadding="0">



              <tr>



                <td height="202">



                  <table width="100%" border="0" cellspacing="0" cellpadding="0" height="82">



                    <tr> 



                      <td height="38"> 



                        <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif"><font face="MS Sans Serif, Microsoft Sans Serif"><font size="1">ยินดีต้อนรับสู่ 



                          <font color="#FF3333">CE-helpdesk</font>...ทุกคำถามที่คุณสงสัย 



                          ที่นี่มีคำตอบ</font></font></font></div>



                      </td>



                    </tr>



                    <tr> 



                      <td height="35"> 



                        <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif"><font face="MS Sans Serif, Microsoft Sans Serif"><font size="1">เชิญสมัครเป็นสมาชิก 



                          <font color="#FF3333">CE-helpdesk</font> เพื่อสิทธิพิเศษต่าง 



                          ๆ </font></font></font></div>



                      </td>



                    </tr>



                    <tr> 



                      <td height="38"> 



                        <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="1">หรือสมัครเป็นผู้เชี่ยวชาญเพื่อแบ่งปันความรู้และตอบคำถามตามที่คุณถนัด 



                          </font></div>



                      </td>



                    </tr>



                  </table>



                </td>



              </tr>



              <tr valign="top" align="center"> 



                <td> 



                  <table width="80%" border="0" cellspacing="0" cellpadding="0">



					<tr bgcolor="#FFFFCC">



					  <td colspan="2">&nbsp;



<?



   if ($CatID == 0 )



   {



     echo '<font size="3" face="MS Sans Serif, Microsoft Sans Serif" color="#CC3300"><b>Category</b></font>';



   } else	



   {



     echo '<font size="3" face="MS Sans Serif, Microsoft Sans Serif" color="#CC3300"><b>'.$CatName.'</b></font>';



   }



?> 



					  </td>



					  <td colspan="2">&nbsp;</td>



					 </tr>



					<?



						$nrow = mysql_num_rows($result);



						$count = 0;



  		            while ($resCat = mysql_fetch_array($result))



						{



							$count = $count+1;



                     		echo'<tr bgcolor="#FFFFCC"> ';



							echo '<td width="7%" valign="middle" align="center"><img src="image/circle.gif" width="15" height="15"></td>';



  	              		echo '<td width="43%"><a href="prepost.php?CatID='.$resCat[0].'&CatName='.$resCat[1].'"><font color="#CC3300" size="2" face="MS Sans Serif, Microsoft Sans Serif">'.$resCat[1].'</font></a></td>';



							$count = $count+1;



							$resCat = mysql_fetch_array($result);



							if ($nrow >= $count)



							{



								echo '<td width="7%" valign="middle" align="center"><img src="image/circle.gif" width="15" height="15"></td>';



  	              			echo '<td width="43%"><a href="prepost.php?CatID='.$resCat[0].'&CatName='.$resCat[1].'"><font color="#CC3300" size="2" face="MS Sans Serif, Microsoft Sans Serif">'.$resCat[1].'</font></a></td>';



							}else



							{



								echo '<td width="7%">&nbsp;</td>';



								echo '<td width="43%">&nbsp;</td>';



							}



  		            	echo '</tr>';



						}



					?>



                  </table>



                </td>



              </tr>



            </table>



          </td>



        </tr>



      </table>



    </td>



  </tr>



</table>



</body>



</html>



