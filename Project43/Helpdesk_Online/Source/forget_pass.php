<?

	session_start( );

include('dbconnect.inc');


	$flag = 0;

	if ($email !="")

	{

		$sql = "select * from MEMBER where Email = '$email'";

		$result = mysql_db_query($dbname,$sql);

		$nrow = mysql_num_rows($result);

		if ($nrow == 0)

		{

			$flag = 1;

		} else 

		{

			$result_arr = mysql_fetch_array($result);

			$mto = $result_arr["Email"];

			$newpass = "";

			for ($i=0; $i<8;$i++)

			{

				$tmp = rand(48,122);

				$newpass .= chr($tmp);

			}

			$u_name = $result_arr["LoginName"];

			$sql = "update MEMBER set Password = password('$newpass') where LoginName = '$u_name'";

			$ch_pass = mysql_db_query($dbname,$sql);

			$msub = "Your Password at Helpdesk Online";

			$mmesg = "Your new password at Helpdesk Online \n";

			$mmesg .= 'Login Name = '.$result_arr["LoginName"]." \n";

			$mmesg .= 'Password = '.$newpass." \n";

			$mmesg .= "You can change this password by your self after login \n \n";

			$mmesg .= "Thanks \n";

			$mmesg .= "Helpdesk System \n";

			$mheader = "From: helpdesk@ce.kmitl.ac.th\n";

			mail($mto,$msub,$mmesg,$mheader);

			$flag = 2;

		}

	}

?>

<html>

<head>

<title>Forget Your Password</title>

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

          <td width="7" background="image/shadow-topleft.gif" height="5" align="left" valign="top"><img src="image/blackdot.jpg" width="1" height="1"></td>

          <td width="579" height="5" background="image/shadow-top.gif" valign="top" align="left"><img src="image/blackdot.jpg" width="1" height="1"></td>

        </tr>

        <tr>

          <td height="485" background="image/shadow-left.gif" align="left" valign="top"><img src="image/blackdot.jpg" width="1" height="1"></td>

          <td height="485" bgcolor="#FFFFFF" align="center" valign="top"><img src="image/whitedot.jpg" width="1" height="1"> 

            <div align="center"> 

              <div align="center"> 

                <p>&nbsp;</p>

                <? 

					if ($flag>1)

					{

						if ($flag==2)

						{

							echo '<p><font face="MS Sans Serif, Microsoft Sans Serif" color="#CC3300" size="2">เราได้จัดส่ง Login name และ Password ไปยัง mailbox ของคุณแล้ว</font></p>';

						}elseif ($flag==3)

						{

							echo '<p><font face="MS Sans Serif, Microsoft Sans Serif" color="#CC3300" size="2">มีปัญหาในการจัดส่ง Login name และ Password ไปยัง mailbox ของคุณกรุณารอสักครู่แล้วลองใหม่</font></p>';

						}

					}else

					{

						if ($flag==1)

						{

							echo '<p><font face="MS Sans Serif, Microsoft Sans Serif" color="#CC3300" size="2">ไม่พบE-mail ของคุณในรายการสมาชิก กรุณาตรวจสอบ E-mail ที่คุณกรอกอีกครั้ง</font></p>';

						}

					?>

                <p>&nbsp;</p>

                <form method="post" action="forget_pass.php" name="forgetemail">

                  <table width="55%" border="0" cellspacing="0" cellpadding="0">

                    <tr bgcolor="#FFFFCC"> 

                      <td width="50%" height="34"> 

                        <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#CC3300">กรุณากรอก 

                          E-mail ที่คุณใช้ในการสมัคร</font></div>

                      </td>

                    </tr>

                    <tr bgcolor="#FFFFCC"> 

                      <td width="50%">&nbsp;</td>

                    </tr>

                    <tr bgcolor="#FFFFCC">

                      <td width="50%"> 

                        <div align="center">

                          <input type="text" name="email">

                          <input type="submit" name="Submit" value="Submit">

                        </div>

                      </td>

                    </tr>

                    <tr bgcolor="#FFFFCC"> 

                      <td width="50%">&nbsp;</td>

                    </tr>

                  </table>

                </form>

				<? 

					} //end else $flag==2

				?>

                <p>&nbsp;</p>

              </div>

            </div>

			</td>

        </tr>

      </table>

    </td>

  </tr>

</table>

</body>

</html>

