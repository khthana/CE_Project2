<html>
<head>
<title>THAICATALOG.COM   Thailand's Product Marketplace</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">

<!--body {  margin: 0px  0px; padding: 0px  0px}
a:link { color: #000000; text-decoration: none}
a:visited { color: #000000; text-decoration: none}
a:active { color: #000000; text-decoration: underline}
a:hover { color: #0000ff; text-decoration: underline}
-->
</style>
<script language="JavaScript">
<!--

// -->
</script>
</head>

<body bgcolor="#FFFFFF" background="images/bg17.jpg">
<form name="form1" method="post" action="SignIn.asp">
  <p>&nbsp;</p>
  <img src="images/home.gif" width="1003" height="110" usemap="#Map" border="0"> 
  <table width="853" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td height="8"> 
      <div align="right"><font face="Microsoft Sans Serif" size="-1"><%="วันที่"&Formatdatetime(now,1)&" เวลา"&Formatdatetime(now,4)%></font></div>
    </td>
  </tr>
</table>

  <map name="Map"> 
    <area shape="rect" coords="633,89,705,112" href="register.asp">
	<area shape="rect" coords="739,90,824,116" href="Signout.asp">
    </map>
  <table border="0" cellspacing="0" cellpadding="0" width="854" height="1113">
    <tr> 
      <td height="1113" width="10">&nbsp;</td>
      <td height="1113"> 
        <%
		if Session("Login")<>"login"  then
		%>
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr> 
              <td background="images/Header.gif" height="24" colspan="2"><b><font size="-1" face="Microsoft Sans Serif">&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FFFFFF">LOGIN</font></font></b></td>
            </tr>
            <tr> 
              <td bgcolor="#AEAEFF" height="25" colspan="2"><font size="-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <%
			  if   request.querystring("st")=1 then
		
				 response.write "ข้อมูลการ Login ไม่ถูกต้อง"
				
			  else
			  
			  response.write "ใส่  user name และ password"
		
			  end if  
			  %></font></td>
            </tr>
            <tr> 
              <td bgcolor="#AEAEFF" width="53%" height="30"><b><font face="Microsoft Sans Serif" size="-1">&nbsp;&nbsp;&nbsp;&nbsp;USER 
                NAME</font></b><font color=#ffffff 
                  face="MS Sans Serif, Default Font" size=1><span 
                  class=searchBold><span class=text-col> </span></span></font></td>
              <td bgcolor="#AEAEFF" width="47%" height="30"><font color=#ffffff 
                  face="MS Sans Serif, Default Font" size=1><span 
                  class=searchBold><span class=text-col> 
                
              <input maxlength=32 
                  name=fUser size=10>
                </span></span></font></td>
            </tr>
            <tr> 
              <td bgcolor="#AEAEFF" height="30"><b><font face="Microsoft Sans Serif" size="-1">&nbsp;&nbsp;&nbsp;&nbsp;PASSWORD</font></b><font color=#ffffff 
                  face="MS Sans Serif, Default Font" size=1><span 
                  class=searchBold><span class=text-col> </span></span></font></td>
              <td bgcolor="#AEAEFF" height="30"><font color=#ffffff 
                  face="MS Sans Serif, Default Font" size=1><span 
                  class=searchBold><span class=text-col> 
                
              <input maxlength=32 
                  name=fPassword size=10 type="password">
                </span></span></font></td>
            </tr>
            <tr> 
              <td bgcolor="#AEAEFF" height="30">&nbsp;</td>
              <td bgcolor="#AEAEFF" height="30"><font face="MS Sans Serif, Microsoft Sans Serif"> 
                <input style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 11pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 22px"type="Submit" value="   OK   " 
        name="Submit" >
                </font></td>
            </tr>
            <tr> 
              <td bgcolor="#AEAEFF" height="30" colspan="2">
                
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="993366"><b>Forgot 
                Password&nbsp;&nbsp;&nbsp;&nbsp;<a href="register.asp"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="993366">
				Register</font></a></b></font> 
                <font face="MS Sans Serif, Microsoft Sans Serif"> </font></div>
              </td>
            </tr>
            <tr> 
              <td bgcolor="#AEAEFF" colspan="2"> </td>
            </tr>
          </table>
		  <%
		  else
		  %>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td background="images/Header.gif" height="24"><b><font size="-1" face="Microsoft Sans Serif">&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FFFFFF">WELCOME</font></font></b></td>
          </tr>
          <tr> 
            <td bgcolor="#AEAEFF" height="25"><font size="-1">&nbsp;&nbsp;&nbsp;&nbsp;<br>
              &nbsp;&nbsp;ยินดีต้อนรับ</font></td>
          </tr>
          <tr> 
            <td bgcolor="#AEAEFF" height="41"> <br>
              <table width="80%" border="0" cellspacing="0" cellpadding="0" align="center">
                <tr>
                  <td><font size="-1" face="Microsoft Sans Serif"><%=session("BizName")%><br>
                    <font size="-2">LAST LOGIN&nbsp;<%=formatdatetime(session("LastLog"),2)%></font></font></td>
                </tr>
              </table>
            </td>
          </tr>
          <tr> 
            <td bgcolor="#AEAEFF" height="30"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="993366"><b><a href="Mainmenu.asp"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="993366"><br>
                Main Menu</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="signout.asp"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="993366">Sign 
                out</font></a></b></font></div>
              <br>
            </td>
          </tr>
          <tr> 
            <td bgcolor="#AEAEFF"> </td>
          </tr>
        </table>
		  <%
		  end if
		  %>
          <br>

        <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFAEFD">
          <tr> 
            <td background="images/header2.gif" height="25"><font face="Microsoft Sans Serif" size="-1" color="#FFFFFF"><b>&nbsp;&nbsp;&nbsp;MAIN 
              MENU</b></font></td>
          </tr>
          <tr> 
            <td height="25"><font face="Microsoft Sans Serif" size="-1">&nbsp;&nbsp;&nbsp;<img src="images/next.gif" width="11" height="11"><a href="#">บริการจาก 
              ThaiCatalog.com</a></font></td>
          </tr>
          <tr> 
            <td height="25"><font face="Microsoft Sans Serif" size="-1">&nbsp;&nbsp;&nbsp;<img src="images/next.gif" width="11" height="11"><a href="#">สมาชิกผู้ขาย(Supplier)</a></font></td>
          </tr>
          <tr> 
            <td height="25"><font face="Microsoft Sans Serif" size="-1">&nbsp;&nbsp;&nbsp;<img src="images/next.gif" width="11" height="11"><a href="#">สมาชิกผู้ซื้อ(Buyer)</a></font></td>
          </tr>
          <tr> 
            <td height="25"><font face="Microsoft Sans Serif" size="-1">&nbsp;&nbsp;&nbsp;<img src="images/next.gif" width="11" height="11"><a href="register.asp">สมัครสมาชิก</a></font></td>
          </tr>
          <tr> 
            <td height="25"><font face="Microsoft Sans Serif" size="-1">&nbsp;&nbsp;&nbsp;<img src="images/next.gif" width="11" height="11"><a href="#">สินค้าใน 
              Marketplace</a> </font></td>
          </tr>
          <tr> 
            <td height="25"><font face="Microsoft Sans Serif" size="-1">&nbsp;&nbsp;&nbsp;<img src="images/next.gif" width="11" height="11"><a href="#">การชำระเงิน</a></font></td>
          </tr>
          <tr> 
            <td height="25"><font face="Microsoft Sans Serif" size="-1">&nbsp;&nbsp;&nbsp;<img src="images/next.gif" width="11" height="11"><a href="#">Partner</a></font></td>
          </tr>
          <tr> 
            <td height="25"><font face="Microsoft Sans Serif" size="-1">&nbsp;&nbsp;&nbsp;<img src="images/next.gif" width="11" height="11"><a href="#">ขาวสาร,บทความ</a></font></td>
          </tr>
          <tr> 
            <td height="25"><font face="Microsoft Sans Serif" size="-1">&nbsp;&nbsp;&nbsp;<img src="images/next.gif" width="11" height="11"><a href="#">FAQs</a></font></td>
          </tr>
          <tr> 
            <td height="25"><font face="Microsoft Sans Serif" size="-1">&nbsp;&nbsp;&nbsp;<img src="images/next.gif" width="11" height="11"><a href="#">ติดต่อเรา</a></font></td>
          </tr>
        </table>
        <br>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFAEFD" height="262">
          <tr> 
            <td background="images/header.gif" height="25"><font face="Microsoft Sans Serif" size="-1" color="#FFFFFF"><b>&nbsp;&nbsp;&nbsp;PARTNER</b></font></td>
          </tr>
          <tr> 
            <td height="50" bgcolor="#AEAEFF"> 
              <div align="center"><br>
                <img src="images/FedEx.gif" width="115" height="35"><br>
                <font face="Microsoft Sans Serif" size="-1">Federal Express Corporation</font> 
              </div>
            </td>
          </tr>
          <tr> 
            <td height="50" bgcolor="#AEAEFF"> 
              <div align="center"><font face="Microsoft Sans Serif" size="-1"><br>
                &nbsp;<img src="images/OTOPLogoA.gif" width="107" height="109"><br>
                โครงการ 1 ตำบล 1 ผลิตภัณฑ์</font></div>
            </td>
          </tr>
          <tr> 
            <td height="25" bgcolor="#AEAEFF"> 
              <div align="center"><br>
                <br>
                <img src="images/CAT.gif" width="170" height="30"><br>
                <font size="-1" face="Microsoft Sans Serif">การสื่อสารแห่งประเทศไทย 
                <br>
                </font></div>
            </td>
          </tr>
          <tr> 
            <td height="25" bgcolor="#AEAEFF"> 
              <div align="center"><font face="Microsoft Sans Serif" size="-1"><br>
                <br>
                &nbsp;<img src="images/EcommerceFlip1A.gif" width="150" height="50"><br>
                ไทยตำบล ดอท คอม<br>
                <br>
                </font></div>
            </td>
          </tr>
        </table>
        <b><font color="#FFFFFF"></font></b> <br>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td background="images/Header3.gif" height="25"> 
              <div align="left"><font face="Microsoft Sans Serif" size="-1" color="#FFFFFF"><b>&nbsp;&nbsp;&nbsp;&nbsp;INSTRUCTION</b></font></div>
            </td>
          </tr>
          <tr> 
            <td bgcolor="#FFCC99" height="113"> 
              <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
                <tr> 
                  <td height="105"><font face="Microsoft Sans Serif" size="-1">ราคาสินค้าที่อยู่ใน 
                    Marketplace หรือ รายละเอียด ติดต่อ ของ สมาชิก ที่อยู่ใน <br>
                    Market Place จะปรากฎ ก็ต่อเมื่อ ท่านทำการ Login ด้วย <b>Username</b> 
                    <br>
                    และ<b> Password</b> ที่ถูกต้องของ สมาชิก<br>
                    เท่านั้น</font></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
      <td height="1113" width="22">&nbsp;</td>
      <td height="1113" width="607"> 
        <table width="606" border="0" cellspacing="0" cellpadding="0" height="1102">
          <tr> 
            <td height="128"><img src="images/P_bike.jpg" width="157" height="110">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/P_ship.jpg" width="179" height="110">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/P_MAP.jpg" width="158" height="110"></td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td><img src="images/WELCOME.gif" width="107" height="25"></td>
          </tr>
          <tr> 
            <td> 
              <table width="98%" border="1" cellspacing="0" cellpadding="1" height="67%">
                <tr> 
                  <td bordercolor="#000000" bgcolor="#000099" height="260"> 
                    <table width="97%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="23%" height="143"> 
                          <div align="center"><img src="images/finger.gif" width="99" height="114"></div>
                        </td>
                        <td width="77%" height="143"><font face="Microsoft Sans Serif" size="-1" color="#FFFFFF">&gt;&gt; 
                          ขอต้อนรับเข้าสู่ THAICATALOG.COM<br>
                          <br>
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;บลูเวฟ 
                          อี-เทรด จำกัดคือห้างสรรพสินค้าอุตสาหกรรมเพื่อธุรกิจ 
                          ซื้อขาย แลกเปลี่ยน ผ่านทางระบบอินเตอร์เน็ต บลูเวฟ อี-เทรด 
                          จำกัด คือหนึ่งเดียว ซึ่งมีความพร้อม ที่จะตอบสนอง ต่อความต้องการ 
                          ของภาคอุตสาหกรรม ในทุกขั้นตอน ของการผลิต ทั้งวัตถุดิบเคมี 
                          อะไหล่ซ่อมบำรุง<br>
                          เครื่องจักร พลังงานเชื้อเพลิง สินค้าแปรรูปอิเล็คทรอนิกส์ 
                          และเยื่อกระดาษบรรจุภัณฑ์ ทั้งหมดกว่า 13,700 รายการ<br>
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;บลูเวฟ 
                          อี-เทรด จำกัดพร้อมแล้วที่จะก้าวเข้ามา เป็นผู้ช่วยในการ 
                          ดำเนินธุรกิจ ด้วยความรู้ ความเข้าใจ ในกลไกราคาสินค้าอุตสาหกรรม 
                          และระบบจัดซื้อจัดจำหน่าย แบบธุรกิจ สู่ ธุรกิจ หรือ<br>
                          ที่เราเรียกว่า B2B อย่างแท้จริง ผสานเข้ากับ เทคโนโลยีอันทันสมัย 
                          ซึ่งสามารถช่วยในการ ค้นหา และ เชื่อมโยง ผู้ซื้อ กับผู้ขายเข้าถึงกันได้อย่างรวดเร็ว 
                          และมีประสิทธิภาพ บลูเวฟ อี-เทรด จำกัด จึงสามารถลดงานเอกสาร 
                          และ ความสิ้นเปลือง ในการจัดซื้อ จัดจำหน่าย ได้เพียงแค่ปลายนิ้วสัมผัส</font></td>
                      </tr>
                    </table>
                    
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td><img src="images/Registration.gif" width="107" height="25"></td>
          </tr>
          <tr> 
            <td> 
              <table width="98%" border="1" cellspacing="0" cellpadding="1" height="18%">
                <tr> 
                  <td bordercolor="#000000" bgcolor="#000099" height="158"> 
                    <table width="97%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="23%" height="113"> 
                          <table width="76%" border="0" cellspacing="0" cellpadding="0" align="center">
                            <tr> 
                              <td width="99" height="13" bgcolor="#DF0070"><font color="#FFFFFF" size="-1"><b>&nbsp;ผู้ซื้อ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;258</b></font></td>
                            </tr>
                            <tr> 
                              <td width="99" height="13"><font color="#FFFFFF" size="-1">&nbsp;online&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;12</font></td>
                            </tr>
                            <tr> 
                              <td width="99" height="13"><font color="#FFFFFF" size="-1">&nbsp;offline&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;246</font></td>
                            </tr>
                            <tr> 
                              <td width="99" height="13" bgcolor="#DF0070"><font color="#FFFFFF" size="-1"><b>&nbsp;ผู้ขาย&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;247</b></font></td>
                            </tr>
                            <tr> 
                              <td width="99" height="13"><font color="#FFFFFF" size="-1">&nbsp;online&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                &nbsp;&nbsp;77</font></td>
                            </tr>
                            <tr> 
                              <td width="99" height="13"><font color="#FFFFFF" size="-1">&nbsp;offline&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;170</font></td>
                            </tr>
                          </table>
                        </td>
                        <td width="77%" height="113"><font face="Microsoft Sans Serif" size="-1" color="#FFFFFF">&gt;&gt;สมัครเป็นสมาชิกวันนี้รับสิทธิพิเศษมากมาย<br>
                          <br>
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                          รีบสมัครก่อน 31 พฤษภาคม นี้ ท่านจะได้รับสิทธิ์พิเศษมากมายบลูเวฟ 
                          อี-เทรด จำกัด<br>
                          ขอเรียนเชิญท่านผู้สนใจสมัคร เข้าเป็น สมาชิกกับทางเวบไซต์ 
                          www.bluewaveb2b.com ห้างสรรพสินค้า และศูนย์กลางในแลกเปลี่ยน 
                          ซื้อขายสินค้า อุตสาหกรรม บนอินเตอร์เน็ต รีบสมัครก่อน 
                          31 พฤษภาคม นี้ ท่านจะได้รับสิทธิ์ ยกเว้น ค่าธรรมเนียม 
                          แรกเข้า และไม่เก็บค่าสมาชิก รายเดือน จนถึงสิ้นปี</font></td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td><img src="images/Service.gif" width="107" height="25"></td>
          </tr>
          <tr> 
            <td> 
              <table width="98%" border="1" cellspacing="0" cellpadding="0">
                <tr> 
                  <td height="224" bordercolor="#000000" bgcolor="#000099"> 
                    <table width="97%" border="0" cellspacing="0" cellpadding="0" height="178">
                      <tr> 
                        <td width="23%" height="217"> 
                          <div align="center"><img src="images/Pic1.jpg" width="99" height="66"><br>
                            <br>
                            <img src="images/pic2.jpg" width="99" height="69"> 
                          </div>
                        </td>
                        <td width="77%" height="217"><font face="Microsoft Sans Serif" size="-1" color="#FFFFFF">&gt;&gt; 
                          ดำเนินงานฉับไวด้วยเอกสารอิเล็คทรอนิกส์<br>
                          <br>
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;บลูเวฟ 
                          อี-เทรด จำกัด มุ่งเน้นไปที่การพัฒนาระบบเอกสารของ เว็ป 
                          ให้สอดคล้องกับ ระบบการทำงานเดิม ของบริษัทอุตสาหกรรมไทย 
                          ในทุกขั้นตอน www.bluewaveb2b.com สามารถประมวลผล และ 
                          ตอบสนอง ต่อคำสั่งซื้อของสมาชิก ได้โดยอัตโนมัติจากหน้าเวบ 
                          ในรูปของ eCatalogs, eSale Process, eP/O, eD/O ตามลำดับ 
                          จนเสร็จสิ้นกระบวนการซื้อขาย ได้อย่างแม่นยำ ภายใต้มาตรฐาน 
                          ของการส่งข้อมูล ในแบบ EDI (Electronic Data Interchange)<br>
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;บริการใหม่ล่าสุดของ 
                          www.bluewaveb2b.com อยู่ในส่วนของ พื้นที่ Marketplace 
                          ซึ่งมีชื่อ เวบไซต์ อย่างเป็นทางการว่า marketplace.bluewaveb2b.com 
                          ได้ถูกจัดทำมาเพื่อ เป็นสื่อกลาง ในการรับฝาก และประกาศข้อมูลที่เกี่ยวข้องกับ 
                          ความต้องการซื้อ หรือขายสินค้าอุตสาหกรรม ทุกประเภท รวมไปถึงธุรกิจบริการ 
                          ระหว่างบริษัทถึงบริษัท โดยไม่มีการคิดค่า transactionใดๆทั้งสิ้น 
                          </font> </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr> 
            <td height="24">&nbsp;</td>
          </tr>
          <tr> 
            <td height="126"><img src="images/1.jpg" width="164" height="114">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/P_Chirt.jpg" width="164" height="114">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/P_model.jpg" width="165" height="114"></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p align="center"><br>
    <img src="images/FEDEXPRESS.gif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/stamp.jpg" width="235" height="132"><br>
  </p>
  <hr>
  <div align="center"><font face="Microsoft Sans Serif" size="-1">Copyright 2000-2002 
    Thai Catalod.com. All Rights Reserved.</font><br>
    <br>
    <br>
  </div>
</form>
</body>
</html>
