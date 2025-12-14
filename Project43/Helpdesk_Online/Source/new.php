<?



	session_start( );



	if (!session_is_registered("loginname"))



	{



		header ("Location: login.php");  



		exit;



	}
include('dbconnect.inc');

	$sql = "select MemberStatus  from MEMBER where LoginName = '$loginname'";



	$result = mysql_db_query($dbname,$sql);



	$memstatus = mysql_fetch_array($result);



	$status = $memstatus["MemberStatus"];



	$sql = 'select QuestionID,ExpertName,EditStatus  from ASK where LoginName = "'.$loginname.'" and AnsStatus="Y" and  ViewStatus = "N"';



	$askresult = mysql_db_query($dbname,$sql);



	$num_new = mysql_num_rows($askresult);



?>



<html>



<head>



<title>See The Answers For You</title>



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



                <td bgcolor=#FFFFCC height=24 valign=top width="0%"><img height=4 



            src="image/tbl.gif" width=4></td>



                <th bgcolor=#FFFFCC noWrap width="15%"><font color="#9999CC" face="MS Sans Serif, Microsoft Sans Serif" size="1"><b>คำตอบใหม่</b></font></th>



                <td align=right bgcolor=#FFFFCC valign=top width="0%"><img height=4 



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



                <th class=tbTD noWrap bgcolor="#999999" width="15%"><a href="newq.php"><font color="#FFFFFF" size="1" face="MS Sans Serif, Microsoft Sans Serif"><b>คำถามใหม่</b></font></a></th>



                <td align=right class=tbTD valign=top bgcolor="#999999" width="0%"><img height=4 



            src="image/tbr.gif" width=4></td>



                <td bgcolor="#FFFFFF" width="0%">&nbsp;</td>



                <td class=tbTD valign=top bgcolor="#999999" width="0%"><img height=4 



            src="image/tbl.gif" width=4></td>



                <th class=tbTD noWrap bgcolor="#999999" width="15%"><a href="historya.php"><font color="#FFFFFF" size="1" face="MS Sans Serif, Microsoft Sans Serif"><b>ดูประวัติการตอบ</b></font></a></th>



                <td align=right class=tbTD valign=top bgcolor="#999999" width="0%"><img height=4 



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



              <tr valign="middle" align="center"> 



                <td> 



                  <div align="center"> <? if ($num_new==0)



						{



					?> 



                    <p align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#333399"><b>&quot;ยังไม่มีคำตอบใหม่ส่งถึงคุณ&quot;</b></font></p>



                  <? }else



						{



							$tmp = $num_new%10;



							$plus=1;



							if ($tmp==0 )

							{

								$plus = 0;

							}

							$totalpage = ($num_new/10)+$plus;

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

							$sql = "select QUESTIONS.QuestionID,Subject,ExpertName,AskDate,EditStatus  from ASK ,QUESTIONS where LoginName = '$loginname' and QUESTIONS.QuestionID = ASK.QuestionID and AnsStatus='Y' and  ViewStatus = 'N' order by AskDate desc limit $goto,10";

							$askresult = mysql_db_query($dbname,$sql);



					?> 



                    <p align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#333399"><b>มีคำตอบใหม่ถึงคุณ 



                      <?echo $num_new;?> คำตอบ</b></font></p>



                    <table width="90%" border="1" cellspacing="0" cellpadding="0" bordercolor="#333399">



                      <tr bgcolor="#333399"> 



                        <td align="center" height="27"> 



                          <div align="center"><font color="#FFFFFF" face="MS Sans Serif, Microsoft Sans Serif" size="2"><b>คำถาม</b></font></div>



                        </td>



                        <td align="center" height="27"> 



                          <div align="center"><font color="#FFFFFF" face="MS Sans Serif, Microsoft Sans Serif" size="2"><b>ผู้เชี่ยวชาญ</b></font></div>



                        </td>



                        <td align="center" height="27"> 



                          <div align="center"><font color="#FFFFFF" face="MS Sans Serif, Microsoft Sans Serif" size="2"><b>วันที่ถาม</b></font></div>



                        </td>

                      </tr>



                      <?	while ($askarry=mysql_fetch_array($askresult))



						{



							$expertthis = $askarry["ExpertName"];;



							$thissql = "select avg(Rate) from EXPERTIN where LoginName = '$expertthis'";



							$thisresult = mysql_db_query($dbname,$thissql);



							$thisarry=mysql_fetch_array($thisresult)



						?> 



                      <tr> 



						  <?



						  		if ($askarry['EditStatus'] == 'Y')



								{



			                        echo '<td width="50%">&nbsp;&nbsp;<a href="addinf_n.php?QID='.$askarry["QuestionID"].'&EName='.$askarry["ExpertName"].'"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"  color="#333399" >'.$askarry["Subject"]."</font></a>";



									echo '<font face="MS Sans Serif, Microsoft Sans Serif" size="2"  color="#CC3300" >&nbsp;&nbsp;(ขอข้อมูลเพิ่มเติม)</font></td>';



								}else



								{



						 ?>



                        <td width="50%">&nbsp;&nbsp;<a href="viewanswer.php?QID=<?echo $askarry["QuestionID"];?>&EName=<?echo $askarry["ExpertName"];?>"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"  color="#333399" ><? echo $askarry["Subject"]; ?></font></a></td>



						<?



								} // end EditStatus



						  ?>



                        <td align="center" valign="middle" width="20%"><a href="personal.php?expert=<? echo $askarry["ExpertName"];?>"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#333399"><? echo $askarry["ExpertName"];?></font></a></td>



                        <td align="center" valign="middle" width="20%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#333399"><? echo $askarry["AskDate"];?></font></td>

                      </tr>



                      <?	}



				?> 



                    </table>



                    <form method="post" action="new.php">



                      <div align="center"></div>



                      <table width="90%" border="0" cellspacing="0" cellpadding="0">



                        <tr> 



                          <td width="50%"> 



                            <div align="left"> <font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#333399">หน้าที่ 



                              <? echo $current+1;?> / <?echo $totalpage;?></font> </div>



                          </td>



                          <td width="50%"> 



                            <div align="center"> 



                              <input type="hidden" name="current" value="<?echo $current;?>">



                              <input type="submit" name="page" value="First">



                              <input type="submit" name="page" value="Prev">



                              <input type="submit" name="page" value="Next">



                              <input type="submit" name="page" value="Last">



                            </div>



                          </td>



                        </tr>



                      </table>



                    </form>



                    <? }  //end else new q



				?> </div>



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



