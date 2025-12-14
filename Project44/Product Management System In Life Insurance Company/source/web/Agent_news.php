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
        <img src="Pic/Agent.gif" width="250" height="28"> <img src="Pic/space.gif" width="1" height="1"></left> 
        <div align="center"></div>
      </td>
      <td height="34" width="40" valign="top" align="left" rowspan="2">&nbsp;</td>
      <td height="16" width="250" align="left" valign="top"><!-- #BeginEditable "sub_menu" --><!-- #EndEditable --></td>
      <td height="16" align="right" valign="top" width="300"><!-- #BeginEditable "date" --> 
        <div align="right"><?echo ThaiDate()?></div>
        <!-- #EndEditable --></td>
    </tr>
    <tr> 
      <td height="24" colspan="2" align="left" valign="top"> 
        <div align="right"><font color="#003366"><!-- #BeginEditable "name" --><font color="#003366"><b>ยินดีต้อนรับ 
          <?echo$CK[Login]?></b></font><!-- #EndEditable --></font></div>
      </td>
    </tr>
    <tr> 
      <td height="201" width="256" valign="top" align="left"><img src="Pic/Pic_Agent/Sub_Agent.gif" width="256" height="196" usemap="#Map" border="0"> 
        <map name="Map"> 
          <area shape="rect" coords="-2,1,249,29" href="Agent_search_insurance.html">
          <area shape="rect" coords="1,30,247,57" href="Agent_search_customer.html">
          <area shape="rect" coords="244,33,245,59" href="Templates/Agent_search_customer.html">
          <area shape="rect" coords="-1,60,246,87" href="Agent_Statistic.html">
          <area shape="rect" coords="-2,88,245,115" href="Agent_message.html">
          <area shape="rect" coords="1,143,248,168" href="Agent_logout.html">
        </map>
      </td>
      <td height="184" colspan="3" align="left" valign="top"><!-- #BeginEditable "content" --> 
        <table width="100%" border="0" bgcolor="#FFFFFF">
          <tr> 
            <td valign="top" align="center" bgcolor="#99CCFF"> 
              <div align="center"> <b><font color="#003366" face="MS Sans Serif, Microsoft Sans Serif">NEWS</font></b></div>
            </td>
          </tr>
          <tr> 
            <td valign="top" align="center" bgcolor="#FFFFFF">&nbsp;</td>
          </tr>
        </table>
        <table width="100%" border="0" bordercolor="#FFFFFF" cellspacing="1" cellpadding="2">
          <tr bgcolor="#FFFFCC"> 
            <td> 
				<?opennews($News_id,&$News_Header,&$News_Detail,&$News_AnnounceDate,&$News_ExpireDate)?>
              <div align="center"><font color="#000000"><b><?echo$News_Announce?></b></font></div>
            </td>
            <td> 
              <div align="center"><b><font color="#003366"><?echo$News_Header?></font></b></div>
            </td>
          </tr>
          <tr> 
            <td colspan="2"> 
              <div align="left"></div>
              <div align="left"><?echo$News_Detail?></div>
            </td>
          </tr>
          <tr> 
            <td colspan="2"> 
              <div align="center"><b><a href="Agent_Main.php">หัวข้อข่าว</a></b></div>
            </td>
          </tr>
        </table>
        <div align="center"> </div>
        <!-- #EndEditable --></td>
    </tr>
  </table>   
  </form>
</body>
</html>
