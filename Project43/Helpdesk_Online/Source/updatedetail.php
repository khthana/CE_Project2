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

	if ($status != 'E')

	{

		header ("Location: new.php");  

		exit;

	}



	if(isset($e_cat))

	{

		$exsql = "select CatID,Rate,NumVote  from EXPERTIN where LoginName = '$loginname'";

		$exresult = mysql_db_query("helpdesk",$exsql );

		$excount = 0;

		$exuse = "";

		$exnum = mysql_num_rows($exresult);

		if ($exnum != 0)

		{

			while ($oldexarry = mysql_fetch_array($exresult))

			{

				for ($i=0 ; $i<sizeof($e_cat) ; $i++)

				{

					if($oldexarry[0] != $e_cat[$i] )

					{

						$sql=" insert into EXPERTIN  (LoginName,CatID) values ('$loginname','$e_cat[$i]')";

						$result = mysql_db_query($dbname,$sql);

						if ($excount <> 0)

						{ $exuse .= "," ; }

						$exuse .= " '".$e_cat[$i]."' ";

						$excount=$excount+1;

					}else

					{

						if ($excount <> 0)

						{ $exuse .= "," ; }

						$exuse .= " '".$oldexarry[0]."' ";

						$excount=$excount+1;

					}

				}

			}

			$exsql = "delete  from EXPERTIN where LoginName = '$loginname' and CatID not in ( $exuse )";

			$exresult = mysql_db_query("helpdesk",$exsql );

			echo mysql_error();

		}else 

		{

			for ($i=0 ; $i<sizeof($e_cat) ; $i++)

			{

				$sql=" insert into EXPERTIN  (LoginName,CatID) values ('$loginname','$e_cat[$i]')";

				$result = mysql_db_query($dbname,$sql);

			}

		} //end $exnum == 0

	} //end if e_cat is set

$sql = "select CatName from CATEGORY,EXPERTIN where EXPERTIN.CatID = CATEGORY.CatID and LoginName = '$loginname'";

$catresult = mysql_db_query($dbname,$sql);



?>

<html>

<head>

<title>สรุปประเภทของคำถามที่คุณถนัด</title>

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

    <td width="30%" valign="top" align="center" height="539"> 

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

		?> </td>

    <td width="72%" valign="top" height="539"> 

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

            <table width="100%" border="0" cellspacing="0" cellpadding="0" height="484">

              <tr> 

                <td width="7%" height="450">&nbsp;</td>

                <td width="86%" height="450" align="center" valign="top"> 

                  <p>&nbsp;</p>

                  <p align="left"><font face="MS Sans Serif, Microsoft Sans Serif" size="3" color="#6666FF"> 

                  &nbsp;&nbsp; สรุปประเภทคำถามที่คุณถนัด</font></p>

                  <table width="90%" border="0" cellspacing="0" cellpadding="0">

					<?

						while ($catarry = mysql_fetch_array($catresult))

						{

					?>

                    <tr>

                      <td> <font face="MS Sans Serif, Microsoft Sans Serif" size="2">&nbsp;&nbsp;-&nbsp; <?echo $catarry["CatName"];?>

                        </font></td>

					<?

							if ($catarry = mysql_fetch_array($catresult))

							{

					?>

                      <td> <font face="MS Sans Serif, Microsoft Sans Serif" size="2">&nbsp;&nbsp;-&nbsp; <?echo $catarry["CatName"];?>

                        </font></td>

					<?

							} // end if $catarry

					?>

                    </tr>

					<?

						} //end while $catarry

					?>

                  </table>

                  <p><a href="selectnewcat.php"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#6666FF">คลิ๊กที่นี่ถ้าต้องการเพิ่มประเภทของคำถามที่คุณถนัด</font></a></p>
                  <p>&nbsp;</p>

                  </td>

                <td width="7%" height="450">&nbsp;</td>

              </tr>

              <tr> 

                <td width="7%">&nbsp;</td>

                <td width="86%">&nbsp;</td>

                <td width="7%">&nbsp;</td>

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

