<? 
include("phpFunctionDB.php"); 
?>
<html><!-- #BeginTemplate "/Templates/Secretary_Template.dwt" -->
<head>
<!-- #BeginEditable "doctitle" --> 
<title>INSURANCE SYSTEM </title>
<!-- #EndEditable -->
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
<body bgcolor="#FFFFFF">
  <form name="form1" method="post" action="Secretary_insurance_updateresult.php">
  <table width="750" border="0" bgcolor="#FFFFFF">
    <tr> 
      <td colspan="4"><img src="Pic/LOGO.gif" width="100%" height="74"></td>
    </tr>
    <tr> 
      <td height="34" width="256" align="left" valign="top" rowspan="2"><left> 
        <a href="Secretary_Main.php"><img src="Pic/Secretary.gif" width="250" height="28" border="0"></a> 
        <img src="Pic/space.gif" width="1" height="1"></left> 
        <div align="center"></div>
      </td>
      <td height="34" width="40" valign="top" align="left" rowspan="2"><img src="Pic/to.gif" width="46" height="28"></td>
      <td height="16" width="250" align="left" valign="top"><!-- #BeginEditable "sub_menu" --><img src="Pic/Pic_Secretary/insurance-policy.gif" width="250" height="28"><!-- #EndEditable --></td>
      <td height="16" align="right" valign="top" width="300"><!-- #BeginEditable "date" --> 
        <div align="right"><?echo ThaiDate()?></div>
        <!-- #EndEditable --></td>
    </tr>
    <tr> 
      <td height="24" colspan="2" align="left" valign="top"> 
        <div align="right"><font color="#003366"><!-- #BeginEditable "name" --><font color="#003366"><b>ยินดีต้อนรับ 
          คุณ <?echo $CK[Login]?></b></font><!-- #EndEditable --></font></div>
      </td>
    </tr>
    <tr> 
      <td height="201" width="256" valign="top" align="left"> <img src="Pic/Pic_Secretary/Sub_Secretary.gif" width="256" height="270" usemap="#Map" border="0"> 
        <map name="Map"> 
          <area shape="rect" coords="-1,1,249,29" href="Secretary_insurance.php">
          <area shape="rect" coords="0,30,249,56" href="Secretary_allstatistic.php">
          <area shape="rect" coords="2,59,249,86" href="Secretary_agentstatistic.php">
          <area shape="rect" coords="1,88,248,115" href="Secretary_competition.php">
          <area shape="rect" coords="1,116,250,145" href="Secretary_customer.php">
          <area shape="rect" coords="2,146,249,173" href="Secretary_agent.php">
          <area shape="rect" coords="0,174,248,203" href="Secretary_news.php">
          <area shape="rect" coords="1,242,249,271" href="Secretary_logout.php">
          <area shape="rect" coords="3,203,248,230" href="Secretary_message.php">
        </map>
      </td>
      <td height="184" colspan="3" align="left" valign="top"><!-- #BeginEditable "content" --> 
        <table width="100%" border="0" bgcolor="#FFFFFF">
          <tr> 
            <td valign="top" align="center" bgcolor="#99CCFF"> 
              <div align="center"> <b><font face="MS Sans Serif, Microsoft Sans Serif" color="#003366"> 
                อัพเดทกรมธรรม์</font></b></div>
            </td>
          </tr>
       <?	
		global $conn;
		Conn2DB();
		$sql = "select * from insurance_policy where Insurance_Id ='$insurance_id' ";
		$result =mysql_query($sql,$conn);
		$row=mysql_fetch_array($result);
		?>

          <tr>
		  <td valign="top" align="center" bgcolor="#FFFFFF">&nbsp;</td>
          </tr>
        </table>
        <table width="100%" border="1" bordercolor="#99CCFF">
          <tr> 
            <td> 
              <table width="100%" border="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
                <tr> 
                  <td width="25%"> 
                    <div align="right"><b>กธ.เลขที่ :</b></div>
                  </td>
                  <td width="25%"><?echo $row[Insurance_Id]?></td>
                  <td width="30%"> 
                    <div align="right"><b>วันที่ออก กธ. :</b></div>
                  </td>
                  <td width="20%"><?echo $row[Startdate]?></td>
                </tr>
                <tr> 
		<?
			$sql2 = "select * from insurance_name where Insurance_Name ='$row[Insurance_Name]' ";
			$result2 =mysql_query($sql2,$conn);
			$row2=mysql_fetch_array($result2);
		?>
                  <td width="25%"> 
                    <div align="right"><b>แบบประกัน :</b></div>
                  </td>
                  <td width="25%"><?echo $row[Insurance_Name]?></td>
                  <td width="30%"> 
                    <div align="right"><b>ชำระราย :</b></div>
                  </td>
                  <td width="20%"><?echo $row2[RangeMonth_Pay_Premium]?> เดือน</td>
                </tr>
                <tr> 
                  <td width="25%" height="23"> 
                    <div align="right"><b>วันที่เริ่มสัญญา :</b></div>
                  </td>
                  <td width="25%" height="23"><?echo $row[Startdate]?></td>
                  <td width="30%" height="23"> 
                    <div align="right"><b>วันที่สิ้นสุดสัญญา:</b></div>
                  </td>
                  <td width="20%" height="23"><?echo $row[Enddate]?></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
        <table width="100%" border="0">
          <tr> 
            <td width="42%"> 
              <div align="right"><b>ชื่อตัวแทน :</b></div>
            </td>
<?
			$sql3 ="select Agent_Name,Customer_Name,Customer_PreN,Customer_Surname from Customer,Agent where customer_id = '$row[Customer_Id]'and agent_id ='$row[Agent_Id]' ";
			$result3 =mysql_query($sql3,$conn);
			$row3 =mysql_fetch_array($result3);
?>
            <td><?echo $row3[Agent_Name]?></td>
          </tr>
  		  <INPUT TYPE="hidden" name="Insurance_Id" value ="<?echo $insurance_id?>">
		  <INPUT TYPE="hidden" name ="Cname" value ="<?echo "$row3[Customer_Name]  $row3[Customer_Surname]"?>">
          <tr> 
            <td width="42%"> 
              <div align="right"><b>ชื่อผู้เอาประกัน :</b></div>
            </td>
            <td><?echo" $row3[Customer_PreN] $row3[Customer_Name] $row3[Customer_Surname]"?></td>
          </tr>
        </table>
        <table width="100%" border="1" bgcolor="#FFFFFF" bordercolor="#99CCFF">
          <tr> 
            <td> 
              <table width="100%" border="0">
                <tr bgcolor="#FFFFCC"> 
                  <td width="20%" > 
                    <div align="center"><b>ประเภท</b></div>
                  </td>
                  <td width="16%" > 
                    <div align="center"><b>จำนวนเงินเอาประกัน</b></div>
                  </td>
                  <td width="20%"> 
                    <div align="center"><b>เบี้ยประกัน</b></div>
                  </td>
                  <td width="20%" > 
                    <div align="center"><b>จำนวนปีคุ้มครอง</b></div>
                    <div align="center"></div>
                  </td>
                  <td width="20%" > 
                    <div align="center"></div>
                    <div align="center"><b>จำนวนชำระเบี้ย</b></div>
                  </td>
                  <td width="11%"> 
                    <div align="center"><b>สถานภาพ</b></div>
                  </td>
                </tr>
        
                  <td width="20%"> 
                    <div align="center"><?echo $row[Insurance_Name]?></div>
                  </td>
		
<?
			$sql4 ="select * from Sub_contact where Insurance_Id = '$row[Insurance_Id]' ";
			$result4 =mysql_query($sql4,$conn);
			$n = 0;
	 while(	$row4 =mysql_fetch_array($result4))
	{		echo"<tr>";
			echo "<td> </td>";
		    echo "<td width=\"16%\"> ";
            echo"<div align=\"center\">";
	         
			echo"<input type=\"text\" name=\"value_sub_contact[]\" value=\"$row4[Value_Sub_Contact]\">";
            echo"</div>";
            echo"</td>";
            echo"<td width=\"20%\">";
            echo"<div align=\"center\">";
            echo"<input type=\"text\" name=\"value_ip[]\" value=\"$row4[Value_Insurance_Premium]\">";
            echo"</div>";
            echo"</td>";
            echo"<td width=\"20%\" >";
            echo"<div align=\"center\">";
            echo"<input type=\"text\" name=\"amount_of_yearP[]\" value=\"$row4[Amount_Of_year_Protect]\">";
            echo"</div>";
            echo"</td>";
            echo"<td width=\"20%\" >";
            echo"<div align=\"center\">"; 
            echo"<input type=\"text\" name=\"amount_of_yearPP[]\" value=\"$row4[Amount_Of_year_Pay_Premium]\">";
            echo"</div>";
            echo"</td>";
            echo"<td width=\"11%\">";
            echo"<div align=\"center\">"; 
            echo"<input type=\"text\" name=\"status[]\" value=\"$row4[Status]\" size=\"3\">";
            echo"</div>";
            echo"</td>";
			echo"</tr>";
            
			echo"<tr>";
            echo"<td width=\"13%\">";
            echo"<div align=\"center\">";
            echo"<select name=\"sub_contact_name[] \">";
            echo"<option selected>$row4[Sub_Contact_Name]</option>";

			$sql5 ="select * from Sub_contact_name  ";
			$result5 =mysql_query($sql5,$conn);
		 while ($row5 = mysql_fetch_array($result5))
		{
			 echo"<option>$row5[Sub_Contact_Name]</option>";
         }
			 echo"</select>";
			 echo"</div>";
             echo "</td>";
			 echo"</tr>";
		$n++;
		
	}
	$n =$n-1;
	echo"<INPUT TYPE=\"hidden\" NAME=\"n\" value=\"$n\">"
  ?>
              </table>
              <table width="100%" border="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
                <tr> 
                  <td> 
                    <div align="center"> 
                      <input type="submit" name="update" value="Update">
					<input type="submit" name="del" value="Del">
                    </div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
        <p>&nbsp;</p>
        <div align="center"> </div>
        <!-- #EndEditable --></td>
    </tr>
  </table>   
  </form>
</body>
<!-- #EndTemplate --></html>
