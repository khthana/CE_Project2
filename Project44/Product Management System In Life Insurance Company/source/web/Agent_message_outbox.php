<? 	
		include("phpFunctionDB.php"); 
		$login=$CK[Login];
		outbox($login,&$Date,&$To,&$Topic,&$Oid,&$count);
?>

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
        <a href="Agent_Main.html"><img src="Pic/Agent.gif" width="250" height="28" border="0"></a> 
        <img src="Pic/space.gif" width="1" height="1"></left> 
        <div align="center"></div>
      </td>

      <td height="34" width="40" valign="top" align="left" rowspan="2"><img src="Pic/to.gif" width="40" height="28"></td>
      <td height="16" width="250" align="left" valign="top"><!-- #BeginEditable "sub_menu" --><img src="Pic/Pic_Agent/Message.gif" width="250" height="28"><!-- #EndEditable --></td>
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
          <area shape="rect" coords="1,142,249,168" href="Agent_logout.html">
          <area shape="rect" coords="-2,88,245,115" href="Agent_message.php">
        </map>
      </td>
      <td height="184" colspan="3" align="left" valign="top"><!-- #BeginEditable "content" --> 
        <table width="100%" border="0" bgcolor="#FFFFFF">
          <tr> 
            <td valign="top" align="center" bgcolor="#99CCFF"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#003366">OUTBOX</font></b></td>
          </tr>
        </table>
        <table width="100%" border="0" bgcolor="#FFFFFF">
          <tr> 
            <td valign="top" align="center" bgcolor="#FFFFFF"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#003366"><a href="Agent_message.php">INBOX</a> 
              | <a href="Agent_message_outbox.php">OUTBOX</a> | <a href="Agent_message_compose.php">COMPOSE</a> 
              | <a href="Agent_Address%20book.php">ADDRESS BOOK</a></font></b> 
            </td>
          </tr>
        </table>
        <table width="100%" border="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
          <tr>
            <td bordercolor="#FFFFFF">
              <div align="center">คุณมีข้อความใน<b> OUTBOX </b>ทั้งหมด <b><?echo  $count?> </b>ข้อความ</div>
            </td>
          </tr>
        </table>
        <table width="100%" border="0">
          <tr> 
            <td width="5%" bgcolor="#ffffe4">&nbsp;</td>
            <td width="21%" bgcolor="#ffffe4">DATE</td>
            <td width="26%" bgcolor="#ffffe4">To</td>
            <td width="48%" bgcolor="#ffffe4">Subject</td>
          </tr>

        <? $n = 0;
			while ($count>$n)
			{
			echo"<tr>";
            echo"<td width=\"5%\" height=\"27\">";
            echo"<input type=\"checkbox\" name=\"checkbox\" value=\"checkbox\">";
            echo"</td>";
            echo"<td width=\"21%\" height=\"27\">$Date[$n]</td>";
            echo"<td width=\"24%\" bgcolor=\"#ffffff\" valign=\"center\">$To[$n]</td>";
            echo"<td width=\"48%\" height=\"27\"><a href=\"Agent_message_detail_outbox.php?outbox_id=$Oid[$n]\">$Topic[$n]</a></td>";
			echo"</tr>";
			$n++;
			}
		?>
	     <tr> 
            <td colspan="4"> 
              <table width="100%" border="0">
                <tr> 
                  <td width="14%"> 
                    <input type="submit" name="Submit" value="Clear">
                  </td>
                  <td width="86%"> 
                    <input type="submit" name="Submit2" value="Delete">
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
<!-- #EndTemplate --></html>
