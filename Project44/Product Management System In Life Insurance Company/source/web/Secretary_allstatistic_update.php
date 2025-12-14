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
  <form name="form1" method="post" action="Secretary_allstatistic_result.php">
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
      <td height="16" width="250" align="left" valign="top"><!-- #BeginEditable "sub_menu" --><img src="Pic/Pic_Secretary/overall-statistic.gif" width="250" height="28"><!-- #EndEditable --></td>
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
              <div align="center"> <b><font face="MS Sans Serif, Microsoft Sans Serif" color="#003366">Update 
                Overall Statistic</font></b></div>
            </td>
          </tr>
          <tr> 
            <td valign="top" align="center" bgcolor="#FFFFFF">&nbsp;</td>
          </tr>
        </table>
        <div align="center">
          <table width="100%" border="1" bordercolor="#FFFFFF">
            <tr> 
              <td width="18%" bgcolor="#FFFFCC" bordercolor="#99CCFF"> 
                <div align="right"><b>Month :</b></div>
<?
				global $conn;
				Conn2DB();
				$sql = "select * from overall_statistics where Year= '$year' and Month ='$month' ";
				$result=mysql_query($sql,$conn);
				$row=mysql_fetch_array($result);
?>
<INPUT TYPE="hidden" name = "index_id" value ="<?echo $row[Index_Id]?>">
              </td>
              <td width="19%"><?echo Month($row[Month])?></td>
              <td width="32%" bgcolor="#FFFFCC" bordercolor="#99CCFF"> 
                <div align="right"><b>Year :</b></div>
              </td>
              <td width="31%"><?echo $row[Year]+543?></td>
            </tr>
          </table>
          <table width="100%" border="0">
            <tr> 
              <td width="17%"> 
                <div align="right"><b> FYP :</b></div>
              </td>
              <td width="31%"><?echo $row[FYP]?></td>
              <td width="22%"><b>จำนวนราย :</b></td>
              <td width="30%"> <?echo $row[Amount_Of_Insurance]?></td>
            </tr>
            <tr> 
              <td width="17%"><b>Persistency :</b></td>
              <td width="31%"><b> 
                <input type="text" name="Persistency" value="<?echo $row[Persistency]?>">
                </b></td>
              <td width="22%"><b>Claim_Ratio :</b></td>
              <td width="30%"> 
                <input type="text" name="Claim_Ratio" value="<?echo $row[Claim_Ratio]?>">
              </td>
            </tr>
            <tr> 
              <td width="17%"> 
                <div align="right"><b>Newcode :</b></div>
              </td>
              <td><b> 
                <input type="text" name="Newcode" value="<?echo $row[NewCode]?>">
                </b> </td>
              <td> <br>
              </td>
              <td>
                <input type="submit" name="Submit2" value="Update">
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
