<?
include("phpFunctionDB.php"); 
?>
<html><!-- #BeginTemplate "/Templates/Agent_Template.dwt" -->
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
  <form name="form1" method="post" action="">
  <table width="750" border="0" bgcolor="#FFFFFF">
    <tr> 
      <td colspan="4"><img src="Pic/LOGO.gif" width="100%" height="74"></td>
    </tr>
    <tr> 
      <td height="34" width="256" align="left" valign="top" rowspan="2"><left> 
        <a href="manager_Main.html"><img src="Pic/manager.gif" width="250" height="28" border="0"></a> 
        <img src="Pic/space.gif" width="1" height="1"></left> 
        <div align="center"></div>
      </td>
      <td height="34" width="40" valign="top" align="left" rowspan="2"><img src="Pic/to.gif" width="40" height="28"></td>
      <td height="16" width="250" align="left" valign="top"><!-- #BeginEditable "sub_menu" --><img src="Pic/Pic_manager/Search_insurance.gif" width="250" height="28"><!-- #EndEditable --></td>
      <td height="16" align="right" valign="top" width="300"><!-- #BeginEditable "date" --> 
        <div align="right"><?echo ThaiDate();?></div>
        <!-- #EndEditable --></td>
    </tr>
    <tr> 
      <td height="24" colspan="2" align="left" valign="top"> 
        <div align="right"><font color="#003366"><!-- #BeginEditable "name" --><font color="#003366"><b>ยินดีต้อนรับ 
          คุณ <?$CK[Login]?></b></font><!-- #EndEditable --></font></div>
      </td>
    </tr>
    <tr> 
        <td height="201" width="256" valign="top" align="left"><img src="Pic/Pic_Manager/Sub_Manager.gif" width="256" height="230" usemap="#Map" border="0"> 
        <map name="Map"> 
          <area shape="rect" coords="-2,1,249,29" href="Manager_search_insurance.php">
          <area shape="rect" coords="0,31,249,57" href="Manager_search_customer.php">
          <area shape="rect" coords="244,33,245,59" href="Templates/Manager_search_customer.php">
          <area shape="rect" coords="-1,60,246,87" href="Manager_search_agent.php">
          <area shape="rect" coords="1,200,249,226" href="Manager_logout.php">
          <area shape="rect" coords="2,145,249,172" href="Manager_message.php">
          <area shape="rect" coords="2,117,249,143" href="Manager_statistic.php">
          <area shape="rect" coords="0,89,247,113" href="Manager_Competition.php">
        </map>
      </td>
      <td height="184" colspan="3" align="left" valign="top"><!-- #BeginEditable "content" --> 
        <table width="100%" border="0" bgcolor="#FFFFFF">
          <tr> 
            <td valign="top" align="center" bgcolor="#99CCFF"> 
              <div align="center"> <b><font face="MS Sans Serif, Microsoft Sans Serif" color="#003366">ข้อมูลกรมธรรม์</font></b></div>
            </td>
          </tr>
          <tr> 
            <td valign="top" align="center" bgcolor="#FFFFFF"> 
              <div align="left"></div>
            </td>
          </tr>
        </table>
        <table width="100%" border="1" bordercolor="#99CCFF">
          <tr> 
            <td> 
              <table width="100%" border="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
                <tr> 
                  <td width="25%"> 
<?
	global $conn;
	Conn2DB();
	$sql ="select * from insurance_policy where insurance_id = '$insurance_id' ";
	$result =mysql_query($sql,$conn);
	$numrow = mysql_num_rows($result);
	if($numrow==0){echo "No matchs to view.","<br/>";}
		else 
		$row=mysql_fetch_array($result);
?>
                    <div align="right"><b>กธ.เลขที่ :</b></div>
                  </td>
                  <td width="25%"><?echo $insurance_id?></td>
                  <td width="30%"> 
                    <div align="right"><b>วันที่ออก กธ. :</b></div>
                  </td>
                  <td width="20%"><?echo $row[Paid_Date]?></td>
                </tr>
                <tr> 
                  <td width="25%"> 
                    <div align="right"><b>แบบประกัน :</b></div>
                  </td>
                  <td width="25%"><?echo $row[Insurance_Name]?></td>
                  <td width="30%"> 
                    <div align="right"><b>ชำระราย :</b></div>
                  </td>
                  <td width="20%">12 เดือน</td>
                </tr>
                <tr> 
                  <td width="25%" height="23"> 
                    <div align="right"><b>วันที่เริ่มสัญญา :</b></div>
                  </td>
                  <td width="25%" height="23"><?echo $row[Startdate]?></td>
                  <td width="30%" height="23"> 
                    <div align="right"><b>วันที่สิ้นสุดสัญญา :</b></div>
                  </td>
                  <td width="20%" height="23"><?echo $row[Enddate]?></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
        <table width="100%" border="0">
          <tr> 
            <td>&nbsp;</td>
          </tr>
        </table>
        <table width="100%" border="1" bgcolor="#FFFFFF" bordercolor="#99CCFF">
          <tr> 
            <td> 
              <table width="100%" border="0">
<?
	$sql ="select  *  from agent where agent_id = '$row[Agent_Id]' ";
	$result =mysql_query($sql,$conn);
	$numrow = mysql_num_rows($result);
	if($numrow==0){echo "No matchs to view.","<br/>";}
	else 
	$r2=mysql_fetch_array($result);
?>
				<tr> 
                  <td width="42%" colspan="2"> 
                    <div align="right"><b>ชื่อตัวแทน :</b></div>
                  </td>
                  <td colspan="2">คุณ <?echo "$r2[Agent_Name] --  $r2[Agent_Surname]"?></td>
                </tr>
                <tr> 
                  <td width="42%" colspan="2"> 
                    <div align="right"><b>ชื่อผู้เอาประกัน :</b></div>
                 </td>
<?
	$sql ="select  *  from customer  where Customer_id = '$row[Customer_Id]' ";
	$result =mysql_query($sql,$conn);
	$numrow = mysql_num_rows($result);
	if($numrow==0){echo "No matchs to view.","<br/>";}
		else 
		$r3=mysql_fetch_array($result);
?>
				  <td colspan="2"><?echo "$r3[Customer_Name] -- $r3[Customer_Surname]" ?></td>
                </tr>
                <tr> 
                  <td width="42%" colspan="2"> 
                    <div align="right"><b>วันเกิด :</b></div>
                  </td>
                  <td colspan="2">21/03/1994</td>
                </tr>
                <tr> 
                  <td width="42%" colspan="2"> 
                    <div align="right"><b>ที่ติดต่อ :</b></div>
                  </td>
                  <td colspan="2"><?echo"$r3[Customer_AddressNo]  $r3[Customer_District]  $r3[Customer_Sub_Disvision]  $r3[Customer_Road]  $r3[Customer_soi]  $r3[Customer_Sub_soi] $r3[Customer_Province]  $r3[Customer_Postcode]"?></td>
                </tr>
                <tr> 
                  <td width="42%" colspan="2"> 
                    <div align="right"><b>โทรศัพท์ติดต่อสะดวก :</b></div>
                  </td>
                  <td colspan="2"><?echo $r3[Customer_Tel1]?></td>
                </tr>
                <tr> 
                  <td width="42%" colspan="2"> 
                    <div align="right"><b>โทรศัพท์บ้าน :</b></div>
                  </td>
                  <td colspan="2"><?echo $r3[Customer_Tel2]?></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
        <table width="100%" border="0">
          <tr> 
            <td>&nbsp;</td>
          </tr>
        </table>
        <div align="center"> 
          <table width="100%" border="1" bgcolor="#FFFFFF" bordercolor="#99CCFF">
            <tr> 
              <td> 
                <table width="100%" border="0">
                  <tr bgcolor="#FFFFCC"> 
                    <td width="15%" > 
                      <div align="center"><b>ประเภท</b></div>
                    </td>
                    <td width="23%" > 
                      <div align="center"><b>จำนวนเงินเอาประกัน</b></div>
                    </td>
                    <td width="13%"> 
                      <div align="center"><b>เบี้ยประกัน</b></div>
                    </td>
                    <td width="32%" > 
                      <div align="center"><b>จำนวนปีคุ้มครอง/</b></div>
                      <div align="center"><b>ชำระเบี้ย</b></div>
                    </td>
                    <td width="17%"> 
                      <div align="center"><b>สถานภาพ</b></div>
                    </td>
                  </tr>
         
				  
<?
	$sql ="select  *  from Sub_contact  where Insurance_ID = '$insurance_id' ";
	$result =mysql_query($sql,$conn);
	$numrow = mysql_num_rows($result);
	if($numrow==0){echo "No matchs to view.","<br/>";}
		else 
		while($r=mysql_fetch_array($result))
		{
					echo"<tr> ";
					echo"<td width=\"15%\"> ";
                    echo" <div align=\"center\">$r[Sub_Contact_Name]</div>";
                    echo"</td>";
                    echo"<td width=\"23%\"> ";
                    echo"<div align=\"center\">$r[Value_Sub_Contact]</div>";
                    echo"</td>";
                    echo"<td width=\"13%\">";
                    echo"<div align=\"center\">$r[Value_Insurance_Premium]</div>";
                    echo"</td>";
                    echo"<td width=\"32%\" >";
                     echo"<div align=\"center\">$r[Amount_Of_year_Protect]/$r[Amount_Of_year_Pay_Premium]</div>";
                    echo"</td>";
                    echo"<td width=\"17%\"> ";
                     echo"<div align=\"center\">$r[Status]</div>";
                    echo"</td>";
                  echo"</tr>"; 
		}
?>

<?
	$sql ="select  sum(Value_Sub_Contact)  from Sub_contact  where Insurance_ID = '$insurance_id' ";
	$result =mysql_query($sql,$conn);
	$r = mysql_fetch_array($result);
?>
                </table>
                <table width="100%" border="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
                  <tr> 
                    <td width="50%"> 
                      <div align="right"><font color="#990000"><b>รวมเบี้ยประกันที่ต้องชำระ 
                        :</b> </font></div>
                    </td>
                    <td width="54%"><b><?echo $r[0]?></b></td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </div>
        <!-- #EndEditable --></td>
    </tr>
  </table>   
  </form>

</body>
<!-- #EndTemplate --></html>
