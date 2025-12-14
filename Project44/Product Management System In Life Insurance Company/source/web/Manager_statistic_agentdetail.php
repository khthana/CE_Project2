<?
	include("phpFunctionDB.php");
	global $conn;
							Conn2DB();
							$sql = "select Agent_Name from agent where Agent_Id ='1' ";
						$result=mysql_query($sql,$conn);
				$row=mysql_fetch_array($result);
							CloseDB();
?>
<html><!-- #BeginTemplate "/Templates/Manager_Template.dwt" -->
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
      <td height="16" width="250" align="left" valign="top"><!-- #BeginEditable "sub_menu" --><img src="Pic/Pic_Manager/statistic.gif" width="250" height="28"><!-- #EndEditable --></td>
      <td height="16" align="right" valign="top" width="300"><!-- #BeginEditable "date" --> 
        <div align="right"><?echo ThaiDate()?></div>
        <!-- #EndEditable --></td>
    </tr>
    <tr> 
      <td height="24" colspan="2" align="left" valign="top"> 
        <div align="right"><font color="#003366"><!-- #BeginEditable "name" --><font color="#003366"><b>ยินดีต้อนรับ 
          คุณ  <?echo $CK[Login]?></b></font><!-- #EndEditable --></font></div>
      </td>
    </tr>
    <tr> 
      <td height="201" width="256" valign="top" align="left"><img src="Pic/Pic_Manager/Sub_Manager.gif" width="256" height="230" usemap="#Map" border="0"> 
        <map name="Map"> 
          <area shape="rect" coords="-2,1,249,29" href="Manager_search_insurance.php">
          <area shape="rect" coords="0,31,249,57" href="Manager_search_customer.php">
          <area shape="rect" coords="244,33,245,59" href="Templates/Agent_search_customer.php">
          <area shape="rect" coords="-1,60,246,87" href="Manager_search_agent.php">
          <area shape="rect" coords="0,200,248,226" href="Manager_logout.php">
          <area shape="rect" coords="1,145,248,172" href="Manager_message.php">
          <area shape="rect" coords="2,117,249,143" href="Manager_statistic.php">
          <area shape="rect" coords="0,89,247,113" href="Manager_Competition.php">
        </map>
      </td>
      <td height="184" colspan="3" align="left" valign="top"><!-- #BeginEditable "content" --> 
        <table width="100%" border="0" bgcolor="#FFFFFF">
          <tr> 
            <td valign="top" align="center" bgcolor="#FFFFFF"> 
              <div align="center"></div>
            </td>
          </tr>
          <tr> 
            <td valign="top" align="center" bgcolor="#99CCFF"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#003366">สถิติตัวแทน 
              คุณ </font><font color="#003366"><b><font face="MS Sans Serif, Microsoft Sans Serif">
<?echo $row[Agent_Name];?>
							</font></b></font></b></td>
          </tr>
        </table>
        <table width="100%" border="0" bgcolor="#FFFFFF">
          <tr bgcolor="#FFFFFF"> 
            <td valign="top" align="center" height="2" colspan="3"> 
              <p align="left"><font color="#000000">ผลผลิตในเดือน <b><?echo month($startmonth)?>  <?echo   $startyear+543; ?> </b> 
                ถึง <b><?echo month($endmonth)?>  <?echo $endyear+543?></b> มีดังนี้</font></p>
              <div align="center"></div>
            </td>
          </tr>
        </table>
        <table width="100%" border="0">
          <tr bgcolor="#FFFFCC" bordercolor="#FFFFFF"> 
            <td width="15%" height="14"> 
              <div align="center"><font color="#003366"><b>เดือน</b></font></div>
            </td>
            <td width="15%" bgcolor="#FFFFCC" height="14"> 
              <div align="center"><font color="#003366"><b>ปี </b></font> </div>
            </td>
            <td width="35%" height="14"> 
              <div align="center"><b>FYP(บาท)</b></div>
            </td>
            <td width="35%" height="14"> 
              <div align="center"><b>Persistency</b></div>
            </td>
            <td width="35%" height="14"> 
              <div align="center"><b>Claim_Ratio</b></div>
            </td>
            <td width="35%" height="14"> 
              <div align="center"><b>จำนวนราย</b></div>
            </td>
          </tr>
		  <?
				Conn2DB();
			$sql = "select * from agent_statistics where (Year>=$startyear and Year<=$endyear)and (Month >=$startmonth and Month<=$endmonth) and Agent_ID='$agent' ";
				$result=mysql_query($sql,$conn);
				while ($row2=mysql_fetch_array($result))
{
		  echo"<tr> ";
           echo"<td width=\"15%\" bordercolor=\"#FFFFFF\"> ";
           echo"<div align=\"center\"><font color=\"#000000\">",month($row2[2]),"</font></div>";
           echo"</td>";
           echo"<td width=\"15%\" bordercolor=\"#FFFFFF\">"; 
           echo"<div align=\"center\">$row2[3]</div>";
           echo"</td>";
           echo"<td bordercolor=\"#FFFFFF\">"; 
           echo"<div align=\"center\">$row2[4] </div>";
           echo"</td>";
           echo"<td>";
           echo"<div align=\"center\">$row2[5]</div>";
           echo"</td>";
           echo"<td> ";
            echo"<div align=\"center\">$row2[6]</div>";
           echo"</td>";
           echo"<td> ";
           echo"<div align==\"center\">$row2[7]</div>";
           echo"</td>";
		   echo"</tr>";
}		$sql = "select sum(FYP),sum(Persistency),sum(Claim_Ratio),sum(Amount_Of_Insurance) from agent_statistics where (Year>=$startyear and Year<=$endyear)and (Month >=$startmonth and Month<=$endmonth) and Agent_ID='$agent' ";
				$result=mysql_query($sql,$conn);
				$row=mysql_fetch_array($result);

CloseDB();
		  ?>
           <tr bgcolor="#cfe6fc"> 
            <td colspan="2" bordercolor="#FFFFFF"> 
              <div align="center"><font color="#993333"><b>รวม </b> </font> </div>
            </td>
            <td bordercolor="#FFFFFF"> 
              <p align="center"><font color="#993333"><b><?echo $row[0]?></b></font></p>
            </td>
            <td> 
              <div align="center"><b><font color="#993333"><?echo $row[1]?></font></b></div>
            </td>
            <td> 
              <div align="center"><b><font color="#993333"><?echo $row[2]?></font></b></div>
            </td>
            <td> 
              <div align="center"><b><font color="#993333"><?echo $row[3]?></font></b></div>
            </td>
          </tr>
        </table>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <div align="center"> </div>
        <!-- #EndEditable --></td>
    </tr>
  </table>   
  </form>

</body>
<!-- #EndTemplate --></html>
