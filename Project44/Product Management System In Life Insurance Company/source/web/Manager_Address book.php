<? 	include("phpFunctionDB.php"); 
namebook_agent(&$AName,&$Aid,&$Acount,&$Anme,&$Asme);
		namebook_secretary(&$SName,&$Sid,&$Scount,&$Snme,&$Ssme);
		namebook_manager(&$MName,&$Mnme,&$Msme);
?>
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
        <a href="Manager_Main.php"><img src="Pic/Manager.gif" width="250" height="28" border="0"></a> 
        <img src="Pic/space.gif" width="1" height="1"></left> 
        <div align="center"></div>
      </td>
      <td height="34" width="40" valign="top" align="left" rowspan="2"><img src="Pic/to.gif" width="46" height="28"></td>
      <td height="16" width="250" align="left" valign="top"><!-- #BeginEditable "sub_menu" --><img src="Pic/Pic_Manager/Message.gif" width="250" height="28"><!-- #EndEditable --></td>
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
          <area shape="rect" coords="1,30,247,57" href="Manager_search_customer.php">
          <area shape="rect" coords="244,33,245,59" href="Templates/Manager_search_customer.php">
          <area shape="rect" coords="-1,60,246,87" href="Manager_search_agent.php?check=true">
          <area shape="rect" coords="1,200,249,226" href="logout.php">
          <area shape="rect" coords="2,145,249,172" href="Manager_message.php">
          <area shape="rect" coords="2,117,249,143" href="Manager_statistic.php">
          <area shape="rect" coords="0,89,247,113" href="Manager_Competition.php">
        </map>
      </td>
      <td height="184" colspan="3" align="left" valign="top"><!-- #BeginEditable "content" --> 
        <table width="100%" border="1" bordercolor="#99CCFF">
          <tr> 
            <td> 
              <table width="100%" border="0" bgcolor="#FFFFFF">
                <tr> 
                  <td valign="top" align="center" bgcolor="#99CCFF"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#003366">ADDRESS 
                    BOOK </font></b></td>
                </tr>
              </table>
              <table width="100%" border="0" bgcolor="#FFFFFF">
                <tr> 
                  <td valign="top" align="center" bgcolor="#FFFFFF"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#003366"><a href="Manager_message.php">INBOX</a> 
                    | <a href="Manager_message_outbox.php">OUTBOX</a> | <a href="Manager_message_compose.php">COMPOSE 
                    </a> | <a href="Manager_Address%20book.php">ADDRESS BOOK</a></font></b> 
                  </td>
                </tr>
              </table>
              <table width="100%" border="1" bordercolor="#99CCFF">
                <tr> 
                  <td> 
                    <table width="100%" border="0">
                      <tr> 
                        <td>&nbsp;</td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
              <table width="100%" border="1" bordercolor="#99CCFF">
                <tr> 
                  <td> 
                    <table width="100%" border="1" bordercolor="#FFFFFF">
                      <tr bgcolor="#9999FF" bordercolor="#FFFFFF"> 
                        <td colspan="3" height="27"> 
                          <div align="center"><b><font color="#003366">ผู้จัดการ</font></b></div>
                        </td>
                      </tr>
                      <tr bordercolor="#FFFFFF" bgcolor="#FFFFCC"> 
                        <td>&nbsp;</td>
                        <td width="65%"><b>ชื่อ-นามสกุล</b></td>
                        <td width="30%"><b>UserName</b></td>
                      </tr>
                      <tr bordercolor="#FFFFFF"> 
                        <td> 
                          <input type="checkbox" name="checkbox" value="checkbox">
                        </td>
                        <td>คุณ 
                          <?echo$Mnme; echo" - ",$Msme; ?>
                        </td>
                        <td> 
                          <?echo $MName?>
                        </td>
                      </tr>
                    </table>
                    <table width="100%" border="1" bordercolor="#FFFFFF">
                      <tr bgcolor="#FFCCFF" bordercolor="#FFFFFF"> 
                        <td colspan="3" height="27"> 
                          <div align="center"><b><font color="#003366">เลขานุการ</font></b></div>
                        </td>
                      </tr>
                      <tr bordercolor="#FFFFCC"> 
                        <td bgcolor="#FFFFCC" width="5%">&nbsp;</td>
                        <td bgcolor="#FFFFCC" bordercolor="#FFFFFF" width="65%"><b>ชื่อ-นามสกุล</b></td>
                        <td bgcolor="#FFFFCC" bordercolor="#FFFFFF" width="30%"><b>UserName</b></td>
                      </tr>
                      <tr bordercolor="#FFFFFF"> 
                        <?
			$n =0;
				while($Scount>$n)
				{	echo"<tr>";
					echo"<td width=\"5%\">";
					echo"<input type=\"checkbox\" name=\"checkbox2\" value=\"checkbox\">";
					echo"</td>";
					echo"<td width=\"59%\">คุณ $Snme[$n] $Ssme[$n]</td>";
					echo"<td width=\"36%\">$SName[$n]</td>";
					echo"</tr>";
					$n++;
				}
			?>
                      </tr>
                    </table>
                    <table width="100%" border="1" bordercolor="#FFFFFF">
                      <tr bgcolor="#FFCCFF" bordercolor="#FFFFFF"> 
                        <td colspan="3" height="27"> 
                          <div align="center"><b><font color="#003366">เลขานุการ</font></b></div>
                        </td>
                      </tr>
                      <tr bordercolor="#FFFFCC"> 
                        <td bgcolor="#FFFFCC" width="5%">&nbsp;</td>
                        <td bgcolor="#FFFFCC" bordercolor="#FFFFFF" width="65%"><b>ชื่อ-นามสกุล</b></td>
                        <td bgcolor="#FFFFCC" bordercolor="#FFFFFF" width="30%"><b>UserName</b></td>
                      </tr>
                      <tr bordercolor="#FFFFFF"> 
                        <? $n=0;
			while($Acount>$n)
			{
			echo"<tr>";
			echo"<td width=\"5%\">";
            echo"<input type=\"checkbox\" name=\"checkbox2\" value=\"checkbox\">";
            echo"</td>";
            echo"<td width=\"59%\">คุณ $Anme[$n] $Asme[$n]</td>";
            echo"<td width=\"36%\">$AName[$n]</td>";
			echo"</tr>";
			$n++;
			}
         ?>
                      </tr>
                    </table>
                    <table width="100%" border="0">
                      <tr> 
                        <td width="13%"> 
                          <input type="submit" name="Submit" value="Clear">
                        </td>
                        <td width="54%"> 
                          <input type="submit" name="Submit2" value="To">
                        </td>
                        <td width="33%">&nbsp;</td>
                      </tr>
                    </table>
                    <p>&nbsp;</p>
                  </td>
                </tr>
              </table>
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
</html>
