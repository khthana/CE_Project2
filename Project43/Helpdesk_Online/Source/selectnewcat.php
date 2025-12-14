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
$sql = "select CatID,CatName from CATEGORY where ParentID= '0'";
$mainresult = mysql_db_query($dbname,$sql);


	function have_sub ($parentid,$dbname)
	{	
		$sql = "select count(*) as num from CATEGORY where ParentID=$parentid";
		$result = mysql_db_query($dbname,$sql );
		$num = mysql_result($result,0,"num");
		return $num;
	}
	function recurprint ($mid,$mname,$owner,$dbname)
	{
		$numchild=have_sub($mid,$dbname);
		if ($numchild==0)
		{
			$exsql = "select CatID from EXPERTIN where CatID='$mid' and LoginName = '$owner'";
			$exresult = mysql_db_query($dbname,$exsql );
			$exnum = mysql_num_rows($exresult);
			if ($exnum != 0)
			{
				echo    '<tr> 
  	                      <td>
  	                        <input type="checkbox" name="e_cat[]" value="'.$mid.'" checked>
  	                        <font face="MS Sans Serif, Microsoft Sans Serif" size="2"> 
  	                        <font color="#6666FF">'.$mname.'</font></font> </td>
  	                    </tr>';
			}else
			{
				echo    '<tr> 
  	                      <td>
  	                        <input type="checkbox" name="e_cat[]" value="'.$mid.'">
  	                        <font face="MS Sans Serif, Microsoft Sans Serif" size="2"> 
  	                        <font color="#6666FF">'.$mname.'</font></font> </td>
  	                    </tr>';
			}
		}else
		{
			$sql = "select CatID,CatName from CATEGORY where ParentID=$mid";
			$result = mysql_db_query($dbname,$sql);
			if (!$result){exit;}
			while ($child = mysql_fetch_array($result))
			{
				recurprint ($child["CatID"],$child["CatName"],$owner,$dbname);			
			}
		}
	}
?>
<html>
<head>
<title>เลือกประเภทของคำถามที่คุณถนัด</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
body {  margin: 0px  0px; padding: 0px  0px; font-family: "MS Sans Serif"; font-size: 12pt}
a:link { color: #005CA2; text-decoration: none; font-family: "MS Sans Serif"; font-size: 12pt}
a:visited { color: #005CA2; text-decoration: none; font-family: "MS Sans Serif"; font-size: 12pt}
a:active { color: #0099FF; text-decoration: underline; font-family: "MS Sans Serif"; font-size: 12pt}
a:hover { color: #0099FF; text-decoration: underline; font-family: "MS Sans Serif"; font-size: 12pt}
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
                  <p><font face="MS Sans Serif, Microsoft Sans Serif" size="3" color="#6666FF">เลือกประเภทของคำถามที่คุณถนัด</font></p>
                  <form method="post" action="updatedetail.php" name="selectcat">
                    <table width="70%" border="0" cellspacing="0" cellpadding="0">
                      <?
			 			while ($maincat = mysql_fetch_array($mainresult))
						{
							$numchild=have_sub($maincat["CatID"],$dbname);
							if ($numchild==0)
							{
								$catid = $maincat["CatID"];
								$exsql = "select CatID from EXPERTIN where CatID='$catid' and LoginName = '$loginname'";
								$exresult = mysql_db_query($dbname,$exsql );
								$exnum = mysql_num_rows($exresult);
								if ($exnum != 0)
								{
						?>
                      <tr> 
                        <td bgcolor="#999999"><input type="checkbox" name="e_cat[]" value="<? echo $maincat["CatID"];?>" checked><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#FFFFFF"><?echo $maincat['CatName'];?></font></b></font></td>
                      </tr>                          
					<?
								}else
								{
					?> 
                      <tr> 
                        <td bgcolor="#999999"><input type="checkbox" name="e_cat[]" value="<? echo $maincat["CatID"];?>"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#FFFFFF"><?echo $maincat['CatName'];?></font></b></font></td>
                      </tr>                          
					<?
								}//end else cat had selected
							}else
							{
					?> 
                      <tr> 
                        <td bgcolor="#999999"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#FFFFFF"><?echo $maincat['CatName'];?></font></b></font></td>
                      </tr>
                  <?
							recurprint ($maincat["CatID"],$maincat["CatName"],$loginname,$dbname);	
							} //end else
						} //end while $maincat
					?> 
                      <tr> 
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td>
                          <div align="center"> 
                            <input type="reset" name="Submit2" value="Reset">
                            <input type="submit" name="Submit" value="Submit">
                          </div>
                        </td>
                      </tr>
                    </table>

                  </form>
                  <p align="center">&nbsp;</p>
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
