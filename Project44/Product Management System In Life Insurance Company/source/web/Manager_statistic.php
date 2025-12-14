<?
	include("phpFunctionDB.php");
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
          คุณ <?echo $CK[Login]?></b></font><!-- #EndEditable --></font></div>
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
            <td valign="top" align="center" bgcolor="#99CCFF"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#003366">สถิติทั้งหมด</font></b> 
              <div align="center"></div>
            </td>
          </tr>
        </table>
<FORM METHOD=POST ACTION="Manager_statistic_alldetail.php">
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
                <select name="startmonth">
                  <option value ="1">มกราคม</option>
                  <option value ="2">กุมภาพันธ์</option>
                  <option value ="3">มีนาคม</option>
                  <option value ="4">เมษายน</option>
                  <option value ="5">พฤษภาคม</option>
                  <option value ="6">มิถุนายน</option>
                  <option value ="7">กรกฎาคม</option>
                  <option value ="8">สิงหาคม</option>
                  <option value ="9">กันยายน</option>
                  <option value ="10">ตุลาคม</option>
                  <option value ="11">พฤศจิกายน</option>
                  <option value ="12">ธันวาคม</option>
                </select>
              </div>
            </td>
            <td width="10%"> 
              <div align="left"><font color="#003366">ปี</font></div>
            </td>
            <td width="10%"> 
              <div align="left"> 
                <select name="startyear">
					<option value ="1993">2536</option>
                  <option value ="1994">2537</option>
                  <option value ="1995">2538</option>
                  <option value ="1996">2539</option>
                  <option value ="1997">2540</option>
                  <option value ="1998">2541</option>
                  <option value ="1999">2542</option>
                  <option value ="2000">2543</option>
                  <option value ="2001">2544</option>
                   <option value ="2002">2545</option>
				  </select>
              </div>
            </td>
            <td width="10%"> 
              <div align="left"><font color="#003366">ถึง</font></div>
            </td>
            <td width="10%"><font color="#003366">เดือน</font></td>
            <td width="10%"> 
              <div align="left"> 
                <select name="endmonth">
				  <option value ="1">มกราคม</option>
                  <option value ="2">กุมภาพันธ์</option>
                  <option value ="3">มีนาคม</option>
                  <option value ="4">เมษายน</option>
                  <option value ="5">พฤษภาคม</option>
                  <option value ="6">มิถุนายน</option>
                  <option value ="7">กรกฎาคม</option>
                  <option value ="8">สิงหาคม</option>
                  <option value ="9">กันยายน</option>
                  <option value ="10">ตุลาคม</option>
                  <option value ="11">พฤศจิกายน</option>
                  <option value ="12">ธันวาคม</option>                
				  </select>
              </div>
            </td>
            <td width="10%"> 
              <div align="left"><font color="#003366">ปี</font></div>
            </td>
            <td width="10%"> 
              <div align="left"> 
                <select name="endyear">
				  <option value ="1993">2536</option>
                  <option value ="1994">2537</option>
                  <option value ="1995">2538</option>
                  <option value ="1996">2539</option>
                  <option value ="1997">2540</option>
                  <option value ="1998">2541</option>
                  <option value ="1999">2542</option>
                  <option value ="2000">2543</option>
                  <option value ="2001">2544</option>
                   <option value ="2002">2545</option>
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
</FORM>

<FORM METHOD=POST ACTION="Manager_statistic_agentdetail.php">
        <table width="100%" border="0" bgcolor="#FFFFFF">
          <tr> 
            <td valign="top" align="center" bgcolor="#FFFFFF"> 
              <div align="center"></div>
            </td>
          </tr>
          <tr> 
            <td valign="top" align="center" bgcolor="#99CCFF"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#003366">สถิติตัวแทนแต่ละคน</font></b> 
            </td>
          </tr>
        </table>
        <table width="100%" border="0">
          <tr> 
            <td  height="33" bgcolor="#FFFFFF" bordercolor="#FFFFFF" width="5%"> 
              <div align="right"> </div>
            </td>
            <td  height="33" bgcolor="#FFFFFF" bordercolor="#FFFFFF" width="30%"> 
              <div align="right"><b>ชื่อตัวแทน : </b></div>
            </td>
            <td  height="33" bgcolor="#FFFFFF" bordercolor="#FFFFFF"> 
              <select name="agent">
                <?
				global $conn;
				Conn2DB();
				$sql = "select * from agent";
					$result = mysql_query($sql,$conn);
					while($row = mysql_fetch_array($result))
					{	echo"<option value =\"$row[Agent_Id]\">$row[Agent_Name]</option>";
					}
				?>
              </select>
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
                <select name="startmonth">
                   <option value ="1">มกราคม</option>
                  <option value ="2">กุมภาพันธ์</option>
                  <option value ="3">มีนาคม</option>
                  <option value ="4">เมษายน</option>
                  <option value ="5">พฤษภาคม</option>
                  <option value ="6">มิถุนายน</option>
                  <option value ="7">กรกฎาคม</option>
                  <option value ="8">สิงหาคม</option>
                  <option value ="9">กันยายน</option>
                  <option value ="10">ตุลาคม</option>
                  <option value ="11">พฤศจิกายน</option>
                  <option value ="12">ธันวาคม</option>
                </select>
              </div>
            </td>
            <td width="10%"> 
              <div align="left"><font color="#003366">ปี</font></div>
            </td>
            <td width="10%"> 
              <div align="left"> 
                <select name="startyear">
                  <option value ="1993">2536</option>
                  <option value ="1994">2537</option>
                  <option value ="1995">2538</option>
                  <option value ="1996">2539</option>
                  <option value ="1997">2540</option>
                  <option value ="1998">2541</option>
                  <option value ="1999">2542</option>
                  <option value ="2000">2543</option>
                  <option value ="2001">2544</option>
                   <option value ="2002">2545</option>
				</select>
              </div>
            </td>
            <td width="10%"> 
              <div align="left"><font color="#003366">ถึง</font></div>
            </td>
            <td width="10%"><font color="#003366">เดือน</font></td>
            <td width="10%"> 
              <div align="left"> 
                <select name="endmonth">
				  <option value ="1">มกราคม</option>
                  <option value ="2">กุมภาพันธ์</option>
                  <option value ="3">มีนาคม</option>
                  <option value ="4">เมษายน</option>
                  <option value ="5">พฤษภาคม</option>
                  <option value ="6">มิถุนายน</option>
                  <option value ="7">กรกฎาคม</option>
                  <option value ="8">สิงหาคม</option>
                  <option value ="9">กันยายน</option>
                  <option value ="10">ตุลาคม</option>
                  <option value ="11">พฤศจิกายน</option>
                  <option value ="12">ธันวาคม</option>
				  </select>
              </div>
            </td>
            <td width="10%"> 
              <div align="left"><font color="#003366">ปี</font></div>
            </td>
            <td width="10%"> 
              <div align="left"> 
                <select name="endyear">
                  <option value ="1993">2536</option>
                  <option value ="1994">2537</option>
                  <option value ="1995">2538</option>
                  <option value ="1996">2539</option>
                  <option value ="1997">2540</option>
                  <option value ="1998">2541</option>
                  <option value ="1999">2542</option>
                  <option value ="2000">2543</option>
                  <option value ="2001">2544</option>
                    <option value ="2002">2545</option>
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
              <input type="submit" name="Submit2" value="Display">
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
