<? 







	session_start( );







	$host = "localhost";







	$user = "helpdesk";







	$password = "online";







	$dbname = "helpdesk";







	if ($CatID=="")







	{







		$CatID = 0;







	}			







	mysql_connect($host,$user,$password) ;







$keyword = trim($keyword);



if (!isset($cat))



{ $cat=0;}







if (!isset($day_ask1))



{ $day_ask1=0;}



if (!isset($month_ask1))



{ $month_ask1=0;}



if (!isset($year_ask1))



{ $year_ask1=0;}



if($day_ask1==99)



{ $day_ask1= date("d");}



if($month_ask1==99)



{ $month_ask1= date("m");}



if($year_ask1==99)



{ $year_ask1= date("Y");}



 



if (!isset($day_ask2))



{ $day_ask2=0;}



if (!isset($month_ask2))



{ $month_ask2=0;}



if (!isset($year_ask2))



{ $year_ask2=0;}



if($day_ask2==99)



{ $day_ask2= date("d");}



if($month_ask2==99)



{ $month_ask2= date("m");}



if($year_ask2==99)



{ $year_ask2= date("Y");}







if (!isset($day_ans1))



{ $day_ans1=0;}



if (!isset($month_ans1))



{ $month_ans1=0;}



if (!isset($year_ans1))



{ $year_ans1=0;}



if (!isset($day_ans2))



if($day_ans1==99)



{ $day_ans1= date("d");}



if($month_ans1==99)



{ $month_ans1= date("m");}



if($year_ans1==99)



{ $year_ans1= date("Y");}







{ $day_ans2=0;}



if (!isset($month_ans2))



{ $month_ans2=0;}



if (!isset($year_ans2))



{ $year_ans2=0;}



if($day_ans2==99)



{ $day_ans2= date("d");}



if($month_ans2==99)



{ $month_ans2= date("m");}



if($year_ans2==99)



{ $year_ans2= date("Y");}







if (!isset($subject))



{ $subject="or";}



if (!isset($question))



{ $question="or";}



if (!isset($answer))



{ $answer="or";}







if (!isset($expert))



{ 



	$expert = "";



}else



{



	$expert = trim($expert);



}







$searchsql = "select distinct Q.QuestionID, Subject , ASK.LoginName, AskDate ";



if ($expert != "")



{



	$searchsql .=" ,ASK.ExpertName,AnswerDate ";



}



$searchsql .= " from QUESTIONS Q, ANS,ASK where ";



$searchsql .= "Q.QuestionID = ASK.QuestionID and ASK.QuestionID = ANS.QuestionID ";



if ($expert != "")



{



	$searchsql .=" and ASK.ExpertName=ANS.LoginName ";



}



if ($keyword <>"") 



{



	if( $subject == "and" or $question == "and" or $answer == "and")



	{



		if ($subject =="and")



		{



			$searchsql .= "and Subject like '%$keyword%' ";



		}



		if ($question =="and")



		{



			$searchsql .= "and Question like '%$keyword%' ";



		}



		if ($answer =="and")



		{



			$searchsql .= "and Answer like '%$keyword%' ";



		}		



	}else



	{



		$searchsql .= "and (Subject like '%$keyword%' or  Answer like '%$keyword%' or Question like '%$keyword%') ";



	}



}//end if $keyword <>""







if ($day_ask1!= 0 and $month_ask1!= 0 and $year_ask1!= 0)



{



	$askdate1 = "$year_ask1-$month_ask1-$day_ask1 00:00:00";



	$searchsql .= "and AskDate >= '$askdate1' ";



}



if ($day_ask2!= 0 and $month_ask2!= 0 and $year_ask2!= 0)



{



	$askdate2 = "$year_ask2-$month_ask2-$day_ask2 00:00:00";



	$searchsql .= "and AskDate <= '$askdate2' ";



}



if ($day_ans1!= 0 and $month_ans1!= 0 and $year_ans1!= 0)



{



	$ansdate1 = "$year_ans1-$month_ans1-$day_ans1 00:00:00";



	$searchsql .= "and AnswerDate >=  '$ansdate1' ";



}



if ($day_ans2!= 0 and $month_ans2!= 0 and $year_ans2!= 0)



{



	$ansdate2 = "$year_ans2-$month_ans2-$day_ans2 00:00:00";



	$searchsql .= "and AnswerDate <=  '$ansdate2' ";



}



if ($expert != "")



{



	$searchsql .= "and ExpertName like '%$expert%'";



}



if ($cat != 0)



{



	$searchsql .= "and CatID = '$cat'";



}







	$searchresult = mysql_db_query($dbname,$searchsql);



	$numsearch = mysql_num_rows($searchresult);







?>







<html>







<head>







<title>ผลการค้นหา</title>







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







          <td height="620" bgcolor="#FFFFFF" align="center" valign="top"> 
            <p><?



				 if ($numsearch ==0)



				{



			?><img src="image/whitedot.jpg" width="1" height="1"> </p>



			 <p align="left"> <font color="#6666FF"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="3">&nbsp;&nbsp;&nbsp;ไม่พบ keyword ที่คุณต้องการ</font></b></font></p>



          <? 



				}else



				{



			?>



		            <p align="left"> <font color="#6666FF"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="3">&nbsp;&nbsp;&nbsp;ค้นพบ<?echo " $numsearch ";?>คำถาม</font></b></font></p>



			<?



					$tmp = $numsearch%10;



					$plus=1;



					if ($tmp==0 )



					{



						$plus = 0;



					}



					$totalpage = ($numsearch/10)+$plus;



					$point = strpos($totalpage,".");



					if ($point)



					{



						$totalpage =substr($totalpage,0,$point+1);



					}



					if (!isset($current))



					{



						$current = 0;



					}



					switch($page)



					{



						case "First":



							$current = 0;



							break;



						case "Prev":



							if ($current-1<0)



							{



								$current = 0;



							}else



							{



								$current = $current-1;



							}



							break;



						case "Next":



							if ($current+1> $totalpage-1)



							{



								$current = $totalpage-1;



							}else



							{



								$current = $current+1;



							}



							break;



						case "Last":



							$current=$totalpage-1;



							break;



					}



						$goto = $current*10;



						$searchsql .= " order by Q.QuestionID  limit $goto,10";



						$searchresult = mysql_db_query($dbname,$searchsql);



			if ($expert =="")



			{



		?>



            <table width="95%" border="1" cellspacing="0" cellpadding="0" bordercolor="#303498">



              <tr bgcolor="#333399"> 



                <td width="40%"> 



                  <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#FFFFFF">หัวข้อ</font></b></font></div>



                </td>



                <td width="15%"> 



                  <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#FFFFFF"><b>ผู้ถาม</b></font></div>



                </td>



                <td width="15%"> 



                  <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#FFFFFF"><b>วันที่ถาม</b></font></div>



                </td>



              </tr>



              <?



					while(	$searcharry = mysql_fetch_array($searchresult))



					{



				?> 



              <tr> 



                <td width="40%">&nbsp;<a href="showsearch.php?QID=<?echo $searcharry[0];?>"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#6666FF"><?echo $searcharry[1];?></font></a></td>



                <td width="15%"> 



                  <div align="center">&nbsp;<font face="MS Sans Serif, Microsoft Sans Serif" size="2"><?echo $searcharry[2];?></font></div>



                </td>



                <td width="15%"> 



                  <div align="center">&nbsp;<font face="MS Sans Serif, Microsoft Sans Serif" size="2" ><?echo $searcharry[3];?></font></div>



                </td>



              </tr>



              <?



					} //end while $searcharry 



				?> 



            </table>



            <p>&nbsp;</p>



			<?



				}else  //end if $expert ==""



				{



			?>



            <table width="95%" border="1" cellspacing="0" cellpadding="0" bordercolor="#303498">



              <tr bgcolor="#333399"> 



                <td width="40%"> 



                  <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#FFFFFF">หัวข้อ</font></b></font></div>



                </td>



                <td width="13%"> 



                  <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#FFFFFF"><b>ผู้ถาม</b></font></div>



                </td>



                <td width="17%"> 



                  <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#FFFFFF"><b>วันที่ถาม</b></font></div>



                </td>



                <td width="13%"> 



                  <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#FFFFFF"><b>ผู้ตอบ</b></font></div>



                </td>



                <td width="17%"> 



                  <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#FFFFFF"><b>วันที่ตอบ</b></font></div>



                </td>



              </tr>



              <?



					while(	$searcharry = mysql_fetch_array($searchresult))



					{



				?> 



              <tr> 



                <td width="40%">&nbsp;<a href="showsearch.php?QID=<?echo $searcharry[0];?>"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#6666FF"><?echo $searcharry[1];?></font></a></td>



                <td width="13%"> 



                  <div align="center">&nbsp;<font face="MS Sans Serif, Microsoft Sans Serif" size="2"><?echo $searcharry[2];?></font></div>



                </td>



                <td width="17%"> 



                  <div align="center">&nbsp;<font face="MS Sans Serif, Microsoft Sans Serif" size="2" ><?echo $searcharry[3];?></font></div>



                </td>



                <td width="13%">



<div align="center">&nbsp;<a href="personal.php?expert=<?echo $searcharry[4];?>"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#6666FF"><?echo $searcharry[4];?></font></a></div></td>



                <td width="17%"> 



                  <div align="center">&nbsp;<font face="MS Sans Serif, Microsoft Sans Serif" size="2" ><?echo $searcharry[5];?></font></div>



                </td>



              </tr>



              <?



					} //end while $searcharry 



				?> 



            </table>



            <p>&nbsp;</p>



			<?



				}  //end if $expert ==""



			?> 



            <form method="post" action="<?getenv("URL");?>">



              <table width="90%" border="0" cellspacing="0" cellpadding="0">



                <tr> 



                  <td width="50%"> 



                    <div align="left"> <font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#333399">หน้าที่ 



                      <? echo $current+1;?> / <?echo $totalpage;?></font> </div>



                  </td>



                  <td width="50%"> 



                    <div align="center"> 



                      <input type="hidden" name="current" value="<?echo $current;?>">



                      <input type="hidden" name="keyword" value="<?echo $keyword;?>">



                      <input type="hidden" name="cat" value="<?echo $cat;?>">



                      <input type="hidden" name="subject" value="<?echo $subject;?>">



                      <input type="hidden" name="question" value="<?echo $question;?>">



                      <input type="hidden" name="answer" value="<?echo $answer;?>">



                      <input type="hidden" name="expert" value="<?echo $expert;?>">



                      <input type="hidden" name="day_ask1" value="<?echo $day_ask1;?>">



                      <input type="hidden" name="month_ask1" value="<?echo $month_ask1;?>">



                      <input type="hidden" name="year_ask1" value="<?echo $year_ask1;?>">



                      <input type="hidden" name="day_ask2" value="<?echo $day_ask2;?>">



                      <input type="hidden" name="month_ask2" value="<?echo $month_ask2;?>">



                      <input type="hidden" name="year_ask2" value="<?echo $year_ask2;?>">



                      <input type="hidden" name="day_ans1" value="<?echo $day_ans1;?>">



                      <input type="hidden" name="month_ans1" value="<?echo $month_ans1;?>">



                      <input type="hidden" name="year_ans1" value="<?echo $year_ans1;?>">



                      <input type="hidden" name="day_ans2" value="<?echo $day_ans2;?>">



                      <input type="hidden" name="month_ans2" value="<?echo $month_ans2;?>">



                      <input type="hidden" name="year_ans2" value="<?echo $year_ans2;?>">



                      <input type="submit" name="page" value="First">



                      <input type="submit" name="page" value="Prev">



                      <input type="submit" name="page" value="Next">



                      <input type="submit" name="page" value="Last">



                    </div>



                  </td>



                </tr>



              </table>



            </form>



			<?



				} //end else $numsearch ==0



			?>



            <p align="center">&nbsp; </p>



          </td>







        </tr>







      </table>







    </td>







  </tr>







</table>







</body>







</html>







