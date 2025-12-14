<? 

	session_start( );

include('dbconnect.inc');


	if ($Flag03 == "")

	{

		$Flag03 = "00";

	}	



	if ($Submit2)

	{	

		if  ( $Subject == "" )

		{

				$Flag03 = "F1";

		}elseif ($Question == "")

		{

				$Flag03 = "F2";

		}else

		{	
			$bansql = "select * from BANWORD";
			$banresult = mysql_db_query($dbname,$bansql);
			$bannum = mysql_num_rows($banresult);
			if ($bannum != 0)
			{
				$ban_i = 0;
				$place = "";
				$Subject = " $Subject";
				$Question = " $Question";
				while ($banarry = mysql_fetch_array($banresult))
				{
					$found1 = strpos($Subject,$banarry['Word'],0);
					if ($found1)
					{
						$ban[$ban_i] = $banarry['Word'];
						$ban_i = $ban_i +1;
						$Flag03 = "F3";
						if ($place=="")
						{
							$place = "หัวข้อ";
						}elseif($place=="คำถาม")
						{
							$place = "หัวข้อและคำถาม";
						}
					}
					$found2 = strpos($Question,$banarry['Word'],0);
					if ($found2)
					{
						if (!$found1)
						{
							$ban[$ban_i] = $banarry['Word'];
							$ban_i = $ban_i +1;
						}
						$Flag03 = "F3";
						if ($place=="")
						{
							$place = "คำถาม";
						}elseif($place=="หัวข้อ")
						{
							$place = "หัวข้อและคำถาม";
						}
					}
				} // end while ban
				$Subject = trim($Subject);
				$Question = trim($Question);
			} //end if ban num !=0
			if($Flag03 != "F3")
			{
				if (session_is_registered("loginname"))
	
				{
	
					$LoginName = $loginname;

				}else

				{

					$LoginName = "Anonymous";

				}

				$AskDate = date("Y-m-d H:i:s");

				$sql0 = "select max(QuestionID) from QUESTIONS";

				$result0 = mysql_db_query($dbname,$sql0);

				$qid = mysql_fetch_array($result0);

				$qid[0] = $qid[0] + 1;



				$sql = "insert into QUESTIONS (Subject,Question, AskDate, CatID) values ('$Subject','$Question','$AskDate','$CatID')";

				$result = mysql_db_query($dbname,$sql);



				$loop = sizeof($expertlist);

				$i = 0;

				while ($i < $loop)

				{

					$x = $expertlist[$i];

					$sql3	= "select LoginName from EXPERTIN where CatID = '$CatID' and LoginName = '$x' ";



  	   			 if ($memstatus=="E")

					{

						$sql3 .= " and LoginName <> '$LoginName'";

					}

					$result3 = mysql_db_query($dbname,$sql3);

					while ($expertin = mysql_fetch_array($result3))

					{

						$tmpe_name = $expertin['LoginName'];

						$sql4 = "insert into ASK values ('$LoginName','$qid[0]','$tmpe_name','N','N','N')";

						$result4 = mysql_db_query($dbname,$sql4);

					}

					$i = $i+1;
					$sql5 = "select Email from MEMBER where LoginName = '$tmpe_name'";
					$result5 = mysql_db_query($dbname,$sql5);
					$result5arr = mysql_fetch_array($result5);
	
					$mto = $result5arr[0];
					$msub = "You've got a new Question !";
					$mmesg = $LoginName." has asked you a question about ";			
					$mmesg .= '"'.$Subject.'"'." on ";
					$mmesg .= $AskDate." \n\n";
					$mmesg .= "Thanks \n";
					$mmesg .= "Helpdesk System \n";
					$mheader = "From: helpdesk@ce.kmitl.ac.th\n";
	
					mail($mto,$msub,$mmesg,$mheader);

				}
				session_unregister("expertlist");
				header("Location:afterpost.php");

			}
		}
	}
	
		session_register("expertlist");

?> 
<html>



<head>



<title>&quot; ตั้งคำถามที่คุณอยากรู้ &quot;</title>



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



    <td bgcolor="#FFFFFF" height="80" width="29%"><img src="image/logo3.gif" width="231" height="77"></td>



    <td background="image/2color2.jpg" height="77" width="71%">&nbsp;</td>



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



<table width="100%" border="0" cellspacing="0" cellpadding="0" height="471">



  <tr>



    <td width="30%" valign="top" align="center" height="484"> 



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



    <td width="72%" valign="top" height="484"> 



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



          <td height="565" background="image/shadow-left.gif" align="left" valign="top"><img src="image/transparent.gif" width="5" height="1"></td>



          <td height="565" bgcolor="#FFFFFF" align="center" valign="top"> 



            <table width="100%" border="0" cellspacing="0" cellpadding="0" height="454">



              <tr> 



                <td width="6%" height="42">&nbsp;</td>



				 <td width="82%" height="42">



<? 



		if ($Flag03 == "F1")



		{ 



?>



				 <font size="2" face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#CC3300">กรุณาใส่ชื่อหัวข้อด้วย</font></b></font>				



<?  } 



		elseif ($Flag03 == "F2")



		{



?> 



      	      <font size="2" face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#CC3300">กรุณาใส่คำถามที่จะถามด้วย</font></b></font><br>
<? }
		elseif ($Flag03 == "F3")
		{
?> 
      	      <font size="2" face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#CC3300">พบคำหยาบใน <?echo $place;?>ของคุณ</font></b></font><br>
      	      <font size="2" face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#CC3300">คำหยาบที่พบคือ :
				  <?
						for ($i=0;$i<$ban_i;$i++)
						{
							echo " $ban[$i]";
						}
				  ?>
				  </font></b></font>


<? }



		else



		{



?> 



				 <font size="2" face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#CC3300">ตั้งคำถามใหม่เกี่ยวกับ <? echo $CatName; ?></font></b></font><br>



<? }



?> 				  



				</td>



				  <td width="6%" height="42">&nbsp;</td>



                <td width="6%" height="42">&nbsp;</td>



              </tr>



              <tr> 



                <td rowspan="2" height="469" width="6%">&nbsp;</td>



                <td rowspan="2" colspan="2" bgcolor="#FFFFCC" valign="top" align="center"> 

				<?

					if (!session_is_registered("loginname"))

					{

				?>

                  <div align="left"><font size="2" face="MS Sans Serif, Microsoft Sans Serif">เพื่อประโยชน์ของคุณในการรับคำตอบ 

                    กรุณา <a href="login.php" target="_blank"><font color="#6666FF">Login</font></a> 

                    หรือ <a href="bememberform.php" target="_blank"><font color="#6666FF">สมัครสมาชิก</font></a> 

                    ก่อนทำการตั้งคำถาม</font> </div>

				<?

					}

				?>

                  <form method="post" action="selectpost.php" name="Questionpost">



                    <table width="100%" border="0" cellspacing="0" cellpadding="0">

                      <tr> 

                        <td width="23%" height="38"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"> 

                          &nbsp;&nbsp;หัวข้อ :</font></td>

                        <td colspan="2" height="38"> 

                          <input type="text" name="Subject" maxlength="50" value="<? echo $Subject;?>">

                        </td>

                      </tr>

                      <tr> 

                        <td width="23%" height="25"><font face="MS Sans Serif, Microsoft Sans Serif" size="2">&nbsp;&nbsp;คำถาม 

                          :</font></td>

                        <td colspan="2" height="25">&nbsp;</td>

                      </tr>

                      <tr> 

                        <td width="23%" height="189">&nbsp;</td>

                        <td colspan="2" height="189"> 

                          <textarea name="Question" rows="10" cols="45"><?echo $Question?></textarea></td>

                      </tr>

                      <tr> 

                        <td width="23%" height="20">&nbsp;</td>

                        <td colspan="2" height="20">&nbsp;</td>

                      </tr>

                      <tr> 

                        <td width="23%" height="43">&nbsp;</td>

                        <td width="28%" height="43"> 
                          <input type="submit" name="Submit2" value="Submit">
                        </td>

                        <td width="49%" height="43"> 
                          <input type="reset" name="Reset" value="Reset">
                          <input type="hidden" name="CatID" value="<?echo $CatID;?>">

                          <input type="hidden" name="CatName" value="<? echo $CatName;?>">

                          <?	



							if (session_is_registered("loginname"))



							{



						?> 

                          <input type="hidden" name="memstatus" value="<? echo $memarry["MemberStatus"];?>">

                          <? } ?> </td>

                      </tr>

                    </table>



                  </form>



                </td>



                <td rowspan="2" height="469" width="6%">&nbsp;</td>



              </tr>



              <tr> </tr>



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



