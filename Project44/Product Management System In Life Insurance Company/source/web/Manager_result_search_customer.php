<? 	
	include("phpFunctionDB.php"); 
	DisplayCustomer($customer_id,&$row);
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
        <a href="manager_Main.php"><img src="Pic/manager.gif" width="250" height="28" border="0"></a> 
        <img src="Pic/space.gif" width="1" height="1"></left> 
        <div align="center"></div>
      </td>
      <td height="34" width="40" valign="top" align="left" rowspan="2"><img src="Pic/to.gif" width="40" height="28"></td>
      <td height="16" width="250" align="left" valign="top"><!-- #BeginEditable "sub_menu" --><img src="Pic/Pic_manager/Search_customer.gif" width="250" height="28"><!-- #EndEditable --></td>
      <td height="16" align="right" valign="top" width="300"><!-- #BeginEditable "date" --> 
        <div align="right"><?echo ThaiDate() ?></div>
        <!-- #EndEditable --></td>
    </tr>
    <tr> 
      <td height="24" colspan="2" align="left" valign="top"> 
        <div align="right"><font color="#003366"><!-- #BeginEditable "name" --><font color="#003366"><b>ยินดีต้อนรับ 
          คุณ<?echo $CK[Login]?></b></font><!-- #EndEditable --></font></div>
      </td>
    </tr>
    <tr> 
      <td height="201" width="256" valign="top" align="left"><img src="Pic/Pic_Manager/Sub_Manager.gif" width="256" height="230" usemap="#Map" border="0"> 
        <map name="Map"> 
          <area shape="rect" coords="-2,1,249,29" href="Manager_search_insurance.php">
          <area shape="rect" coords="0,31,249,57" href="Manager_search_customer.php">
          <area shape="rect" coords="244,33,245,59" href="Templates/manager_search_customer.php">
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
            <td valign="top" align="center" bgcolor="#99CCFF"> 
              <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#003366">ข้อมูลลูกค้า</font></b></div>
            </td>
          </tr>
        </table>
        <table width="100%" border="0" bgcolor="#FFFFFF">
          <tr> 
            <td valign="top" align="center" bgcolor="#FFFFFF"> 
              <div align="center"><b></b></div>
            </td>
          </tr>
        </table>
        <table width="100%" border="0" bordercolor="#FFFFFF" cellspacing="1" cellpadding="2">
          <tr> 
            <td width="34%" bgcolor="#FFFFFF"> 
              <div align="right"><b>รหัสลูกค้า :</b></div>
            </td>
            <td colspan="3"><?echo $row[Customer_Id]?></td>
          </tr>
          <tr> 
            <td width="34%" bgcolor="#FFFFFF"> 
              <div align="right"><b>ชื่อ - นามสกุล :</b></div>
            </td>
            <td colspan="3">คุณ<?echo "$row[Customer_Name]"," -  $row[Customer_Surname]"?></td>
          </tr>
          <tr> 
            <td width="34%" bgcolor="#FFFFFF">
              <div align="right"><b>ระดับลูกค้า :</b></div>
            </td>
            <td colspan="3"><?echo $row[Customer_Range]?></td>

		  </tr>
          <tr> 
            <td width="34%" bgcolor="#FFFFFF"> 
              <div align="right"><b>บ้านเลขที่ :</b></div>
            </td>
            <td colspan="3"><?echo $row[Customer_AddressNo]?></td>
          </tr>
          
		  <tr> 
            <td width="34%" bgcolor="#FFFFFF"> 
              <div align="right"><b>ถนน :</b></div>
            </td>
            <td width="21%"><?echo $row[Customer_Road]?></td>
            <td width="19%" bgcolor="#FFFFFF"> 
              <div align="right"><b>ตรอก :</b></div>
            </td>
            <td width="26%"><?echo $row[Customer_Sub_soi]?></td>
          </tr>
          
		  <tr> 
            <td width="34%" bgcolor="#FFFFFF"> 
              <div align="right"><b>ซอย :</b></div>
            </td>
            <td width="21%"><?echo $row[Customer_Soi]?></td>
            <td width="19%" bgcolor="#FFFFFF"> 
              <div align="right"><b>หมู่บ้าน :</b></div>
            </td>
            <td width="26%"><?echo $row[Customer_SubH]?></td>
          </tr>
          
		  <tr> 
            <td width="34%" bgcolor="#FFFFFF"> 
              <div align="right"><b>แขวง :</b></div>
            </td>
            <td width="21%"><?echo $row[Customer_Sub_Division]?></td>
            <td width="19%" bgcolor="#FFFFFF"> 
              <div align="right"><b>เขต :</b></div>
            </td>
            <td width="26%"><?echo $row[Customer_District]?></td>
          </tr>
          <tr> 
            <td width="34%" bgcolor="#FFFFFF"> 
              <div align="right"><b>รหัสไปรษณีย์ :</b></div>
            </td>
            <td width="21%"><?echo $row[Customer_Postcode]?></td>
            <td width="19%" bgcolor="#FFFFFF"> 
              <div align="right"><b>จังหวัด :</b></div>
            </td>
            <td width="26%"><?echo $row[Customer_Province]?></td>
          </tr>
          <tr> 
            <td width="34%" bgcolor="#FFFFFF"> 
              <div align="right"><b>เบอร์โทรศัพท์ :</b></div>
            </td>
            <td colspan="3"><?echo $row[Customer_Tel1]?></td>
          </tr>
          <tr> 
            <td width="34%" bgcolor="#FFFFFF"> 
			<?
			global  $conn;
			Conn2DB();
			$sql = "select agent_id,agent_name,agent_surname from agent where agent_username='$row[Agent_Username]' ";
			$result =mysql_query($sql,$conn);
			$ro=	mysql_fetch_array($result);
			CloseDB();
			?>
              <div align="right"><b>รหัสตัวแทน :</b></div>
            </td>
            <td colspan="3"><?echo $ro[agent_id]?></td>
          </tr>
          <tr> 
            <td width="34%" bgcolor="#FFFFFF"> 
              <div align="right"><b>ชื่อ-นามสกุลตัวแทน :</b></div>
            </td>
            <td colspan="3"><?echo "$ro[agent_name]","  -  $ro[agent_surname]";?></td>
          </tr>
        </table>
        <table width="100%" border="0" bgcolor="#FFFFFF">
          <tr> 
            <td valign="top" align="center" bgcolor="#FFFFFF"> 
              <div align="center"><b> </b></div>
            </td>
          </tr>
        </table>
        <table width="100%" border="0" bgcolor="#FFFFFF">
          <tr bgcolor="#FFFFCC"> 
            <td valign="top" align="center" width="34%"> 
		      <div align="center"><b>ลำดับที่</b></div>
            </td>
            <td valign="top" align="center" width="66%"><b>เลขที่กรมธรรม์</b></td>
          </tr>
        <?
			global  $conn;
			Conn2DB();
			$sql = "select insurance_id from insurance_policy  where customer_id='$row[Customer_Id]' ";
			$result =mysql_query($sql,$conn);
			$n =1;
		while(	$ro2 =	mysql_fetch_array($result))
		{
		 echo"<tr> ";
         echo"<td valign=\"top\" align=\"center\" bgcolor=\"#FFFFFF\" width=\"34%\">$n</td>";
         echo"<td valign=\"top\" align = \"center\" bgcolor=\"#FFFFFF\" width=\"66%\"><a href=\"customer_insurance.php?insurance_id=$ro2[insurance_id]\">";
		 echo "$ro2[insurance_id]</a></td>";
          echo"</tr>";
        $n++;
		}
			CloseDB();
		?>
        
		</table>
        <p>&nbsp;</p>
        <div align="center"> </div>
        <!-- #EndEditable --></td>
    </tr>
  </table>   
  </form>

</body>
<!-- #EndTemplate --></html>
