<? 	include("phpFunctionDB.php"); ?>
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
        <a href="Agent_Main.php"><img src="Pic/Agent.gif" width="250" height="28" border="0"></a> 
        <img src="Pic/space.gif" width="1" height="1"></left> 
        <div align="center"></div>
      </td>
      <td height="34" width="40" valign="top" align="left" rowspan="2"><img src="Pic/to.gif" width="40" height="28"></td>
      <td height="16" width="250" align="left" valign="top"><!-- #BeginEditable "sub_menu" --><img src="Pic/Pic_Agent/Statistic.gif" width="250" height="28"><!-- #EndEditable --></td>
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
      <td height="201" width="256" valign="top" align="left"><img src="Pic/Pic_Agent/Sub_Agent.gif" width="256" height="196" usemap="#Map" border="0"> 
        <map name="Map"> 
          <area shape="rect" coords="-2,1,249,29" href="Agent_search_insurance.php">
          <area shape="rect" coords="1,30,247,57" href="Agent_search_customer.php">
          <area shape="rect" coords="244,33,245,59" href="Templates/Agent_search_customer.php">
          <area shape="rect" coords="-1,60,246,87" href="Agent_Statistic.php">
          <area shape="rect" coords="1,142,249,168" href="Agent_logout.php">
          <area shape="rect" coords="-2,88,245,115" href="Agent_message.php">
        </map>
      </td>
      <td height="184" colspan="3" align="left" valign="top"><!-- #BeginEditable "content" --> 
        <table width="100%" border="0" bgcolor="#FFFFFF">
          <tr> 
            <td valign="top" align="center" bgcolor="#99CCFF"> 
              <div align="center"> <b><font face="MS Sans Serif, Microsoft Sans Serif" color="#003366">สถิติ</font></b></div>
            </td>
          </tr>
        </table>
        <table width="100%" border="0" bordercolor="#FFFFFF" cellspacing="1" cellpadding="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="10%"> 
              <div align="left"><font color="#003366">ช่วง </font></div>
            </td>
            <td width="10%"> 
              <div align="left"><font color="#003366">เดือน</font></div>
            </td>
            <td width="10%"> 
              <div align="left"> 
                <select name="select">
                  <option>มกราคม</option>
                  <option>กุมภาพันธ์</option>
                  <option>มีนาคม</option>
                  <option>เมษายน</option>
                  <option>พฤษภาคม</option>
                  <option>มิถุนายน</option>
                  <option>กรกฎาคม</option>
                  <option>สิงหาคม</option>
                  <option>กันยายน</option>
                  <option>ตุลาคม</option>
                  <option>พฤศจิกายน</option>
                  <option>ธันวาคม</option>
                </select>
              </div>
            </td>
            <td width="10%"> 
              <div align="left"><font color="#003366">ปี</font></div>
            </td>
            <td width="10%"> 
              <div align="left"> 
                <select name="select2">
                  <option>2536</option>
                  <option>2537</option>
                  <option>2538</option>
                  <option>2539</option>
                  <option>2540</option>
                  <option>2541</option>
                  <option>2542</option>
                  <option>2543</option>
                  <option>2544</option>
                </select>
              </div>
            </td>
            <td width="10%"> 
              <div align="left"><font color="#003366">ถึง</font></div>
            </td>
            <td width="10%"><font color="#003366">เดือน</font></td>
            <td width="10%"> 
              <div align="left">
                <select name="select3">
                  <option>มกราคม</option>
                  <option>กุมภาพันธ์</option>
                  <option>มีนาคม</option>
                  <option>เมษายน</option>
                  <option>พฤษภาคม</option>
                  <option>มิถุนายน</option>
                  <option>กรกฎาคม</option>
                  <option>สิงหาคม</option>
                  <option>กันยายน</option>
                  <option>ตุลาคม</option>
                  <option>พฤศจิกายน</option>
                  <option>ธันวาคม</option>
                </select>
              </div>
            </td>
            <td width="10%"> 
              <div align="left"><font color="#003366">ปี</font></div>
            </td>
            <td width="10%"> 
              <div align="left">
                <select name="select4">
                  <option>2536</option>
                  <option>2537</option>
                  <option>2538</option>
                  <option>2539</option>
                  <option>2540</option>
                  <option>2541</option>
                  <option>2542</option>
                  <option>2543</option>
                  <option>2544</option>
                </select>
              </div>
            </td>
          </tr>
          <tr> 
            <td width="5%"> 
              <div align="left"></div>
            </td>
            <td width="6%"> 
              <div align="left"></div>
            </td>
            <td width="10%">&nbsp;</td>
            <td width="6%"> 
              <div align="left"></div>
            </td>
            <td width="10%">&nbsp;</td>
            <td width="5%"> 
              <div align="left"></div>
            </td>
            <td width="6%"> 
              <div align="left"></div>
            </td>
            <td width="10%">&nbsp;</td>
            <td width="4%"> 
              <div align="left"></div>
            </td>
            <td width="18%"> 
              <input type="submit" name="Submit" value="Display">
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
