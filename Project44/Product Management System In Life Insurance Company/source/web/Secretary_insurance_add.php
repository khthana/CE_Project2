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
      <td height="34" width="40" valign="top" align="left" rowspan="2"><img src="Pic/to.gif" width="46" height="28"></td>
      <td height="16" width="250" align="left" valign="top"><!-- #BeginEditable "sub_menu" --><img src="Pic/Pic_Secretary/insurance-policy.gif" width="250" height="28"><!-- #EndEditable --></td>
      <td height="16" align="right" valign="top" width="300"><!-- #BeginEditable "date" --> 
        <div align="right"><?echo ThaiDate()?></div>
        <!-- #EndEditable --></td>
    </tr>
    <tr> 
      <td height="24" colspan="2" align="left" valign="top"> 
        <div align="right"><font color="#003366"><!-- #BeginEditable "name" --><font color="#003366"><b>ยินดีต้อนรับ 
          คุณ<?echo $CK[Login]?></b></font><!-- #EndEditable --></font></div>
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
              <div align="center"> <b><font face="MS Sans Serif, Microsoft Sans Serif" color="#003366"> 
                เพิ่ม กรมธรรม์</font></b></div>
            </td>
          </tr>
          <tr> 
            <td valign="top" align="center" bgcolor="#FFFFFF">&nbsp;</td>
          </tr>
        </table>
        <table width="100%" border="1" bordercolor="#99CCFF">
          <tr> 
            <td> 
              <table width="100%" border="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
                <tr> 
                  <td width="25%"> 
                    <div align="right"><b>กธ.เลขที่ :</b></div>
                  </td>
                  <td width="25%"> 
                    <input type="text" name="textfield40">
                  </td>
                  <td width="30%"> 
                    <div align="right"><b>วันที่ออก กธ. :</b></div>
                  </td>
                  <td width="20%"> 
                    <input type="text" name="textfield41">
                  </td>
                </tr>
                <tr> 
                  <td width="25%"> 
                    <div align="right"><b>แบบประกัน :</b></div>
                  </td>
                  <td width="25%"> 
                    <select name="select">
                      <option>บดทพ-18</option>
                    </select>
                  </td>
                  <td width="30%">&nbsp;</td>
                  <td width="20%">&nbsp;</td>
                </tr>
                <tr> 
                  <td width="25%" height="23"> 
                    <div align="right"><b>วันที่เริ่มสัญญา :</b></div>
                  </td>
                  <td width="25%" height="23"> 
                    <input type="text" name="textfield42">
                  </td>
                  <td width="30%" height="23"> 
                    <div align="right"><b>วันที่สิ้นสุดสัญญา :</b></div>
                  </td>
                  <td width="20%" height="23"> 
                    <input type="text" name="textfield43">
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
        <table width="100%" border="0">
          <tr> 
            <td width="42%"> 
              <div align="right"><b>Username ตัวแทน :</b></div>
            </td>
            <td>
              <select name="select9">
                <option>tyasinee</option>
              </select>
            </td>
          </tr>
          <tr> 
            <td width="42%"> 
              <div align="right"><b>รหัสลูกค้า :</b></div>
            </td>
            <td>
              <input type="text" name="textfield5">
            </td>
          </tr>
        </table>
        <table width="100%" border="1" bgcolor="#FFFFFF" bordercolor="#99CCFF">
          <tr> 
            <td> 
              <table width="100%" border="0">
                <tr bgcolor="#FFFFCC"> 
                  <td width="15%" > 
                    <div align="center"><b>ประเภท</b></div>
                  </td>
                  <td width="23%" > 
                    <div align="center"><b>จำนวนเงินเอาประกัน</b></div>
                  </td>
                  <td width="13%"> 
                    <div align="center"><b>เบี้ยประกัน</b></div>
                  </td>
                  <td width="32%" > 
                    <div align="center"><b>จำนวนปีคุ้มครอง</b></div>
                    <div align="center"></div>
                  </td>
                  <td width="32%" > 
                    <div align="center"></div>
                    <div align="center"><b>จำนวนชำระเบี้ย</b></div>
                  </td>
                  <td width="17%"> 
                    <div align="center"><b>สถานภาพ</b></div>
                  </td>
                </tr>
                <tr> 
                  <td width="15%"> 
                    <div align="center">กรมธรรม์หลัก</div>
                  </td>
                  <td width="23%"> 
                    <div align="center"> 
                      <input type="text" name="textfield">
                    </div>
                  </td>
                  <td width="13%"> 
                    <div align="center"> 
                      <input type="text" name="textfield2">
                    </div>
                  </td>
                  <td width="32%" > 
                    <div align="center"> 
                      <input type="text" name="textfield3">
                    </div>
                  </td>
                  <td width="32%" > 
                    <div align="center"> 
                      <input type="text" name="textfield310">
                    </div>
                  </td>
                  <td width="17%"> 
                    <div align="center"> 
                      <input type="text" name="textfield4">
                    </div>
                  </td>
                </tr>
                <tr> 
                  <td width="15%"> 
                    <div align="center"> 
                      <select name="select2">
                        <option>อ2</option>
                        <option>H&amp;B</option>
                        <option>ส4</option>
                        <option>ส4ปน</option>
                        <option>ผช2</option>
                      </select>
                    </div>
                  </td>
                  <td width="23%"> 
                    <div align="center"> 
                      <input type="text" name="textfield32">
                    </div>
                  </td>
                  <td width="13%"> 
                    <div align="center"> 
                      <input type="text" name="textfield33">
                    </div>
                  </td>
                  <td width="32%" > 
                    <div align="center"> 
                      <input type="text" name="textfield36">
                    </div>
                  </td>
                  <td width="32%" > 
                    <div align="center"> 
                      <input type="text" name="textfield36">
                    </div>
                  </td>
                  <td width="17%"> 
                    <div align="center"> 
                      <input type="text" name="textfield38">
                    </div>
                  </td>
                </tr>
                <tr> 
                  <td width="15%"> 
                    <div align="center"> 
                      <select name="select3">
                        <option>อ2</option>
                        <option>H&amp;B</option>
                        <option>ส4</option>
                        <option>ส4ปน</option>
                        <option>ผช2</option>
                      </select>
                    </div>
                  </td>
                  <td width="23%"> 
                    <div align="center"> 
                      <input type="text" name="textfield34">
                    </div>
                  </td>
                  <td width="13%"> 
                    <div align="center"> 
                      <input type="text" name="textfield35">
                    </div>
                  </td>
                  <td width="32%" > 
                    <div align="center"> 
                      <input type="text" name="textfield37">
                    </div>
                  </td>
                  <td width="32%" > 
                    <div align="center"> 
                      <input type="text" name="textfield37">
                    </div>
                  </td>
                  <td width="17%"> 
                    <div align="center"> 
                      <input type="text" name="textfield39">
                    </div>
                  </td>
                </tr>
                <tr> 
                  <td width="15%"> 
                    <div align="center"> 
                      <select name="select4">
                        <option>อ2</option>
                        <option>H&amp;B</option>
                        <option>ส4</option>
                        <option>ส4ปน</option>
                        <option>ผช2</option>
                      </select>
                    </div>
                  </td>
                  <td width="23%"> 
                    <input type="text" name="textfield6">
                  </td>
                  <td width="13%"> 
                    <input type="text" name="textfield7">
                  </td>
                  <td width="32%" > 
                    <input type="text" name="textfield8">
                  </td>
                  <td width="32%" > 
                    <input type="text" name="textfield8">
                  </td>
                  <td width="17%"> 
                    <input type="text" name="textfield9">
                  </td>
                </tr>
                <tr> 
                  <td width="15%"> 
                    <div align="center"> 
                      <select name="select5">
                        <option>อ2</option>
                        <option>H&amp;B</option>
                        <option>ส4</option>
                        <option>ส4ปน</option>
                        <option>ผช2</option>
                      </select>
                    </div>
                  </td>
                  <td width="23%"> 
                    <input type="text" name="textfield11">
                  </td>
                  <td width="13%"> 
                    <input type="text" name="textfield12">
                  </td>
                  <td width="32%" > 
                    <input type="text" name="textfield13">
                  </td>
                  <td width="32%" > 
                    <input type="text" name="textfield13">
                  </td>
                  <td width="17%"> 
                    <input type="text" name="textfield14">
                  </td>
                </tr>
                <tr> 
                  <td width="15%"> 
                    <div align="center"> 
                      <select name="select6">
                        <option>อ2</option>
                        <option>H&amp;B</option>
                        <option>ส4</option>
                        <option>ส4ปน</option>
                        <option>ผช2</option>
                      </select>
                    </div>
                  </td>
                  <td width="23%"> 
                    <input type="text" name="textfield16">
                  </td>
                  <td width="13%"> 
                    <input type="text" name="textfield17">
                  </td>
                  <td width="32%" > 
                    <input type="text" name="textfield18">
                  </td>
                  <td width="32%" > 
                    <input type="text" name="textfield18">
                  </td>
                  <td width="17%"> 
                    <input type="text" name="textfield19">
                  </td>
                </tr>
                <tr> 
                  <td width="15%"> 
                    <div align="center"> 
                      <select name="select7">
                        <option>อ2</option>
                        <option>H&amp;B</option>
                        <option>ส4</option>
                        <option>ส4ปน</option>
                        <option>ผช2</option>
                      </select>
                    </div>
                  </td>
                  <td width="23%"> 
                    <input type="text" name="textfield21">
                  </td>
                  <td width="13%"> 
                    <input type="text" name="textfield22">
                  </td>
                  <td width="32%" > 
                    <input type="text" name="textfield23">
                  </td>
                  <td width="32%" > 
                    <input type="text" name="textfield23">
                  </td>
                  <td width="17%"> 
                    <input type="text" name="textfield24">
                  </td>
                </tr>
                <tr> 
                  <td width="15%"> 
                    <div align="center"> 
                      <select name="select8">
                        <option>อ2</option>
                        <option>H&amp;B</option>
                        <option>ส4</option>
                        <option>ส4ปน</option>
                        <option>ผช2</option>
                      </select>
                    </div>
                  </td>
                  <td width="23%"> 
                    <input type="text" name="textfield26">
                  </td>
                  <td width="13%"> 
                    <input type="text" name="textfield27">
                  </td>
                  <td width="32%" > 
                    <input type="text" name="textfield28">
                  </td>
                  <td width="32%" > 
                    <input type="text" name="textfield28">
                  </td>
                  <td width="17%"> 
                    <input type="text" name="textfield29">
                  </td>
                </tr>
              </table>
              <table width="100%" border="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
                <tr> 
                  <td> 
                    <div align="center"> 
                      <input type="submit" name="Submit" value="Add">
                    </div>
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
