<?

	session_start( );

	if (!session_is_registered("loginname"))

	{

		header ("Location: login.php");  

		exit;

	}

	if (!isset($QID))

	{

		header ("Location: new.php");  

		exit;

	}
include('dbconnect.inc');

	$sql = "select MemberStatus  from MEMBER where LoginName = '$loginname'";

	$result = mysql_db_query($dbname,$sql);

	$memstatus = mysql_fetch_array($result);

	$status = $memstatus["MemberStatus"];

	if ($status != 'E')

	{

		header ("Location: new.php");  

		exit;

	}



	if ($Submit)

	{
			$bansql = "select * from BANWORD";
			$banresult = mysql_db_query($dbname,$bansql);
			$bannum = mysql_num_rows($banresult);
			if ($bannum != 0)
			{
				$ban_i = 0;
				$place = "";
				$Answer = " $Answer";
				while ($banarry = mysql_fetch_array($banresult))
				{
					$found2 = strpos($Answer,$banarry['Word'],0);
					if ($found2)
					{
						$ban[$ban_i] = $banarry['Word'];
						$ban_i = $ban_i +1;
						$Flag03 = "F3";
					}
				} // end while ban
				$Answer = trim($Answer);
			} //end if ban num !=0
			if($Flag03 != "F3")
			{
				$Answer = trim($Answer);

				$AnsDate = date("Y-m-d H:i:s");

				if ($EditStatus != 'A')

				{

					$sql=" insert into ANS  (LoginName,QuestionID,Answer,AnswerDate) values ('$loginname','$QID','$Answer','$AnsDate')";

				}else

				{

					$sql="update  ANS  set Answer = '$Answer',AnswerDate = '$AnsDate' where LoginName = '$loginname' and QuestionID = '$QID'";

				}

				$result = mysql_db_query($dbname,$sql);

				echo mysql_error();

				$sql = "update ASK set AnsStatus='Y', EditStatus = 'N'  where QuestionID = '$QID' and ExpertName = '$loginname'";

				$result = mysql_db_query($dbname,$sql);

				echo mysql_error();

				$sql = "select AskDate from QUESTIONS where QuestionID = '$QID'";

				$result = mysql_db_query($dbname,$sql);

				$askdate = mysql_fetch_array($result);

				$sql = "select AnswerDate from ANS where QuestionID = '$QID' and LoginName = '$loginname'";

				$result = mysql_db_query($dbname,$sql);

				$ansdate = mysql_fetch_array($result);

				$asky = substr($askdate[0],0,4);

				$askm = substr($askdate[0],5,2);

				$askd = substr($askdate[0],8,2);

				$ansy = substr($ansdate[0],0,4);

				$ansm = substr($ansdate[0],5,2);

				$ansd = substr($ansdate[0],8,2);

				$ydiff = $ansy-$asky;

				$mdiff = $ansm-$askm;

				$ddiff = $ansd-$askd;

				$score = 0;

				if ($ydiff == 0)

				{

					if($ddiff<0)

					{
		
						if($mdiff == 1)

						{

							$day = 30;

							if($askm == "02") 

							{ $day = 28;}

							if($askm == "01" or $askm == "03" or $askm == "05" or $askm == "07" or $askm == "08" or $askm == "10" or $askm == "12") 

							{ $day = 31;}
		
							$tmp = $day+$ddiff;
	
							if($tmp <10 )

							{

								$score = 10-$tmp;

							}

						}

					}elseif($ddiff >= 0 and $mdiff == 0)

					{

							if($ddiff <10 )

							{

								$score = 10-$ddiff;

							}

					}

				}  //end ydiff =0

				$sql = "select ResRate,NumRate  from EXPERTIN where LoginName = '$loginname' and CatID = '$CatID'";

				$result = mysql_db_query($dbname,$sql);
				echo mysql_error();
				$exnum = mysql_num_rows($result);
				if ($exnum !=0)
				{
					$ratearry = mysql_fetch_array($result);
					$rate = $ratearry['ResRate'] + $score;
					$numvote = $ratearry['NumRate']+ 1;
					$sql = "update  EXPERTIN set ResRate='$rate',NumRate='$numvote'  where LoginName = '$loginname' and CatID = '$CatID'";
					$result = mysql_db_query($dbname,$sql);
					echo mysql_error();
				}
				if ($asker != "Anonymous")

				{

					$sql = "select Email from MEMBER where LoginName = '$asker'";

					$result = mysql_db_query($dbname,$sql);

					$askeremail = mysql_fetch_array($result);

					$mto = $askeremail[0];

					$msub = "You get new answer.";

		

					$sql = "select Subject,AskDate  from QUESTIONS  where QuestionID = '$QID'";

					$result = mysql_db_query($dbname,$sql);

					$qresult = mysql_fetch_array($result);

			

					$mmesg = $loginname." has answer your question about ";

					$mmesg .= '"'.$qresult[0].'"'." that you ask on ";

					$mmesg .= $qresult[1]." \n\n";

					$mmesg .= "Thanks \n";

					$mmesg .= "Helpdesk System \n";

					$mheader = "From: helpdesk@ce.kmitl.ac.th\n";

					mail($mto,$msub,$mmesg,$mheader);

				}

				header("Location: ../historya.php"); 

				exit;		
			}
	}



	$sql = "select Subject,Question,AskDate,LoginName,EditStatus,CatID  from ASK,QUESTIONS  where QUESTIONS.QuestionID = ASK.QuestionID and QUESTIONS.QuestionID = '$QID' and ExpertName = '$loginname'";

	$showresult = mysql_db_query($dbname,$sql);

  $showarry = mysql_fetch_array($showresult);



	$sql="select QuestionID,AnsStatus from ASK where QuestionID ='$QID' and ExpertName = '$loginname'";

	$result = mysql_db_query($dbname,$sql);

	$ansstatus = mysql_fetch_array($result);

?>







<html>







<head>







<title>Answer Your Question</title>







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







    <td width="30%" bgcolor="#FFFFFF" height="83"><img src="image/logo3.gif" width="231" height="77"></td>







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







        







      <p>&nbsp;</p>















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







          <td height="485" bgcolor="#FFFFFF" align="left" valign="top"><img src="image/whitedot.jpg" width="1" height="1"> 







            <table width="100%" border="0" cellspacing="0" cellpadding="0">







              <tr align="left" valign="middle"> 







                <td height="38"><font size="3" face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#CC3300">Welcome 







                  <? echo $loginname;?> </font></b></font></td>







              </tr>







            </table>







            <table width="100%" border="0" cellspacing="0" cellpadding="0">







              <tr> 







                <td bgcolor=#999999 height=24 valign=top width="0%"><img height=4 







            src="image/tbl.gif" width=4></td>







                <th bgcolor=#999999 noWrap width="15%"><font color="#9999CC" face="MS Sans Serif, Microsoft Sans Serif" size="1"><b><a href="new.php"><font color="#FFFFFF">คำตอบใหม่</font></a></b></font></th>







                <td align=right bgcolor=#999999 valign=top width="0%"><img height=4 







            src="image/tbr.gif" width=4></td>







                <td bgcolor="#FFFFFF" width="0%">&nbsp;</td>







                <td class=tbTD valign=top bgcolor="#999999" width="0%"><img height=4 







            src="image/tbl.gif" width=4></td>







                <th class=tbTD noWrap bgcolor="#999999" width="15%"><a href="history.php"><font color="#FFFFFF" size="1" face="MS Sans Serif, Microsoft Sans Serif"><b>ดูประวัติการถาม</b></font></a></th>







                <td align=right class=tbTD valign=top bgcolor="#999999" width="0%"><img height=4 







            src="image/tbr.gif" width=4></td>







                <td bgcolor="#FFFFFF" width="0%">&nbsp;</td>







                <? if ($status=='E')







					{







			?> 







                <td class=tbTD valign=top bgcolor="#999999" width="0%"><img height=4 







            src="image/tbl.gif" width=4></td>







                <th class=tbTD noWrap bgcolor="#999999" width="15%"><font color="#FFFFFF" size="1" face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#9999CC"><a href="newq.php"><font color="#FFFFFF">คำถามใหม่</font></a></font></b></font></th>







                <td align=right class=tbTD valign=top bgcolor="#999999" width="0%"><img height=4 







            src="image/tbr.gif" width=4></td>







                <td bgcolor="#FFFFFF" width="0%">&nbsp;</td>







                <td class=tbTD valign=top bgcolor="#FFFFCC" width="0%"><img height=4 







            src="image/tbl.gif" width=4></td>







                <th class=tbTD noWrap bgcolor="#FFFFCC" width="15%"><font color="#9999CC" size="1" face="MS Sans Serif, Microsoft Sans Serif"><b>ดูประวัติการตอบ</b></font></th>







                <td align=right class=tbTD valign=top bgcolor="#FFFFCC" width="0%"><img height=4 







            src="image/tbr.gif" width=4></td>







                <td bgcolor="#FFFFFF" width="0%">&nbsp;</td>







                <?	} ?> 







                <td class=tbTD valign=top bgcolor="#999999" width="0%"><img height=4 







            src="image/tbl.gif" width=4></td>







                <th class=tbTD bgcolor="#999999" width="22%"><a href="editprofile.php"><font color="#FFFFFF" size="1"><b><font face="MS Sans Serif, Microsoft Sans Serif">แก้ไขข้อมูลส่วนตัว</font></b></font></a></th>







                <td align=right class=tbTD valign=top bgcolor="#999999" width="0%"><img height=4 







            src="image/tbr.gif" width=4></td>







                <td bgcolor="#FFFFFF" width="0%">&nbsp;</td>







                <td class=tbTD valign=top bgcolor="#999999" width="0%"><img height=4 







            src="image/tbl.gif" width=4></td>







                <th class=tbTD bgcolor="#999999" width="20%"><a href="prepost.php"><font color="#FFFFFF" face="MS Sans Serif, Microsoft Sans Serif" size="1"><b>ตั้งคำถามใหม่</b></font></a></th>







                <td align=right class=tbTD valign=top bgcolor="#999999" width="1%"><img height=4 







            src="image/tbr.gif" width=4></td>







                <td width="<? if ($status=='E'){echo "5%";}else{echo "15%";}?>">&nbsp;</td>







              </tr>







            </table>







            <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFCC">

              <tr> 







                <td>&nbsp;</td>







              </tr>







              <tr> 







                <td> 
<? 
		if ($Flag03 == "F3")
		{
?> 
      	      <font size="2" face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#CC3300">พบคำหยาบในข้อความของคุณ</font></b></font><br>
      	      <font size="2" face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#CC3300">คำหยาบที่พบคือ :
				  <?
						for ($i=0;$i<$ban_i;$i++)
						{
							echo " $ban[$i]";
						}
				  ?>
				  </font></b></font><br>
<?
 		}
?>






                  <form method="post" action="ansask.php">



                    <div align="center"> 







                      <table width="90%" border="0" cellspacing="0" cellpadding="0">







                        <tr> 







                          <td width="18%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300">หัวเรื่อง 







                            :</font></td>







                          <td width="82%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2">&nbsp;<?echo htmlspecialchars($showarry["Subject"]);?></font></td>







                        </tr>







                        <tr> 







                          <td width="18%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300">วันที่ถาม 







                            :</font></td>







                          <td width="82%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"color="#CC3300">&nbsp;<?echo $showarry["AskDate"];?></font></td>







                        </tr>







                        <tr> 







                          <td width="18%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300">ผู้ถาม 







                            : </font></td>







                          <td width="82%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2">&nbsp;<?echo $showarry["LoginName"];?></font></td>







                        </tr>







                        <tr> 







                          <td width="18%" valign="top"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300">คำถาม 







                            :</font></td>







                          <td width="82%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2">&nbsp;<?echo htmlspecialchars($showarry["Question"]);?></font></td>







                        </tr>







                        <tr>







                          <td width="18%">&nbsp;</td>







                          <td width="82%">&nbsp;</td>







                        </tr>







                       <?







						if ($ansstatus["AnsStatus"]=="N")







						{







							echo '







                        <tr> 







                          <td width="18%" valign="top"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300">คำตอบ 







                            :</font></td>







                          <td width="82%"> 







                            <div align="left"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"> 







                              <textarea name="Answer" cols="40" rows="10" wrap="PHYSICAL">'.$Answer.'</textarea>







                              </font></div>







                          </td>







                        </tr>







                        <tr> 







                          <td width="18%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2">&nbsp;</font></td>







                          <td width="82%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"> 







                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 







                            &nbsp;&nbsp; </font></td>







                        </tr>







                      </table>







                      <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2">';

						echo '<input type="hidden" name="asker" value="'.$showarry["LoginName"].'">';

						echo '<input type="hidden" name="QID" value="'.$QID.'">';

						echo '<input type="hidden" name="CatID" value="'.$showarry["CatID"].'">';

						echo '<input type="hidden" name="EditStatus" value="'.$showarry['EditStatus'].'"></font>';

						echo '
                        <input type="submit" name="Submit" value="Submit">
                        <input type="reset" name="Reset" value="Reset">



                        </font></div>

                    </div>

                    <div align="center"> </div>';

						} else

						{

							$sql="select Answer,AnswerDate from ANS  where QuestionID ='$QID' and LoginName = '$loginname'";

							$result = mysql_db_query($dbname,$sql);

							$ansarry = mysql_fetch_array($result);

					?> 







                        <tr> 







                          <td width="18%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300">วันที่ตอบ 







                            :</font></td>







                          <td width="82%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300">&nbsp;<?echo $ansarry["AnswerDate"];?></font></td>







                        </tr>







                        <tr> 







                          <td width="18%" valign="top"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300">คำตอบ 







                            :</font></td>







                          <td width="82%"> 







                            <div align="left"><font face="MS Sans Serif, Microsoft Sans Serif" size="2">&nbsp;<?echo htmlspecialchars($ansarry["Answer"]);?></font></div>







                          </td>







                        </tr>







                        <tr> 







                          <td width="18%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2">&nbsp;</font></td>







                          <td width="82%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"> 







                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 







                            &nbsp;&nbsp; </font></td>







                        </tr>







                      </table>







                    </div>







                    <?







						} //end else ansstatus







					?> 







                  </form>







                </td>







              </tr>







              <tr>







                <td>







                  <div align="center"><font color="#9999FF"><a href="historya.php"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#6666FF">คลิ๊กที่นี่เพื่อกลับไปดูประวัติการตอบรวม</font></a></font></div>







                </td>







              </tr>







              <tr> 







                <td>&nbsp;</td>







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

