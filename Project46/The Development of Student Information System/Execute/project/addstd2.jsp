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
  	<td colspan="2">ข้อมูลนักศึกษา</td>
  </tr>  
  <tr valign="top">
  	<td width="100%" colspan="2">
       	<form name="form1" method="post" action="addstdre.jsp">
<table border="0">
  <tr valign="top">
    <td width="90" align="right">คำนำหน้า(ท) :<br>
			<select name="tpren">
			<option value="1">นาย</option>
			<option value="2">นาง</option>
			<option value="3">นางสาว</option>										
			</select>
	</td>
    <td  width="120"align="left">ชื่อ(ท) : <br> <input name="tfname" type="text" size="20" maxlength="40"></td>
    <td  width="150"align="left">นามสกุล(ท) : <br> <input name="tlname" type="text" size="30" maxlength="40"></td>
    <td  width="350" height="100"rowspan="5" >dfg</td>
  </tr>
  <tr>
    <td align="right">คำนำหน้า(อ) : <br>
			<select name="epren">
			<option value="1">Mr.</option>
			<option value="2">Ms.</option>
			<option value="3">Miss</option>										
			</select>	
	</td>
    <td  width="120"align="left">ชื่อ(อ) : <br> <input name="efname" type="text" size="20" maxlength="40"></td>
    <td  width="150"align="left">นามสกุล(อ) : <br> <input name="elname" type="text" size="30" maxlength="40"></td>
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
    <td colspan="3">
		  	<input name="chk" type="checkbox" value="1">เป็นข้าราชการในสถาบันฯ |  ประเภทรับเข้า/เวลาเรียน
			<select name="cur">
			<option value="1">sdf</option>
			<option value="2">asdf</option>
			<option value="3">fasd</option>										
			</select>	
	</td>
    </tr>
  <tr>
    <td colspan="5">
		  	<a href="javascript:void(0)"  onClick="showm(h1,stdm1)";>ข้อมูลสำหรับลงทะเบียน</a> | 
			<a href="javascript:void(0)"  onClick="showm(h2,stdm2)";>อาจารย์ที่ปรึกษา</a> | 	
	</td>
    </tr>
  <tr>
    <td colspan="5">
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
                	<td align="right" valign="top">ฟฟ</td>					
               </tr>
            </table>	
	</td>
    </tr>
  <tr>
    <td colspan="5" align="right">
      <input type="submit" name="Submit" value="Submit">
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
