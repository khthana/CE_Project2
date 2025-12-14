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
  <form name="form1" method="post" action="Secretary_customer_updateresult.php">
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
      <td height="16" width="250" align="left" valign="top"><!-- #BeginEditable "sub_menu" --><img src="Pic/Pic_Secretary/Customer.gif" width="250" height="28"><!-- #EndEditable --></td>
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
                Customer</font></b></div>
            </td>
          </tr>
          <tr> 
            <td valign="top" align="center" bgcolor="#FFFFFF">&nbsp;</td>
          </tr>
        </table>
        <table width="100%" border="0" bordercolor="#FFFFFF" cellspacing="1" cellpadding="2">
         <?	
			global $conn;
			Conn2DB();
			$sql = "select * from customer where Customer_Id ='$Customer_Id' ";
			$result =mysql_query($sql,$conn);
			$row=mysql_fetch_array($result);
		?>

		  <tr> 
            <td width="34%" bgcolor="#FFFFFF"> 
              <div align="right"><b>รหัสลูกค้า :</b></div>
            </td>
            <td colspan="3"><?echo $row[Customer_Id]?></td>
			<INPUT TYPE="hidden" name ="Cid" value="<?echo $row[Customer_Id]?>">
          </tr>
          <tr> 
            <td width="34%" bgcolor="#FFFFFF"> 
              <div align="right"><b>คำนำหน้าชื่อ :</b></div>
            </td>
            <td colspan="3"> 
              <select name="CPreN">
                <option selected><?echo $row[Customer_PreN]?></option>
				<option>ด.ช</option>
				<option>ด.ญ</option>
                <option>นาย</option>
                <option>นาง</option>
                <option>น.ส</option>
              </select>
            </td>
          </tr>
          <tr> 
            <td width="34%" bgcolor="#FFFFFF"> 
              <div align="right"><b>ชื่อ :</b></div>
            </td>
            <td colspan="3"> 
              <input type="text" name="Cname" value="<?echo $row[Customer_Name]?>">
            </td>
          </tr>
		  
          <tr> 
            <td width="34%" bgcolor="#FFFFFF"> 
              <div align="right"><b>นามสกุล :</b></div>
            </td>
            <td colspan="3"> 
              <input type="text" name="Csurname" value="<?echo $row[Customer_Surname]?>">
            </td>
          </tr>
          <tr> 
            <td width="34%" bgcolor="#FFFFFF"> 
              <div align="right"><b>ระดับลูกค้า :</b></div>
            </td>
            <td colspan="3"> 
              <select name="Crange">
				<option selected><?echo $row[Customer_Range]?></option>
				<option>A</option>
				<option>B</option>
                <option>C</option>
              </select>
            </td>
          </tr>
          <tr> 
            <td width="34%" bgcolor="#FFFFFF"> 
              <div align="right"><b>บ้านเลขที่ :</b></div>
            </td>
            <td colspan="3"> 
              <input type="text" name="Caddr" value="<?echo $row[Customer_AddressNo]?>">
            </td>
          </tr>
          <tr> 
            <td width="34%" bgcolor="#FFFFFF"> 
              <div align="right"><b>ถนน :</b></div>
            </td>
            <td width="21%"> 
              <input type="text" name="Croad" value="<?echo $row[Customer_Road]?>">
            </td>
            <td width="19%" bgcolor="#FFFFFF"> 
              <div align="right"><b>ตรอก :</b></div>
            </td>
            <td width="26%"> 
              <input type="text" name="Csubsoi" value ="<?echo $row[Customer_Sub_soi]?>">
            </td>
          </tr>
          <tr> 
            <td width="34%" bgcolor="#FFFFFF"> 
              <div align="right"><b>ซอย :</b></div>
            </td>
            <td width="21%"> 
              <input type="text" name="Csoi" value ="<?echo $row[Customer_Soi]?>">
            </td>
            <td width="19%" bgcolor="#FFFFFF"> 
              <div align="right"><b>หมู่บ้าน :</b></div>
            </td>
            <td width="26%"> 
              <input type="text" name="Csubh" value="<?echo $row[Customer_SubH]?>">
            </td>
          </tr>
          <tr> 
            <td width="34%" bgcolor="#FFFFFF"> 
              <div align="right"><b>แขวง :</b></div>
            </td>
            <td width="21%"> 
              <input type="text" name="Csubd" value="<?echo $row[Customer_Sub_Division]?>">
            </td>
            <td width="19%" bgcolor="#FFFFFF"> 
              <div align="right"><b>เขต :</b></div>
            </td>
            <td width="26%"> 
              <input type="text" name="Cdistrict" value="<?echo $row[Customer_District]?>">
            </td>
          </tr>
          <tr> 
            <td width="34%" bgcolor="#FFFFFF"> 
              <div align="right"><b>รหัสไปรษณีย์ :</b></div>
            </td>
            <td width="21%"> 
              <input type="text" name="Cpostcode" value="<?echo $row[Customer_Postcode]?>">
            </td>
            <td width="19%" bgcolor="#FFFFFF"> 
              <div align="right"><b>จังหวัด :</b></div>
            </td>
            <td width="26%"> 
              <input type="text" name="Cprovince" value="<?echo $row[Customer_Province]?>">
            </td>
          </tr>
          <tr> 
            <td width="34%" bgcolor="#FFFFFF"> 
              <div align="right"><b>เบอร์โทรศัพท์ติดต่อสะดวก :</b></div>
            </td>
            <td colspan="3"> 
              <input type="text" name="Ctel1" value="<?echo $row[Customer_Tel1]?>">
            </td>
          </tr>
          <tr> 
            <td width="34%" bgcolor="#FFFFFF"> 
              <div align="right"><b>เบอร์โทรศัพท์บ้าน :</b></div>
            </td>
            <td colspan="3"> 
              <input type="text" name="Ctel2" value="<?echo $row[Customer_Tel2]?>">
            </td>
          </tr>
          <tr> 
            <td width="34%" bgcolor="#FFFFFF"> 
              <div align="right"><b>Agent Username :</b></div>
            </td>
            <td colspan="3"> 
              <select name="Ausername" >
                <option selected><?echo $row[Agent_Username]?></option>
				<?
				global $conn;
				Conn2DB();
				$sql = "select * from agent ";
				$result =mysql_query($sql,$conn);
				while ($row=mysql_fetch_array($result))
				{
				echo"<option >$row[Agent_Username]</option>";
				}
				?>
              </select>
            </td>
          </tr>
        </table>
        <table width="100%" border="0">
          <tr> 
            <td> 
              <div align="center"> 
                <input type="submit" name="update" value="Update">
					<input type="submit" name="del" value="Del">
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
