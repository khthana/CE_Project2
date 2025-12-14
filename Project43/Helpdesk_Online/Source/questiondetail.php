<? 



	session_start( );

include('dbconnect.inc');



	if ($CatID=="")



	{



		$CatID = 0;



	}			





	function  ratemax($main,$compare,$index,$catID)



{	



	$dbname = "helpdesk";

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

			$main[$index][0] = $compare[0];

			$main[$index][1]=$compare[1];

		}

}



?>



<html>



<head>



<title>&quot;รายละเอียดของคำถาม&quot;</title>



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
  
      <p>&nbsp;</p>



    </td>



    <td width="72%" valign="top"> 



      <table width="100%" border="0" cellspacing="0" cellpadding="0">



        <tr>



          <td background="image/2color2.jpg" align="left" valign="top" width="7" height="6"><img src="image/2color2_6pix.jpg" width="1" height="6"></td>



          <td background="image/2color2.jpg" width="579"><img src="image/2color2_6pix.jpg" width="1" height="6"></td>



        </tr>



        <tr>



          <td width="7" background="image/shadow-topleft.gif" height="3" align="left" valign="top"><img src="image/blackdot.jpg" width="1" height="1"></td>



          <td width="579" height="3" background="image/shadow-top.gif" valign="top" align="left"><img src="image/blackdot.jpg" width="1" height="1"></td>



        </tr>



        <tr>



          <td height="485" background="image/shadow-left.gif" align="left" valign="top"><img src="image/transparent.gif" width="5" height="1"></td>



          <td height="485" bgcolor="#FFFFFF" align="center" valign="top"> 

<?		$sql1 = "select distinct Subject,Question,Askdate,LoginName from QUESTIONS,ASK where CatID = '$CatID' and QUESTIONS.QuestionID = $QuestionID and QUESTIONS.QuestionID = ASK.QuestionID";

			$result1 = mysql_db_query($dbname,$sql1);

			$result1arr = mysql_fetch_array($result1);?>

            <table width="100%" border="0" cellspacing="0" cellpadding="0" height="168">

              <tr> 

                <td width="6%">&nbsp;</td>

                <td colspan="2"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#CC3300">คำถามประเภท <?echo $CatName?>

                  </font> </b> </font></td>

                <td width="6%">&nbsp;</td>

              </tr>

              <tr> 

                <td width="6%">&nbsp;</td>

                <td colspan="2" bgcolor="#FFFFCC" rowspan="2"> 

                  <table width="100%" border="1" height="86" cellspacing="2" cellpadding="0" bordercolor="#000000">

                    <tr bgcolor="#003399"> 

                      <td height="27"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#FFFFFF">หัวข้อ : <?echo htmlspecialchars($result1arr[0])?></font></b></td>

                    </tr>

                    <tr bgcolor="#003399"> 

                      <td height="24"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#FFFFFF"><b><font size="1">ถามโดย 

                        <?echo $result1arr[3]?> เมื่อ <?echo $result1arr[2]?></font> 

                        </b></font></td>

                    </tr>

                    <tr bgcolor="#99CCCC"> 
                      <td height="63"> 
                        <p><font face="MS Sans Serif, Microsoft Sans Serif" size="1" color="#000000"><b>รายละเอียด 
                          :</b></font></p>

                        <p><font face="MS Sans Serif, Microsoft Sans Serif" size="1" color="#000000"><?echo htmlspecialchars($result1arr[1])?></font></p>

                      </td>

                    </tr>

                  </table>

<? 				$sql2 = " select count(*) from ASK where QuestionID = '$QuestionID' and AnsStatus = 'Y'";

					$result2 = mysql_db_query($dbname,$sql2);

					$count2 = mysql_num_rows($result2);

					$result2arr = mysql_fetch_array($result2);

?>

                  <table width="100%" border="1" cellspacing="2" cellpadding="0" bordercolor="#000000">

                    <? if ($count2 == 0)

		{ ?> 

                    <tr bgcolor="#003399"> 

                      <td height="27"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#FFFFFF">ยังไม่มีผู้เชี่ยวชาญตอบคำถามนี้ 

                        !</font></b></font></td>

                    </tr>

		<? } else { 

					$sql3 = "select * from ANS where QuestionID = '$QuestionID' order by AnswerDate";

					$result3 = mysql_db_query($dbname,$sql3);

			?>		

                    <tr bgcolor="#003399"> 

                      <td height="27"><font face="MS Sans Serif, Microsoft Sans Serif" size="1"><b><font color="#FFFFFF">มีผู้เชี่ยวชาญตอบคำถามนี้แล้ว 

                        <? echo $result2arr[0] ?> คน ได้แก่</font></b></font></td>

                    </tr>

                    <tr bgcolor="#6699CC"> 

                      <td>

                        <table width="100%" border="0" cellspacing="0" cellpadding="0" bordercolor="#99CCCC">
                          <? while ($result3arr = mysql_fetch_array($result3))

						{ ?> 
                          <tr bgcolor="#99CCCC"> 
                            <td width="41%" bordercolor="#FFFFCC"> 
                              <div align="center"><a href="answerdetail.php?CatName=<? echo $CatName; ?>&CatID=<? echo $CatID ?>&LoginName=<? echo $result3arr[0] ?>&QuestionID=<? echo $result3arr[1] ?>"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#FFFFFF"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#FFFFFF"><font color="#CC3300"><b><? echo $result3arr[0] ?></b></font></font><font color="#CC3300"></font></font></a></div>

                            </td>

                            <td colspan="4" width="59%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#FFFFFF"> 
                              <font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#FFFFFF"><font color="#000000">ตอบไว้เมื่อ 
                              <? echo $result3arr[3] ?></font></font><font color="#CC3300"></font> 
                              </font></td>

                          </tr>

                          <? } ?> 

                        </table>

                      </td>

                    </tr>

		<? } ?>

                  </table>

                </td>

                <td width="6%">&nbsp;</td>

              </tr>

              <tr> 

                <td width="6%" height="166">&nbsp;</td>

                <td width="6%" height="166">&nbsp;</td>

              </tr>

              <tr> 

                <td width="6%" height="61">&nbsp;</td>

                <td width="44%" bgcolor="#FFFFCC" height="61">&nbsp;</td>

                <td width="44%" bgcolor="#FFFFCC" height="61">&nbsp;</td>

                <td width="6%" height="61">&nbsp;</td>

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



