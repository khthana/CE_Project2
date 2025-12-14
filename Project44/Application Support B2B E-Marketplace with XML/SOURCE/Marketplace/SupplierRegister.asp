<html>
<head>
<title>Register Application form</title>



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

<body background="images/bg17.jpg"  onload=" document.form1.fBizName.focus()">
<font face="MS Sans Serif, Microsoft Sans Serif"> 
<script language="JavaScript">
<!--
	function Check(object){
		

			  if  (document.form1.fBizName.value=="") 
			  {
				
				alert("กรุณาใส่ชื่อธุรกิจ");
				document.form1.fBizName.focus();
				return false;
				}		
			else	if  (document.form1.fName.value=="")
				 {
				alert("กรุณาใส่ชื่อผู้ติดต่อ");
		 		document.form1.fName.focus();
				return false;
				}
			else	if  (document.form1.fDepartment.value=="")
				 {
				alert("กรุณาเลือกแผนกในหน่วยงานของผู้ติดต่อ");
		 		document.form1.fDepartment.focus();
				return false;
				}
			else	if  (document.form1.fPosition.value=="")
				 {
				alert("กรุณาเลือกตำแหน่งของผู้ติดต่อ");
		 		document.form1.fPosition.focus();
				return false;
				}
			else	if  (document.form1.fAddress.value=="")
				 {
				alert("กรุณาใส่ที่อยู่ของธุรกิจ");
		 		document.form1.fAddress.focus();
				return false;
				}	
			else	if  (document.form1.fZip.value=="")
				 {
				alert("กรุณาใส่รหัสไปรษณีย์ของที่ตั้งธุรกิจ")
		 		document.form1.fZip.focus();
				return false;
				}
				else	if  (document.form1.fCountry.value=="")
				 {
				alert("กรุณาเลือกประเทศที่ตั้งธุรกิจ");
		 		document.form1.fCountry.focus();
				return false;
				}
				else	if  ((document.form1.fPhone1.value=="")& (document.form1.fPhone2.value==""))
				 {
				alert("กรุณาใส่เบอร์โทรศัพท์ อย่างน้อย 1 เบอร์");
		 		document.form1.fPhone1.focus();
				return false;
				}
				else	if  ((document.form1.fEmail1.value=="")& (document.form1.fEmail2.value==""))
				 {
				alert("กรุณาใส่ Email  Address ");
		 		document.form1.fEmail1.focus();
				return false;
				}
				else	if  (document.form1.fType.value=="")
				 {
				alert("กรุณาเลือกประเภทของธุรกิจ ");
		 		document.form1.fType.focus();
				return false;
				}
	
				else	if  (document.form1.fEmployee.value=="")
				 {
				alert("กรุณาเลือกจำนวนพนักงานที่มีของธุรกิจ");
		 		document.form1.fEmployee.focus();
				return false;
				}
				else	if  (document.form1.fIncome.value=="")
				 {
				alert("กรุณาเลือกรายได้ต่อปีของธุรกิจ");
		 		document.form1.fIncome.focus();
				return false;
				}
				else	if  (document.form1.fCountry.value=="Thailand")
				 {
							if  (document.form1.fProvince.value==""){
							alert ("กรุณาระบุจังหวัดที่ตั้งของธุรกิจ");
							document.form1.fProvince.focus();
							return false;
							}
							if  (document.form1.fRegion.value==""){
							alert ("กรุณาระบุภาคที่ตั้งของธุรกิจ");
							document.form1.fRegion.focus();
							return false;
							}
								
		 		
				}
				else	if  ((document.form1.Fax.checked==false)&(document.form1.Email.checked==false)&(document.form1.XML.checked)==false)
				 {
				alert("กรุณาเลือกวิธีการติดต่อ");
		 		
				return false;
				}
			
					
			else 	{
	
						return  true;
						  }				
		} 
		

//-->	
</script>
<br>
<br>
</font> <img src="images/SupplierRegistration.gif" width="1003" height="110" usemap="#Map" border="0"> 
<map name="Map">
  <area shape="rect" coords="885,86,979,114" href="home.asp">
</map>
<font face="MS Sans Serif, Microsoft Sans Serif"><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><img src="images/next.gif" width="11" height="11"><img src="images/next.gif" width="11" height="11">ใส่ข้อมูลการลงทะเบียน</b><font face="MS Sans Serif, Microsoft Sans Serif"><font color="#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* 
จำเป็นต้องใส</font></font></font> 
<form name="form1" method="post" action="AddMemberSupplier.asp" enctype="multipart/form-data"  >
  <font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#FF0000"> 
  </font> 
  <table width="790" border="0" name="FormBuyerReg">
    <tr> 
      <td width="59" height="2">&nbsp;</td>
      <td width="190" height="2"><font face="MS Sans Serif, Microsoft Sans Serif"><b>Bussiness 
        Name<font color="#FF0000">*</font></b></font></td>
      <td width="527" height="40"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        <input type="text" name="fBizName" size="30">
        </font></td>
    </tr>
    <tr> 
      <td width="59" height="30">&nbsp;</td>
      <td width="190" height="30"><font face="MS Sans Serif, Microsoft Sans Serif"><b>Contact 
        Person<font color="#FF0000">*</font></b></font></td>
      <td width="527" height="40"> 
        <p><font face="MS Sans Serif, Microsoft Sans Serif"> 
          <input type="radio" name="fTitle" value="Mr" checked>
          Mr. 
          <input type="radio" name="fTitle" value="Ms">
          Ms. &nbsp;<font size="-1">Name</font> 
          <input type="text" name="fName" size="21">
          </font></p>
      </td>
    </tr>
    <tr> 
      <td width="59" height="6">&nbsp;</td>
      <td width="190" height="6"><font face="MS Sans Serif, Microsoft Sans Serif"><b>Department<font color="#FF0000">*</font></b></font></td>
      <td width="527" height="40"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        <select name=fDepartment>
          <option selected 
        value="">------------Please Select-----------</option>
          <option 
        value=Marketing>Marketing</option>
          <option value=Sales>Sales</option>
          <option value=Logistic>Logistic</option>
          <option 
        value=Controller>Controller</option>
          <option 
        value=Technical>Technical</option>
        </select>
        </font></td>
    </tr>
    <tr> 
      <td width="59" height="6">&nbsp;</td>
      <td width="190" height="6"><font face="MS Sans Serif, Microsoft Sans Serif"><b>Position/Function<font color="#FF0000">*</font></b></font></td>
      <td width="527" height="40"> <font face="MS Sans Serif, Microsoft Sans Serif"> 
        <select name=fPosition>
          <option selected 
        value="">------------Please Select-----------</option>
          <option 
        value="Vice President of Marketing">Vice President of Marketing</option>
          <option value="Marketing Manager">Marketing Manager</option>
          <option 
        value="Maketing Reserch Director">Maketing Reserch Director</option>
          <option value="Maketing Officer">Maketing Officer</option>
          <option 
        value="Sales Executive">Sales Executive</option>
          <option 
        value="Sales Manager">Sales Manager</option>
          <option 
        value="Product Manager">Product Manager</option>
          <option 
        value="Supply Chain Manager">Supply Chain Manager</option>
          <option 
        value="Advertising Manager">Advertising Manager</option>
          <option 
        value="Distribution Manager">Distribution Manager</option>
          <option 
        value="Export Manager">Export Manager</option>
          <option 
        value="General Manager">General Manager</option>
          <option 
        value="Accout Executives">Accout Executives</option>
          <option 
        value="Logistic Manager">Logistic Manager</option>
          <option 
        value=Controller>Controller</option>
        </select>
        </font></td>
    </tr>
    <tr> 
      <td width="59" height="6">&nbsp;</td>
      <td width="190" height="6"> 
        <p><font face="MS Sans Serif, Microsoft Sans Serif"><b>Bussiness Address<font color="#FF0000">*</font></b></font></p>
      </td>
      <td width="527" height="40"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        <textarea name="fAddress" cols="30"></textarea>
        </font></td>
    </tr>
    <tr> 
      <td width="59">&nbsp;</td>
      <td width="190"><font face="MS Sans Serif, Microsoft Sans Serif"><b>Postal 
        Code<font color="#FF0000">*</font></b></font></td>
      <td width="527" height="40"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        <input type="text" name="fZip" size="12">
        </font></td>
    </tr>
    <tr> 
      <td width="59">&nbsp;</td>
      <td width="190"><font face="MS Sans Serif, Microsoft Sans Serif"><b>Country<font color="#FF0000">*</font></b></font></td>
      <td width="527" height="40"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        <select name=fCountry   size=1>
          <option selected>---------------Select1--------------</option>
          <option value=Thailand>Thailand</option>
          <option value=USA>USA</option>
          <option value=Others>OTHERS</option>
        </select>
        </font></td>
    </tr>
    <tr> 
      <td width="59">&nbsp;</td>
      <td width="190"><font face="MS Sans Serif, Microsoft Sans Serif"><b>Region</b> 
        <font size="-1">(in Thailand)</font></font></td>
      <td width="527" height="40"> <font face="MS Sans Serif, Microsoft Sans Serif"> 
        <select name="fRegion" >
          <option><font face="MS Sans Serif, Microsoft Sans Serif">---------------Select2--------------</font></option>
          <option value="C">Center Part</option>
          <option value="N">Northen Part</option>
          <option value="E">Eastern Part</option>
          <option value="W">Western Part</option>
          <option value="S">Southen Part</option>
          <option value="A">North-Eastern Part</option>
        </select>
        </font></td>
    </tr>
    <tr> 
      <td width="59">&nbsp;</td>
      <td width="190"><font face="MS Sans Serif, Microsoft Sans Serif"><b>Province 
        </b><font size="-1">(in Thailand)</font></font></td>
      <td width="527" height="40"> <font face="MS Sans Serif, Microsoft Sans Serif">
        <select name="fProvince">
          <option><font face="MS Sans Serif, Microsoft Sans Serif">---------------Select3--------------</font></option>
          <option value="41"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">กรุงเทพมหานคร</font></option>
          <option value="61"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">กระบี่</font></option>
          <option value="37"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">กาญจนบุรี</font></option>
          <option value="10"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">กาฬสินธ์</font></option>
          <option value="57"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">กำแพงเพชร</font></option>
          <option value="11"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">ขอนแก่น</font></option>
          <option value="33"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">จันทรบุรี</font></option>
          <option value="30"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">ฉะเชิงเทรา</font></option>
          <option value="32"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">ชลบุรี</font></option>
          <option value="42"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">ชัยนาท</font></option>
          <option value="12"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">ชัยภูมิ</font></option>
          <option value="62"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">ชุมพร</font></option>
          <option value="4"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">เชียงราย</font></option>
          <option value="3"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">เชียงใหม่</font></option>
          <option value="63"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">ตรัง</font></option>
          <option value="34"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">ตราด</font></option>
          <option value="36"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">ตาก</font></option>
          <option value="43"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">นครนายก</font></option>
          <option value="44"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">นครปฐม</font></option>
          <option value="13"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">นครพนม</font></option>
          <option value="14"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">นครราชสีมา</font></option>
          <option value="64"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">นครศรีธรรมราช</font></option>
          <option value="59"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">นครสวรรค์</font></option>
          <option value="45"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">นนทบุรี</font></option>
          <option value="65"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">นราธิวาส</font></option>
          <option value="1"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">น่าน</font></option>
          <option value="15"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">บุรีรัมย์</font></option>
          <option value="46"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">ปทุมธานี</font></option>
          <option value="40"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">ประจวบคีรีขันธ์</font></option>
          <option value="29"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">ปราจีนบุรี</font></option>
          <option value="66"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">ปัตตานี</font></option>
          <option value="47"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">พระนครศรีอยุธยา</font></option>
          <option value="2"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">พะเยา</font></option>
          <option value="67"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">พังงา</font></option>
          <option value="68"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">พัทลุง</font></option>
          <option value="58"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">พิจิตร</font></option>
          <option value="56"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">พิษณุโลก</font></option>
          <option value="39"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">เพชรบุรี</font></option>
          <option value="50"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">เพชรบูรณ์</font></option>
          <option value="5"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">แพร่</font></option>
          <option value="69"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">ภูเก็ต</font></option>
          <option value="19"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">มหาสารคาม</font></option>
          <option value="20"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">มุกดาหาร</font></option>
          <option value="6"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">แม่ฮ่องสอน</font></option>
          <option value="176"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">ยโสธร</font></option>
          <option value="71"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">ยะลา</font></option>
          <option value="18"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">ร้อยเอ็ด</font></option>
          <option value="70"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">ระนอง</font></option>
          <option value="76"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">ระยอง</font></option>
          <option value="38"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">ราชบุรี</font></option>
          <option value="48"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">ลพบุรี</font></option>
          <option value="7"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">ลำปาง</font></option>
          <option value="8"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">ลำพูน</font></option>
          <option value="21"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">เลย</font></option>
          <option value="24"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">ศรีสะเกษ</font></option>
          <option value="27"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">สกลนคร</font></option>
          <option value="72"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">สงขลา</font></option>
          <option value="73"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">สตูล</font></option>
          <option value="49"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">สมุทรปราการ</font></option>
          <option value="51"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">สมุทรสงคราม</font></option>
          <option value="52"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">สมุทรสาคร</font></option>
          <option value="31"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">สระแก้ว</font></option>
          <option value="53"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">สระบุรี</font></option>
          <option value="54"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">สิงห์บุรี</font></option>
          <option value="60"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">สุโขทัย</font></option>
          <option value="55"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">สุพรรณบุรี</font></option>
          <option value="74"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">สุราษฏร์ธานี</font></option>
          <option value="28"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">สุรินทร์</font></option>
          <option value="22"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">หนองคาย</font></option>
          <option value="23"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">หนองบัวลำภู</font></option>
          <option value="35"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">อ่างทอง</font></option>
          <option value="16"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">อำนาจเจริญ</font></option>
          <option value="25"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">อุดรธานี</font></option>
          <option value="9"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">อุตรดิตถ์</font></option>
          <option value="75"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">อุทัยธานี</font></option>
          <option value="26"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">อบุลราชธานี</font></option>
        </select>
        </font></td>
    </tr>
    <tr> 
      <td width="59">&nbsp;</td>
      <td width="190"><font face="MS Sans Serif, Microsoft Sans Serif"><b>Phone<font color="#FF0000">*</font></b></font></td>
      <td width="527" height="40"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        <input type="text" name="fPhone1" size="12">
        , 
        <input type="text" name="fPhone2" size="12">
        </font></td>
    </tr>
    <tr> 
      <td width="59">&nbsp;</td>
      <td width="190"><font face="MS Sans Serif, Microsoft Sans Serif"><b>Fax</b></font></td>
      <td width="527" height="40"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        <input type="text" name="fFax1" size="12" value=" ">
        , 
        <input type="text" name="fFax2" size="12">
        </font></td>
    </tr>
    <tr> 
      <td width="59" height="28">&nbsp;</td>
      <td width="190" height="28"><font face="MS Sans Serif, Microsoft Sans Serif"><b>Email<font color="#FF0000">*</font></b></font></td>
      <td width="527" height="40"> <font face="MS Sans Serif, Microsoft Sans Serif"> 
        <input type="text" name="fEmail1" size="25">
        <font face="MS Sans Serif, Microsoft Sans Serif"> , 
        <input type="text" name="fEmail2" size="25">
        </font><br>
        <font size="-1" color="#FF0000">(Please make sure your email address is 
        correct.)</font></font> </td>
    </tr>
    <tr> 
      <td width="59" height="28">&nbsp;</td>
      <td width="190" height="28"><font face="MS Sans Serif, Microsoft Sans Serif"><b>ประเภทของธุรกิจ<font color="#FF0000">*</font></b></font></td>
      <td width="527" height="40"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        <select name=fType>
          <option selected 
        value="">------------Please Select-----------</option>
          <option 
        value="Store Retailing">Store Retailing</option>
          <option 
        value="Non Store Retailing">Non Store Retailing</option>
          <option 
        value="Retailing Organizations">Retailing Organizations</option>
          <option 
        value=Wholesaler>Wholesaler</option>
          <option 
        value=Distributors>Distributors</option>
          <option 
        value=Brokers>Brokers</option>
          <option value=Agents>Agents</option>
          <option value=Vendor>Vendor</option>
          <option 
        value=Warehousing>Warehousing</option>
        </select>
        </font></td>
    </tr>
    <tr> 
      <td width="59" height="93">&nbsp;</td>
      <td height="93" width="190"><font face="MS Sans Serif, Microsoft Sans Serif"><b>หลักฐานทางธุรกิจ<font color="#FF0000">*</font><font size="-1"><br>
        </font></b><font size="-1">( อย่างน้อย 1)</font></font></td>
      <td height="93" width="527"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        <input type="file" name="fEvidance1" size="30">
        <font size="-1">Attach File 1</font></font> <font face="MS Sans Serif, Microsoft Sans Serif"><br>
        <input type="file" name="fEvidance2" size="30">
        <font size="-1">Attach File 2</font></font></td>
    </tr>
    <tr> 
      <td width="59" height="31">&nbsp;</td>
      <td width="190" height="31"><font face="MS Sans Serif, Microsoft Sans Serif"><b>จำนวนพนักงาน<font color="#FF0000">*</font></b></font></td>
      <td width="527" height="31"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        <select name=fEmployee>
          <option selected 
        value=""><font face="MS Sans Serif, Microsoft Sans Serif">------------Please 
          Select-----------</font></option>
          <option 
        value="Less than 5 People&#13;"><font face="MS Sans Serif, Microsoft Sans Serif">Less 
          than 5 People</font></option>
          <option 
        value="5 - 10 People&#13;"><font face="MS Sans Serif, Microsoft Sans Serif">5 
          - 10 People</font></option>
          <option 
        value="11 - 50 People"><font face="MS Sans Serif, Microsoft Sans Serif">11 
          - 50 People</font></option>
          <option 
        value="51 - 100 People"><font face="MS Sans Serif, Microsoft Sans Serif">51 
          - 100 People</font></option>
          <option 
        value="101 - 500 People"><font face="MS Sans Serif, Microsoft Sans Serif">101 
          - 500 People</font></option>
          <option 
        value="501 - 1000 People"><font face="MS Sans Serif, Microsoft Sans Serif">501 
          - 1000 People</font></option>
          <option 
        value="Above 1000 People"><font face="MS Sans Serif, Microsoft Sans Serif">Above 
          1000 People</font></option>
        </select>
        </font></td>
    </tr>
    <tr> 
      <td width="59" height="31">&nbsp;</td>
      <td width="190" height="31"><font face="MS Sans Serif, Microsoft Sans Serif"><b>รายได้ต่อปีของธุรกิจ<font color="#FF0000">*</font></b></font></td>
      <td width="527" height="31"> <font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#FF0000"> 
        </font><font face="MS Sans Serif, Microsoft Sans Serif"> 
        <select name=fIncome>
          <option selected 
        value=""><font face="MS Sans Serif, Microsoft Sans Serif">------------Please 
          Select-----------</font></option>
          <option 
        value="Below US$1 Million"><font face="MS Sans Serif, Microsoft Sans Serif">Below 
          US$1 Million</font></option>
          <option 
        value="US$1 Million-US$2.5 Million&#13;"><font face="MS Sans Serif, Microsoft Sans Serif">US$1 
          Million-US$2.5 Million</font></option>
          <option value="US$2.5 Million-US$5 Million"><font face="MS Sans Serif, Microsoft Sans Serif">US$2.5 
          Million-US$5 Million</font></option>
          <option 
        value="US$5 Million-US$10 Million"><font face="MS Sans Serif, Microsoft Sans Serif">US$5 
          Million-US$10 Million</font></option>
          <option value="US$10 Million-US$50 Million"><font face="MS Sans Serif, Microsoft Sans Serif">US$10 
          Million-US$50 Million</font></option>
          <option value="US$50 Million-US$100 Million"><font face="MS Sans Serif, Microsoft Sans Serif">US$50 
          Million-US$100 Million</font></option>
          <option 
        value="Above US$100 Million"><font face="MS Sans Serif, Microsoft Sans Serif">Above 
          US$100 Million</font></option>
        </select>
        </font></td>
    </tr>
    <tr> 
      <td width="59" height="80">&nbsp;</td>
      <td width="190" height="80"> 
        <p><font face="MS Sans Serif, Microsoft Sans Serif"><b>รายละเอียดอื่นๆ<br>
          เกี่ยวกับธุรกิจ </b></font></p>
      </td>
      <td width="527" height="80"> <font face="MS Sans Serif, Microsoft Sans Serif"> 
        <textarea name="fDetail" cols="30"> </textarea>
        </font></td>
    </tr>
    <tr> 
      <td width="59" height="28">&nbsp;</td>
      <td width="190" height="28"><font face="MS Sans Serif, Microsoft Sans Serif"><b><font face="MS Sans Serif, Microsoft Sans Serif"><b>แผนที่</b></font></b></font></td>
      <td width="527" height="40"> <font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#FF0000"> 
        </font><font face="MS Sans Serif, Microsoft Sans Serif"> 
        <input type="file" name="fMap" size="30">
        <font size="-1">Attach File </font></font></td>
    </tr>
    <tr> 
      <td width="59" height="37">&nbsp;</td>
      <td width="190" height="37"><font face="MS Sans Serif, Microsoft Sans Serif"><b><font face="MS Sans Serif, Microsoft Sans Serif"><b>Homepage</b></font></b></font></td>
      <td width="527" height="40"> <font face="MS Sans Serif, Microsoft Sans Serif"> 
        </font><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#FF0000"> 
        <input type="text" name="fURL" value="http://" size="25">
        </font></td>
    </tr>
    <tr> 
      <td width="59" height="6">&nbsp;</td>
      <td width="190" height="6"><font face="MS Sans Serif, Microsoft Sans Serif"><b>วิธีการรับข้อมูล<font color="#FF0000">*</font><br>
        </b> <font size="-1">(เลือกได้มากกว่า1) </font><font color="#FF0000"></font><b><font color="#FF0000"><br>
        </font></b></font></td>
      <td width="527" height="41"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        &nbsp; 
        <input type="checkbox" name="Fax" value="true" readonly>
        Fax &nbsp; &nbsp; 
        <input type="checkbox" name="Email" value="true">
        E-mail &nbsp; &nbsp;&nbsp; 
        <input type="checkbox" name="XML" value="true">
        XML&nbsp;&nbsp;</font></td>
    </tr>
    <tr> 
      <td colspan="3" height="22">&nbsp; </td>
    </tr>
  </table>
  <div align="left">
    <table width="90%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>
          <hr>
          <div align="center">
            <input type="reset" name="Submit2" value="  Reset  "style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 11pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 23px">
            &nbsp;&nbsp; 
            <input type="submit" name="Submit" value=" Submit " style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 11pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 23px" onClick="return Check(this);" >
          </div>
        </td>
      </tr>
    </table>
    <br>
    <br>
    <br>
  </div>
</form>
</body>
</html>
