<?include("phpFunctionDB.php"); 
 $check=SearchAgent($vdb,$Aid,$Aname,$Asurname,$Ausername,$Aprovince,$Adistrict,$Asubd,$Aroad,$Asoi,$Asubsoi,$Asubh,	$Aaddr,	$Atel,$Apost);

?>
<html>
<!-- #BeginTemplate "/Templates/Manager_Template.dwt" --> 
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
        <a href="Manager_Main.php"><img src="Pic/Manager.gif" width="250" height="28" border="0"></a> 
        <img src="Pic/space.gif" width="1" height="1"></left> 
        <div align="center"></div>
      </td>
      <td height="34" width="40" valign="top" align="left" rowspan="2"><img src="Pic/to.gif" width="46" height="28"></td>
      <td height="16" width="250" align="left" valign="top"><!-- #BeginEditable "sub_menu" --><img src="Pic/Pic_Manager/Search_Agent.gif" width="250" height="28"> 
        <!-- #EndEditable --></td>
      <td height="16" align="right" valign="top" width="300"><!-- #BeginEditable "date" --> 
        <div align="right"><?echo ThaiDate()?></div>
        <!-- #EndEditable --></td>
    </tr>
    <tr> 
      <td height="24" colspan="2" align="left" valign="top"> 
        <div align="right"><font color="#003366"><!-- #BeginEditable "name" --><font color="#003366"><b>ยินดีต้อนรับ 
          คุณ   <?$CK[Login]?></b></font><!-- #EndEditable --></font></div>
      </td>
    </tr>
    <tr> 
      <td height="201" width="256" valign="top" align="left"><img src="Pic/Pic_Manager/Sub_Manager.gif" width="256" height="230" usemap="#Map" border="0"> 
        <map name="Map"> 
          <area shape="rect" coords="-2,1,249,29" href="Manager_search_insurance.php">
          <area shape="rect" coords="0,31,249,57" href="Manager_search_customer.php">
          <area shape="rect" coords="244,33,245,59" href="Templates/Agent_search_customer.php">
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
              <div align="center"> <b><font face="MS Sans Serif, Microsoft Sans Serif" color="#003366">ผลการค้นหาตัวแทน</font></b></div>
            </td>
          </tr>
        </table>
        <table width="100%" border="0" bordercolor="#FFFFFF" cellspacing="1" cellpadding="2">
          <tr bgcolor="#FFFFCC"> 
            <td width="18%"> 
              <div align="left"><b><font color="#003366">ลำดับที่</font></b></div>
            </td>
            <td width="25%"> 
              <div align="left"><b><font color="#003366">รหัสตัวแทน</font></b></div>
            </td>
            <td width="57%"> 
              <div align="left"><b><font color="#003366">ชื่อ-นามสกุล</font></b></div>
            </td>
          </tr>
         <?
	global $conn;
	Conn2DB();
	if ($check==true)
	{
			$result =mysql_query($sql,$conn);
			$numrow = mysql_num_rows($result);
		if($numrow==0){echo"No ROW  <-- <br>"; echo"<a href =\"Manager_search_agent.php?check=false\">BACK TO MAIN</a>";}
		else 
			{
				while ($row=mysql_fetch_array($result))
					{
			echo"<tr>";
            echo"<td width=\"18%\">";
            echo"<div align=\"left\">$x</div>";
            echo"</td>";
            echo"<td width=\"25%\">$row[Agent_Id]</td>";
            echo"<td width=\"57%\"><a href=\"Manager_search_agent_detail.php?agent_id=$row[Agent_Id]\"> คุณ $row[Agent_Name]  -  $row[Agent_Surname]</a></td>";
			echo"</tr>";
					}	
						CloseDB();		
				}
	}else header("Location Manager_search_agent.php?check=$check");
?>          
         
          <tr> 
            <td colspan="2" height="29"> 
              <div align="right"><font color="#990000">ทั้งหมด <b>50 </b>เรคคอร์ด<b> 
                5</b> หน้า: </font></div>
            </td>
            <td height="29"> 
              <div align="center"><font color="#990000">&lt;&lt; 1 [2][3][4][5] 
                &gt;&gt;</font></div>
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
<!-- #EndTemplate -->
</html>
