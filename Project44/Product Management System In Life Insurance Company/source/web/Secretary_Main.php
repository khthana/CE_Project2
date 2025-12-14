<? 	include("phpFunctionDB.php"); ?>
<html>
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
        <a href="Secretary_Main.php"><img src="Pic/Secretary.gif" width="250" height="28" border="0"></a> 
        <img src="Pic/space.gif" width="1" height="1"></left> 
        <div align="center"></div>
      </td>
      <td height="34" width="40" valign="top" align="left" rowspan="2">&nbsp; </td>
      <td height="16" width="250" align="left" valign="top"><!-- #BeginEditable "sub_menu" --><!-- #EndEditable --></td>
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
          <area shape="rect" coords="0,243,248,272" href="Secretary_logout.php">
          <area shape="rect" coords="3,203,248,232" href="Secretary_message.php">
        </map>
      </td>
      <td height="184" colspan="3" align="left" valign="top"><!-- #BeginEditable "content" --> 
        <table width="100%" border="0" bgcolor="#FFFFFF">
          <tr> 
            <td valign="top" align="center" bgcolor="#99CCFF"> 
              <div align="center"> <b><font color="#003366" face="MS Sans Serif, Microsoft Sans Serif">NEWS</font></b></div>
            </td>
          </tr>
        </table>
        <table width="100%" border="0" bordercolor="#FFFFFF" cellspacing="1" cellpadding="2">
          <tr bgcolor="#FFFFCC"> 
            <td width="15%"> 
              <div align="left"><font color="#003366"><b>Date</b></font></div>
            </td>
            <td> 
              <div align="left"><font color="#003366"><b>Header</b></font></div>
            </td>
          </tr>
            <?
			view_news(&$Header,&$Announce,&$count,&$News_id);
			$n=0;
			while ($count > $n)
			{
			echo"<tr> ";
            echo"<td width=\"15%\">";
            echo"<div align=\"left\"><font color=\"#000000\">$Announce[$n]</font></div>";
            echo"</td>";
            echo"<td width=\"75%\">"; 
            echo"<div align=\"left\"><a href=\"Secretary_Vnews.php?News_id=$News_id[$n]\">$Header[$n]</a></div>";
            echo"</td>";
            echo"</tr>";
			$n++;
			}
			?>
        </table>
        <p>&nbsp;</p>
        <div align="center"> </div>
        <!-- #EndEditable --></td>
    </tr>
  </table>   
  </form>

</body>
</html>
