<?include("phpFunctionDB.php"); ?>
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
      <td height="16" width="250" align="left" valign="top"><!-- #BeginEditable "sub_menu" --><img src="Pic/Pic_Manager/Competition.gif" width="250" height="28"><!-- #EndEditable --></td>
      <td height="16" align="right" valign="top" width="300"><!-- #BeginEditable "date" --> 
        <div align="right"><?echo ThaiDate()?></div>
        <!-- #EndEditable --></td>
    </tr>
    <tr> 
      <td height="24" colspan="2" align="left" valign="top"> 
        <div align="right"><font color="#003366"><!-- #BeginEditable "name" --><font color="#003366"><b>ยินดีต้อนรับ 
          คุณ   <?echo $CK[Login]?></b></font><!-- #EndEditable --></font></div>
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
		<?
		global $conn;
		Conn2DB();
		$sql ="select * from Competition where Competition_Id = $Competition_Id ";
		$result = mysql_query($sql,$conn);
		$row = mysql_fetch_array($result);
		CloseDB();
		?>
          <tr> 
            <td valign="top" align="center" bgcolor="#99CCFF"> 
              <div align="center"> <b><font face="MS Sans Serif, Microsoft Sans Serif" color="#003366"><?echo $row[Competition_Name]?></font></b></div>
            </td>
          </tr>
        </table>
        <table width="100%" border="0">
          <tr> 
            <td>&nbsp;</td>
          </tr>
        </table>
        <table width="100%" border="1" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
          <tr>
            <td>
              <table width="100%" border="1" bordercolor="#FFFFFF">
                <tr> 
                  <td width="19%" bgcolor="#FFFFCC" bordercolor="#99CCFF"> 
                    <div align="right"><b>ระยะเวลา :</b></div>
                  </td>
                  <td width="81%" bordercolor="#99CCFF"><?echo $row[Start_Date]?>   ถึง  <?echo $row[End_Date]?></td>
                </tr>
                <tr> 
                  <td width="19%" bgcolor="#FFFFCC" bordercolor="#99CCFF"> 
                    <div align="right"><b>ข้อกำหนด :</b></div>
                  </td>
				  
                  <td width="81%" bordercolor="#99CCFF"><?echo $row[Detail_Condition]?></td>
                </tr>
                <tr> 
                  <td width="19%" bgcolor="#FFFFCC" bordercolor="#99CCFF"> 
                    <div align="right"><b>รางวัล :</b></div>
                  </td>
                  <td width="81%" bordercolor="#99CCFF"><?echo $row[Detail_Reward]?></td>
                </tr>
                <tr> 
                  <td width="19%" bgcolor="#FFFFCC" bordercolor="#99CCFF"> 
                    <div align="right"><b>อื่นๆ :</b></div>
                  </td>
                  <td width="81%" bordercolor="#99CCFF"><?echo $row[Detail_Other]?></td>
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
        <table width="100%" border="1">
          <tr> 
            <td bgcolor="#FFFFCC"> 
              <div align="center"><b>FYP</b></div>
            </td>
            <td bgcolor="#FFFFCC"> 
              <div align="center"><b>NEWCODE</b></div>
            </td>
            <td bgcolor="#FFFFCC"> 
              <div align="center"><b>จำนวนราย</b></div>
            </td>
            <td bgcolor="#FFFFCC"> 
              <div align="center"><b>Persistency</b></div>
            </td>
            <td bgcolor="#FFFFCC"> 
              <div align="center"><b>Claim_Ratio</b></div>
            </td>
          </tr>
          <tr>
            <td> 
              <div align="center"><b><?echo $row[FYP_OverAll]?></b></div>
            </td>
            <td> 
              <div align="center"><b><?echo "$row[NewCode]/$row[FYP_NewCode]"?></b></div>
            </td>
            <td> 
              <div align="center"><b><?echo $row[Amount_Of_Insurance]?></b></div>
            </td>
            <td> 
              <div align="center"><b><?echo $row[Persistency]?> </b></div>
            </td>
            <td> 
              <div align="center"><b><?echo $row[Claim_Ratio]?></b></div>
            </td>
          </tr>
          <tr> 
            <td>
			 <?
//Field table agent_statistics 
// index_Id  Agent_ID  Month  Year  FYP  Persistency  Claim_Ratio  Amount_Of_Insurance 
//Field table Competition
//  Competition_Id  Post_Date  Competition_Name  Detail_Condition  Detail_Reward  Detail_Other  Start_Date  End_Date  FYP_OverAll  NewCode  FYP_NewCode  Persistency  Claim_Ratio  Amount_Of_Insurance  
				
				/*Conn2DB();
				$sql = "select * from agent_statistics where (Year>=$startyear and Year<=$endyear)and (Month >=$startmonth and Month<=$endmonth) and Agent_ID='$agent' ";
				$result=mysql_query($sql,$conn);
				while ($row=mysql_fetch_array($result))
				*/
			?>
              <div align="center"><b><font color="#0033CC">4,000,000</font></b></div>
            </td>
            <td> 
              <div align="center"><b><font color="#0033CC">6</font></b></div>
            </td>
            <td> 
              <div align="center"><b><font color="#0033CC">19</font></b></div>
            </td>
            <td> 
              <div align="center"><b><font color="#0033CC">80</font></b></div>
            </td>
            <td> 
              <div align="center"><b><font color="#0033CC">50</font></b></div>
            </td>
          </tr>
          <tr> 
            <td> 
              <div align="center"><b><font color="#990033">2,000,000</font></b></div>
            </td>
            <td> 
              <div align="center"><b><font color="#990033"> 2 </font></b></div>
            </td>
            <td> 
              <div align="center"><b><font color="#990033">1</font></b></div>
            </td>
            <td> 
              <div align="center"><b><font color="#990033">0</font></b></div>
            </td>
            <td> 
              <div align="center"><b><font color="#990033">0</font></b></div>
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
