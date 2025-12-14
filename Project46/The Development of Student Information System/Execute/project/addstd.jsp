<%@ page contentType="text/html; charset=tis-620" language="java" pageEncoding="tis-620" %>
<%
	if( session.isNew() )  {  session.setAttribute("auth","0"); response.sendRedirect("auth.jsp");  }
	else if( !session.getAttribute("auth").equals("1") )  response.sendRedirect("auth.jsp");  
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>สถาบันเทคโนโลยีพระจอมเกล้าฯ ลาดกระบัง</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<LINK href="css/sitestyle.css"  type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2800.1400" name=GENERATOR>
<style type="text/css" >
	DIV.mHead  { }
	DIV.StdMenu {
		 position:absolute; visibility:hidden;
	}	
</style>
<script language="javascript">
function showm(h,me) {
	h.style.color="black";
	me.style.visibility="visible";  me.style.position="static";
}
function nochar() {
	if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;
}
</script>
</HEAD>
<BODY leftMargin="0" topMargin="0" off autocompleted marginwidth="0"  marginheight="0" >
<table width="100%"  height="100%" border="0"   cellspacing="0" cellpadding="0"  background="pic/shadow.JPG" >
  <tr valign="top" >
    <td height="35"><IMG  height="100%"alt="สถาบันเทคโนโลยีพระจอมเกล้าฯ ลาดกระบัง" src="pic/header.gif" /></td>
    <td width="100%" background="pic/pad.gif">&nbsp;</td>
  </tr>
  <tr valign="top" height="40">
    <td colspan="2" ><jsp:include page="popup.jsp" flush="false"></jsp:include></td>
  </tr>
  <tr valign="top" height="30">
  	<td colspan="2">ข้อมูลนักศึกษา </td>
  </tr>  
  <tr valign="top">
  	<td width="100%" colspan="2">
       	<form name="form1" method="post" action="addstdre.jsp">
<table border="0">
  <tr valign="top">
    <td width="80" align="right"><input name="stdid" type="text" value="STDID" size="10" maxlength="8"><br>
      <select name="tpren">
        <option value="1">นาย</option>
        <option value="2">นาง</option>
        <option value="3" >นางสาว</option>
       </select>
	   </td>
    <td  width="100"align="left">ชื่อ(ท) : <br> 
      <input name="tfname" type="text" size="15" maxlength="40"></td>
    <td  width="110"align="left">นามสกุล(ท) : <br> <input name="tlname" type="text" size="25" maxlength="40"></td>
    <td  width="80" height="100"rowspan="6" >
		ประเภท<br>
		<label><input type="radio" name="type" value="1">สามัญ</label><br>
		<label><input type="radio" name="type" value="1">ทดลองเรียน</label> <hr>
		ระดับ<br>
		<label><input type="radio" name="degree" value="1">ป.ตรี</label><br>
		<label><input type="radio" name="degree" value="1">ป.โท</label><br>
		<label><input type="radio" name="degree" value="1">ป.เอก</label><br>
		<label><input type="radio" name="degree" value="1">ป.บัณฑิต</label>
	</td>
    <td  width="90"rowspan="6" >
	นักศึกษา<br>
	<label><input type="radio" name="degree" value="1">ในประเทศ</label><br>
	<label><input type="radio" name="degree" value="1">ต่างประเทศ</label><hr>
	วิทยาเขต<br>
	<label><input type="radio" name="degree" value="1">ลาดกระบัง</label><br>
	<label><input type="radio" name="degree" value="1">ชุมพร</label><br>
	<label><input type="radio" name="degree" value="1">ระยอง</label>	</td>
    <td  width="120"rowspan="6" align="right"  >dfsdf
	
	</td>
  </tr>
  <tr>
    <td align="right"><br>
			<select name="epren">
			<option value="1">Mr.</option>
			<option value="2">Ms.</option>
			<option value="3">Miss</option>										
			</select>	
	</td>
    <td align="left">ชื่อ(อ) : <br> 
      <input name="efname" type="text" size="15" maxlength="40">
	 </td>
    <td align="left">นามสกุล(อ) : <br> <input name="elname" type="text" size="25" maxlength="40"></td>
    </tr>
  <tr>
  		<td colspan="3">สาขา / แขนงวิชา : 
			<select name="major">
              <option value="1">com</option>
              <option value="2">asdf</option>
              <option value="3">fasd</option>
            </select> 
			|  ห้อง : 
          <input name="room" type="text" size="2" maxlength="2"> | ชั้นปี : <input name="class" type="text" size="2" maxlength="2">
		</td>
    </tr>
  <tr>
    <td colspan="3">หลักสูตรที่เรียน : 
			<select name="cur">
			<option value="1">sdf</option>
			<option value="2">asdf</option>
			<option value="3">fasd</option>										
			</select> 
			| เพศ : <label><input type="radio" name="sex" value="1">ชาย</label> <label><input type="radio" name="sex" value="1">หญิง</label>	
	</td>
    </tr>
  <tr>
    <td colspan="3"><input name="chk" type="checkbox" value="1">เป็นข้าราชการในสถาบันฯ</td>
  </tr>
  <tr>
    <td colspan="3">
		  	ประเภทรับเข้า/เวลาเรียน
			<select name="cur">
			<option value="1">sdf</option>
			<option value="2">asdf</option>
			<option value="3">fasd</option>										
			</select>	
	</td>
    </tr>
  <tr>
    <td colspan="7">สถานภาพ
			  	<label><input type="radio" name="status" value="1">กำลังศึกษา</label>
				<label><input type="radio" name="status" value="1">จบการศึกษา</label>
			  	<label><input type="radio" name="status" value="1">พ้นสภาพ</label>
				<label><input type="radio" name="status" value="1">ปรับสภาพนักศึกษา</label>
			  	<label><input type="radio" name="status" value="1">ลาออก</label>
				<label><input type="radio" name="status" value="1">ไม่มารายงานตัว</label>
			  	<label><input type="radio" name="status" value="1">คัดชื่อออก</label>	
	</td>
  </tr>
  <tr>
    <td colspan="7">
	  	<a href="javascript:void(0)"  onClick="showm(h1,stdm1)";>ข้อมูลสำหรับลงทะเบียน</a> | 
		<a href="javascript:void(0)"  onClick="showm(h2,stdm2)";>อาจารย์ที่ปรึกษา</a> | 
		<a href="javascript:void(0)"  onClick="showm(h3,stdm3)";>ประวัติน.ศ1</a> | 
		<a href="javascript:void(0)"  onClick="showm(h4,stdm4)";>ประวัติน.ศ2</a> | 
		<a href="javascript:void(0)"  onClick="showm(h5,stdm5)";>ประวัติการศึกษา</a> | 
		<a href="javascript:void(0)"  onClick="showm(h6,stdm6)";>ประวัติบิดา</a> | 
		<a href="javascript:void(0)"  onClick="showm(h7,stdm7)";>ประวัติมารดา</a> 
	</td>
  </tr>
  <tr>
    <td colspan="7">
		<a href="javascript:void(0)"  onClick="showm(h8,stdm8)";>ประวัติผู้ปกครอง</a> | 
		<a href="javascript:void(0)"  onClick="showm(h9,stdm9)";>ประวัติสามี/ภรรยา</a> | 
		<a href="javascript:void(0)"  onClick="showm(h10,stdm10)";>ผู้อุปการะด้านการเงิน</a> | 
		<a href="javascript:void(0)"  onClick="showm(h11,stdm11)";>ผลการตรวจร่างกาย1</a> | 
		<a href="javascript:void(0)"  onClick="showm(h12,stdm12)";>ผลการตรวจร่างกาย2</a> 
	</td>
    </tr>
  <tr>
    <td colspan="7">
		<div class="StdMenu"  id="stdm1">
		<table  border="0">
              <tr>
                <td colspan="2" width="160">เข้าศึกษา</td>
                <td colspan="2" width="190">จบการศึกษา/ลาออก/พ้นสภาพ</td>
                <td width="180">ทุน</td>
                <td width="180">การค้างหนังสือ/อื่นๆ</td>
              </tr>
              <tr valign="top">
                <td width="80">วัน/เดือน/ปี : </td>
                <td width="80">sdf</td>
                <td width="80">วัน/เดือน/ปี : </td>
                <td width="110">ddd</td>
                <td  rowspan="3"  align="left">
					<input name="sco1" type="checkbox" value="1">ได้ทุนยกเว้นค่าหน่วยกิจ<br>
					<input name="sco2" type="checkbox" value="1">ได้ทุนยกเว้นเงินสนับสนุน<br>
					<input name="sco3" type="checkbox" value="1">ได้ทุนยกเว้นค่าธรรมเนียม<br>
				  <input name="sco4" type="checkbox" value="1">ได้ทุนกู้ยืมเพื่อการศึกษา				</td>
                <td  rowspan="3">
					<input name="tmp1" type="checkbox" value="1">ค้างหนังสือหอสมุดกลาง<br>
					<input name="tmp2" type="checkbox" value="1">ค้างหนังสือหอสมุดคณะ<br>
					<input name="tmp3" type="checkbox" value="1">ห้ามลงทะเบียนเรียน<br>
				  <input name="tmp4" type="checkbox" value="1">ห้ามดูผลการศึกษา				</td>
              </tr>
              <tr>
                <td>ปีการศึกษา : </td>
                <td>&nbsp;</td>
                <td>ปีการศึกษา : </td>
                <td>&nbsp;</td>
                </tr>
              <tr>
                <td>ภาค : </td>
                <td>&nbsp;</td>
                <td>ภาค : </td>
                <td>&nbsp;</td>
               </tr>
              <tr valign="top">
                	<td colspan="4">
					หัวข้อวิทยานิพนธ์ / ปัญหาพิเศษ(ภาษาไทย) :<br> 
					<input type="text" name="tthesis" maxlength="200" size="50"> <br>
 					หัวข้อวิทยานิพนธ์ / ปัญหาพิเศษ(ภาษาอังกฤษ) :<br> 
				  <input type="text" name="ethesis" maxlength="200" size="50">
				  </td>
                	<td valign="top">ฟฟ</td>
                	<td valign="top">
						เกียรตินิยมที่ได้<br>
						<label><input type="radio" name="degree" value="1">ไม่ได้เกียรตินิยม</label><br>
						<label><input type="radio" name="degree" value="1">เกียรตินิยมอันดับ1</label><br>
					  <label><input type="radio" name="degree" value="1">เกียรตินิยมอันดับ2</label>					</td>					
               </tr>
            </table>	
			</div>
			<div class="" id="stdm2">
			</div>
			<div class="StdMenu" id="stdm3">
<table  width="100%" border="0">
  <tr>
    <td colspan="3">ว/ด/ป เกิด  : <input type="text" name="bod" size="8" maxlength="8"> : จังหวัดที่เกิด 
			<select name="birthprovince">
              <option value="1">กรุงเทพ</option>
              <option value="2">asdf</option>
              <option value="3">fasd</option>
            </select> 
			เลขบัตรประชาชน  <input type="text" name="textfield" size="13" maxlength="13"></td>
    <td width="210" align="right">กลุ่มเลือด <br>
		<label><input type="radio" name="degree" value="1">A</label>
		<label><input type="radio" name="degree" value="1">B</label>
		<label><input type="radio" name="degree" value="1">AB</label>
		<label><input type="radio" name="degree" value="1">O</label>
		<label><input type="radio" name="degree" value="1">อื่นๆ</label>			
	</td>
  </tr>
  <tr>
    <td>เชื่อชาติ 	<input type="text" name="race" size="12" maxlength="20"></td>
    <td>สัญชาติ	<input type="text" name="citizen" size="12" maxlength="20"></td>
    <td>ศาสนา<br>
		<label><input type="radio" name="degree" value="1">พุทธ</label>
		<label><input type="radio" name="degree" value="1">คริสต์</label>
		<label><input type="radio" name="degree" value="1">อิสลาม</label>
		<label><input type="radio" name="degree" value="1">อื่นๆ</label>			
	</td>
    <td align="right">สถานะภาพสมรส <br>
		<label><input type="radio" name="degree" value="1">โสด</label>
		<label><input type="radio" name="degree" value="1">สมรส</label>
		<label><input type="radio" name="degree" value="1">หย่า</label>
		<label><input type="radio" name="degree" value="1">ม่าย</label>
	</td>
  </tr>
  <tr>
    <td colspan="4">ที่อยู่ตามทะเบียนบ้าน <input type="text" name="homeno1" size="10" maxlength="10"> หมู่ <input type="text" name="moo1" size="3" maxlength="2"> ซอย <input type="text" name="soi1" size="20" maxlength="20"> ถนน <input type="text" name="street1" size="20" maxlength="20"> รหัสไปรษณีย์ <input type="text" name="zipcode1" size="5" maxlength="5"><br>
	แขวง <input type="text" name="district1" size="20" maxlength="20"> เขต <input type="text" name="amphur1" size="20" maxlength="20"> จังหวัด <input type="text" name="province1" size="20" maxlength="20"> โทร. <input type="text" name="tel1" size="9" maxlength="9">
	</td>
    </tr>
  <tr>
    <td colspan="4">ที่อยู่ที่สามารถติดต่อได้ <input type="text" name="homeno2" size="10" maxlength="10"> หมู่ <input type="text" name="moo2" size="3" maxlength="2"> ซอย <input type="text" name="soi2" size="20" maxlength="20"> ถนน <input type="text" name="street2" size="20" maxlength="20"> รหัสไปรษณีย์ <input type="text" name="zipcode2" size="5" maxlength="5"><br>
	แขวง <input type="text" name="district2" size="20" maxlength="20"> เขต <input type="text" name="amphur2" size="20" maxlength="20"> จังหวัด <input type="text" name="province2" size="20" maxlength="20"> โทร. <input type="text" name="tel2" size="9" maxlength="9">
	</td>
    </tr>
</table>
			</div>
			<div class="StdMenu" id="stdm4">
              <table width="100%"  border="1">
                <tr>
                  <td >ปัจจุบันอาศัยอยู่กับ
						<label><input type="radio" name="livewith" value="1">บิดา-มารดา</label>
						<label><input type="radio" name="livewith" value="1">บิดา</label>  						
						<label><input type="radio" name="livewith" value="1">มารดา</label>
						<label><input type="radio" name="livewith" value="1">ญาติ</label><br>
						<label><input type="radio" name="livewith" value="1">หอพักสถาบัน</label>
						<label><input type="radio" name="livewith" value="1">หอพักเอกชน</label>						
						<label><input type="radio" name="livewith" value="1">บ้านเช่า</label>
						<label><input type="radio" name="livewith" value="1">วัด</label>
						<label><input type="radio" name="livewith" value="1">อื่นๆ</label>  
				  </td>
                  <td width="220" align="left">E-mail<br><input name="email" type="text" size="30" maxlength="50">
				  </td>
                </tr>
                <tr>
                  <td colspan="2">
				  	สถานภาพสมรสบิดามารดา
						<label><input type="radio" name="parentstatus" value="1">มารดา</label>
						<label><input type="radio" name="parentstatus" value="1">ญาติ</label>
						<label><input type="radio" name="parentstatus" value="1">หอพักสถาบัน</label>
						<label><input type="radio" name="parentstatus" value="1">หอพักเอกชน</label>						
						<label><input type="radio" name="parentstatus" value="1">บ้านเช่า</label>
						<label><input type="radio" name="parentstatus" value="1">วัด</label>
						<label><input type="radio" name="parentstatus" value="1">อื่นๆ</label>  					
				  </td>
                </tr>
                <tr>
                  <td>เป็นบุตรคนที่ <input name="childno" type="text" size="2" maxlength="2" onKeyPress="nochar()"> ในจำนวนพี่น้อง <input name="noofchild" type="text" size="2" maxlength="2" onKeyPress="nochar()"> บิดา-มารดาเดียวกันที่มีชีวิตอยู่ คน อยู่ในระหว่างการศึกษา <input name="stdchild" type="text" size="2" maxlength="2" onKeyPress="nochar()"></td>
                  <td align="left"s>รายได้จากการทำงาน / เดือน <br>
						<label><input type="radio" name="income" value="0">ไม่มี</label>
						<label><input type="radio" name="income" value="1">มี</label>	
					  <input name="email2" type="text" size="10" maxlength="10" onKeyPress="nochar()">  
				  </td>
                </tr>
              </table>
			</div>
			<div class="" id="stdm5">
              <table width="100%"  border="0">
                <tr align="left" valign="top">
                  <td width="160">สำเร็จการศึกษาสูงสุดระดับ<br>
						<select name="colle">
						  <option value="1">ตรี</option>
						  <option value="2">โท</option>
						</select> 				  
				  </td>
                  <td width="160">ชื่อสถาบันที่จบการศึกษา<br>
                    <input name="elname2" type="text" size="25" maxlength="40"></td>
                  <td width="100">จังหวัด<br>
					<select name="uprovince">
					  <option value="1">กรุงเทพ</option>
					  <option value="2">asdf</option>
					  <option value="3">fasd</option>
					</select>   
				  </td>
                  <td width"80">ปีการศีกษา<br>
					<select name="year">
					  <option value="1">2525</option>
					  <option value="2">2526</option>
					  <option value="3">fasd</option>
					</select>   				  
				  </td>
                  <td>GPA<br>
                    <input name="elname22" type="text" size="5" maxlength="4"></td>
                </tr>
                <tr>
                  <td colspan="5">การศึกษาในมหาวิทยาลัย<br>
					<label><input type="radio" name="degfree" value="1">ไม่เคย</label>
					<label><input type="radio" name="degsfree" value="1">เคยศึกษาในมหาวิทยาลัย</label>
						<select name="uni">
						  <option value="1">จุฬา</option>
						  <option value="2">ธรรมศาสตร์</option>
						</select> 
					ในปีการศึกษา
						<select name="year">
						  <option value="1">2523</option>
						  <option value="2">2524</option>
						</select> 						
				  </td>
                  </tr>
                <tr>
                  <td colspan="5">การเข้าเป็นนักศึกษาของสถาบันฯ<br>
					<label><input type="radio" name="degfree" value="1">เข้าเป็นนักศึกษาของสถาบันฯ ครั้งแรก</label>
					<label><input type="radio" name="degsfree" value="1">เคยเป็นนักศึกษาของสถาบันฯ มาก่อน</label>
					ในปีการศึกษา   
						<select name="year">
						  <option value="1">2523</option>
						  <option value="2">2524</option>
						</select> 						
				  </td>
                  </tr>
                <tr>
                  <td colspan="5">ปริญญานิพนธ์ / ปัญหาพิเศษ / วิทยานิพนธ์ / ที่ทำเมื่อสำเร็จการศึกษา<br>
				  ภาษาไทย  <input name="elname2" type="text" size="40" maxlength="40"> ภาษาอังกฤษ <input name="elname2" type="text" size="40" maxlength="40">
				  </td>
                  </tr>
              </table>
</div>
	</td>
    </tr>
  <tr>
    <td colspan="7" align="right">
      <input type="submit" name="Submit" value="add">
      <input type="reset" name="Submit2" value="clear">
	 </td>
   </tr>
</table>
		</form>
	</td>
  </tr>
  <tr valign="bottom">
    <td height="5%" colspan="2" align="right">
	<SPAN class=copyright>
		Copyrighted by Division of System&nbsp;&amp;&nbsp;Programming. CRSC, KMITL. 2003<BR>
		&copy; Division of System&nbsp;&amp;&nbsp;Programming. CRSC, KMITL. All rights reserved.
	</SPAN>
	</td>
  </tr>
</table>
</BODY>
</HTML>
