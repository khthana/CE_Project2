<html>
<head>
<title>ลงทะเบียนอาจารย์</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<script language = "javaScript">
   function check_blank() {
   		var user = document.addstu.user.value.length;
		//var pw = document.addstu.pw.value.length;
	
	 	 if(document.addstu.fname.value==''){
			alert('กรุณากรอกชื่อจริง');
			document.addstu.fname.focus();
			return false;
		 }
	 	 if(document.addstu.lname.value==''){
			alert('กรุณากรอกนามสกุล');
			document.addstu.lname.focus();
			return false;
		 }
		if(document.addstu.branch.value==''){
			alert('กรุณากรอก สาขาวิชาที่จบ');
			document.addstu.branch.focus();
			return false;
		}
	 	 if(document.addstu.addr.value==''){
			alert('กรุณากรอกที่อยู่');
			document.addstu.addr.focus();
			return false;
		 }
	  	 if(document.addstu.city.value==''){
			alert('กรุณากรอกอำเภอ / เขต');
			document.addstu.city.focus();
			return false;
		 }
		 if(document.addstu.zip.value==''){
			alert('กรุณากรอกรหัสไปรษณีย์');
			document.addstu.zip.focus();
			return false;
		 }
		if(document.addstu.mail.value==''){
			alert('กรุณากรอก e-mail address');
			document.addstu.mail.focus();
			return false;
	 }
	 	if(document.addstu.user.value==''){
			alert('กรุณากรอก username');
			document.addstu.user.focus();
			return false;
		}
	/*	if(document.addstu.pw.value==''){
			alert('กรุณากรอก password');
			document.addstu.pw.focus();
			return false;
		}
		if(document.addstu.cpwd.value==''){
			alert('กรุณากรอกยืนยัน passsword');
			document.addstu.cpwd.focus();
			return false;
		}
//	 if(trim(document.addstu.password.value)!=trim(document.addstu.cpwd.value)){
		if(document.addstu.pw.value!=document.addstu.cpwd.value){
			 alert ('password ไม่ตรงกับ comfirm password ');
			 return false;
	 }*/
	 	//if (!validLength(user, 4, 12)){
		if( user< 4  || user > 12) {
		alert("ความยาว username ต้องมีความยาว 4-12 ตัวอักษร");
		document.addstu.user.focus();
		return false;
	}
/*
		if( pw < 4  || pw > 12) {
		alert("ความยาว password ต้องมีความยาว 4-12 ตัวอักษร");
		document.addstu.pw.focus();
		return false;
	}*/
	if(document.addstu.ask.value==''){
			alert('กรุณากรอกคำถาม');
			document.addstu.ask.focus();
			return false;
	}
	if(document.addstu.ans.value==''){
			alert('กรุณากรอกคำตอบ');
			document.addstu.ans.focus();
			return false;
	}	
	 if(!filetype()){
	 	return false;
	 }

  }
  	function filetype(){
		var filename = addstu.stu_pic.value;
		var ext = "",position,num;
		if(filename!=""){
			position = filename.lastIndexOf('.');
			num = filename.length;	
			ext = filename.substring(position,num);
			if(!((ext==".gif")||((ext==".jpg")||(ext==".jpeg")))){
				alert("ท่านไม่สามารถส่งไฟล์" + ext + " ได้  \n กรุณาส่งไฟล์นามสกุล  .jpg,.jpeg or gif เท่านั้น");
				document.addstu.stu_pic.focus();
				return false;
			}
			else
				return true;	
		}
		else
			return true;	
	}
/*
  	function openfile(se_file){
			var window_open = null;
		     window_open =  window.open("http://www.ram.edu/select_file.php","mine","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,left=100,top=10,width=430,height=500");
		      window_open.focus();
		      window_open.opener = self;
		      return window_open;
	}
 function remove_picture () {
	   addnew.pic.src = 'images/no_pic.gif';
   }
   /*
  function gener_password(){
  	document.addnew.gen_pass.value=1;
	document.addnew.action= "http://www.ram.edu/admin_account_add.php";
	document.addnew.method = "post";
	document.addnew.target = "_self";
	document.addnew.submit();  	
  }*/
  
</script>
</head>
<body bgcolor="white">
<form name="addstu" enctype = "multipart/form-data" method = "post" action = "InsMember.php  " onsubmit = "return check_blank()">
  <table cellspacing="0" cellpadding="0" border="0" class="text" width="540" >
    <tr> 
      <td width="562" class="title">สมัครสมาชิกอาจารย์</td>
    </tr>
    <tr> 
      <td bgcolor="black" height="1" width="562"></td>
    </tr>
    <tr> 
      <td width="562"> <font color="red">*</font> กรุณากรอกข้อมูลให้ครบด้วย</td>
    </tr>
    <tr> 
      <!-- Sign-Up Information -->
      <td width="562"> <table width="100%" cellpadding="0" cellspacing="0" border="0">
          <tr> 
            <td width="252">&nbsp; </td>
            <td width="296"> <div align="right"> 
                <input type="submit" value="ลงทะเบียน"  class="button">
                <input type="reset" name="Reset22" value="ยกเลิก" class="button">
                <input type="button" value="ปิด" onClick = "window.close();" name="button22" class="button">
              </div></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td width="562"> <table border="0" cellspacing="0" cellpadding="0" class="header">
          <tr> 
            <td align="left" valign="top" bgcolor="#869DB9"><img src="Picture/cn_drk_lt.gif" width="11" height="19"></td>
            <td bgcolor="#869DB9"><b> ข้อมูลส่วนตัว</b></td>
            <td bgcolor="#869DB9">&nbsp;</td>
            <td align="right" valign="top" bgcolor="#869DB9"><img src="Picture/cn_drk_rt.gif" width="11" height="19"></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td width="562" bgcolor="#869DB9"> <table width="100%" border="0" cellspacing="1" cellpadding="4" class="text">
          <tr bgcolor="#E9E9E9" align="left"> 
            <td bgcolor="#FAF7EA"> <table class="text" width="100%" border="0" cellspacing="1" cellpadding="4">
                <tr> 
                  <!-- Name -->
                  <td width="28%"><div align="right"><b> ชื่อจริง <font color="red">*</font></b></div></td>
                  <td width="72%"> <input type="text" name="fname" maxlength="50" size="25" value="" class="text"> 
                  </td>
                </tr>
                <tr> 
                  <!-- Last Name -->
                  <td height="36" width="28%"><div align="right"><b> นามสกุล <font color="red">*</font></b></div></td>
                  <td height="36" width="72%"> <input type="text" name="lname" maxlength="50" size="25" value="" class="text"> 
                  </td>
                </tr>
                <tr> 
                  <!-- Sex -->
                  <td width="28%"><div align="right"><b> เพศ</b></div></td>
                  <td width="72%"> <input type="radio" name="sex" value="ชาย" checked>
                    ชาย&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="sex" value="หญิง">
                    หญิง </td>
                </tr>
                <tr> 
                  <!-- Birthday -->
                  <td width="28%"><div align="right"><b> วันเกิด</b></div></td>
                  <td width="72%"> <select name="date">
                      <option value="1" > 1 </option>
                      <option value="2" > 2 </option>
                      <option value="3" > 3 </option>
                      <option value="4" > 4 </option>
                      <option value="5" > 5 </option>
                      <option value="6" > 6 </option>
                      <option value="7" > 7 </option>
                      <option value="8" > 8 </option>
                      <option value="9" > 9 </option>
                      <option value="10" > 10 </option>
                      <option value="11" > 11 </option>
                      <option value="12" > 12 </option>
                      <option value="13" > 13 </option>
                      <option value="14" > 14 </option>
                      <option value="15" > 15 </option>
                      <option value="16" > 16 </option>
                      <option value="17" > 17 </option>
                      <option value="18" > 18 </option>
                      <option value="19" > 19 </option>
                      <option value="20" > 20 </option>
                      <option value="21" > 21 </option>
                      <option value="22" > 22 </option>
                      <option value="23" > 23 </option>
                      <option value="24" > 24 </option>
                      <option value="25" > 25 </option>
                      <option value="26" > 26 </option>
                      <option value="27" > 27 </option>
                      <option value="28" > 28 </option>
                      <option value="29" > 29 </option>
                      <option value="30" > 30 </option>
                      <option value="31" > 31 </option>
                    </select> <select name="month">
                      <option value="1">มกราคม</option>
                      <option value="2">กุมภาพันธ์</option>
                      <option value="3">มีนาคม</option>
                      <option value="4">เมษายน</option>
                      <option value="5">พฤษภาคม</option>
                      <option value="6">มิถุนายน</option>
                      <option value="7">กรกฎาคม</option>
                      <option value="8">สิงหาคม</option>
                      <option value="9">กันยายน</option>
                      <option value="10">ตุลาคม</option>
                      <option value="11">พฤศจิกายน</option>
                      <option value="12">ธันวาคม</option>
                    </select> <select name="year">
                      <option value="1957" > 2500 </option>
                      <option value="1958" > 2501 </option>
                      <option value="1959" > 2502 </option>
                      <option value="1960" > 2503 </option>
                      <option value="1961" > 2504 </option>
                      <option value="1962" > 2505 </option>
                      <option value="1963" > 2506 </option>
                      <option value="1964" > 2507 </option>
                      <option value="1965" > 2508 </option>
                      <option value="1966" > 2509 </option>
                      <option value="1967" > 2510 </option>
                      <option value="1968" > 2511 </option>
                      <option value="1969" > 2512 </option>
                      <option value="1970" > 2513 </option>
                      <option value="1971" > 2514 </option>
                      <option value="1972" > 2515 </option>
                      <option value="1973" > 2516 </option>
                      <option value="1974" > 2517 </option>
                      <option value="1975" > 2518 </option>
                      <option value="1976" > 2519 </option>
                      <option value="1977" > 2520 </option>
                      <option value="1978" > 2521 </option>
                      <option value="1979" > 2522 </option>
                      <option value="1980" > 2523 </option>
                      <option value="1981" > 2524 </option>
                      <option value="1982" > 2525 </option>
                      <option value="1983" > 2526 </option>
                      <option value="1984" > 2527 </option>
                      <option value="1985" > 2528 </option>
                      <option value="1986" > 2529 </option>
                      <option value="1987" > 2530 </option>
                      <option value="1988" > 2531 </option>
                      <option value="1989" > 2532 </option>
                      <option value="1990" > 2533 </option>
                      <option value="1991" > 2534 </option>
                      <option value="1992" > 2535 </option>
                      <option value="1993" > 2536 </option>
                      <option value="1994" > 2537 </option>
                      <option value="1995" > 2538 </option>
                      <option value="1996" > 2539 </option>
                      <option value="1997" > 2540 </option>
                      <option value="1998" > 2541 </option>
                      <option value="1999" > 2542 </option>
                      <option value="2000" > 2543 </option>
                      <option value="2001" > 2544 </option>
                      <option value="2002" > 2545 </option>
                    </select> </td>
                </tr>
                <tr> 
                  <td><div align="right"><b>ระดับการศึกษา <font color="red">*</font></b></div></td>
                  <td><select name="edu">
                      <option value="อนุปริญญา">อนุปริญญา</option>
                      <option value="ปริญญาตรี">ปริญญาตรี</option>
                      <option value="ปริญญาโท">ปริญญาโท</option>
                      <option value="ปริญญาเอก">ปริญญาเอก</option>
                    </select></td>
                </tr>
                <tr> 
                  <td><div align="right"><strong>สาขาวิชาที่จบ<font color="#FF0000"> 
                      *</font></strong></div></td>
                  <td><input type="text" name="branch"></td>
                </tr>
                <tr> 
                  <td width="28%"> <div align="right"><b> รูป</b> (gif or jpeg 
                      file)</div></td>
                  <td width="72%"> <input type = "file" name = "stu_pic"> </td>
                </tr>
                <tr> 
                  <td><div align="right"><b>หมายเลข ICQ</b></div></td>
                  <td><input name="icq" type="text" size="15" maxlength="15"  class = "text" value = ""></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td> <table border="0" cellspacing="0" cellpadding="0" class="header">
          <tr> 
            <td align="left" valign="top" bgcolor="#869DB9"><img src="Picture/cn_drk_lt.gif" width="11" height="19"></td>
            <td bgcolor="#869DB9"><b> ข้อมูลประสบการณ์</b></td>
            <td bgcolor="#869DB9">&nbsp;</td>
            <td align="right" valign="top" bgcolor="#869DB9"><img src="Picture/cn_drk_rt.gif" width="11" height="19"></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td width="562" bgcolor="#869DB9"> <table width="100%" border="0" cellspacing="1" cellpadding="4" class="text">
          <tr bgcolor="#E9E9E9" align="left"> 
            <td bgcolor="#FAF7EA"> <table class="text" width="100%" border="0" cellspacing="1" cellpadding="4">
                <tr> 
                  <!-- teach -->
                  <td width="150" valign="top"><div align="right"><b> ประวัติการสอน 
                      </b></div></td>
                  <td width="390"> <textarea name="teach" cols="50" rows="3" class="text"></textarea> 
                  </td>
                </tr>
                <tr> 
                  <!-- train-->
                  <td valign="top"><div align="right"><b> ประวัติการอบรม </b></div></td>
                  <td><textarea name="train" cols="50" rows="2"></textarea> 
                  </td>
                </tr>
                <tr>
				<!-- work-->
                  <td  valign="top"><div align="right"><strong>ประวัติการทำงาน 
                      </strong></div></td>
                  <td><textarea name="work" cols="50" rows="2"></textarea></td>
                </tr>
                <tr> 
                  <!-- workshop -->
                  <td  valign="top"><div align="right"><b> ประวัติการดูงาน </b></div></td>
                  <td><textarea name="workshop" cols="50"  rows="2"></textarea> 
                  </td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td width="562">&nbsp;</td>
    </tr>
    <tr> 
      <td width="562"> <table border="0" cellspacing="0" cellpadding="0" class="header">
          <tr> 
            <td align="left" valign="top" bgcolor="#869DB9"><img src="Picture/cn_drk_lt.gif" width="11" height="19"></td>
            <td bgcolor="#869DB9"><b> ข้อมูลสำหรับติดต่อ </b></td>
            <td bgcolor="#869DB9">&nbsp;</td>
            <td align="right" valign="top" bgcolor="#869DB9"><img src="Picture/cn_drk_rt.gif" width="11" height="19"></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td width="562" bgcolor="#869DB9"> <table width="100%" border="0" cellspacing="1" cellpadding="4" class="text">
          <tr bgcolor="#E9E9E9" align="left"> 
            <td bgcolor="#FAF7EA"> <table class="text" width="100%" border="0" cellspacing="1" cellpadding="4">
                <tr> 
                  <!-- Address -->
                  <td width="150" valign="top"><div align="right"><b> ที่อยู่ 
                      <font color="red">*</font></b></div></td>
                  <td width="390"> <textarea name="addr" cols="40" rows="3" class="text"></textarea> 
                  </td>
                </tr>
                <tr> 
                  <!-- City -->
                  <td><div align="right"><b> อำเภอ <font color="red">*</font></b></div></td>
                  <td> <input type="text" name="city" maxlength="40" size="25" value="" class="text"> 
                  </td>
                </tr>
                <tr> 
                  <!-- State (Province) -->
                  <td><div align="right"><b> จังหวัด <font color="red">*</font></b></div></td>
                  <td> <select name="state" size="1" id="state">
                      <option value="กรุงเทพฯ">กรุงเทพมหานคร</option>
                      <option value="กระบี่">กระบี่</option>
                      <option value="กาญจนบุรี">กาญจนบุรี</option>
                      <option value="กาฬสินธุ์">กาฬสินธุ์</option>
                      <option value="กำแพงเพชร">กำแพงเพชร</option>
                      <option value="ขอนแก่น">ขอนแก่น</option>
                      <option value="จันทบุรี">จันทบุรี</option>
                      <option value="ฉะเชิงเทรา">ฉะเชิงเทรา</option>
                      <option value="ชลบุรี">ชลบุรี</option>
                      <option value="ชัยนาท">ชัยนาท</option>
                      <option value="ชัยภูมิ">ชัยภูมิ</option>
                      <option value="ชุมพร">ชุมพร</option>
                      <option value="เชียงราย">เชียงราย</option>
                      <option value="เชียงใหม่">เชียงใหม่</option>
                      <option value="ตรัง">ตรัง</option>
                      <option value="ตราด">ตราด</option>
                      <option value="ตาก">ตาก</option>
                      <option value="นครนายก">นครนายก</option>
                      <option value="นครปฐม">นครปฐม</option>
                      <option value="นครพนม">นครพนม</option>
                      <option value="นครราชสีมา">นครราชสีมา</option>
                      <option value="นครศรีธรรมราช">นครศรีธรรมราช</option>
                      <option value="นครสวรรค์">นครสวรรค์</option>
                      <option value="นนทบุรี">นนทบุรี</option>
                      <option value="นราธิวาส">นราธิวาส</option>
                      <option value="น่าน">น่าน</option>
                      <option value="บุรีรัมย์">บุรีรัมย์</option>
                      <option value="ปทุมธานี">ปทุมธานี</option>
                      <option value="ประจวบคีรีขันธ์">ประจวบคีรีขันธ์</option>
                      <option value="ปราจีนบุรี">ปราจีนบุรี</option>
                      <option value="ปัตตานี">ปัตตานี</option>
                      <option value="พระนครศรีอยุธยา">พระนครศรีอยุธยา</option>
                      <option value="พะเยา">พะเยา</option>
                      <option value="พังงา">พังงา</option>
                      <option value="พัทลุง">พัทลุง</option>
                      <option value="พิจิตร">พิจิตร</option>
                      <option value="พิษณุโลก">พิษณุโลก</option>
                      <option value="เพชรบุรี">เพชรบุรี</option>
                      <option value="เพชรบูรณ์">เพชรบูรณ์</option>
                      <option value="แพร่">แพร่</option>
                      <option value="ภูเก็ต">ภูเก็ต</option>
                      <option value="มหาสารคาม">มหาสารคาม</option>
                      <option value="มุกดาหาร">มุกดาหาร</option>
                      <option value="แม่ฮ่องสอน">แม่ฮ่องสอน</option>
                      <option value="ยโสธร">ยโสธร</option>
                      <option value="ยะลา">ยะลา</option>
                      <option value="ร้อยเอ็ด">ร้อยเอ็ด</option>
                      <option value="ระนอง">ระนอง</option>
                      <option value="ระยอง">ระยอง</option>
                      <option value="ราชบุรี">ราชบุรี</option>
                      <option value="ลพบุรี">ลพบุรี</option>
                      <option value="ลำปาง">ลำปาง</option>
                      <option value="ลำพูน">ลำพูน</option>
                      <option value="เลย">เลย</option>
                      <option value="ศรีสะเกษ">ศรีสะเกษ</option>
                      <option value="สกลนคร">สกลนคร</option>
                      <option value="สงขลา">สงขลา</option>
                      <option value="สตูล">สตูล</option>
                      <option value="สมุทรปราการ">สมุทรปราการ</option>
                      <option value="สมุทรสงคราม">สมุทรสงคราม</option>
                      <option value="สมุทรสาคร">สมุทรสาคร</option>
                      <option value="สระแก้ว">สระแก้ว</option>
                      <option value="สระบุรี">สระบุรี</option>
                      <option value="สิงห์บุรี">สิงห์บุรี</option>
                      <option value="สุโขทัย">สุโขทัย</option>
                      <option value="สุพรรณบุรี">สุพรรณบุรี</option>
                      <option value="สุราษฎร์ธานี">สุราษฎร์ธานี</option>
                      <option value="สุรินทร์">สุรินทร์</option>
                      <option value="หนองคาย">หนองคาย</option>
                      <option value="หนองบังลำภู">หนองบังลำภู</option>
                      <option value="อ่างทอง">อ่างทอง</option>
                      <option value="อำนาจเจริญ">อำนาจเจริญ</option>
                      <option value="อุดรธานี">อุดรธานี</option>
                      <option value="อุตรดิตถ์">อุตรดิตถ์</option>
                      <option value="อุทัยธานี">อุทัยธานี</option>
                      <option value="อุบลราชธานี">อุบลราชธานี</option>
                      <option value="อื่นๆ(ต่างประเทศ)">อื่นๆ(ต่างประเทศ)</option>
                    </select></td>
                </tr>
                <tr> 
                  <!-- Zip Code -->
                  <td><div align="right"><b> รหัสไปรษณีย์ <font color="red">*</font></b></div></td>
                  <td> <input type="text" name="zip" maxlength="20" size="20" value="" class="text"> 
                  </td>
                </tr>
                <tr> 
                  <!-- E-Mail Address -->
                  <td><div align="right"><b> E-Mail Address <font color="red">*</font></b></div></td>
                  <td> <input type="text" name="mail" maxlength="100" size="30" value="" class="text">
                    <font color="#FF0000">( password จะส่งไปตามอีเมล์นี้)</font> 
                  </td>
                </tr>
                <tr> 
                  <!-- Tel -->
                  <td><div align="right"><b> เบอร์โทรศัพท์ </b></div></td>
                  <td> <input type="text" name="tel" maxlength="100" size="30" value="" class="text"> 
                  </td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td width="562">&nbsp;</td>
    </tr>
    <tr> 
      <td width="562">&nbsp;</td>
    </tr>
    <tr> 
      <td width="562"> <table border="0" cellspacing="0" cellpadding="0" class="header">
          <tr> 
            <td width="11" align="left" valign="top" bgcolor="#869DB9"><img src="Picture/cn_drk_lt.gif" width="11" height="19"></td>
            <td width="114" bgcolor="#869DB9"><b> ข้อมูลเข้าสู่ระบบ </b></td>
            <td width="11" align="right" valign="top" bgcolor="#869DB9"><img src="Picture/cn_drk_rt.gif" width="11" height="19"></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td bgcolor="#869DB9" width="562"> <table width="100%" border="0" cellspacing="1" cellpadding="4" class="text">
          <tr bgcolor="#E9E9E9" align="left"> 
            <td  bgcolor="#FAF7EA"> <table class="text" width="100%" border="0" cellspacing="1" cellpadding="4">
                <tr bgcolor="#E0DDBC"> 
                  <td colspan="4"> <b>"รหัสผ่านเข้าสู่ระบบ"</b> และ <b>"รหัสผ่าน"</b> 
                    ต้องมีความยาว 4-12 ตัวอักษร 
                    <!--และอนุญาตให้มีเฉพาะตัวอักษร 0-9, A-Z และ เท่านั้น  -->
                  </td>
                </tr>
                <tr> 
                  <!-- User Name -->
                  <td width="156"><div align="right"><b> username <font color="red">*</font></b></div></td>
                  <td width="121"> <input type="text" name="user" maxlength="12" size="12" value="" class="text"> 
                  </td>
                  <td width="128"> <div align="right"> 
                      <input align="middle" type="button" name="chkuser" value="ตรวจสอบ username" onClick="window.open('Frm_ChkUser.php','ChkUser','scrollbars = 0,width = 400,height=150,top=130,left=200')">
                    </div></td>
                  <td width="88">&nbsp;</td>
                </tr>
              <!--  <tr> 
                  <td ><div align="right"><b> password <font color="red">*</font></b></div></td>
                  <td colspan="3"> <input name="pw" type="password" class="text" id="password" size="12" maxlength="12">
                    (ตรวจสอบ keyboard ด้วยว่าเป็นภาษาไทยหรืออังกฤษ)</td>
                </tr>
                <tr> 
                  <td><div align="right"><b> comfirm password <font color="red">*</font></b></div></td>
                  <td colspan="3"> <input type="password" name="cpwd" maxlength="12" size="12" class="text"> 
                  </td>
                </tr>-->
                <tr> 
                  <td><div align="right"><b>คำถาม <font color="red">*</font></b></div></td>
                  <td colspan="3"><input name="ask" type="text" size="12" class="text">
                    (เป็นคำถามที่จะใช้ตรวจสอบเมื่อท่านลืมรหัสผ่าน) </td>
                </tr>
                <tr> 
                  <td ><div align="right"><b> คำตอบ <font color="red">*</font></b></div></td>
                  <td colspan="3"> <input name="ans" type="text" class="text" size="12" > 
                  </td>
                </tr>
              </table></tr>
        </table></td>
    </tr>
    <tr> 
      <td width="562">&nbsp;</td>
    </tr>
    <tr> 
      <td width="562"> <table width="100%">
          <tr> 
            <td width="251">&nbsp; </td>
            <td width="297"> <div align="right">
                <input name="status" type="hidden" id="status" value="teacher">
                <input type="submit" value="ลงทะเบียน" class="button" name="submit">
                <input type="reset" name="Reset" value="ยกเลิก" class="button">
                <input type="button" value="ปิด" onClick = "window.close();" name="button" class="button">
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
	<br>
  &nbsp; 
</form>   
</body>
</html>
