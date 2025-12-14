<?
	session_start( );
	if (!session_is_registered("loginname"))
	{
		header ("Location: login.php");  
		exit;
	}
	if ($loginname !="")
	{
		include('dbconnect.inc');
		$sql = "select *  from MEMBER where LoginName = '$loginname'";
		$result = mysql_db_query($dbname,$sql);
		$resmember = mysql_fetch_array($result);
		$status = $resmember['MemberStatus'];
	}else 
	{
		header ("Location: login.php");  
		exit;		
	}
?>



<html>



<head>



<title>แก้ไขข้อมูลส่วนตัว</title>



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



				$sql = "select MemberStatus,SubDate  from MEMBER where LoginName= '$loginname'";



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



                <th class=tbTD noWrap bgcolor="#999999" width="15%"><font color="#FFFFFF" size="1" face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#9999CC"><a href="history.php"><font color="#FFFFFF">ดูประวัติการถาม</font></a></font></b></font></th>



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



                <td class=tbTD valign=top bgcolor="#999999" width="0%"><img height=4 



            src="image/tbl.gif" width=4></td>



                <th class=tbTD noWrap bgcolor="#999999" width="15%"><a href="historya.php"><font color="#FFFFFF" size="1" face="MS Sans Serif, Microsoft Sans Serif"><b>ดูประวัติการตอบ</b></font></a></th>



                <td align=right class=tbTD valign=top bgcolor="#999999"><img height=4 



            src="image/tbr.gif" width=4></td>



                <td bgcolor="#FFFFFF">&nbsp;</td>



                <?	} ?> 



                <td class=tbTD valign=top bgcolor="#FFFFCC" width="0%"><img height=4 



            src="image/tbl.gif" width=4></td>



                <th class=tbTD bgcolor="#FFFFCC" width="22%"><font color="#FFFFFF" size="1"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#9999CC">แก้ไขข้อมูลส่วนตัว</font></b></font></th>



                <td align=right class=tbTD valign=top bgcolor="#FFFFCC" width="0%"><img height=4 



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



            <table width="100%" border="0" cellspacing="0" cellpadding="0">



              <tr bgcolor="#FFFFCC">



                <td width="8%">&nbsp;</td>



                <td width="84%">&nbsp;</td>



                <td width="8%">&nbsp;</td>



              </tr>



		<?



			if(isset($flag))



			{



				if ($flag == 'E')



				{



		?>



              <tr bgcolor="#FFFFCC"> 



                <td width="8%" height="30">&nbsp;</td>



                <td width="84%" height="30"> 



                  <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300">E-mail 



                    ที่คุณเปลี่ยนซ้ำกับ E-mail ของสมาชิกท่านอื่นกรุณาตรวจสอบอีกครั้ง</font></div>



                </td>



                <td width="8%" height="30">&nbsp;</td>



              </tr>



			<?



				}elseif ($flag=='P')

				{



		?>



              <tr bgcolor="#FFFFCC"> 



                <td width="8%" height="30">&nbsp;</td>



                <td width="84%" height="30"> 



                  <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300">Password 

                    ใหม่ของคุณสั้นเกินไป จึงไม่สมารถเปลี่ยนข้อมูลให้ได้</font></div>



                </td>



                <td width="8%" height="30">&nbsp;</td>



              </tr>



			<?



				}elseif ($flag=='I')



				{



			?>



              <tr bgcolor="#FFFFCC"> 



                <td width="8%" height="30">&nbsp;</td>



                <td width="84%" height="30"> 



                  <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300">กรุณาใส่รูปที่เป็น file.gif เท่านั้น</font></div>



                </td>



                <td width="8%" height="30">&nbsp;</td>



              </tr>

			<?



				}elseif ($flag=='ban')



				{



			?>



              <tr bgcolor="#FFFFCC"> 



                <td width="8%" height="30">&nbsp;</td>



                <td width="84%" height="30"> 



                  <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300">พบคำหยาบในข้อความของคุณ</font></div>



                </td>



                <td width="8%" height="30">&nbsp;</td>



              </tr>


		<?



				}



			}



		?>







              <tr bgcolor="#FFFFCC"> 



                <td width="8%">&nbsp;</td>



                <td width="84%"> 



                  <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#333399">



                    <tr bgcolor="#333399"> 



                      <td height="51"> 



                        <div align="center"><font color="#9999CC" size="4" face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#FFFFFF">ทำการแก้ไขข้อมูล 



                          </font></b></font></div>



                      </td>



                    </tr>



                    <tr> 



                      <td height="265"> 



                        <form 



							  <? if ($resmember['MemberStatus'] =='E')



				  				{



                                echo 'ENCTYPE="multipart/form-data" ';



								}?>



								method="post" action="updateprofile.php" name="profile">



                          <table width="100%" border="0" cellspacing="0" cellpadding="0">



                            <tr> 



                              <td width="45%" height="36"> 



                                <div align="center"><font color="#333399"><b><font size="2" face="MS Sans Serif, Microsoft Sans Serif">Login 



                                  Name</font></b></font></div>



                              </td>



                              <td width="50%" height="36"> 



                                <div align="left"><font color="#9999CC"><font size="2" face="MS Sans Serif, Microsoft Sans Serif" color="#333399"><b><?echo $resmember['LoginName'];?> 



                                  </b> </font> </font></div>



                              </td>



                            </tr>



                            <tr> 



                              <td width="45%" height="41"> 



                                <div align="center"><font color="#333399"><b><font size="2" face="MS Sans Serif, Microsoft Sans Serif">Password</font></b></font> 

                                  (6 - 10 Characters)</div>



                              </td>



                              <td width="50%" height="41"> 



                                <input type="password" name="password" maxlength="10"value="<?echo $resmember['Password'];?>">



                              </td>



                            </tr>



                            <tr> 



                              <td width="45%" height="43"> 



                                <div align="center"><font color="#333399"><b><font size="2" face="MS Sans Serif, Microsoft Sans Serif">ชื่อ</font></b></font></div>



                              </td>



                              <td width="50%" height="43"> 



                                <input type="text" name="firstname" maxlength="20" value="<?echo $resmember['FirstName'];?>">



                              </td>



                            </tr>



                            <tr> 



                              <td width="45%" height="43"> 



                                <div align="center"><font color="#333399" size="2" face="MS Sans Serif, Microsoft Sans Serif"><b>นามสกุล</b></font></div>



                              </td>



                              <td width="50%" height="43"> 



                                <input type="text" name="lastname" maxlength="20" value="<?echo $resmember['LastName'];?>">



                              </td>



                            </tr>



                            <tr> 



                              <td width="45%" height="40"> 



                                <div align="center"><font color="#333399" size="2" face="MS Sans Serif, Microsoft Sans Serif"><b>E-mail</b></font></div>



                              </td>



                              <td width="50%" height="40"> 



                                <input type="text" name="email" maxlength="30" size="30" value="<?echo $resmember['Email'];?>">



                              </td>



                            </tr>



                            <? if ($resmember['MemberStatus'] == 'E')



				  		{



                                  echo '<tr><td width="45%" height="35">';



                                  echo '<div align="center"><font color="#333399" size="2" face="MS Sans Serif, Microsoft Sans Serif"><b>URL ของ homepage</b></font></div>';



                                  echo '</td><td width="50%" height="35"><font face="MS Sans Serif, Microsoft Sans Serif" size="1">http://</font>';



                                  echo '<input type="text" name="link" maxlength="80" size="23" value=" ' .$resmember['Link'] . '"></td></tr>';

                                  echo '<tr>

                                  <td width="48%" height="42">

                          		<div align="center"><font color="#333399" face="MS Sans Serif, Microsoft Sans Serif" size="2"><b>ใส่ประวัติ 

                            		หรือ แนะนำตัวเอง</b></font></div>

                        		</td>

                        		<td width="52%" height="42">

                          		<textarea name="detail" cols="35" rows="10">'.$resmember['Detail'].'</textarea>

                        		</td>

                      		</tr>';

                                  echo '<tr><td width="45%" height="35">';

									if (!empty($resmember['Picture']))



									{



 										echo '<div align="center"><img src="showblob.php?loginname='.$loginname.'"  width="150" height="150"></div>';



									}else



									{



                                  	echo '<div align="center"><img src="image/whitedot.jpg" width="150" height="150"></div>';



									}



                                  echo'</td><td width="50%" height="35">';



									echo'<p><b><font color="#333399" face="MS Sans Serif, Microsoft Sans Serif" size="1">รูปต้องเป็น file.gif ขนาด150x150 pixel</font></b></p>';



                                  echo'<p><input type="file" name="Picture"></p>';



									echo '<input type="hidden" name="MAX_FILE_SIZE" value="2097152">';



                                  echo '</td></tr>';



						}?> 



                            <tr> 



                              <td width="45%" height="35"> 



                                <div align="center">
                                  <input type="submit" name="Submit" value="Submit">
                                </div>



                              </td>



                              <td width="50%" height="35"> 



                                <div align="center">
                                  <input type="reset" name="Submit2" value="Restore">
                                </div>



                              </td>



                            </tr>



                          </table>



                        </form>



                      </td>



                    </tr>



                  </table>



                </td>



                <td width="8%">&nbsp;</td>



              </tr>



              <tr bgcolor="#FFFFCC"> 



                <td width="8%">&nbsp;</td>



                <td width="84%">&nbsp;</td>



                <td width="8%">&nbsp;</td>



              </tr>



              <? 



					if ($status=="E")



					{



				 ?> 



              <tr bgcolor="#FFFFCC"> 



                <td width="8%">&nbsp;</td>



                <td width="84%"> 



                  <div align="center"><a href="updatedetail.php"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#6666FF">คลิ๊กที่นี่ถ้าต้องการเพิ่มประเภทของคำถามที่คุณถนัด</font></a></div>



                </td>



                <td width="8%">&nbsp;</td>



              </tr>



              <tr bgcolor="#FFFFCC"> 



                <td width="8%">&nbsp;</td>



                <td width="84%">&nbsp;</td>



                <td width="8%">&nbsp;</td>



              </tr>



              <?



					} // end else "E"



				?> 



            </table>



          </td>



        </tr>



      </table>



    </td>



  </tr>



</table>



</body>



</html>



