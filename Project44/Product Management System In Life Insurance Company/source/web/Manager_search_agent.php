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
  <form name="search agent" method="post" action="Manager_search_agent_list.php">
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
          คุณ  <?$CK[Login]?></b></font><!-- #EndEditable --></font></div>
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
<?
/*	if ($check ==false){
 echo"<table width=\"100%\" border=\"0\" bgcolor=\"#FFFFFF\">";
  echo" <tr>" ;
            echo"<td valign=\"top\" align=\"center\" bgcolor=\"#99CCFF\"> ";
             echo" <div align=\"center\"> <b><font face=\"MS Sans Serif, Microsoft Sans Serif\" color=\"#003366\">ผลการค้นหาตัวแทน</font></b></div>";
            echo"</td>";
          echo"</tr>";
        echo"</table>";
        echo"<p><font color=\"#990033\">ไม่พบในฐานข้อมูลกรุณาค้นหาใหม่</font> </p>";
}*/
?>		
		<table width="100%" border="0" bgcolor="#FFFFFF">
          <tr> 
            <td valign="top" align="center" bgcolor="#99CCFF"> 
              <div align="center"> <b><font face="MS Sans Serif, Microsoft Sans Serif" color="#003366">ค้นหาตัวแทน</font></b></div>
            </td>
          </tr>
        </table>
        <table width="100%" border="0" bordercolor="#FFFFFF" cellspacing="1" cellpadding="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="18%"> 
              <div align="left"><font color="#003366">ค้นหาโดย...</font></div>
            </td>
            <td width="25%"> 
              <div align="left"></div>
            </td>
            <td width="57%" colspan="2"> 
              <div align="left"><font color="#003366"></font></div>
            </td>
          </tr>
          <tr> 
            <td width="18%"> 
              <div align="right"> 
                <input type="radio" name="vdb" value="byname">
              </div>
            </td>
            <td width="25%"> 
              <div align="left">รหัส :</div>
            </td>
            <td width="57%" colspan="2"> 
              <input type="text" name="Aid">
            </td>
          </tr>
          <tr> 
            <td width="18%"> 
              <div align="right"> 
                <input type="radio" name="vdb" value="byname">
              </div>
            </td>
            <td width="25%"> 
              <div align="left">ชื่อ :</div>
            </td>
            <td width="57%" colspan="2"> 
              <input type="text" name="Aname">
            </td>
          </tr>
          <tr> 
            <td width="18%"> 
              <div align="right"> 
                <input type="radio" name="vdb" value="byname">
              </div>
            </td>
            <td width="25%"> 
              <div align="left">นามสกุล :</div>
            </td>
            <td width="57%" colspan="2"> 
              <input type="text" name="Asurname">
            </td>
          </tr>
          <tr> 
            <td width="18%"> 
              <div align="right"> 
                <input type="radio" name="vdb" value="byaddr">
              </div>
            </td>
            <td width="25%"> 
              <div align="left">บ้านเลขที่ :</div>
            </td>
            <td width="57%" colspan="2"> 
              <input type="text" name="Aaddr">
            </td>
          </tr>
          <tr> 
            <td width="18%"> 
              <div align="right"> 
                <input type="radio" name="vdb" value="byaddr">
              </div>
            </td>
            <td width="25%"> 
              <div align="left">หมู่บ้าน :</div>
            </td>
            <td width="57%" colspan="2"> 
              <input type="text" name="Asubh">
            </td>
          </tr>
          <tr> 
            <td width="18%"> 
              <div align="right"> 
                <input type="radio" name="vdb" value="byaddr">
              </div>
            </td>
            <td width="25%"> 
              <div align="left">ซอย :</div>
            </td>
            <td width="57%" colspan="2"> 
              <input type="text" name="Asoi">
            </td>
          </tr>
          <tr> 
            <td width="18%"> 
              <div align="right"> 
                <input type="radio" name="vdb" value="byaddr">
              </div>
            </td>
            <td width="25%"> 
              <div align="left">ตรอก :</div>
            </td>
            <td width="57%" colspan="2"> 
              <div align="left"> 
                <input type="text" name="Asubsoi">
              </div>
            </td>
          </tr>
          <tr> 
            <td width="18%"> 
              <div align="right"> 
                <input type="radio" name="vdb" value="byaddr">
              </div>
            </td>
            <td width="25%"> 
              <div align="left">ถนน :</div>
            </td>
            <td width="57%" colspan="2"> 
              <div align="left"> 
                <input type="text" name="Aroad">
              </div>
            </td>
          </tr>
          <tr> 
            <td width="18%"> 
              <div align="right"> 
                <input type="radio" name="vdb" value="byaddr">
              </div>
            </td>
            <td width="25%"> 
              <div align="left">แขวง :</div>
            </td>
            <td width="57%" colspan="2"> 
              <div align="left"> 
                <input type="text" name="Asubd">
              </div>
            </td>
          </tr>
          <tr> 
            <td width="18%"> 
              <div align="right"> 
                <input type="radio" name="vdb" value="byaddr">
              </div>
            </td>
            <td width="25%"> 
              <div align="left">เขต :</div>
            </td>
            <td width="57%" colspan="2"> 
              <div align="left"> 
                <input type="text" name="Adistrict">
              </div>
            </td>
          </tr>
          <tr> 
            <td width="18%"> 
              <div align="right"> 
                <input type="radio" name="vdb" value="byaddr">
              </div>
            </td>
            <td width="25%"> 
              <div align="left">รหัสไปรณีย์ :</div>
            </td>
            <td width="57%" colspan="2"> 
              <div align="left"> 
                <input type="text" name="Apost">
              </div>
            </td>
          </tr>
          <tr> 
            <td width="18%"> 
              <div align="right"> 
                <input type="radio" name="vdb" value="byaddr">
              </div>
            </td>
            <td width="25%"> 
              <div align="left">เบอร์โทรศัพท์ :</div>
            </td>
            <td width="57%" colspan="2"> 
              <div align="left"> 
                <input type="text" name="Atel">
              </div>
            </td>
          </tr>
          <tr> 
            <td width="18%"> 
              <div align="left"> 
                <input type="reset" name="Submit2" value="Clear">
              </div>
            </td>
            <td width="25%"> 
              <div align="left"> 
                <input type="submit" name="Submit" value="Search">
              </div>
            </td>
            <td width="28%"> 
              <div align="left"> </div>
            </td>
            <td width="29%">&nbsp; </td>
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
