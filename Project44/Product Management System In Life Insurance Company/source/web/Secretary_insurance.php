<? 	include("phpFunctionDB.php"); ?>
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
  <form name="form1" method="post" action="Secretary_insurance_add.php">
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
              <div align="center"> <b><font face="MS Sans Serif, Microsoft Sans Serif" color="#003366">กรมธรรม์</font></b></div>
            </td>
          </tr>
        </table>
        <table width="100%" border="0">
          <tr bgcolor="#FFFFCC"> 
            <td width="12%">&nbsp;</td>
            <td width="16%"> 
              <div align="left"><b>Insurance ID </b></div>
            </td>
            <td width="31%"> 
              <div align="left"><b>Customer Name</b></div>
            </td>
            <td width="41%"> 
              <div align="left"><b>Agent Username </b></div>
            </td>
          </tr>
          <?
		  global $conn;
		  Conn2DB();
		  $sql = "select * from Insurance_policy ";
		  $result = mysql_query($sql,$conn);
		  while ($row =mysql_fetch_array($result))
		  {
			echo"<tr> ";
            echo"<td width=\"12%\"> ";
            echo"<input type=\"checkbox\" name=\"checkbox\" value=\"checkbox\">";
            echo"</td>";
            echo"<td width=\"16%\"><a href=\"Secretary_insurance_update.php?insurance_id=$row[Insurance_Id]\">$row[Insurance_Id]</a></td>";
            $sql2 = "select Customer_Name ,Customer_Surname from Customer where Customer_Id ='$row[Customer_Id]' ";
			$result2 = mysql_query($sql2,$conn);
			$row2 =mysql_fetch_array($result2);
			echo"<td width=\"31%\">คุณ $row2[Customer_Name]  $row2[Customer_Surname]</td>";

			$sql3 = "select Agent_Username from Agent where Agent_Id ='$row[Agent_Id]' ";
			$result3 = mysql_query($sql3,$conn);
			$row3 =mysql_fetch_array($result3);
			echo"<td width=\"41%\">$row3[Agent_Username]</td>";
			echo"</tr>";
		  }
			CloseDB();
          ?>
          <tr> 
            <td width="12%"> 
            </td>
            <td width="16%"> 
              <input type="submit" name="Submit2" value="Add">
            </td>
            <td colspan="2"><font color="#990000">ทั้งหมด <b>50 </b>เรคคอร์ด<b> 
              5</b> หน้า: &lt;&lt; 1 [2][3][4][5] &gt;&gt;</font></td>
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
