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
  <form name="update" method="post" action="Secretary_competition_updateresult.php">
  
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
      <td height="16" width="250" align="left" valign="top"><!-- #BeginEditable "sub_menu" --><img src="Pic/Pic_Secretary/Competition.gif" width="250" height="28"><!-- #EndEditable --></td>
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
            <td valign="top" align="center" bgcolor="#99CCFF"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#003366">อัพเดทการแข่งขัน</font></b></td>
          </tr>
		  <?
		  global $conn;
		  Conn2DB();
		  $sql = "select * from competition where Competition_Id = '$Com_Id' ";
		  $result = mysql_query($sql,$conn);
		  $row = mysql_fetch_array($result);
		  ?>
          <tr> 
            <td valign="top" align="center" bgcolor="#FFFFFF">&nbsp;</td>
          </tr>
        </table>
        <table width="100%" border="0" bordercolor="#FFFFFF">
          <tr> 
            <td width="23%" bgcolor="#FFFFCC" bordercolor="#99CCFF"> 
              <div align="right"><b>ชื่อการแข่งขัน :</b></div>
            </td>

            <td bordercolor="#FFFFFF" colspan="3"><?echo $row[Competition_Name]?></td>
          </tr>
		  			<INPUT TYPE="hidden" name="Competition_Id"  value ="<?echo $Com_Id?>" >
          <tr> 
            <td width="23%" bgcolor="#FFFFCC" bordercolor="#99CCFF"> 
              <div align="right"><b>ข้อกำหนด :</b></div>
            </td>
            <td bordercolor="#FFFFFF" colspan="3"> 
              <textarea name="Detail_Con" cols="50" rows="10"><?echo $row[Detail_Condition]?>
</textarea>
            </td>
          </tr>
          <tr> 
            <td width="23%" bgcolor="#FFFFCC" bordercolor="#99CCFF"> 
              <div align="right"><b>รางวัล :</b></div>
            </td>
            <td bordercolor="#FFFFFF" colspan="3"> 
              <textarea name="Detail_Rew"><?echo $row[Detail_Reward]?> </textarea>
            </td>
          </tr>
          <tr> 
            <td width="23%" bgcolor="#FFFFCC" bordercolor="#99CCFF"> 
              <div align="right"><b>อื่นๆ :</b></div>
            </td>
            <td bordercolor="#FFFFFF" colspan="3"> 
              <textarea name="Detail_O"><?echo $row[Detail_Other]?></textarea>
            </td>
          </tr>
          <tr> 
            <td width="23%" bgcolor="#FFFFCC" bordercolor="#99CCFF"> 
              <div align="right"><b>วันเริ่มต้น :</b></div>
            </td>
            <td width="24%" bordercolor="#FFFFFF"> 
              <input type="text" name="Start_date" value="<?echo $row[Start_Date]?>">
            </td>
            <td width="17%" bordercolor="#CCFFFF" bgcolor="#FFFFCC"> 
              <div align="right"><b>วันสิ้นสุด :</b></div>
            </td>
            <td width="36%" bordercolor="#FFFFFF"> 
              <input type="text" name="End_Date" value="<?echo $row[End_Date]?>">
            </td>
          </tr>
          <tr> 
            <td width="23%" bgcolor="#FFFFCC" bordercolor="#99CCFF"> 
              <div align="right"><b>FYP :</b></div>
            </td>
            <td width="24%" bordercolor="#FFFFFF"> 
              <input type="text" name="FYP_OverAll" value="<?echo $row[FYP_OverAll]?>">
            </td>
            <td width="17%" bordercolor="#CCFFFF" bgcolor="#FFFFCC"> 
              <div align="right"><b>จำนวนราย :</b></div>
            </td>
            <td width="36%" bordercolor="#FFFFFF"> 
              <input type="text" name="Amount_Of_In" value="<?echo $row[Amount_Of_Insurance]?>">
            </td>
          </tr>
          <tr> 
            <td width="23%" bgcolor="#FFFFCC" bordercolor="#99CCFF"> 
              <div align="right"><b>Newcode :</b></div>
            </td>
            <td width="24%" bordercolor="#FFFFFF"> 
              <input type="text" name="NewCode" value="<?echo $row[NewCode]?>">
            </td>
            <td width="17%" bordercolor="#CCFFFF" bgcolor="#FFFFCC"> 
              <div align="right"><b>FYP Newcode :</b></div>
            </td>
            <td width="36%" bordercolor="#FFFFFF"> 
              <input type="text" name="FYP_Newcode" value="<?echo $row[FYP_NewCode]?>">
            </td>
          </tr>
          <tr> 
            <td width="23%" bgcolor="#FFFFCC" bordercolor="#99CCFF"> 
              <div align="right"><b>Persistency :</b></div>
            </td>
            <td width="24%" bordercolor="#FFFFFF"> 
              <input type="text" name="Persistency" value="<?echo $row[Persistency]?>">
            </td>
            <td width="17%" bordercolor="#CCFFFF" bgcolor="#FFFFCC"> 
              <div align="right"><b>Claim_Ratio :</b></div>
            </td>
            <td width="36%" bordercolor="#FFFFFF"> 
              <input type="text" name="Claim_Ratio" value="<?echo $row[Claim_Ratio]?>">
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td colspan="4" bordercolor="#FFFFFF"> 
              <div align="right"> </div>
              <div align="center"> 
                <input type="submit" name="update" value="Update">
				<input type="submit" name="del" value="Del">
				<!-- <FORM name ="del" METHOD=Get ACTION="Secretary_competition_updateresult.php">
		  			<INPUT TYPE="hidden" name="Competition_Id"  value ="<?echo $Com_Id?>" >
				<input type="submit" name="del" value="Del">
				</form>
				 -->
              </div>
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
